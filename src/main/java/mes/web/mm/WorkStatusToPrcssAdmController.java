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

import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.PrcssBomAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.web.ut.Utils;

@Controller
public class WorkStatusToPrcssAdmController {
	
	@Inject
	private CommonCodeAdmService systemCommonCodeService;
	@Inject
	private PrcssBomAdmService prcssBomAdmService;
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkStatusToPrcssAdmController.class);
	
	//공정별실적현황 메인
	@RequestMapping(value = "/mmsc0020", method = RequestMethod.GET)
	public String workOrderManagementMain(Locale locale, Model model) throws Exception {
		logger.info("공정별실적현황 메인");
		try {
			List<PrcssBomAdmVo> PrcssBomAdmList = prcssBomAdmService.prcssBomAdmList();
			model.addAttribute("bomList", PrcssBomAdmList);
			PrcssBomDtlVo prcssBomDtlVo = new PrcssBomDtlVo();
			for(PrcssBomAdmVo m : PrcssBomAdmList) {
				prcssBomDtlVo.setBomCd(m.getBomCd());
				List<PrcssBomDtlVo> PrcssBomDtlList = prcssBomAdmService.prcssBomDtlList(prcssBomDtlVo);
				model.addAttribute("bomList_"+m.getBomCd(), PrcssBomDtlList);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mm/mmsc0020";
	}
	
	// 공정별실적현황 목록조회
	@RequestMapping(value = "/mm/workOrdStatusList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdStatusList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정별실적현황 목록조회: " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = workOrderPrcssService.workOrdStatusList(workOrderPrcssVo);
			jsonData.put("data", workOrderPrcssList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 공정별실적현황 목록조회(소공정)
	@RequestMapping(value = "/mm/workOrdStatusDtlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdStatusDtlList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정별실적현황 목록조회(소공정): " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = workOrderPrcssService.workOrdStatusDtlList(workOrderPrcssVo);
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