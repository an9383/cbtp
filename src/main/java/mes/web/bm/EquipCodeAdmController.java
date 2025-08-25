package mes.web.bm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mysql.jdbc.Util;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.CorrDataListVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bm.AttachDataService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.MeasureInstrmtAdmService;
import mes.service.sm.MatrlUserService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.EquipUtils;
import mes.web.ut.Utils;

@Controller
public class EquipCodeAdmController {
	
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	@Inject
	private MeasureInstrmtAdmService measureInstrmtAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private AttachDataService attachDataService;
	
	@Inject
	private MatrlUserService matrlUserService;
	
	@Value("${file.equipExcelUpload}") 
	private String equipExcelUpload;
	
	@Value("${file.equipBasicForm}") 
	private String equipBasicForm;
	
	private static final Logger logger = LoggerFactory.getLogger(EquipCodeAdmController.class);
	
	//설비정보관리 페이지
	@RequestMapping(value = "/bmsc0060", method = RequestMethod.GET)
	public String bmsc0060(Locale locale, Model model) throws Exception {
		logger.info("설비정보관리 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			model.addAttribute("userNm", Utils.getUserNm());
			model.addAttribute("userNumber", Utils.getUserNumber());
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
			commonCodeVo.setBaseGroupCd("125"); // 설비상태
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
			
			MatrlUserVo matrlUserVo = new MatrlUserVo(); // 사용자 목록
			List<MatrlUserVo> matrlUserList  = matrlUserService.listAll(matrlUserVo);
			model.addAttribute("matrlUserList", matrlUserList);

			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "bm/bmsc0060";
	}
	
	//설비관리대장 페이지
	@RequestMapping(value = "/emsc0080", method = RequestMethod.GET)
	public String emsc0080(Locale locale, Model model) throws Exception {
		logger.info("설비관리대장 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
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

			MatrlUserVo matrlUserVo = new MatrlUserVo(); //작성자
			List<MatrlUserVo> matrlUserList = matrlUserService.listAll(matrlUserVo);
			model.addAttribute("userList", matrlUserList );
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "em/emsc0080";
	}
	
	//설비이력카드 페이지
	@RequestMapping(value = "/emsc0090", method = RequestMethod.GET)
	public String emsc0090(Locale locale, Model model) throws Exception {
		logger.info("설비이력카드 메인");
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
		
		return "em/emsc0090";
	}
	
	//설비재사용 이력 페이지
	@RequestMapping(value = "/emsc0100", method = RequestMethod.GET)
	public String emsc0100(Locale locale, Model model) throws Exception {
		logger.info("설비재사용 이력 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
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

			commonCodeVo.setBaseGroupCd("115"); // 작업지시선택비가동구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("nonOperationGubun", equipCodeList );
			
			commonCodeVo.setBaseGroupCd("132"); // 통합자료실 파일구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("fileGubun", equipCodeList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "em/emsc0100";
	}

	//설비관리 전체 조회
	@RequestMapping(value = "/bm/equipCodeAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodeAdmList(EquipCodeAdmVo equipCodeAdmVo
		) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		//logger.info("설비코드 읽기 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			
			List<EquipCodeAdmVo> list2 = new ArrayList<EquipCodeAdmVo>();
			
			if(equipCodeAdmVo.getValue() == null ) {
				list2 =  equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
				
			}else {
					for(int i = 0; i < list.size(); i++) {
					
					if(list.get(i).getUseYn().equals("001")) {
						list2.add(list.get(i));
					}
				}
			}
			
			//logger.info("검색 후 : " + list);
			jsonData.put("data", list2);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비코드 클릭 Read
	@RequestMapping(value = "/bm/equipCodeAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodeAdmRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비코드 읽기 : " + equipCodeAdmVo);
		try {
			equipCodeAdmVo = equipCodeAdmService.equipCodeAdmRead(equipCodeAdmVo);
			logger.info("검색 후 : " + equipCodeAdmVo);
			jsonData.put("data", equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비재가동 이력 read
	@RequestMapping(value = "/bm/equipRestartInfoRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRestartInfoRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비재가동 이력 read : " + equipCodeAdmVo);
		try {
			equipCodeAdmVo = equipCodeAdmService.equipRestartInfoRead(equipCodeAdmVo);
			jsonData.put("data", equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//작업조건 Read
	@RequestMapping(value = "/bm/eqWorkStandAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> eqWorkStandAdmRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("작업조건 읽기 : " + equipCodeAdmVo);
		try {
			equipCodeAdmVo = equipCodeAdmService.eqWorkStandAdmRead(equipCodeAdmVo);
			logger.info("검색 후 : " + equipCodeAdmVo);
			jsonData.put("data", equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//작업조건 등록 및 수정
	@RequestMapping(value = "/bm/eqWorkStandAdmController", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> eqWorkStandAdmController(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("작업조건 등록 및 수정 : " + equipCodeAdmVo);
		try {
			if (equipCodeAdmService.eqWorkStandAdmCount(equipCodeAdmVo) == 0) {
				equipCodeAdmVo.setRegId(Utils.getUserId());
				equipCodeAdmService.eqWorkStandAdmCreate(equipCodeAdmVo);
			} else {
				equipCodeAdmVo.setUpdId(Utils.getUserId());
				equipCodeAdmService.eqWorkStandAdmUpdate(equipCodeAdmVo);
			}
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//부대설비 삭제
	@RequestMapping(value = "/bm/ancFacDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ancFacDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("부대설비 추가 및 삭제 : " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setUpdId(Utils.getUserId());
			equipCodeAdmService.ancFacUpdateDelete(equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//부속품 삭제
	@RequestMapping(value = "/bm/partDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> partDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("부속품 삭제 : " + equipCodeAdmVo);
		try {
			equipCodeAdmService.partAdmDelete(equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//기준서 삭제
	@RequestMapping(value = "/bm/equipCheckAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCheckAdmDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("기준서 삭제 : " + equipCodeAdmVo);
		try {
			equipCodeAdmService.equipCheckAdmDelete(equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//일상점검 삭제
	@RequestMapping(value = "/bm/equipDailyCheckDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipDailyCheckDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("일상점검 삭제 : " + equipCodeAdmVo);
		try {
			equipCodeAdmService.equipDailyCheckDelete(equipCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//부대설비 추가
	@RequestMapping(value = "/bm/ancFacUpdateDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ancFacUpdateDelete(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부대설비 추가 및 삭제: " + equipCodeAdmVo);
		try {
			
			//저장해야하는 중심 설비 코드
			String equipCdValue = equipCodeAdmList.get(0).get("mainEquipCd").toString();
			logger.info("======================" + equipCdValue);
			equipCodeAdmVo.setMainEquipCd(equipCdValue);
			List<EquipCodeAdmVo> insertList  = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			
			//각 부대설비에 등록된 설비 초기화
			for(EquipCodeAdmVo list : insertList) {
				equipCodeAdmVo = new EquipCodeAdmVo();
				equipCodeAdmVo.setEquipCd(list.getEquipCd());
				equipCodeAdmVo.setUpdId(Utils.getUserId());
				equipCodeAdmService.ancFacUpdateDelete(equipCodeAdmVo);
			}
			
			if(!(equipCodeAdmList.get(0).get("equipCd").toString().equals("x"))) {
				//입력한 부대설비 등록
				for(Map<String, Object> list : equipCodeAdmList) {
					
					equipCodeAdmVo.setEquipCd(list.get("equipCd").toString());
					equipCodeAdmVo.setMainEquipCd(equipCdValue);
					equipCodeAdmVo.setUpdId(Utils.getUserId());
					
					equipCodeAdmService.ancFacUpdateDelete(equipCodeAdmVo);
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
	
	//일상점검 등록
	@RequestMapping(value = "/bm/equipDailyCheckCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipDailyCheckCreate(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("일상점검 추가 : " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setEquipCd(equipCodeAdmList.get(0).get("equipCd").toString());
			equipCodeAdmVo.setMainGubun(equipCodeAdmList.get(0).get("mainGubun").toString());
			equipCodeAdmService.equipDailyCheckDelete(equipCodeAdmVo);
			
			for(Map<String, Object> list : equipCodeAdmList) {
				
				int seq = equipCodeAdmService.getCheckSeq(equipCodeAdmVo);
				String sequence = Integer.toString(seq);
				logger.info("검색 후 SEQ : " + sequence);
				equipCodeAdmVo.setCheckSeq(sequence);
				
				equipCodeAdmVo.setCheckList(list.get("checkList").toString());
				equipCodeAdmVo.setCheckMethod(list.get("checkMethod").toString());
				equipCodeAdmVo.setCheckSpec(list.get("checkSpec").toString());
				equipCodeAdmVo.setInspInputMethod(list.get("inspInputMethod").toString());
				equipCodeAdmVo.setRegId(Utils.getUserNumber());
				
				equipCodeAdmService.equipDailyCheckCreate(equipCodeAdmVo);
			}
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//교정내역 전체 조회
	@RequestMapping(value = "/bm/equipCorrInfolist", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCorrInfolist(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("교정내역 읽기:" + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list = null;
			
			if(equipCodeAdmVo.getEquipCd() == null || equipCodeAdmVo.getEquipCd() == ""){
				list = new ArrayList<EquipCodeAdmVo>();
			}else {
				list  = equipCodeAdmService.equipCorrInfoList(equipCodeAdmVo);
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//기타 전체 조회
	@RequestMapping(value = "/bm/equipEtcInfoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipEtcInfo(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("기타 읽기:"+equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list = null;
			
			if(equipCodeAdmVo.getEquipCd() == null || equipCodeAdmVo.getEquipCd() == ""){
				list = new ArrayList<EquipCodeAdmVo>();
			}else {
				list = equipCodeAdmService.equipEtcInfoList(equipCodeAdmVo);
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//부속품 목록 조회
	@RequestMapping(value = "/bm/equipPartAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipPartAdmList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("부속품 목록 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipPartAdmList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//금형 SHOT 이력 목록 조회
	@RequestMapping(value = "/bm/equipShotList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipShotList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("금형 SHOT 이력 목록 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipShotList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//금형 SHOT 이력 년 조회
	@RequestMapping(value = "/bm/moldYearList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> moldYearList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("금형 SHOT 이력 년 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.moldYearList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//금형 SHOT 이력 월 조회
	@RequestMapping(value = "/bm/moldMonthList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> moldMonthList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("금형 SHOT 이력 년 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.moldMonthList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//금형 SHOT 이력 일 조회
	@RequestMapping(value = "/bm/moldDayList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> moldDayList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("금형 SHOT 이력 년 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.moldDayList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//기준서 목록 조회
	@RequestMapping(value = "/bm/equipCheckAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCheckAdmList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("기준서 목록 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipCheckAdmList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비재가동 이력 목록 조회
	@RequestMapping(value = "/bm/equipRestartInfoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRestartInfoList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비재가동 목록 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipRestartInfoList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//일상점검 목록 조회
	@RequestMapping(value = "/bm/equipDailyCheckList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipDailyCheckList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("일상점검 조회 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipDailyCheckList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//등록시 설비코드 채번
	@RequestMapping(value = "/bm/readEquipSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> readEquipSeq() throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비코드 채번 : ");
		try {
			String equipCd = equipCodeAdmService.equipCodeSeq();
			logger.info("채번 equipCd : " + equipCd);
			jsonData.put("data", equipCd);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비코드 Create
	@RequestMapping(value = "/bm/equipCodeCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeAdmCreate(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비관리 등록: " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setRegId(Utils.getUserId());
			equipCodeAdmService.equipCodeAdmCreate(equipCodeAdmVo);
			/*
			if (equipCodeAdmService.overlapEquipInitial(equipCodeAdmVo)==0) {
				if(equipCodeAdmService.equipCodeAdmCreate(equipCodeAdmVo)>0) {
					jsonData.put("result", "ok");
					jsonData.put("message", "등록되었습니다.");
				}else {
					jsonData.put("result", "fail");
					jsonData.put("message", "등록에 실패하였습니다.");
				}
			}else {
				jsonData.put("result", "fail");
				jsonData.put("message", "이니셜이 중복되었습니다.");	
			}
			 */
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//설비코드(엑셀) Create
	@RequestMapping(value="bm/equipExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> equipExcelCreate(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception{
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(모터) 등록 :" + equipCodeAdmVo);
		try {
			
			for(Map<String, Object> m : equipCodeAdmList) {
				equipCodeAdmVo.setEquipCd(equipCodeAdmService.equipCodeSeq());
				
				equipCodeAdmVo.setAssetCd(m.get("assetCd").toString());
				equipCodeAdmVo.setAssetGubun(m.get("assetGubun").toString());
				equipCodeAdmVo.setBuyAmt(m.get("buyAmt").toString());
				
				equipCodeAdmVo.setEquipNo(m.get("equipNo").toString());
				equipCodeAdmVo.setEquipNm(m.get("equipNm").toString());
				equipCodeAdmVo.setPrcNm(m.get("prcNm").toString());
				equipCodeAdmVo.setEquipType(m.get("equipType").toString());
				equipCodeAdmVo.setMfcDate(m.get("mfcDate").toString());
				equipCodeAdmVo.setMfcCorpCd(m.get("mfcCorpCd").toString());
				
				equipCodeAdmVo.setEquipCond(m.get("equipCond").toString());
				equipCodeAdmVo.setUpperAmt(m.get("upperAmt").toString());
				equipCodeAdmVo.setLowerAmt(m.get("lowerAmt").toString());
				
				equipCodeAdmVo.setAncEquipNm(m.get("ancEquipNm").toString());
				equipCodeAdmVo.setAncDate(m.get("ancDate").toString());
				equipCodeAdmVo.setAncCorpCd(m.get("ancCorpCd").toString());
				equipCodeAdmVo.setExpNm(m.get("expNm").toString());
				equipCodeAdmVo.setAncEquipType(m.get("ancEquipType").toString());
				equipCodeAdmVo.setBuyCorpNm(m.get("buyCorpNm").toString());
				
				equipCodeAdmVo.setRegId(Utils.getUserId());
				equipCodeAdmService.equipCodeExcelCreate(equipCodeAdmVo);
			}
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	
	//교정내역 Create
	@RequestMapping(value = "/bm/equipCorrInfoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCorrInfoCreate(@RequestBody List<Map<String, Object>> equipCorrInfoList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("교정내역 등록: " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setEquipCd(equipCorrInfoList.get(0).get("equipCd").toString());
			equipCodeAdmService.equipCorrInfoDelete(equipCodeAdmVo);
		
			for(Map<String, Object> m : equipCorrInfoList) {
				if(m.get("corrCont")!=null) {
					equipCodeAdmVo.setCorrRegDate(m.get("corrRegDate").toString());
					if(equipCodeAdmService.overlapCorrRegDate(equipCodeAdmVo)==0) {
						equipCodeAdmVo.setCorrCont(m.get("corrCont").toString());
						equipCodeAdmVo.setCorrActOrgan(m.get("corrActOrgan").toString());
						equipCodeAdmVo.setCorrDesc(m.get("corrDesc").toString());
						equipCodeAdmVo.setRegId(Utils.getUserId().toString());
						
						equipCodeAdmService.equipCorrInfoCreate(equipCodeAdmVo);
						jsonData.put("result", "ok");
					}else{
						jsonData.put("result", "exist");
					}
				}else {
					jsonData.put("result", "ok");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부속품 Create
	@RequestMapping(value = "/bm/partAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> partAdmCreate(@RequestBody List<Map<String, Object>> equipCorrInfoList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("교정내역 등록: " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setEquipCd(equipCorrInfoList.get(0).get("equipCd").toString());
			equipCodeAdmService.partAdmDelete(equipCodeAdmVo);
			int partSeq = 1;
			
			if(!(equipCorrInfoList.get(0).get("partArticle").toString().equals("데이터xx"))) {
				for(Map<String, Object> m : equipCorrInfoList) {
					//부속품 시퀀스 조회
					equipCodeAdmVo.setPartSeq(Integer.toString(partSeq));
					equipCodeAdmVo.setPartArticle(m.get("partArticle").toString());
					equipCodeAdmVo.setExchangeCycle(m.get("exchangeCycle").toString());
					equipCodeAdmVo.setRegId(Utils.getUserId().toString());
					equipCodeAdmService.partAdmCreate(equipCodeAdmVo);
					partSeq++;
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
	
	
	//기준서 Create
	@RequestMapping(value = "/bm/equipCheckAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCheckAdmCreate(@RequestBody List<Map<String, Object>> equipCorrInfoList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기준서 등록: " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setEquipCd(equipCorrInfoList.get(0).get("equipCd").toString());
			equipCodeAdmService.equipCheckAdmDelete(equipCodeAdmVo);
		
			for(Map<String, Object> m : equipCorrInfoList) {
				//기준서 시퀀스 조회
				int tempCheckSeq = equipCodeAdmService.checkSeq(equipCodeAdmVo);
				String checkSeq = Integer.toString(tempCheckSeq);
				equipCodeAdmVo.setCheckSeq(checkSeq);
				
				equipCodeAdmVo.setCheckState(m.get("checkState").toString());
				equipCodeAdmVo.setCheckMethod(m.get("checkMethod").toString());
				equipCodeAdmVo.setCheckStandard(m.get("checkStandard").toString());
				equipCodeAdmVo.setCheckDesc(m.get("checkDesc").toString());
				equipCodeAdmVo.setRegId(Utils.getUserId().toString());
				
				equipCodeAdmService.equipCheckAdmCreate(equipCodeAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//교정내역 상세 Delete
	@RequestMapping(value = "/bm/equipCorrInfoDelete2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCorrInfoDelete2(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("교정내역 상세삭제: " + equipCodeAdmVo);
		try {
			equipCodeAdmService.equipCorrInfoDelete2(equipCodeAdmVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//작업조건 Delete
	@RequestMapping(value = "/bm/eqWorkStandAdmDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> eqWorkStandAdmDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("교정내역 상세삭제: " + equipCodeAdmVo);
		try {
			equipCodeAdmService.eqWorkStandAdmDelete(equipCodeAdmVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//기타 Create
	@RequestMapping(value = "/bm/equipEtcInfoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipEtcInfoCreate(@RequestBody List<Map<String, Object>> equipEtcInfoList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기타 등록: " + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setEquipCd(equipEtcInfoList.get(0).get("equipCd").toString());
			equipCodeAdmService.equipEtcInfoDelete(equipCodeAdmVo);
		
			for(Map<String, Object> m : equipEtcInfoList) {
				if(m.get("etcGubun")!=null) {
					equipCodeAdmVo.setEquipCd(m.get("equipCd").toString());
					int etcSeq = equipCodeAdmService.etcSeq(equipCodeAdmVo);
					equipCodeAdmVo.setEtcSeq(etcSeq);
					equipCodeAdmVo.setEtcGubun(m.get("etcGubun").toString());
					equipCodeAdmVo.setEtcCont(m.get("etcCont").toString());
					equipCodeAdmVo.setRegId(Utils.getUserId().toString());
					
					equipCodeAdmService.equipEtcInfoCreate(equipCodeAdmVo);
					jsonData.put("result", "ok");
				}
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//설비코드 Update
	@RequestMapping(value = "/bm/equipCodeUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodemAdmUpdate(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		
		try {
			equipCodeAdmVo.setUpdId(Utils.getUserId());
			if(equipCodeAdmService.equipCodeAdmUpdate(equipCodeAdmVo)>0) {
				jsonData.put("result", "ok");
				jsonData.put("message", "수정되었습니다.");
			}else {
				jsonData.put("result", "fail");
				jsonData.put("message", "수정에 실패하였습니다.");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//설비관리 이미지 경로조회
	@RequestMapping(value = "/bm/equipCodeImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodeImageRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
			EquipCodeAdmVo vo = equipCodeAdmService.equipImgRead(equipCodeAdmVo);
			jsonData.put("imageFile1Con", vo.getImageFile1Con());
			jsonData.put("imageFile2Con", vo.getImageFile2Con());
			if (vo.getImageFile1() != null) {
				String imageFile1 = new String(Base64.encodeBase64(vo.getImageFile1()));
				String imageFile1Nm = vo.getImageFile1Nm();
				jsonData.put("imageFile1", imageFile1);
				jsonData.put("imageFile1Nm", imageFile1Nm);
			}
			if (vo.getImageFile2() != null) {
				String imageFile2 = new String(Base64.encodeBase64(vo.getImageFile2()));
				String imageFile2Nm = vo.getImageFile2Nm();
				jsonData.put("imageFile2", imageFile2);
				jsonData.put("imageFile2Nm", imageFile2Nm);
			}
			if (vo.getImageFile3() != null) {
				String imageFile3 = new String(Base64.encodeBase64(vo.getImageFile3()));
				String imageFile3Nm = vo.getImageFile3Nm();
				jsonData.put("imageFile3", imageFile3);
				jsonData.put("imageFile3Nm", imageFile3Nm);
			}
			if (vo.getImageFile4() != null) {
				String imageFile4 = new String(Base64.encodeBase64(vo.getImageFile4()));
				String imageFile4Nm = vo.getImageFile4Nm();
				jsonData.put("imageFile4", imageFile4);
				jsonData.put("imageFile4Nm", imageFile4Nm);
			}
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	 

	
	//설비 관리 이미지 업로드(DB에 바로 저장)
	@RequestMapping(value = "/bm/equipCodeImageUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeImageUpload(EquipCodeAdmVo equipCodeAdmVo,
			MultipartHttpServletRequest multi) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			logger.info("설비이미지 vo = " + equipCodeAdmVo);
			//이미지 번호
			String value = multi.getParameter("value");
			MultipartFile mFile = multi.getFile("imgAdd" + value);
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
			String[] imageList = {"tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"};
			Long size = mFile.getSize();
			if(!Arrays.asList(imageList).contains(extension)) {
				jsonData.put("result", "extensionError");
	  		} 
//			else if (size > (1 * 1024 * 1024)) {
//	  			jsonData.put("result", "sizeError");
//			} 
			else if (mFile == null || mFile.isEmpty()) {

			} else {
				switch(value) {
				case "1" :
					equipCodeAdmVo.setImageFile1(mFile.getBytes());
					equipCodeAdmVo.setImageFile1Nm(fileName);
					break;
				case "2" :
					equipCodeAdmVo.setImageFile2(mFile.getBytes());
					equipCodeAdmVo.setImageFile2Nm(fileName);
					break;
				case "3" :
					equipCodeAdmVo.setImageFile3(mFile.getBytes());
					equipCodeAdmVo.setImageFile3Nm(fileName);
					break;
				case "4" :
					equipCodeAdmVo.setImageFile4(mFile.getBytes());
					equipCodeAdmVo.setImageFile4Nm(fileName);
					break;
				}
				equipCodeAdmService.equipImageUpload(equipCodeAdmVo);
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//설비 관리 이미지 Delete
	@RequestMapping(value = "/bm/equipCodeImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeImageDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("파일 삭제 vo:" + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setUpdId(Utils.getUserId());		
			equipCodeAdmService.equipImageDelete(equipCodeAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			logger.info("" + Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//견적관리 엑셀조회
	@RequestMapping(value = "bm/equipExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipExcelDataList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(equipCodeAdmVo.getUrl());
		
		if(equipCodeAdmVo.getUrl() == null || equipCodeAdmVo.getUrl().equals("")) {
			List<EquipCodeAdmVo> equipCodeAdmList = new ArrayList<EquipCodeAdmVo>();
			jsonData.put("data", equipCodeAdmList);
		}else {
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<EquipCodeAdmVo> equipCodeAdmList = excelReader.equipFileload(equipCodeAdmVo.getUrl(), logger);
			jsonData.put("data", equipCodeAdmList);
			
			logger.info("견적관리 엑셀조회 : " + equipCodeAdmList);				
			File file = new File(equipCodeAdmVo.getUrl());
			logger.info(equipCodeAdmVo.getUrl());

			if( file.exists() ){
	    		if(file.delete()){
	    			logger.info("파일삭제 성공");    			
	    		}else{
	    			logger.info("파일삭제 실패");
	    		}
	    	}else{
	    		logger.info("파일이 존재하지 않습니다.");
	    	}
			
		}
		return jsonData;
	}
	
	//엑셀 업로드
	@RequestMapping(value= "bm/equipExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipExcelUpload(Model model, @RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = equipExcelUpload;
			
			// 서버에서 저장 할 파일 이름
			TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
			Calendar calendar = Calendar.getInstance(tz);
			fileName += calendar.get(Calendar.YEAR);
			fileName += calendar.get(Calendar.MONTH)+1;
			fileName += calendar.get(Calendar.DATE);
			fileName += calendar.get(Calendar.HOUR);
			fileName += calendar.get(Calendar.MINUTE);
			fileName += calendar.get(Calendar.SECOND);
			
			String[] originalFileName = extName.split("\\.");
			if(originalFileName[1].equals("xlsx")) {
				fileName += ".xlsx";		
			} else if(originalFileName[1].equals("xls")) {
				fileName += ".xls";		
			}
			
			String saveFileName = fileName;
			
			logger.info("originFilename : " + originFilename);
			logger.info("extensionName : " + extName);
			logger.info("size : " + size);
			logger.info("saveFileName : " + saveFileName);
			
			logger.info("path : " + path);
			
			File Folder = new File(path);
			
			if (!Folder.exists()) {
				try{
				    Folder.mkdirs(); //폴더 생성합니다.
				    logger.info("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
		        	 logger.info("이미 폴더가 생성되어 있습니다.");
			}
			
			boolean result = false;
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ===> " + path);
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = path + saveFileName;
			logger.info(url);
			jsonData.put("data", url);
			jsonData.put("result", "ok");
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		
		return jsonData;
			
	}
	
	//기본양식 다운로드
	@RequestMapping(value="bm/equipBasicForm", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipBasicForm(
		 HttpServletResponse res , HttpServletRequest req,
		 ItemPartAdmVo itemPartAdmVo) throws Exception{
	Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String saveFile = "basicEquip.xlsx"; 
			String filePath = equipBasicForm+"/basicEquip.xlsx";
		
			fileDownload(res, req, saveFile, filePath);
			
			logger.info("파일 다운");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	}
	 
	//파일 다운로드
	public void fileDownload( HttpServletResponse res , HttpServletRequest req, String saveFile, String filePath) throws Exception{
		try {
			
			String dFile = saveFile;
			String path = filePath;
			logger.info(path);
			File file = new File(path);
		
			String userAgent = req.getHeader("User-Agent");
	
			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);
	
			if (ie) {
				logger.info("익스");
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				logger.info("크롬");
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}
			
	
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=\"" + dFile + "\";");
	
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);
	
			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}
	
			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	  }
	
	//이미지 내용 수정
	@RequestMapping(value = "/bm/equipImgUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipImgUpdate(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지 내용 수정: " + equipCodeAdmVo);
		try {
			equipCodeAdmService.equipImgUpdate(equipCodeAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("message", "수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	

	//전체 Delete
	@RequestMapping(value = "/bm/equipDataDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipDataDelete(EquipCodeAdmVo equipCodeAdmVo,
			CorrDataListVo corrDataListVo, AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("삭제: " + equipCodeAdmVo);
		try {
			//기본정보 삭제
			equipCodeAdmService.equipDataDelete(equipCodeAdmVo);
			
			//점검이력 삭제
			measureInstrmtAdmService.attachCorreDataDelete(corrDataListVo);
			
			//점검이력 첨부파일 삭제
			attachDataService.attachDataDelete(attachDataVo);
			
			//작업조건 삭제
//			equipCodeAdmService.eqWorkStandAdmDelete(equipCodeAdmVo);
			
			//부속품 삭제
			equipCodeAdmService.partAdmDelete(equipCodeAdmVo);
			
			//각 부대설비에 등록된 설비 초기화
			EquipCodeAdmVo delete = new EquipCodeAdmVo();
			delete.setMainEquipCd(equipCodeAdmVo.getEquipCd());
			List<EquipCodeAdmVo> insertList  = equipCodeAdmService.equipCodeAdmList(delete);
			
			for(EquipCodeAdmVo list : insertList) {
				equipCodeAdmVo = new EquipCodeAdmVo();
				equipCodeAdmVo.setEquipCd(list.getEquipCd());
				equipCodeAdmVo.setUpdId(Utils.getUserId());
				equipCodeAdmService.ancFacUpdateDelete(equipCodeAdmVo);
			}
			
			//일상점검 삭제
			equipCodeAdmService.equipDailyCheckDelete(equipCodeAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//설비코드 Create
	@RequestMapping(value = "/bm/equipNoCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipNoCheck(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			if (equipCodeAdmService.equipNoCheck(equipCodeAdmVo)>0) {
				jsonData.put("result", "exist");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//설비제원 리스트 조회
	@RequestMapping(value = "/bm/equipDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipDataList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비코드 읽기 : " + equipCodeAdmVo);
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.equipDataList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비제원 Create
	@RequestMapping(value="bm/equipDataCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> equipDataCreate(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception{
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(모터) 등록 :" + equipCodeAdmVo);
		try {
			equipCodeAdmVo.setEquipCd(equipCodeAdmList.get(0).get("equipCd").toString());
			equipCodeAdmService.equipDataDtlDelete(equipCodeAdmVo);
			int equipSeq = 1;
			for(Map<String, Object> m : equipCodeAdmList) {
				if(equipSeq==1 && m.get("equipPart").toString().equals("noData") && m.get("equipUnit").toString().equals("noData") && m.get("equipDc").toString().equals("noData")) {
					jsonData.put("result", "ok");
					return jsonData;
				}
				equipCodeAdmVo.setEquipSeq(Integer.toString(equipSeq));
				equipCodeAdmVo.setEquipPart(m.get("equipPart").toString());
				equipCodeAdmVo.setEquipUnit(m.get("equipUnit").toString());
				equipCodeAdmVo.setEquipDc(m.get("equipDc").toString());
				equipCodeAdmVo.setRegId(Utils.getUserId());
				equipCodeAdmService.equipDataDtlCreate(equipCodeAdmVo);
				equipSeq++;
			}
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	//주생산설비에 속한 부대설비 이미지 경로조회
	@RequestMapping(value = "/bm/equipCodePartImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodePartImgRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
			//부대 설비 데이터 조회
			List<EquipCodeAdmVo> ancFacData = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
			//부대 설비 데이터 크기
			int ancFacDataCount = ancFacData.size();
			
			//보낼 데이터
			List<EquipCodeAdmVo> outputData = new ArrayList();
			
			jsonData.put("dataCount", ancFacDataCount);
			//조회한 부대 설비의 이미지, 경로 조회
			for(int i=0; i<ancFacDataCount; i++) {
				EquipCodeAdmVo imageData = new EquipCodeAdmVo();
				imageData.setEquipCd(ancFacData.get(i).getEquipCd());	
				imageData = equipCodeAdmService.equipImgRead(imageData);	//설비 파일 조회
				//파일 여부 확인
				if (imageData.getImageFile1() != null) {
					String imageFile1 = new String(Base64.encodeBase64(imageData.getImageFile1()));
					imageData.setImageFile1Con(imageFile1);
				} else {
					imageData.setImageFile1Con(null);
				}
				outputData.add(imageData);
			}
			jsonData.put("data", outputData);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	
	
	
	//******************************************철형차종정보관리**************************************************//
	
	
	//철형차종정보관리 조회
	@RequestMapping(value = "/bm/ironItemList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ironCarTypeList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("철형차종정보관리 조회");
		try {
			List<EquipCodeAdmVo> list  = equipCodeAdmService.ironItemList(equipCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	//철형차종정보관리 데이터 등록
	@RequestMapping(value = "/bm/ironItemCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ironCarTypeCreate(@RequestBody List<Map<String, Object>> ironItemList) throws Exception {
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		logger.info("철형차종정보관리 등록 : "+equipCodeAdmVo);   		
		try {
			equipCodeAdmVo.setEquipCd(ironItemList.get(0).get("equipCd").toString());		
			equipCodeAdmService.ironItemDeleteAll(equipCodeAdmVo);
			for(Map<String, Object> m : ironItemList) {	
				equipCodeAdmVo.setItemSeq(m.get("itemSeq").toString());	
				equipCodeAdmVo.setRegId(Utils.getUserId());
				equipCodeAdmService.ironItemCreate(equipCodeAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//철형차종정보관리 데이터 삭제 
	@RequestMapping(value = "bm/ironItemDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ironCarTypeDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("철형차종정보관리 삭제 : "+equipCodeAdmVo);   
		try {
			equipCodeAdmService.ironItemDelete(equipCodeAdmVo);			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
}