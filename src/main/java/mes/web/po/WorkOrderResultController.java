package mes.web.po;

import java.text.DateFormat;
import java.util.Date;
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
import mes.domain.po.WorkOrderResultVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.po.WorkOrderResultService;
import mes.web.ut.Utils;

@Controller
public class WorkOrderResultController {
	
	@Inject
	private WorkOrderResultService workOrderResultService;
	
	@Inject
	private CommonCodeAdmService systemCommonCodeService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderResultController.class);
	
	/*
	 * //설비별 가동실적관리 메인
	 * 
	 * @RequestMapping(value = "/posc0060", method = RequestMethod.GET) public
	 * String workOrderAdmMain(Locale locale, Model model) throws Exception {
	 * logger.info("설비별 가동실적관리 메인"); try { Date date = new Date(); DateFormat
	 * dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,
	 * locale); String formattedDate = dateFormat.format(date);
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * CommonCodeAdmVo systemCommonCodeVo = new CommonCodeAdmVo();
	 * 
	 * systemCommonCodeVo.setBaseGroupCd("015"); // 자재분류 List<CommonCodeAdmVo>
	 * systemCommonCodeList =
	 * systemCommonCodeService.CommonCodeList(systemCommonCodeVo);
	 * model.addAttribute("prcssGubun", systemCommonCodeList ); }catch(Exception e)
	 * { e.printStackTrace(); }
	 * 
	 * return "po/posc0060"; }
	 */
	
	//설비별 가동실적관리 목록조회
	@RequestMapping(value = "/po/workOrderResultDataList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderResultDataList(WorkOrderResultVo workOrderResultVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비별 가동실적관리 목록조회: "+workOrderResultVo);
		try {
			List<WorkOrderResultVo> workOrderResultDataList = workOrderResultService.listAll(workOrderResultVo);
			jsonData.put("data", workOrderResultDataList);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
}