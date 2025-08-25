package mes.web.em;

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
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.web.ut.Utils;

@Controller
public class EquipBehaviorStatusController {
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	private static final Logger logger = LoggerFactory.getLogger(EquipBehaviorStatusController.class);
	
	//설비가동/비가동관리 메인
	@RequestMapping(value = "/emsc0070", method = RequestMethod.GET)
	public String workOrderManagementMain(Locale locale, Model model) throws Exception {
		logger.info("설비가동/비가동관리 메인");
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("026"); // 설비구분
			List<CommonCodeAdmVo> commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", commonCodeList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "em/emsc0070";
	}
	
	// 설비별 작지목록조회
	@RequestMapping(value = "/em/equipToWorkOrdList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비별 작지목록조회: " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = workOrderPrcssService.equipToWorkOrdList(workOrderPrcssVo);
			jsonData.put("data", workOrderPrcssList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
    
		return jsonData;
	}
}