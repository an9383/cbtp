
package mes.web.bm;

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
import mes.domain.bm.FactoryCalendarVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.FactoryCalendarService;
import mes.web.ut.Utils;

@Controller
public class FactoryCalendarController {
	private static final Logger logger = LoggerFactory.getLogger(FactoryCalendarController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private FactoryCalendarService factoryCalendarService;
	
	// 공장력 페이지
	@RequestMapping(value = "/bmsc0220", method = RequestMethod.GET)
	public String factoryCalendarMain(Locale locale, Model model) throws Exception {
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("151"); // 시간설정코드
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> timeCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("timeCodeList", timeCodeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0220";
	}
	
	//공장력 월별 목록조회
	@RequestMapping(value = "bm/factoryCalendarList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> factoryCalendarList(FactoryCalendarVo factoryCalendarVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공장력 월별 목록조회 : " + factoryCalendarVo);
		try {
			List<FactoryCalendarVo> factoryCalendarVoList = factoryCalendarService.factoryCalendarList(factoryCalendarVo);
			jsonData.put("data", factoryCalendarVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공장력 기간별 목록조회
	@RequestMapping(value = "bm/factoryCalendarListByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> factoryCalendarListByDate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공장력 기간별 목록조회 : " + factoryCalendarVo);
		try {
			List<FactoryCalendarVo> factoryCalendarVoList = factoryCalendarService.factoryCalendarListByDate(factoryCalendarVo);
			jsonData.put("data", factoryCalendarVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공장력 월별 공휴일 목록조회
	@RequestMapping(value = "bm/factoryCalendarHolidayList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> factoryCalendarHolidayList(FactoryCalendarVo factoryCalendarVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공장력 월별 공휴일 목록조회 : " + factoryCalendarVo);
		try {
			List<FactoryCalendarVo> factoryCalendarVoList = factoryCalendarService.holidayList(factoryCalendarVo);
			jsonData.put("data", factoryCalendarVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 가입고등록 등록
	@RequestMapping(value = "/bm/factoryCalendarCreateOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inOutWhsAdmCreate(@RequestBody List<Map<String, Object>> factoryCalendarList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			for(Map<String, Object> m : factoryCalendarList) {
				FactoryCalendarVo factoryCalendarVo = new FactoryCalendarVo();
				factoryCalendarVo.setFactoryDate(m.get("factoryDate").toString());
				factoryCalendarVo.setFactoryType(m.get("factoryType").toString());
				factoryCalendarVo.setTimeCode(m.get("timeCode").toString());
				factoryCalendarVo.setStartTime(m.get("startTime").toString());
				factoryCalendarVo.setEndTime(m.get("endTime").toString());
				factoryCalendarVo.setRunningTime(m.get("runningTime").toString());
				factoryCalendarVo.setBreakTime(m.get("breakTime").toString());
				factoryCalendarVo.setRegId(Utils.getUserId());
				factoryCalendarVo.setUpdId(Utils.getUserId());
				if(m.get("dataStatus").toString().equals("create")) {
					factoryCalendarService.factoryCalendarCreate(factoryCalendarVo);
				} else {
					factoryCalendarService.factoryCalendarUpdate(factoryCalendarVo);
				}
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}

