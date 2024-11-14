package mes.web.mm;

import java.io.File;
import java.sql.Blob;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale	;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.mm.AccidentFreeVo;
import mes.domain.mm.CustSendDocVo;
import mes.domain.mm.OperationNoticeVo;
import mes.domain.mm.WelcomeVo;
import mes.domain.mm.WorkStatusVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.mm.AccidentFreeService;
import mes.service.mm.CustSendDocService;
import mes.service.mm.OperationNoticeService;
import mes.service.mm.WelcomeService;
import mes.service.mm.WorkStatusService;
import mes.service.po.WorkOrderPrcssService;
import mes.web.ut.DateUtil;
import mes.web.ut.FileUtil;
import mes.web.ut.Utils;

@Controller
public class MonitoringInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(MonitoringInfoController.class);

	@Inject
	private OperationNoticeService operationNoticeService;
	@Inject
	private AccidentFreeService accidentFreeService;
	@Inject
	private WorkStatusService workStatusService;
	@Inject
	private WelcomeService welcomeService;
	@Inject
	private CustSendDocService custSendDocService;
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	
	
	// ========================================== 모니터링 관련정보 등록 ==========================================
	// 모니터링 관련정보 등록 메인
	@RequestMapping(value = "mmsc0180", method = RequestMethod.GET)
	public String mmsc0180(Locale locale, Model model) throws Exception {
		return "mm/mmsc0180";
	}
	
	// ========================================== 운영 공지사항 ================================================
	// 목록조회
	@RequestMapping(value = "mm/operationNoticeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> operationNoticeList(OperationNoticeVo operationNoticeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("운영 공지사항 목록조회 : "+operationNoticeVo);
		try {
			List<OperationNoticeVo> operationNoOticeVoList = operationNoticeService.list(operationNoticeVo);
			jsonData.put("data", operationNoOticeVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 조회
	@RequestMapping(value = "mm/operationNoticeRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> operationNoticeRead(OperationNoticeVo operationNoticeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("운영 공지사항 조회 : "+operationNoticeVo);
		try {
			operationNoticeVo = operationNoticeService.read(operationNoticeVo);
			jsonData.put("data", operationNoticeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 등록
	@RequestMapping(value = "mm/operationNoticeAdd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> operationNoticeAdd(OperationNoticeVo operationNoticeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("운영 공지사항 등록 : "+operationNoticeVo);
		try {
			operationNoticeVo.setRegId(Utils.getUserNumber());
			String idx = operationNoticeService.add(operationNoticeVo);
			jsonData.put("idx", idx);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수정
	@RequestMapping(value = "mm/operationNoticeEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> operationNoticeEdit(OperationNoticeVo operationNoticeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("운영 공지사항 수정 : "+operationNoticeVo);
		try {
			operationNoticeVo.setUpdId(Utils.getUserNumber());
			operationNoticeService.edit(operationNoticeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 삭제
	@RequestMapping(value = "mm/operationNoticeRemove", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> operationNoticeRemove(OperationNoticeVo operationNoticeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("운영 공지사항 삭제 : "+operationNoticeVo);
		try {
			operationNoticeService.remove(operationNoticeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// ========================================== 무재해 현황판 ================================================
	// 조회
	@RequestMapping(value = "mm/accidentFreeRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> accidentFreeRead(AccidentFreeVo accidentFreeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("무재해 현황판 조회 : "+accidentFreeVo);
		try {
			accidentFreeVo = accidentFreeService.read(accidentFreeVo);
			jsonData.put("data", accidentFreeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수정
	@RequestMapping(value = "mm/accidentFreeEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> accidentFreeEdit(AccidentFreeVo accidentFreeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("무재해 현황판 수정 : "+accidentFreeVo);
		try {
			accidentFreeService.edit(accidentFreeVo);
			jsonData.put("data", accidentFreeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ========================================== 사출 Part 생산현황 ================================================
	// 조회
	@RequestMapping(value = "mm/workStatusRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workStatusRead(WorkStatusVo workStatusVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사출 Part 생산현황 조회 : "+workStatusVo);
		try {
			workStatusVo = workStatusService.read(workStatusVo);
			jsonData.put("data", workStatusVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 등록/수정
	@RequestMapping(value = "mm/workStatusAdd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workStatusAdd(WorkStatusVo workStatusVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사출 Part 생산현황 등록/수정 : "+workStatusVo);
		try {
			if(workStatusService.read(workStatusVo) == null) { // 존재하지 않을 경우
				workStatusService.add(workStatusVo); // 등록
			} else {
				workStatusService.edit(workStatusVo); // 수정
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ========================================== 환영문구 ================================================
	// 조회
	@RequestMapping(value = "mm/welcomeRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> welcomeRead(WelcomeVo welcomeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("환영문구 조회 : "+welcomeVo);
		try {
			welcomeVo = welcomeService.read(welcomeVo);
			jsonData.put("data", welcomeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수정
	@RequestMapping(value = "mm/welcomeTextEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> welcomeTextEdit(WelcomeVo welcomeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("환영문구(문구) 수정 : "+welcomeVo);
		try {
			welcomeService.edit(welcomeVo);
			jsonData.put("data", welcomeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 파일 upload
	@ResponseBody
	@RequestMapping(value = "mm/welcomeImgEdit", method = RequestMethod.POST)
	public Object welcomeImgEdit( MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("환영문구(이미지) 수정");
		try {
			FileUtil fileUtil = new FileUtil();
		    Iterator<String> itr =  multipartRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
		    MultipartFile mpf = multipartRequest.getFile(itr.next());
		    File file = fileUtil.convertToMultipartFile(mpf);
		    Blob blob = fileUtil.convertFileToBlob(file);
		    WelcomeVo welcomeVo = new WelcomeVo(); 
		    welcomeVo.setWelcomeImg(blob.getBytes(1,(int) blob.length()));
		    welcomeService.edit(welcomeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
	    return jsonData;
	}
	
	// ========================================== 고객사 전달 문서 ================================================
	// 조회
	@RequestMapping(value = "mm/custSendDocRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custSendDocRead(CustSendDocVo custSendDocVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("고객사 전달 문서 조회 : "+custSendDocVo);
		try {
			custSendDocVo = custSendDocService.read(custSendDocVo);
			jsonData.put("data", custSendDocVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 파일 upload
	@ResponseBody
	@RequestMapping(value = "mm/custSendDocEdit", method = RequestMethod.POST)
	public Object custSendDocEdit( MultipartHttpServletRequest multipartRequest) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("고객사 전달 문서 수정");
		try {
			FileUtil fileUtil = new FileUtil();
		    Iterator<String> itr =  multipartRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
		    MultipartFile mpf = multipartRequest.getFile(itr.next());
		    File file = fileUtil.convertToMultipartFile(mpf);
		    Blob blob = fileUtil.convertFileToBlob(file);
		    CustSendDocVo custSendDocVo = new CustSendDocVo(); 
		    custSendDocVo.setImg(blob.getBytes(1,(int) blob.length()));
		    custSendDocService.edit(custSendDocVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
	    return jsonData;
	}
	
	// 고객사 전달 문서 활성화/비활성화
	@RequestMapping(value = "mm/custSendDocStateEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custSendDocStateEdit(CustSendDocVo custSendDocVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("고객사 전달 문서 활성화/비활성화 : "+custSendDocVo);
		try {
			custSendDocService.edit(custSendDocVo);
			jsonData.put("data", custSendDocVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ========================================== 모니터링 (원단위관리) ==========================================
	
	// 모니터링 원단위 관리 메인
	@RequestMapping(value = "/mmsc0190", method = RequestMethod.GET) 
	public String mmsc0190(Locale locale, Model model) throws Exception {
	  
	  model.addAttribute("serverDateFrom", DateUtil.getCustomDate(DateUtil.getToday("yyyymmdd")));
	  model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	  
	  return "mm/mmsc0190"; 
	}
	
	// ========================================== 모니터링 (제조리드타임) ==========================================
	
	// 모니터링 제조리드타임 관리 메인
	@RequestMapping(value = "/mmsc0200", method = RequestMethod.GET) 
	public String mmsc0200(Locale locale, Model model) throws Exception {
	  
	  model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	  model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	  
	  return "mm/mmsc0200"; 
	}
	 
	//제조리드타임 조회--------------------------------------------------------
	@RequestMapping(value = "mm/leadTimeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> leadTimeList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<WorkOrderPrcssVo> list =  workOrderPrcssService.leadTimeList(workOrderPrcssVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//제조리드타임 조회--------------------------------------------------------
	@RequestMapping(value = "mm/leadTimeSubTotalList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> leadTimeSubTotalList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			WorkOrderPrcssVo vo =  workOrderPrcssService.leadTimeSubTotalList(workOrderPrcssVo);
			
			jsonData.put("leadCountData", vo.getLeadCount());
			jsonData.put("totalLeadTimeData", vo.getTotalLeadTime());
			jsonData.put("avgLeadTimeData", vo.getAvgLeadTime());
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// ========================================== 모니터링 (생산 공정 불량율 현황) ==========================================
	
	// 모니터링 생산 공정 불량율 현황 관리 메인
	@RequestMapping(value = "/mmsc0210", method = RequestMethod.GET) 
	public String mmsc0210(Locale locale, Model model) throws Exception {
	  
	  model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	  model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	  
	  BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
	  baseInfoAdmVo.setBaseInfoGubun("003");
	  List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
	  model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형
	  model.addAttribute("baseInfoAdmListLength", baseInfoAdmList.size()+1); // 공정불량유형
	  
	  return "mm/mmsc0210"; 
	}
	
	//생산 공정 불량율 현황 조회--------------------------------------------------------
	@RequestMapping(value = "mm/workPrcssFaultyRateList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workPrcssFaultyRateList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			
			List<WorkOrderPrcssVo> list=  workOrderPrcssService.workPrcssFaultyRateList(workOrderPrcssVo);
			jsonData.put("data", list);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ========================================== 모니터링 - 제조리드타임(봉제) ==========================================
	
	// 모니터링 제조리드타임(봉제) 관리 메인
	@RequestMapping(value = "/mmsc0220", method = RequestMethod.GET) 
	public String mmsc0220(Locale locale, Model model) throws Exception {
	  
	  model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	  model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	  
	  return "mm/mmsc0220"; 
	}
	
	//제조리드타임(봉제) 조회--------------------------------------------------------
	@RequestMapping(value = "mm/leadTimeSewingList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> leadTimeSewingList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderPrcssVo> list =  workOrderPrcssService.leadTimeSewingList(workOrderPrcssVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
}
