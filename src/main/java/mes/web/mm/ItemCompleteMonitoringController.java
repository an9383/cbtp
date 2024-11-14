package mes.web.mm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.Util;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.domain.qm.MonPriManageAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.qm.ItemCompleteAdmService;
import mes.service.qm.MonPriManageAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemCompleteMonitoringController {

	private static final Logger logger = LoggerFactory.getLogger(ItemCompleteMonitoringController.class);
	
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	
	@Inject
	private ItemCompleteAdmService completeAdmService;

	@Inject
	private MonPriManageAdmService monPriManageAdmService;
	
	
	
	// 수입검사현황(모니터링) (레아저) 메인
	@RequestMapping(value = "/mmsc0070", method = RequestMethod.GET)
	public String mmsc0070(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		
		baseInfoAdmVo.setBaseInfoGubun("003");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		
		
		return "mm/mmsc0070";
	}
	
	// 수입검사현황(모니터링) (후가공) 메인
	@RequestMapping(value = "/mmsc0270", method = RequestMethod.GET)
	public String mmsc0270(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		
		baseInfoAdmVo.setBaseInfoGubun("003");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		
		
		return "mm/mmsc0270";
	}
		
	// 수입검사현황월별(모니터링) (레이저) 메인
	@RequestMapping(value = "/mmsc0080", method = RequestMethod.GET)
	public String mmsc0080(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		baseInfoAdmVo.setBaseInfoGubun("002");
		baseInfoAdmVo.setEtc1("002");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo(); 
		itemCompleteAdmVo.setFaultyTypeDate(DateUtil.getToday("yyyy-mm-dd").substring(0,4));
		List<ItemCompleteAdmVo> list = completeAdmService.itemCompleteMonthList(itemCompleteAdmVo);
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		model.addAttribute("faultyTypeList", list);
		
		
		
		return "mm/mmsc0080";
	}
	
	// 수입검사현황월별(모니터링) (레이저) 메인
	@RequestMapping(value = "/mmsc0250", method = RequestMethod.GET)
	public String mmsc0250(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		baseInfoAdmVo.setBaseInfoGubun("002");
		baseInfoAdmVo.setEtc1("002");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo(); 
		itemCompleteAdmVo.setFaultyTypeDate(DateUtil.getToday("yyyy-mm-dd").substring(0,4));
		List<ItemCompleteAdmVo> list = completeAdmService.itemCompleteMonthList(itemCompleteAdmVo);
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		model.addAttribute("faultyTypeList", list);
		
		
		
		return "mm/mmsc0250";
	}
		
	// 수입검사 목록조회 
	@RequestMapping(value = "mm/faultyTypeList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<ItemCompleteAdmVo> list = completeAdmService.itemCompleteMonthList(itemCompleteAdmVo);
			if(list==null || list.size()==0) {
				jsonData.put("data", list);
				jsonData.put("listSize", list.size());
				jsonData.put("result", "empty");
			}else {
				jsonData.put("data", list);
				jsonData.put("listSize", list.size());
				jsonData.put("result", "ok");
			}
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	// 월주요 중점관리 사항 목록조회
	@RequestMapping(value = "qm/monPriManageAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> monPriManageAdmList(MonPriManageAdmVo monPriManageAdmVo) throws Exception {
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			List<MonPriManageAdmVo> list = monPriManageAdmService.monPriManageAdmList(monPriManageAdmVo);
		
			if(list==null || list.size()==0) {
				list = new ArrayList<MonPriManageAdmVo>();
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	// 월주요 중점관리 사항 등록
	@RequestMapping(value = "qm/monPriManageAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> monPriManageAdmCreate(@RequestBody List<Map<String, Object>> monPriManageAdmList) throws Exception {
		Map<String , Object> jsonData = new HashMap<String, Object>();
		MonPriManageAdmVo monPriManageAdmVo = new MonPriManageAdmVo();
		try {
		
			monPriManageAdmVo.setMonPriType(monPriManageAdmList.get(0).get("monPriType").toString());
			monPriManageAdmVo.setRegId(Utils.getUserId());
			
			monPriManageAdmService.monPriManageAdmDelete(monPriManageAdmVo);
			
			for(Map<String, Object> m :monPriManageAdmList) {
				monPriManageAdmVo.setMonPriCont(m.get("monPriCont").toString());
				
				String date = DateUtil.getToday("yyyyMMdd");
				String seq = monPriManageAdmService.getMonPriNo(date);
				
				monPriManageAdmVo.setMonPriNo(date+"-"+seq);
				monPriManageAdmService.monPriManageAdmCreate(monPriManageAdmVo);
				
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}
