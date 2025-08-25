package mes.web.mt;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.mt.LaserOperInfoVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.mt.LaserOperInfoService;

@Controller
public class LaserOperInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(LaserOperInfoController.class);
	
	@Inject
	private LaserOperInfoService laserOperInfoService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	// 제조조건 모니터링(레이저) 페이지
	@RequestMapping(value = "/mtsc1030", method = RequestMethod.GET)
	public String mtsc1030(Locale locale, Model model) throws Exception {
		try {
			logger.info("제조조건모니터링(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1030";
	}
	
	// 제조조건 모니터링 리스트
	@RequestMapping(value = "mt/laserOperInfoList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperInfoList(LaserOperInfoVo laserOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<LaserOperInfoVo> laserOperInfoList = laserOperInfoService.laserOperInfoList(laserOperInfoVo);
			jsonData.put("data", laserOperInfoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 제조조건 모니터링 상세 리스트
	@RequestMapping(value = "mt/laserOperInfoDtlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperInfoDtlList(LaserOperInfoVo laserOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<LaserOperInfoVo> laserOperInfoDtlList = laserOperInfoService.laserOperInfoDtlList(laserOperInfoVo);
			jsonData.put("data", laserOperInfoDtlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 제조조건 모니터링 상세 리스트
	@RequestMapping(value = "mt/laserOperInfoStageCount", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperInfoStageCount(LaserOperInfoVo laserOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int stageCount = laserOperInfoService.laserOperInfoStageCount(laserOperInfoVo);
			jsonData.put("stageCount", stageCount);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}