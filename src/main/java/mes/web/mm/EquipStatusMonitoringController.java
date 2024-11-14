package mes.web.mm;

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
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.web.ut.Utils;

@Controller
public class EquipStatusMonitoringController {
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(EquipStatusMonitoringController.class);
	
	//설비가동/비가동현황 메인
	@RequestMapping(value = "/mmsc0040", method = RequestMethod.GET)
	public String workOrderManagementMain(Locale locale, Model model) throws Exception {
		logger.info("설비가동/비가동현황 메인");
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("026"); // 설비구분
			List<CommonCodeAdmVo> commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", commonCodeList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mm/mmsc0040";
	}
	
	// 설비 목록조회
	@RequestMapping(value = "/mm/equipCodeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비 목록조회: " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> equipCodeAdmList = equipCodeAdmService.equipGubunToList(equipCodeAdmVo);
			jsonData.put("data", equipCodeAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
    
		return jsonData;
	}
	
	// 설비 가동비가동현황 조회
	@RequestMapping(value = "/mm/equipStateList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipStateList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비 가동비가동현황 조회: " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> equipCodeAdmList = equipCodeAdmService.equipStateList(equipCodeAdmVo);
			jsonData.put("data", equipCodeAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
    
		return jsonData;
	}
	
}