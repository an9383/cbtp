package mes.web.mt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.mt.LaserInspResultVo;
import mes.service.mt.LaserInspResultService;

@Controller
public class LaserInspResultController {
	
	private static final Logger logger = LoggerFactory.getLogger(LaserInspResultController.class);
	
	@Inject
	private LaserInspResultService laserInspResultService;
	
	// 레이저 측정검사 작지별 목록조회
	@RequestMapping(value = "mt/laserInspResultList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserInspResultList(LaserInspResultVo laserInspResultVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<LaserInspResultVo> laserInspResultList = laserInspResultService.laserInspResultList(laserInspResultVo);
			jsonData.put("data", laserInspResultList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}