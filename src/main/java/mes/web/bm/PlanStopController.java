
package mes.web.bm;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.PlanStopVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.PlanStopService;
import mes.web.ut.Utils;

@Controller
public class PlanStopController {
	private static final Logger logger = LoggerFactory.getLogger(PlanStopController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	@Inject
	private PlanStopService planStopService;
	
	// 공장력 페이지
	@RequestMapping(value = "/bmsc0310", method = RequestMethod.GET)
	public String factoryCalendarMain(Locale locale, Model model) throws Exception {
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("151"); // 시간설정코드
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> timeCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("timeCodeList", timeCodeList);
			
			commonCodeVo.setBaseGroupCd("039"); // 공정구분
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("prcNm", equipCodeList );
			
			EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			model.addAttribute("equipList", list );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0310";
	}
	
	//월별 계획정지등록리스트 조회
	@RequestMapping(value = "bm/planStopList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planStopListRead(PlanStopVo planStopVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<PlanStopVo> planStopVoList = planStopService.planStopList(planStopVo);
			jsonData.put("data", planStopVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//월, 설비별 누적시간 조회
	@RequestMapping(value = "bm/planStopMonthSummaryList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planStopMonthSummaryList(PlanStopVo planStopVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<PlanStopVo> planStopVoList = planStopService.planStopMonthSummaryList(planStopVo);
			jsonData.put("data", planStopVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//일, 설비별 누적시간 조회
	@RequestMapping(value = "bm/planStopDaySummaryList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planStopDaySummaryList(PlanStopVo planStopVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<PlanStopVo> planStopVoList = planStopService.planStopDaySummaryList(planStopVo);
			jsonData.put("data", planStopVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 기간별 목록조회
	@RequestMapping(value = "bm/planStopLstByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planStopLstByDate(PlanStopVo planStopVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("계획정지 기간별 목록조회 : "+planStopVo);
		try {
			List<PlanStopVo> planStopVoList = planStopService.planStopLstByDate(planStopVo);
			jsonData.put("data", planStopVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 기간별 목록 조회(날짜 그룹)
	@RequestMapping(value = "bm/planStopLstByDateGroup", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planStopLstByDateGroup(PlanStopVo planStopVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("계획정지 기간별 목록 조회(날짜 그룹) : "+planStopVo);
		try {
			List<PlanStopVo> planStopVoList = planStopService.planStopLstByDateGroup(planStopVo);
			jsonData.put("data", planStopVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//계획정지등록리스트 삭제 후 등록
	@RequestMapping(value = "/bm/planStopListCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inOutWhsAdmCreate(@RequestBody List<Map<String, Object>> planStopList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			PlanStopVo planStopVo = new PlanStopVo();
			planStopVo.setStopDate(planStopList.get(0).get("searchMonth").toString());
			planStopVo.setStopType(planStopList.get(0).get("stopType").toString());
			if(planStopList.get(0).get("deleteStatus").toString().equals("equipDelete")) {
				planStopVo.setEquipCd(planStopList.get(0).get("deleteEquipCd").toString());	
			}
			planStopService.planStopDelete(planStopVo);
			
			for(Map<String, Object> m : planStopList) {
				planStopVo.setStopDate(m.get("stopDate").toString());
				planStopVo.setStopType(m.get("stopType").toString());
				planStopVo.setEquipCd(m.get("equipCd").toString());
				planStopVo.setTimeCode(m.get("timeCode").toString());
				planStopVo.setStartTime(m.get("startTime").toString());
				planStopVo.setEndTime(m.get("endTime").toString());
				planStopVo.setStopTime(m.get("stopTime").toString());
				planStopVo.setRegId(Utils.getUserId());
				planStopVo.setUpdId(Utils.getUserId());
				planStopService.planStopCreate(planStopVo);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 계획정지 일괄등록
	@RequestMapping(value = "bm/planStopBatchCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planStopBatchCreate(PlanStopVo planStopVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String resultDate = planStopVo.getStartDate();
			List<PlanStopVo> list = new ArrayList<PlanStopVo>();
			PlanStopVo data = new PlanStopVo();
			data.setStopDate(resultDate);
			data.setStopType(planStopVo.getStopType());
			data.setEquipCd(planStopVo.getEquipCd());
			data.setTimeCode(planStopVo.getTimeCode());
			data.setStartTime(planStopVo.getStartTime());
			data.setEndTime(planStopVo.getEndTime());
			data.setStopTime(planStopVo.getStopTime());
			data.setRegId(Utils.getUserId());
			list.add(data);
			if(planStopVo.getStartDate().equals(planStopVo.getEndDate())) {
			} else {
				while(true) {
					resultDate = AddDate(resultDate, 0, 0, 1);
					data = new PlanStopVo();
					data.setStopDate(resultDate);
					data.setStopType(planStopVo.getStopType());
					data.setEquipCd(planStopVo.getEquipCd());
					data.setTimeCode(planStopVo.getTimeCode());
					data.setStartTime(planStopVo.getStartTime());
					data.setEndTime(planStopVo.getEndTime());
					data.setStopTime(planStopVo.getStopTime());
					data.setRegId(Utils.getUserId());
					list.add(data);
					if(resultDate.equals(planStopVo.getEndDate())) {
						break;
					}
				}
			}
			planStopService.planStopListCreate(list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	private static String AddDate(String strDate, int year, int month, int day) throws Exception {
		
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
        
		Calendar cal = Calendar.getInstance();
        
		Date dt = dtFormat.parse(strDate);
        
		cal.setTime(dt);
        
		cal.add(Calendar.YEAR,  year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE,  day);
        
		return dtFormat.format(cal.getTime());
	}
}

