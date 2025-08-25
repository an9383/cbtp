package mes.web.ml;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.sm.MatrlUserService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class MoldInfoAdmController {

	private static final Logger logger = LoggerFactory.getLogger(MoldInfoAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	@Inject
	private MatrlUserService matrlUserService;
	
	//금형정보관리 메인
	@RequestMapping(value = "/mlsc0010", method = RequestMethod.GET)
	public String totalAttachAdmMain(Locale locale, Model model) throws Exception {
		logger.info("금형정보관리 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			model.addAttribute("userNm", Utils.getUserNm());
			model.addAttribute("userNumber", Utils.getUserNumber());
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
			commonCodeVo.setBaseGroupCd("125"); // 사용유무
			List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("003"); // 관리부서
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("admDept", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("031"); // 설비기타구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("etcGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("039"); // 공정구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("prcNm", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("106"); // 자산구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("assetGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("066"); // 수리상태
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("repairStatus", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("122"); // 등급
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("moldGrade", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("124"); // 설비정보관리구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("056"); // 점검주기
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("checkCycle", equipCodeList);
			
			commonCodeVo.setBaseGroupCd("137"); // 일상점검 입력방식
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspInputMethod", equipCodeList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "ml/mlsc0010";
	}
	
	//철형정보관리 메인
	@RequestMapping(value = "/mlsc0100", method = RequestMethod.GET)
	public String totalAttachAdmMain2(Locale locale, Model model) throws Exception {
		logger.info("철형정보관리 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			model.addAttribute("userNm", Utils.getUserNm());
			model.addAttribute("userNumber", Utils.getUserNumber());
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
			commonCodeVo.setBaseGroupCd("125"); // 사용유무
			List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("003"); // 관리부서
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("admDept", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("031"); // 설비기타구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("etcGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("039"); // 공정구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("prcNm", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("106"); // 자산구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("assetGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("066"); // 수리상태
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("repairStatus", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("122"); // 등급
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("moldGrade", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("124"); // 설비정보관리구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("056"); // 점검주기
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("checkCycle", equipCodeList);
			
			commonCodeVo.setBaseGroupCd("137"); // 일상점검 입력방식
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspInputMethod", equipCodeList);
			
			commonCodeVo.setBaseGroupCd("099"); // 차종
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("carType", equipCodeList);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "ml/mlsc0100";
	}
	
	//금형정보관리 메인
		@RequestMapping(value = "/mlsc0030", method = RequestMethod.GET)
		public String moldLifeManagementMain(Locale locale, Model model) throws Exception {
			logger.info("금형수명관리 메인");
			try {
				Date date = new Date();
				DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				String formattedDate = dateFormat.format(date);
				model.addAttribute("serverTime", formattedDate );
				model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
				
				CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
				
				commonCodeVo.setBaseGroupCd("001"); // 사용유무
				List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("useYn", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("003"); // 관리부서
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("admDept", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("030"); // 구분
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("equipGubun", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("031"); // 설비기타구분
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("etcGubun", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("039"); // 공정구분
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("prcNm", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("106"); // 자산구분
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("assetGubun", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("122"); // 등급
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("moldGrade", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("095"); // 품목상태
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("stateCd", equipCodeList);
				
				String userNumber = Utils.getUserNumber();
				String userNm = Utils.getUserNm();
				String departmentNm = Utils.getUserDepartmentNm();
				model.addAttribute("userNumber" , userNumber);
				model.addAttribute("userNm" , userNm);
				model.addAttribute("departmentNm" , departmentNm);
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return "ml/mlsc0030";
		}
		
	
	//금형관리대장 페이지
	@RequestMapping(value = "/mlsc0040", method = RequestMethod.GET)
	public String mlsc0040(Locale locale, Model model) throws Exception {
		logger.info("금형관리대장 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			MatrlUserVo matrlUserVo = new MatrlUserVo(); //작성자
			List<MatrlUserVo> matrlUserList = matrlUserService.listAll(matrlUserVo);
			model.addAttribute("userList", matrlUserList );
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ml/mlsc0040";
	}
	
	//철형관리대장 페이지
		@RequestMapping(value = "/mlsc0110", method = RequestMethod.GET)
		public String mlsc0110(Locale locale, Model model) throws Exception {
			logger.info("철형관리대장 메인");
			try {
				model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
				model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
				model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
				
				MatrlUserVo matrlUserVo = new MatrlUserVo(); //작성자
				List<MatrlUserVo> matrlUserList = matrlUserService.listAll(matrlUserVo);
				model.addAttribute("userList", matrlUserList );
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return "ml/mlsc0110";
		}
	
	//금형이력카드 페이지
	@RequestMapping(value = "/mlsc0050", method = RequestMethod.GET)
	public String mlsc0050(Locale locale, Model model) throws Exception {
		logger.info("금형이력카드 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("userNm", Utils.getUserNm());
			model.addAttribute("userNumber", Utils.getUserNumber());
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
			commonCodeVo.setBaseGroupCd("001"); // 사용유무
			List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("003"); // 관리부서
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("admDept", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("031"); // 설비기타구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("etcGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("039"); // 공정구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("prcNm", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("106"); // 자산구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("assetGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("066"); // 수리상태
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("repairStatus", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("122"); // 등급
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("moldGrade", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("124"); // 설비정보관리구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", equipCodeList );

			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "ml/mlsc0050";
	}
	
	//철형이력카드 페이지
		@RequestMapping(value = "/mlsc0120", method = RequestMethod.GET)
		public String mlsc0120(Locale locale, Model model) throws Exception {
			logger.info("금형이력카드 메인");
			try {
				Date date = new Date();
				DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				String formattedDate = dateFormat.format(date);
				model.addAttribute("serverTime", formattedDate );
				model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
				model.addAttribute("userNm", Utils.getUserNm());
				model.addAttribute("userNumber", Utils.getUserNumber());
				
				CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
				commonCodeVo.setBaseGroupCd("001"); // 사용유무
				List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("useYn", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("003"); // 관리부서
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("admDept", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("031"); // 설비기타구분
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("etcGubun", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("039"); // 공정구분
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("prcNm", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("106"); // 자산구분
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("assetGubun", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("066"); // 수리상태
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("repairStatus", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("122"); // 등급
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("moldGrade", equipCodeList );
				
				commonCodeVo.setBaseGroupCd("124"); // 설비정보관리구분
				commonCodeVo.setUseYn("001");
				equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("equipGubun", equipCodeList );

				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return "ml/mlsc0120";
		}
	
	
	//금형재가동이력 페이지
	@RequestMapping(value = "/mlsc0060", method = RequestMethod.GET)
	public String mlsc0060(Locale locale, Model model) throws Exception {
		logger.info("금형재가동이력 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ml/mlsc0060";
	}
	
	
	//금형 수명관리
	@RequestMapping(value = "ml/readMoldMonthListAll", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> readMoldMonthListAll(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("금형 수명관리 목록조회 " + equipCodeAdmVo);
		try {	
			List<EquipCodeAdmVo> outputList = new ArrayList<EquipCodeAdmVo>();
			String matrlCd = "";
			String planDateList = "";
			String[] planDateListSetter = new String[31];
			for(int i=1; i <= 31; i++) {
				
				planDateList += "[" + equipCodeAdmVo.getThisMonth().toString();
				planDateList += String.format("%02d", i);
				planDateList += "],";
				
				planDateListSetter[i-1] = equipCodeAdmVo.getThisMonth().toString() + String.format("%02d", i);
			}
			equipCodeAdmVo.setDayList(planDateList.substring(0,planDateList.length()-1));	
			equipCodeAdmVo.setLastMonth(equipCodeAdmVo.getThisMonth().toString() + "01");
			outputList = equipCodeAdmService.readMoldMonthListAll(equipCodeAdmVo);
			
			
			jsonData.put("data", outputList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("원자재수급 계획등록 목록조회 에러발생");
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	//생산관리/생산계획 - DataTable Header 생성
	@RequestMapping(value = "/ml/createMonthPlanHeader", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> createMonthPlanHeader(String planDate) throws Exception {

		logger.info("생산계획 - DataTable Header 생성");
		Map<String, Object> jsonData = new HashMap<>();
		try {
			//ajax로 선택한 yyyymm을 가져와서 해당 달의 최대 일 수를 구함
			int intYear = Integer.parseInt(planDate.substring(0, 4));
			int intMonth = Integer.parseInt(planDate.substring(4, 6));
			LocalDate newMonth = LocalDate.of(intYear, intMonth, 1);
			//선택 월의 최대 일 수
			int lengthOfMonth = newMonth.lengthOfMonth();
			String stringYear = planDate.substring(0, 4);
			String stringMonth = planDate.substring(4, 6);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			//존재하는 날짜들
			List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
			for (int i = 1; i <= lengthOfMonth; i++) {
				Date date = dateFormat.parse(stringYear + "-" + stringMonth + "-" + Integer.toString(i));
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				//1일, 2월, 3화, 4수, 5목, 6금, 7토
				int dayNum = cal.get(Calendar.DAY_OF_WEEK);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", i);
				map.put("countDay", i + "일");
				map.put("day", dayNum);
				listMap.add(map);
			}
			
			//존재하지 않는 날짜들
			for (int i=lengthOfMonth; i<31; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", i);
				map.put("countDay", "");
				map.put("day", 0);
				listMap.add(map);
			}
			
			jsonData.put("dayCount", lengthOfMonth);
			jsonData.put("data", listMap);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			logger.info("생산계획 - DataTable Header 생성 실패");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}

		return jsonData;
	}
	
	

	
}
