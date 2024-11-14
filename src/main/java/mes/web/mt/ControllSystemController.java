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

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.mt.ControllSystemVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.mt.ControllSystemService;

@Controller
public class ControllSystemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ControllSystemController.class);
	
	@Inject
	private ControllSystemService controllSystemService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	// 공장별 온도/습도 페이지
	@RequestMapping(value = "/mtsc0010", method = RequestMethod.GET)
	public String mtsc0010(Locale locale, Model model) throws Exception {
		try {
			logger.info("공장별 온도/습도");
			CommonCodeAdmVo systemCommonCodeVo  = new CommonCodeAdmVo();
			systemCommonCodeVo.setBaseGroupCd("152"); // 온습도 범위
			List<CommonCodeAdmVo>  systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
			model.addAttribute("tempHumiRangeCd", systemCommonCodeList );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc0010";
	}
	
	// 공장별 전기사용량 페이지
	@RequestMapping(value = "/mtsc0020", method = RequestMethod.GET)
	public String mtsc0020(Locale locale, Model model) throws Exception {
		try {
			logger.info("공장별 전기사용량");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc0020";
	}
	
	// 환영문구(문구) 페이지
	@RequestMapping(value = "/mtsc0030", method = RequestMethod.GET)
	public String mtsc0030(Locale locale, Model model) throws Exception {
		try {
			logger.info("환영문구(문구)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc0030";
	}
	
	// 환영문구(이미지) 페이지
	@RequestMapping(value = "/mtsc0040", method = RequestMethod.GET)
	public String mtsc0040(Locale locale, Model model) throws Exception {
		try {
			logger.info("환영문구(이미지)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc0040";
	}
	
	// 대시보드(레이저) 페이지
	@RequestMapping(value = "/mtsc1000", method = RequestMethod.GET)
	public String mtsc1000(Locale locale, Model model) throws Exception {
		try {
			logger.info("대시보드(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1000";
	}
	
	// 생산진행모니터링(레이저) 페이지
	@RequestMapping(value = "/mtsc1010", method = RequestMethod.GET)
	public String mtsc1010(Locale locale, Model model) throws Exception {
		try {
			logger.info("생산진행모니터링(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1010";
	}
	
	// 품질목표대비실적(레이저) 페이지
	@RequestMapping(value = "/mtsc1040", method = RequestMethod.GET)
	public String mtsc1040(Locale locale, Model model) throws Exception {
		try {
			logger.info("품질목표대비실적(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1040";
	}
	
	// 설비종합효율(레이저) 페이지
	@RequestMapping(value = "/mtsc1050", method = RequestMethod.GET)
	public String mtsc1050(Locale locale, Model model) throws Exception {
		try {
			logger.info("설비종합효율(레이저)");
			EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
			equipCodeAdmVo.setMainGubun("001");
			equipCodeAdmVo.setPrcNm("001");
			equipCodeAdmVo.setUseYn("001");
			List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			model.addAttribute("equipList", equipList );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1050";
	}
	
	// 설비가동율현황(레이저) 페이지
	@RequestMapping(value = "/mtsc1060", method = RequestMethod.GET)
	public String mtsc1060(Locale locale, Model model) throws Exception {
		try {
			logger.info("설비가동율현황(레이저)");
			EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
			equipCodeAdmVo.setMainGubun("001");
			equipCodeAdmVo.setPrcNm("001");
			equipCodeAdmVo.setUseYn("001");
			List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			model.addAttribute("equipList", equipList );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1060";
	}
	
	// 설비가동/비가동(레이저) 페이지
	@RequestMapping(value = "/mtsc1070", method = RequestMethod.GET)
	public String mtsc1070(Locale locale, Model model) throws Exception {
		try {
			logger.info("설비가동/비가동(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1070";
	}
	
	// 무재해현황판(레이저) 페이지
	@RequestMapping(value = "/mtsc1080", method = RequestMethod.GET)
	public String mtsc1080(Locale locale, Model model) throws Exception {
		try {
			logger.info("무재해현황판(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1080";
	}
	
	// 대시보드(후가공) 페이지
	@RequestMapping(value = "/mtsc2000", method = RequestMethod.GET)
	public String mtsc2000(Locale locale, Model model) throws Exception {
		try {
			logger.info("대시보드(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2000";
	}
	
	// 생산진행모니터링(후가공) 페이지
	@RequestMapping(value = "/mtsc2010", method = RequestMethod.GET)
	public String mtsc2010(Locale locale, Model model) throws Exception {
		try {
			logger.info("생산진행모니터링(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2010";
	}
	
	// 제조조건모니터링(후가공) 페이지
	@RequestMapping(value = "/mtsc2030", method = RequestMethod.GET)
	public String mtsc2030(Locale locale, Model model) throws Exception {
		try {
			logger.info("제조조건모니터링(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2030";
	}
	
	// 품질목표대비실적(후가공) 페이지
	@RequestMapping(value = "/mtsc2040", method = RequestMethod.GET)
	public String mtsc2040(Locale locale, Model model) throws Exception {
		try {
			logger.info("품질목표대비실적(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2040";
	}
	
	// 설비종합효율(후가공) 페이지
	@RequestMapping(value = "/mtsc2050", method = RequestMethod.GET)
	public String mtsc2050(Locale locale, Model model) throws Exception {
		try {
			logger.info("설비종합효율(후가공)");
			EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
			equipCodeAdmVo.setMainGubun("001");
			equipCodeAdmVo.setPrcNm("002");
			equipCodeAdmVo.setUseYn("001");
			List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			model.addAttribute("equipList", equipList );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2050";
	}
	
	// 설비가동율현황(후가공) 페이지
	@RequestMapping(value = "/mtsc2060", method = RequestMethod.GET)
	public String mtsc2060(Locale locale, Model model) throws Exception {
		try {
			logger.info("설비가동율현황(후가공)");
			EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
			equipCodeAdmVo.setMainGubun("001");
			equipCodeAdmVo.setPrcNm("002");
			equipCodeAdmVo.setUseYn("001");
			List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			model.addAttribute("equipList", equipList );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2060";
	}
	
	// 설비가동/비가동(후가공) 페이지
	@RequestMapping(value = "/mtsc2070", method = RequestMethod.GET)
	public String mtsc2070(Locale locale, Model model) throws Exception {
		try {
			logger.info("설비가동/비가동(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2070";
	}
	
	// 무재해현황판(후가공) 페이지
	@RequestMapping(value = "/mtsc2080", method = RequestMethod.GET)
	public String mtsc2080(Locale locale, Model model) throws Exception {
		try {
			logger.info("무재해현황판(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2080";
	}
	
	// 전기량, 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemList(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ControllSystemVo> controllSystemList = controllSystemService.controllSystemList(controllSystemVo);
			jsonData.put("data", controllSystemList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 전기량, 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemCreate(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			controllSystemService.controllSystemCreate(controllSystemVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 전기량, 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemBoardList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemBoardList(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ControllSystemVo> controllSystemBoardList = controllSystemService.controllSystemBoardList(controllSystemVo);
			jsonData.put("data", controllSystemBoardList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 레이저 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemLaser", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemLaser(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ControllSystemVo resultVo = controllSystemService.controllSystemLaser(controllSystemVo);
			jsonData.put("data", resultVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 레이저 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemLaserList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemLaserList(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ControllSystemVo> controllSystemFinishList = controllSystemService.controllSystemLaserList(controllSystemVo);
			jsonData.put("data", controllSystemFinishList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 후가공 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemFinish", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemFinish(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ControllSystemVo resultVo = controllSystemService.controllSystemFinish(controllSystemVo);
			jsonData.put("data", resultVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 후가공 온습도 현황 리스트
	@RequestMapping(value = "mt/controllSystemFinishList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> controllSystemFinishList(ControllSystemVo controllSystemVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ControllSystemVo> controllSystemFinishList = controllSystemService.controllSystemFinishList(controllSystemVo);
			jsonData.put("data", controllSystemFinishList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}