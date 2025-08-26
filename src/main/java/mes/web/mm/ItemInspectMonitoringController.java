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

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.ItemInspectAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemInspectMonitoringController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemInspectMonitoringController.class);
	
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemInspectAdmService inspectAdmService;

	// 모니터링(수주진행현황(레이저)) 메인
	@RequestMapping(value = "/mmsc0050", method = RequestMethod.GET)
	public String mmsc0050(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		
		baseInfoAdmVo.setBaseInfoGubun("001");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		
		return "mm/mmsc0050";
	}
	
	// 모니터링(수주진행현황(후가공)) 메인
	@RequestMapping(value = "/mmsc0260", method = RequestMethod.GET)
	public String mmsc0260(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		
		baseInfoAdmVo.setBaseInfoGubun("001");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		
		return "mm/mmsc0260";
	}
		
	// 모니터링(수주진행현황) (레이저) 메인
	@RequestMapping(value = "/mmsc0060", method = RequestMethod.GET)
	public String mmsc0060(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		baseInfoAdmVo.setBaseInfoGubun("001");
		baseInfoAdmVo.setEtc1("001");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("069"); // KPI
		List<CommonCodeAdmVo> kpiList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("kpiCode", kpiList);
		
		ItemInspectAdmVo itemInspectAdmVo = new ItemInspectAdmVo();
		itemInspectAdmVo.setFaultyTypeDate(DateUtil.getToday("yyyy-mm-dd").substring(0,4));
		List<ItemInspectAdmVo> list = inspectAdmService.itemInspectMonthList(itemInspectAdmVo);
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		model.addAttribute("faultyTypeList", list);
		
		return "mm/mmsc0060";
	}
	
	// 모니터링(수주진행현황) (후가공) 메인
	@RequestMapping(value = "/mmsc0240", method = RequestMethod.GET)
	public String mmsc0240(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); 
		baseInfoAdmVo.setBaseInfoGubun("001");
		baseInfoAdmVo.setEtc1("001");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("069"); // KPI
		List<CommonCodeAdmVo> kpiList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("kpiCode", kpiList);
		
		ItemInspectAdmVo itemInspectAdmVo = new ItemInspectAdmVo();
		itemInspectAdmVo.setFaultyTypeDate(DateUtil.getToday("yyyy-mm-dd").substring(0,4));
		List<ItemInspectAdmVo> list = inspectAdmService.itemInspectMonthList(itemInspectAdmVo);
		
		model.addAttribute("inspectDesc", baseInfoAdmList);
		model.addAttribute("faultyTypeCount", baseInfoAdmList.size());
		model.addAttribute("faultyTypeList", list);
		
		return "mm/mmsc0240";
	}
		
	// 수입검사 목록조회 
	@RequestMapping(value = "mm/faultyTypeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeList(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<ItemInspectAdmVo> list = inspectAdmService.itemInspectMonthList(itemInspectAdmVo);
			
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
}
