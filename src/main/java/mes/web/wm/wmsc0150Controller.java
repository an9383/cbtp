package mes.web.wm;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.po.WorkOrderJajuInspectVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.po.WorkOrderPrcssService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class wmsc0150Controller {
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	// 생산일보
	@RequestMapping(value = "/wmsc0150", method = RequestMethod.GET)
	public String wmsc0150(Locale locale, Model model) throws Exception {

		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		return "wm/wmsc0150";
	}
	
	//작업일보
	@RequestMapping(value = "/wmsc0190", method = RequestMethod.GET)
	public String wmsc0190(Locale locale, Model model) throws Exception {

		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		return "wm/wmsc0190";
	}
	
	// 생산일보(작업지시공정 전체) 조회
	@RequestMapping(value = "/wm/workOrderPrcssAllList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectRead(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			List<WorkOrderPrcssVo> workOrderPrcssAllList = workOrderPrcssService.workOrderPrcssAllList(workOrderPrcssVo);
			jsonData.put("data", workOrderPrcssAllList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
}
