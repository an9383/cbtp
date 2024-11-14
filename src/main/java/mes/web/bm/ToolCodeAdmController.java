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

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.CorrDataListVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.ToolCodeAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bm.AttachDataService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.MeasureInstrmtAdmService;
import mes.service.bm.ToolCodeAdmService;
import mes.service.sm.MatrlUserService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ToolCodeAdmController {
	
	@Inject
	private ToolCodeAdmService toolCodeAdmService;
	
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
	
	//공구정보관리 페이지
	@RequestMapping(value = "/bmsc0320", method = RequestMethod.GET)
	public String bmsc0320(Locale locale, Model model) throws Exception {
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
			
			commonCodeVo.setBaseGroupCd("156"); // 설비정보관리구분
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
		
		return "bm/bmsc0320";
	}
	
	
	//공구관리대장 페이지
	@RequestMapping(value = "/tosc0010", method = RequestMethod.GET)
	public String tosc0010(Locale locale, Model model) throws Exception {
		logger.info("공구관리대장 메인");
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
			
			commonCodeVo.setBaseGroupCd("156"); // 설비정보관리구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", equipCodeList );

			MatrlUserVo matrlUserVo = new MatrlUserVo(); //작성자
			List<MatrlUserVo> matrlUserList = matrlUserService.listAll(matrlUserVo);
			model.addAttribute("userList", matrlUserList );
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "to/tosc0010";
	}
	
	//공구이력카드 페이지
	@RequestMapping(value = "/tosc0020", method = RequestMethod.GET)
	public String tosc0020(Locale locale, Model model) throws Exception {
		logger.info("공구이력카드 메인");
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
			
			commonCodeVo.setBaseGroupCd("156"); // 설비정보관리구분
			commonCodeVo.setUseYn("001");
			equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", equipCodeList );

			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "to/tosc0020";
	}

	//설비관리 전체 조회
	@RequestMapping(value = "/bm/toolCodeAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodeAdmList(ToolCodeAdmVo toolCodeAdmVo
		) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		//logger.info("설비코드 읽기 : " + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list  = toolCodeAdmService.equipCodeAdmList(toolCodeAdmVo);
			
			List<ToolCodeAdmVo> list2 = new ArrayList<ToolCodeAdmVo>();
			
			if(toolCodeAdmVo.getValue() == null ) {
				list2 =  toolCodeAdmService.equipCodeAdmList(toolCodeAdmVo);
				
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
	@RequestMapping(value = "/bm/toolCodeAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodeAdmRead(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비코드 읽기 : " + toolCodeAdmVo);
		try {
			toolCodeAdmVo = toolCodeAdmService.equipCodeAdmRead(toolCodeAdmVo);
			logger.info("검색 후 : " + toolCodeAdmVo);
			jsonData.put("data", toolCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비재가동 이력 read
	@RequestMapping(value = "/bm/toolRestartInfoRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRestartInfoRead(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비재가동 이력 read : " + toolCodeAdmVo);
		try {
			toolCodeAdmVo = toolCodeAdmService.equipRestartInfoRead(toolCodeAdmVo);
			jsonData.put("data", toolCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//기준서 삭제
	@RequestMapping(value = "/bm/toolCheckAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCheckAdmDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("기준서 삭제 : " + toolCodeAdmVo);
		try {
			toolCodeAdmService.equipCheckAdmDelete(toolCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//일상점검 삭제
	@RequestMapping(value = "/bm/toolDailyCheckDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipDailyCheckDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("일상점검 삭제 : " + toolCodeAdmVo);
		try {
			toolCodeAdmService.equipDailyCheckDelete(toolCodeAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//일상점검 등록
	@RequestMapping(value = "/bm/toolDailyCheckCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipDailyCheckCreate(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception {
		ToolCodeAdmVo toolCodeAdmVo = new ToolCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("일상점검 추가 : " + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setEquipCd(equipCodeAdmList.get(0).get("equipCd").toString());
			toolCodeAdmVo.setMainGubun(equipCodeAdmList.get(0).get("mainGubun").toString());
			toolCodeAdmService.equipDailyCheckDelete(toolCodeAdmVo);
			
			for(Map<String, Object> list : equipCodeAdmList) {
				
				int seq = toolCodeAdmService.getCheckSeq(toolCodeAdmVo);
				String sequence = Integer.toString(seq);
				logger.info("검색 후 SEQ : " + sequence);
				toolCodeAdmVo.setCheckSeq(sequence);
				
				toolCodeAdmVo.setCheckList(list.get("checkList").toString());
				toolCodeAdmVo.setCheckMethod(list.get("checkMethod").toString());
				toolCodeAdmVo.setCheckSpec(list.get("checkSpec").toString());
				toolCodeAdmVo.setInspInputMethod(list.get("inspInputMethod").toString());
				toolCodeAdmVo.setRegId(Utils.getUserNumber());
				
				toolCodeAdmService.equipDailyCheckCreate(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCorrInfolist", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCorrInfolist(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("교정내역 읽기:" + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list = null;
			
			if(toolCodeAdmVo.getEquipCd() == null || toolCodeAdmVo.getEquipCd() == ""){
				list = new ArrayList<ToolCodeAdmVo>();
			}else {
				list  = toolCodeAdmService.equipCorrInfoList(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolEtcInfoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipEtcInfo(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("기타 읽기:"+toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list = null;
			
			if(toolCodeAdmVo.getEquipCd() == null || toolCodeAdmVo.getEquipCd() == ""){
				list = new ArrayList<ToolCodeAdmVo>();
			}else {
				list = toolCodeAdmService.equipEtcInfoList(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolPartAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipPartAdmList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("부속품 목록 조회 : " + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list  = toolCodeAdmService.equipPartAdmList(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCheckAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCheckAdmList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("기준서 목록 조회 : " + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list  = toolCodeAdmService.equipCheckAdmList(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolRestartInfoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRestartInfoList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비재가동 목록 조회 : " + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list  = toolCodeAdmService.equipRestartInfoList(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolDailyCheckList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipDailyCheckList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("일상점검 조회 : " + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list  = toolCodeAdmService.equipDailyCheckList(toolCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//설비코드 Create
	@RequestMapping(value = "/bm/toolCodeCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeAdmCreate(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비관리 등록: " + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setRegId(Utils.getUserId());
			toolCodeAdmService.equipCodeAdmCreate(toolCodeAdmVo);
			/*
			if (toolCodeAdmService.overlapEquipInitial(toolCodeAdmVo)==0) {
				if(toolCodeAdmService.equipCodeAdmCreate(toolCodeAdmVo)>0) {
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
	@RequestMapping(value="bm/toolExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> equipExcelCreate(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception{
		ToolCodeAdmVo toolCodeAdmVo = new ToolCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(모터) 등록 :" + toolCodeAdmVo);
		try {
			
			for(Map<String, Object> m : equipCodeAdmList) {
				toolCodeAdmVo.setEquipCd(toolCodeAdmService.equipCodeSeq());
				
				toolCodeAdmVo.setAssetCd(m.get("assetCd").toString());
				toolCodeAdmVo.setAssetGubun(m.get("assetGubun").toString());
				toolCodeAdmVo.setBuyAmt(m.get("buyAmt").toString());
				
				toolCodeAdmVo.setEquipNo(m.get("equipNo").toString());
				toolCodeAdmVo.setEquipNm(m.get("equipNm").toString());
				toolCodeAdmVo.setPrcNm(m.get("prcNm").toString());
				toolCodeAdmVo.setEquipType(m.get("equipType").toString());
				toolCodeAdmVo.setMfcDate(m.get("mfcDate").toString());
				toolCodeAdmVo.setMfcCorpCd(m.get("mfcCorpCd").toString());
				
				toolCodeAdmVo.setEquipCond(m.get("equipCond").toString());
				toolCodeAdmVo.setUpperAmt(m.get("upperAmt").toString());
				toolCodeAdmVo.setLowerAmt(m.get("lowerAmt").toString());
				
				toolCodeAdmVo.setAncEquipNm(m.get("ancEquipNm").toString());
				toolCodeAdmVo.setAncDate(m.get("ancDate").toString());
				toolCodeAdmVo.setAncCorpCd(m.get("ancCorpCd").toString());
				toolCodeAdmVo.setExpNm(m.get("expNm").toString());
				toolCodeAdmVo.setAncEquipType(m.get("ancEquipType").toString());
				toolCodeAdmVo.setBuyCorpNm(m.get("buyCorpNm").toString());
				
				toolCodeAdmVo.setRegId(Utils.getUserId());
				toolCodeAdmService.equipCodeExcelCreate(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCorrInfoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCorrInfoCreate(@RequestBody List<Map<String, Object>> equipCorrInfoList) throws Exception {
		ToolCodeAdmVo toolCodeAdmVo = new ToolCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("교정내역 등록: " + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setEquipCd(equipCorrInfoList.get(0).get("equipCd").toString());
			toolCodeAdmService.equipCorrInfoDelete(toolCodeAdmVo);
		
			for(Map<String, Object> m : equipCorrInfoList) {
				if(m.get("corrCont")!=null) {
					toolCodeAdmVo.setCorrRegDate(m.get("corrRegDate").toString());
					if(toolCodeAdmService.overlapCorrRegDate(toolCodeAdmVo)==0) {
						toolCodeAdmVo.setCorrCont(m.get("corrCont").toString());
						toolCodeAdmVo.setCorrActOrgan(m.get("corrActOrgan").toString());
						toolCodeAdmVo.setCorrDesc(m.get("corrDesc").toString());
						toolCodeAdmVo.setRegId(Utils.getUserId().toString());
						
						toolCodeAdmService.equipCorrInfoCreate(toolCodeAdmVo);
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
	
	
	//기준서 Create
	@RequestMapping(value = "/bm/toolCheckAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCheckAdmCreate(@RequestBody List<Map<String, Object>> equipCorrInfoList) throws Exception {
		ToolCodeAdmVo toolCodeAdmVo = new ToolCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기준서 등록: " + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setEquipCd(equipCorrInfoList.get(0).get("equipCd").toString());
			toolCodeAdmService.equipCheckAdmDelete(toolCodeAdmVo);
		
			for(Map<String, Object> m : equipCorrInfoList) {
				//기준서 시퀀스 조회
				int tempCheckSeq = toolCodeAdmService.checkSeq(toolCodeAdmVo);
				String checkSeq = Integer.toString(tempCheckSeq);
				toolCodeAdmVo.setCheckSeq(checkSeq);
				
				toolCodeAdmVo.setCheckState(m.get("checkState").toString());
				toolCodeAdmVo.setCheckMethod(m.get("checkMethod").toString());
				toolCodeAdmVo.setCheckStandard(m.get("checkStandard").toString());
				toolCodeAdmVo.setCheckDesc(m.get("checkDesc").toString());
				toolCodeAdmVo.setRegId(Utils.getUserId().toString());
				
				toolCodeAdmService.equipCheckAdmCreate(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCorrInfoDelete2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCorrInfoDelete2(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("교정내역 상세삭제: " + toolCodeAdmVo);
		try {
			toolCodeAdmService.equipCorrInfoDelete2(toolCodeAdmVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//기타 Create
	@RequestMapping(value = "/bm/toolEtcInfoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipEtcInfoCreate(@RequestBody List<Map<String, Object>> equipEtcInfoList) throws Exception {
		ToolCodeAdmVo toolCodeAdmVo = new ToolCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기타 등록: " + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setEquipCd(equipEtcInfoList.get(0).get("equipCd").toString());
			toolCodeAdmService.equipEtcInfoDelete(toolCodeAdmVo);
		
			for(Map<String, Object> m : equipEtcInfoList) {
				if(m.get("etcGubun")!=null) {
					toolCodeAdmVo.setEquipCd(m.get("equipCd").toString());
					int etcSeq = toolCodeAdmService.etcSeq(toolCodeAdmVo);
					toolCodeAdmVo.setEtcSeq(etcSeq);
					toolCodeAdmVo.setEtcGubun(m.get("etcGubun").toString());
					toolCodeAdmVo.setEtcCont(m.get("etcCont").toString());
					toolCodeAdmVo.setRegId(Utils.getUserId().toString());
					
					toolCodeAdmService.equipEtcInfoCreate(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCodeUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodemAdmUpdate(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		
		try {
			toolCodeAdmVo.setUpdId(Utils.getUserId());
			if(toolCodeAdmService.equipCodeAdmUpdate(toolCodeAdmVo)>0) {
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
	@RequestMapping(value = "/bm/toolCodeImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodeImageRead(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
			ToolCodeAdmVo vo = toolCodeAdmService.equipImgRead(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCodeImageUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeImageUpload(ToolCodeAdmVo toolCodeAdmVo,
			MultipartHttpServletRequest multi) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			logger.info("설비이미지 vo = " + toolCodeAdmVo);
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
					toolCodeAdmVo.setImageFile1(mFile.getBytes());
					toolCodeAdmVo.setImageFile1Nm(fileName);
					break;
				case "2" :
					toolCodeAdmVo.setImageFile2(mFile.getBytes());
					toolCodeAdmVo.setImageFile2Nm(fileName);
					break;
				case "3" :
					toolCodeAdmVo.setImageFile3(mFile.getBytes());
					toolCodeAdmVo.setImageFile3Nm(fileName);
					break;
				case "4" :
					toolCodeAdmVo.setImageFile4(mFile.getBytes());
					toolCodeAdmVo.setImageFile4Nm(fileName);
					break;
				}
				toolCodeAdmService.equipImageUpload(toolCodeAdmVo);
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//설비 관리 이미지 Delete
	@RequestMapping(value = "/bm/toolCodeImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCodeImageDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("파일 삭제 vo:" + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setUpdId(Utils.getUserId());		
			toolCodeAdmService.equipImageDelete(toolCodeAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			logger.info("" + Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//엑셀 업로드
	@RequestMapping(value= "bm/toolExcelUpload", method = RequestMethod.POST)
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
	@RequestMapping(value="bm/toolBasicForm", method = RequestMethod.GET)
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
	@RequestMapping(value = "/bm/toolImgUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipImgUpdate(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지 내용 수정: " + toolCodeAdmVo);
		try {
			toolCodeAdmService.equipImgUpdate(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolDataDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipDataDelete(ToolCodeAdmVo toolCodeAdmVo,
			CorrDataListVo corrDataListVo, AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("삭제: " + toolCodeAdmVo);
		try {
			//기본정보 삭제
			toolCodeAdmService.equipDataDelete(toolCodeAdmVo);
			
			//점검이력 삭제
			measureInstrmtAdmService.attachCorreDataDelete(corrDataListVo);
			
			//점검이력 첨부파일 삭제
			attachDataService.attachDataDelete(attachDataVo);
			
			//작업조건 삭제
//			toolCodeAdmService.eqWorkStandAdmDelete(toolCodeAdmVo);
			
			//부속품 삭제
			toolCodeAdmService.partAdmDelete(toolCodeAdmVo);
			
			//각 부대설비에 등록된 설비 초기화
			ToolCodeAdmVo delete = new ToolCodeAdmVo();
			delete.setMainEquipCd(toolCodeAdmVo.getEquipCd());
			List<ToolCodeAdmVo> insertList  = toolCodeAdmService.equipCodeAdmList(delete);
			
			for(ToolCodeAdmVo list : insertList) {
				toolCodeAdmVo = new ToolCodeAdmVo();
				toolCodeAdmVo.setEquipCd(list.getEquipCd());
				toolCodeAdmVo.setUpdId(Utils.getUserId());
				toolCodeAdmService.ancFacUpdateDelete(toolCodeAdmVo);
			}
			
			//일상점검 삭제
			toolCodeAdmService.equipDailyCheckDelete(toolCodeAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//설비코드 Create
	@RequestMapping(value = "/bm/toolNoCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipNoCheck(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			if (toolCodeAdmService.equipNoCheck(toolCodeAdmVo)>0) {
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
	@RequestMapping(value = "/bm/toolDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipDataList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("설비코드 읽기 : " + toolCodeAdmVo);
		try {
			List<ToolCodeAdmVo> list  = toolCodeAdmService.equipDataList(toolCodeAdmVo);
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
	@RequestMapping(value="bm/toolDataCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> equipDataCreate(@RequestBody List<Map<String, Object>> equipCodeAdmList) throws Exception{
		ToolCodeAdmVo toolCodeAdmVo = new ToolCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(모터) 등록 :" + toolCodeAdmVo);
		try {
			toolCodeAdmVo.setEquipCd(equipCodeAdmList.get(0).get("equipCd").toString());
			toolCodeAdmService.equipDataDtlDelete(toolCodeAdmVo);
			int equipSeq = 1;
			for(Map<String, Object> m : equipCodeAdmList) {
				if(equipSeq==1 && m.get("equipPart").toString().equals("noData") && m.get("equipUnit").toString().equals("noData") && m.get("equipDc").toString().equals("noData")) {
					jsonData.put("result", "ok");
					return jsonData;
				}
				toolCodeAdmVo.setEquipSeq(Integer.toString(equipSeq));
				toolCodeAdmVo.setEquipPart(m.get("equipPart").toString());
				toolCodeAdmVo.setEquipUnit(m.get("equipUnit").toString());
				toolCodeAdmVo.setEquipDc(m.get("equipDc").toString());
				toolCodeAdmVo.setRegId(Utils.getUserId());
				toolCodeAdmService.equipDataDtlCreate(toolCodeAdmVo);
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
	@RequestMapping(value = "/bm/toolCodePartImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipCodePartImgRead(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
			//부대 설비 데이터 조회
			List<ToolCodeAdmVo> ancFacData = toolCodeAdmService.equipCodeAdmList(toolCodeAdmVo);
			//부대 설비 데이터 크기
			int ancFacDataCount = ancFacData.size();
			
			//보낼 데이터
			List<ToolCodeAdmVo> outputData = new ArrayList();
			
			jsonData.put("dataCount", ancFacDataCount);
			//조회한 부대 설비의 이미지, 경로 조회
			for(int i=0; i<ancFacDataCount; i++) {
				ToolCodeAdmVo imageData = new ToolCodeAdmVo();
				imageData.setEquipCd(ancFacData.get(i).getEquipCd());	
				imageData = toolCodeAdmService.equipImgRead(imageData);	//설비 파일 조회
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
	
	
	
	
}