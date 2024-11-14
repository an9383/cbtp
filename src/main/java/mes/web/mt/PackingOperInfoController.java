package mes.web.mt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import io.lettuce.core.RedisClient;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;
import mes.domain.mt.PackingOperInfoVo;
import mes.service.mt.PackingOperInfoService;

@Controller
public class PackingOperInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(PackingOperInfoController.class);
	
	@Value("${redis.ip}")
	private String redis_ip;
	
	@Value("${redis.port}")
	private String redis_port;
	
	@Value("${redis.db}")
	private String redis_db;
	
	@Inject
	private PackingOperInfoService packingOperInfoService;
	
	// 금일 가장 최신 데이터 조회
	@RequestMapping(value = "mt/packingOperInfoTodayData", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> packingOperInfoTodayData(PackingOperInfoVo packingOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			RedisClient redisClient = RedisClient.create("redis://"+redis_ip+":"+redis_port+"/"+redis_db);
			StatefulRedisConnection<String, String> connection = redisClient.connect();
			RedisCommands<String, String> syncCommands = connection.sync();
			
			String packing = syncCommands.get("Packing1_");
			
			connection.close();
			redisClient.shutdown();
			
			List<PackingOperInfoVo> packingOperInfoVoList = packingOperInfoService.packingOperInfoTodayData(packingOperInfoVo);
			jsonData.put("data", packingOperInfoVoList);
			jsonData.put("packing", packing);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 후가공 설비정지
	@RequestMapping(value = "mt/packingStop", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> packingStop(PackingOperInfoVo packingOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			RedisClient redisClient = RedisClient.create("redis://"+redis_ip+":"+redis_port+"/"+redis_db);
			StatefulRedisConnection<String, String> connection = redisClient.connect();
			RedisCommands<String, String> syncCommands = connection.sync();
			
			syncCommands.set("Packing1_Stop", "1");
			
			connection.close();
			redisClient.shutdown();
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}