package mes.web.po;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.time.DateUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.po.EqWorkHisAdmVo;
import mes.domain.po.WorkOrderFaultyTypeVo;
import mes.domain.po.WorkOrderJajuInspectVo;
import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderNonOperationVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemMotorService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.bm.PrcssCodeAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.po.EqWorkHisAdmService;
import mes.service.po.WorkOrderFaultyTypeService;
import mes.service.po.WorkOrderJajuInspectService;
import mes.service.po.WorkOrderMatrlService;
import mes.service.po.WorkOrderNonOperationService;
import mes.service.po.WorkOrderPrcssService;
import mes.service.po.WorkOrderService;
import mes.service.sm.MatrlUserService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkOrderPrcssController { 

	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	
	@Inject
	private WorkOrderService workOrderService;

	@Inject
	private WorkOrderPrcssService workOrderPrcssService;

	@Inject
	private WorkOrderMatrlService workOrderMatrlService;

	@Inject
	private WorkOrderJajuInspectService workOrderJajuInspectService;

	@Inject
	private WorkOrderNonOperationService workOrderNonOperationService;

	@Inject
	private CommonCodeAdmService commonCodeService;

	@Inject
	private PrcssCodeAdmService prcssCodeAdmService;

	@Inject
	private OutWhsAdmService outWhsAdmService;

	@Inject
	private WorkOrderFaultyTypeService workOrderFaultyTypeService;

	@Inject
	private BaseInfoAdmService baseInfoAdmService;

	@Inject
	private ItemMotorService itemMotorService;

	@Inject
	private EquipCodeAdmService equipCodeAdmService;

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private EqWorkHisAdmService eqWorkHisAdmService;
	
	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private MatrlUserService matrlUserService;

	@Inject
	private LocationAdmService locationAdmService;

	@Value("${file.itemStandardPath}")
	private String file_Item_Standard_Path;

	private static final Logger logger = LoggerFactory.getLogger(WorkOrderPrcssController.class);

	
	// 생산실적관리(사출) 메인
	@RequestMapping(value = "/posc0020", method = RequestMethod.GET)
		public String posc0020(Locale locale, Model model) throws Exception {

		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		prcssCodeAdmVo.setPrcssType("002");
		List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);

		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("prcssMidList", prcssCodeAdmList);

		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("003");

		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		logger.info(baseInfoAdmList.toString());
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();

		commonCodeVo.setBaseGroupCd("060"); // 사용여부
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prcssCd", poscCd);
		
		commonCodeVo.setBaseGroupCd("113"); // 작업방식
		commonCodeVo.setUseYn("001");
		poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("workMethod", poscCd);
		
		commonCodeVo.setBaseGroupCd("114"); // 작업구분
		commonCodeVo.setUseYn("001");
		poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("workGubun", poscCd);
		
		commonCodeVo.setBaseGroupCd("115"); // 비가동구분
		commonCodeVo.setUseYn("001");
		poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("noGubun", poscCd);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("091"); // 품목구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("060"); // 긴급여부
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> workEmerYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("workEmerYn", workEmerYnList);
		
		commonCodeVo.setBaseGroupCd("118"); // 검사취출
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> inspectGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectGubun", inspectGubunList);
		
		commonCodeVo.setBaseGroupCd("121"); // 작업조건차수
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> histSeqList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("histSeq", histSeqList);
		
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		commonCodeVo.setBaseGroupCd("140"); // 퍼징구분
		List<CommonCodeAdmVo> fuzzGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("fuzzGubun", fuzzGubunList);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		return "po/posc0020";
	}
	
	
	//생산실적(봉제)_new 메인
	@RequestMapping(value = "/wmsc0270", method = RequestMethod.GET)
	public String wmsc0270(Locale locale, Model model) throws Exception {
		logger.info("생산실적(봉제) 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
			
			model.addAttribute("userNm", Utils.getUserNm());	
			model.addAttribute("userNumber", Utils.getUserNumber());
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("060"); // 긴급여부
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> workEmerYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("workEmerYn", workEmerYnList);
			
			commonCodeVo.setBaseGroupCd("114"); // 작업구분
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> workGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("workGubun", workGubunList);
			
			commonCodeVo.setBaseGroupCd("091"); // 품목구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> itemGubunList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemGubunList);
			
			commonCodeVo.setBaseGroupCd("118"); // 검사취출
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> inspectGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectGubun", inspectGubunList);
			
			commonCodeVo.setBaseGroupCd("072"); // 판정
			List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("judge", judgeList);
			
			commonCodeVo.setBaseGroupCd("128"); // 실행여부
			List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("silhang", silhangList);
			
			MatrlUserVo matrlUserVo = new MatrlUserVo();
			matrlUserVo.setDepartmentCd("003");
			matrlUserVo.setEmpCd("001");
			List<MatrlUserVo> userList = matrlUserService.listAll(matrlUserVo);
			model.addAttribute("userList", userList);
			
			PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
			prcssCodeAdmVo.setUserNumber(Utils.getUserNumber());
			prcssCodeAdmVo.setPrcssGubun("002");
			List<PrcssCodeAdmVo> prcssWorkerAdmList = prcssCodeAdmService.prcssWorkerAdmList(prcssCodeAdmVo);
			model.addAttribute("prcssCdVal", prcssWorkerAdmList.size() > 0 ? prcssWorkerAdmList.get(0).getPrcssCd() : "");
			
			PrcssCodeAdmVo prcssCodeAdmVo2 = new PrcssCodeAdmVo();
			prcssCodeAdmVo2.setPrcssType("001");
			prcssCodeAdmVo2.setMainGubun("002");
			List<PrcssCodeAdmVo> prcssList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo2);
			model.addAttribute("prcssList", prcssList);
			
			BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); //불량유형
			baseInfoAdmVo.setBaseInfoType("FT");
			baseInfoAdmVo.setEtc1("002");
			baseInfoAdmVo.setBaseInfoGubun("003");
			List<BaseInfoAdmVo> faultyTypeList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
			model.addAttribute("faultyTypeList", faultyTypeList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0270";
	}
	
	// 생산실적(봉제)
	@RequestMapping(value = "/posc0050", method = RequestMethod.GET)
	public String posc0050(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		return "po/posc0050";
	}
	

	// 생산실적등록 목록 조회(사출)
	@RequestMapping(value = "/po/workOrderPrcssList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcssList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회(사출): " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = workOrderPrcssService.workOrderPrcssList(workOrderPrcssVo);
			jsonData.put("data", workOrderPrcssList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 생산실적등록 목록 조회(봉제)
	@RequestMapping(value = "/po/workOrderPrcssListByBongjea", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcssListByBongjea(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회(봉제): " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
			if ( workOrderPrcssVo.getMiddlePrcssCd() != null && !workOrderPrcssVo.getMiddlePrcssCd().equals("") ) {
				workOrderPrcssList = workOrderPrcssService.workOrderPrcssListByBongjea(workOrderPrcssVo);
			}
			jsonData.put("data", workOrderPrcssList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 초/중/종물 공정검사 유무
	@RequestMapping(value = "/po/workOrdInspectYnList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdInspectYnList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회: " + workOrderPrcssVo);
		try {
			WorkOrderPrcssVo vo = workOrderPrcssService.workOrdInspectYnList(workOrderPrcssVo);
			
			if(vo!=null) {
				if(vo.getMdInspectYn()==null || vo.getMdInspectYn().equals("001")) {
					if(vo.getApprovalCho().equals("OK") && vo.getApprovalJung().equals("OK") && vo.getApprovalJong().equals("OK")) {
						jsonData.put("result", "ok");
					}else {
						jsonData.put("result", "fail");
					}
				}else {
					if(vo.getApprovalCho().equals("OK") && vo.getApprovalJong().equals("OK")) {
						jsonData.put("result", "ok");
					}else {
						jsonData.put("result", "fail");
					}
				}
			}else {
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 초/중/종물 공정검사 유무
	@RequestMapping(value = "/po/workOrdInspectDone", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdInspectDone(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회: " + workOrderPrcssVo);
		try {
			//초/중/종물 생산실적등록유무
			if(workOrderPrcssService.workOrdInspectDone(workOrderPrcssVo)>0) {
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 중공정 목록조회
	@RequestMapping(value = "/po/workOrderMiddlePrcssList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderMiddlePrcssList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("중공정 목록조회: " + workOrderVo);
		try {
			List<WorkOrderVo> workOrderDataList = workOrderService.readMiddlePrcss(workOrderVo);
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 소공정 공정별 설비목록조회
	@RequestMapping(value = "/po/prcssToEquipList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssToEquipList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("소공정 공정별 설비목록조회: " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo = prcssCodeAdmService.prcssToEquipList(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	

	//작지 등록처리(사출)
	@RequestMapping(value = "/po/workOrdAdd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAdd(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리(사출): " + workOrderPrcssVo);
		try {
			int workOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
			workOrderPrcssVo.setWorkOrdSeq(workOrdSeq);
			workOrderPrcssVo.setMiddlePrcssCd("");
			workOrderPrcssVo.setMinorPrcssCd("");
			workOrderPrcssVo.setOrdLotNo(getOrdLotNo(workOrderPrcssVo));
			workOrderPrcssVo.setRegId(Utils.getUserId());
			workOrderPrcssService.create(workOrderPrcssVo);
			
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderService.update(workOrderVo);
			
			if(workOrderPrcssVo.getWorkStatus().equals("003")) { 
				WorkOrderPrcssVo vo = new WorkOrderPrcssVo(); 
				vo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				vo.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
				vo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				vo.setUpdId(Utils.getUserId()); 
				workOrderPrcssService.update(vo); 
			}
			 
			// 총 생산수량
			String outputQty = workOrderService.workOrdRead(workOrderVo).getOutputQty();
			String faultyQty = workOrderService.workOrdRead(workOrderVo).getFaultyQty();
			float fairQty = Float.parseFloat(outputQty)-Float.parseFloat(faultyQty);
			
			logger.info("생산수량:"+outputQty);
			logger.info("불량수량:"+faultyQty);
			logger.info("양품수량:"+fairQty);
			
			jsonData.put("outputQtyVal", outputQty);
			jsonData.put("fairQtyVal", fairQty);
			
			jsonData.put("count", 0);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	// 작지 등록처리(봉제)
	@RequestMapping(value = "/po/workOrdAddByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAddByBongjae(WorkOrderPrcssVo workOrderPrcssVo,WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리: " + workOrderPrcssVo);
		try {
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderService.update(workOrderVo);
			if(workOrderPrcssVo.getWorkStatus().equals("003")) {
				WorkOrderPrcssVo vo = new WorkOrderPrcssVo();
				vo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				vo.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
				vo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				vo.setUpdId(Utils.getUserId());
				workOrderPrcssService.update(vo);
			}
			
			//작업지시 등록
			int boxCount = Integer.parseInt(workOrderPrcssVo.getBoxCount());
			int fairQty = Integer.parseInt(workOrderPrcssVo.getFairQty());
			int faultyQty = Integer.parseInt(workOrderPrcssVo.getFaultyQty());
			int quotientVal = 0;
			
			if (fairQty >= faultyQty) {
				quotientVal = fairQty / boxCount;
				if (fairQty % boxCount != 0) {
					quotientVal += 1;
				}
			} else {
				quotientVal = faultyQty / boxCount;
				if (faultyQty % boxCount != 0) {
					quotientVal += 1;
				}
			}
			
			String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
			
			//실적별 제품입고
			for (int i = 0; i < quotientVal; i++) {
				int workOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
				workOrderPrcssVo.setWorkOrdSeq(workOrdSeq);
				workOrderPrcssVo.setOrdLotNo(getOrdLotNoByBongjae(workOrderPrcssVo));
				int outputQty = 0;
				if (fairQty >= boxCount) {
					workOrderPrcssVo.setFairQty(Integer.toString(boxCount));
					fairQty -= boxCount;
					outputQty += boxCount;
				} else {
					workOrderPrcssVo.setFairQty(Integer.toString(fairQty));
					outputQty += fairQty;
					fairQty = 0;
				}
				if (faultyQty >= boxCount) {
					workOrderPrcssVo.setFaultyQty(Integer.toString(boxCount));
					faultyQty -= boxCount;
					outputQty += boxCount;
				} else {
					workOrderPrcssVo.setFaultyQty(Integer.toString(faultyQty));
					outputQty += faultyQty;
					faultyQty = 0;
				}
				workOrderPrcssVo.setOutputQty(workOrderPrcssVo.getWorkStatus().equals("003") ? "0" : Integer.toString(outputQty));
				workOrderPrcssVo.setRegId(Utils.getUserId());
				workOrderPrcssService.create(workOrderPrcssVo);
				
				
				//제품입고 테이블
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
				itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());	
				itemWhsAdmVo.setItemSeq(workOrderPrcssVo.getItemSeq());	
				itemWhsAdmVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				itemWhsAdmVo.setInDate(workOrderPrcssVo.getOrdLotNoDate());					
				itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssVo.getFairQty()));
				itemWhsAdmVo.setInLoc(workOrderPrcssVo.getInLoc());
				itemWhsAdmVo.setLocationNo(workOrderPrcssVo.getLocationNo());
				itemWhsAdmVo.setRegId(Utils.getUserId());
				itemWhsAdmVo.setUpdId(Utils.getUserId());
				
				if(itemWhsAdmService.existItemWhsAdm(itemWhsAdmVo) > 0) {
					itemWhsAdmService.itemWhsAdmUpdate(itemWhsAdmVo);
				}else {
					itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
				}
				
				//수불테이블 Create
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(workOrderPrcssVo.getItemGubun());
				stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("제품입고");
				stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
				stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
				stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(itemWhsAdmVo.getInLoc());
				stockPaymentAdmVo.setAreaCd(itemWhsAdmVo.getInArea());
				stockPaymentAdmVo.setFloorCd(itemWhsAdmVo.getInFloor());
				stockPaymentAdmVo.setLocationNo(itemWhsAdmVo.getLocationNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				
				//잔량처리
				logger.info("outputQty:"+outputQty);
				
				//BOM 목록조회
				ItemPartAdmVo bomVo = new ItemPartAdmVo();	
				bomVo.setUpperItemSeq(workOrderMatrlVo.getItemSeq());
				List<ItemPartAdmVo> bomList =  itemPartAdmService.itemMotorEbomList(bomVo);	//bom리스트
				
				if(bomList.size()>0) {
					String spNo2 = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
					
					for(int j=0; j<bomList.size(); j++) {
						float remainQty = outputQty;
						
						while(remainQty>0) {
							WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
							workOrderMatrlUpdVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
							workOrderMatrlUpdVo.setWorkProgNo(workOrderMatrlVo.getWorkProgNo());
							workOrderMatrlUpdVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
							workOrderMatrlUpdVo.setOrdLotNo(workOrderPrcssVo.getOrdLotNo());
							workOrderMatrlUpdVo.setLocationCd(workOrderMatrlVo.getLocationCd());
							workOrderMatrlUpdVo.setItemSeq(bomList.get(j).getItemSeq());
							
							WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoListByBongjae(workOrderMatrlUpdVo);	//자재투입 데이터
							if(vo==null) {
								jsonData.put("result", "lack");
								jsonData.put("message", "자재가 부족합니다.");
								break;
							}
							
							float matrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
							float consumpt = Float.parseFloat(bomList.get(j).getItemConsumpt()); //소요량
							float totalSanSangQty = (remainQty*consumpt);	//생산량
							float totalMatrlQty = matrlQty;
							
							logger.info("matrlQty:"+matrlQty);
							logger.info("consumpt:"+consumpt);
							logger.info("totalMatrlQty:"+totalSanSangQty); 
							
							StockPaymentAdmVo stockPaymentAdmVo2 = new StockPaymentAdmVo();
							stockPaymentAdmVo2.setSpNo(spNo2);
							stockPaymentAdmVo2.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo2));
							stockPaymentAdmVo2.setSpType(vo.getItemGubun());
							stockPaymentAdmVo2.setSpCd(vo.getItemSeq());
							stockPaymentAdmVo2.setSpGubun("002");
							stockPaymentAdmVo2.setSpSubGubun("자재투입");
							stockPaymentAdmVo2.setSpDate(DateUtil.getToday("yyyymmdd"));
							stockPaymentAdmVo2.setBarcodeNo(vo.getBarcodeNo());
							stockPaymentAdmVo2.setSourceNo(workOrderPrcssVo.getOrdLotNo());
							stockPaymentAdmVo2.setLocationCd(vo.getLocationCd());
							stockPaymentAdmVo2.setLocationNo(vo.getLocationNo());
							stockPaymentAdmVo2.setRegId(Utils.getUserId());
							
							//투입보다 생산량이 많을 경우  
							if(totalMatrlQty<totalSanSangQty) {	
								stockPaymentAdmVo2.setSpQty(Float.toString(Math.round(totalMatrlQty)));  //출고량
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo2);
								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalMatrlQty))); //사용량
								remainQty = totalSanSangQty-totalMatrlQty;
							}else {
								stockPaymentAdmVo2.setSpQty(Float.toString(Math.round(totalSanSangQty)));
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo2);
								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalSanSangQty)));
								remainQty = 0;
							}
							workOrderMatrlUpdVo.setBarcodeNo(vo.getBarcodeNo());
							workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlUpdVo);
							jsonData.put("result", "ok");
						}
					}
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
		
	//작지 수정처리(사출)
	@RequestMapping(value = "/po/workOrdEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdEdit(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작지 수정처리(사출): " + workOrderPrcssVo);
		try {
			
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(workOrderPrcssVo);
			
			itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());	
			itemWhsAdmVo.setItemSeq(workOrderPrcssVo.getItemSeq());	
			itemWhsAdmVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			itemWhsAdmVo.setInDate(workOrderPrcssVo.getOrdLotNoDate());					
			itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssVo.getFairQty()));
			
			itemWhsAdmVo.setInLoc(workOrderPrcssVo.getInLoc());
			itemWhsAdmVo.setInArea(workOrderPrcssVo.getInArea());
			itemWhsAdmVo.setInFloor(workOrderPrcssVo.getInFloor());
			itemWhsAdmVo.setLocationNo(workOrderPrcssVo.getLocationNo());
			itemWhsAdmVo.setRegId(Utils.getUserId());
			itemWhsAdmVo.setUpdId(Utils.getUserId());
			
			if(itemWhsAdmService.existItemWhsAdm(itemWhsAdmVo) > 0) {
				itemWhsAdmService.itemWhsAdmUpdate(itemWhsAdmVo);
			}else {
				itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
			}
			
			String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
				
			//수불테이블 Create
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType("001");
			stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("001");
			stockPaymentAdmVo.setSpSubGubun("제품입고");
			stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
			stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
			stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(itemWhsAdmVo.getInLoc());
			stockPaymentAdmVo.setAreaCd(itemWhsAdmVo.getInArea());
			stockPaymentAdmVo.setFloorCd(itemWhsAdmVo.getInFloor());
			stockPaymentAdmVo.setLocationNo(itemWhsAdmVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//작지 수정처리(봉제)
	@RequestMapping(value = "/po/workOrdEditByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdEditByBongjae(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작지 수정처리(봉제): " + workOrderPrcssVo);
		try {
			//WorkOrderPrcssVo workOrderPrcssUpdVo = new WorkOrderPrcssVo();
			//workOrderPrcssUpdVo.setOrdLotNo(workOrderPrcssVo.getOrdLotNo());
			//workOrderPrcssUpdVo.setWorkStatus(workOrderPrcssVo.getWorkStatus());
			//workOrderPrcssUpdVo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
			//workOrderPrcssUpdVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			//workOrderPrcssUpdVo.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
			//workOrderPrcssUpdVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
			//workOrderPrcssUpdVo.setUpdId(Utils.getUserId());
			//workOrderPrcssService.update(workOrderPrcssUpdVo);
			
			//제품 봉제 창고 입력
			itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());	
			itemWhsAdmVo.setItemSeq(workOrderPrcssVo.getItemSeq());	
			itemWhsAdmVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			itemWhsAdmVo.setInDate(workOrderPrcssVo.getOrdLotNoDate());					
			itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssVo.getFairQty()));
			itemWhsAdmVo.setInLoc(workOrderPrcssVo.getInLoc());
			itemWhsAdmVo.setLocationNo(workOrderPrcssVo.getLocationNo());
			itemWhsAdmVo.setRegId(Utils.getUserId());
			itemWhsAdmVo.setUpdId(Utils.getUserId());
			
			if(itemWhsAdmService.existItemWhsAdm(itemWhsAdmVo) > 0) {
				itemWhsAdmService.itemWhsAdmUpdate(itemWhsAdmVo);
			}else {
				itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
			}
			
			String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
				
			//수불테이블 Create
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType(workOrderPrcssVo.getItemGubun());
			stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("001");
			stockPaymentAdmVo.setSpSubGubun("제품입고");
			stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
			stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
			stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(itemWhsAdmVo.getInLoc());
			stockPaymentAdmVo.setAreaCd(itemWhsAdmVo.getInArea());
			stockPaymentAdmVo.setFloorCd(itemWhsAdmVo.getInFloor());
			stockPaymentAdmVo.setLocationNo(itemWhsAdmVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			//잔량처리
			float outputQty = Float.parseFloat(workOrderPrcssVo.getOutputQty());		//생산수량
			logger.info("outputQty:"+outputQty);
			if(outputQty==0) {
				jsonData.put("result", "fail");
				jsonData.put("message", "생산실적을 등록해주세요.");
			}else {
				//BOM 목록조회
				ItemPartAdmVo bomVo = new ItemPartAdmVo();	
				bomVo.setUpperItemSeq(workOrderMatrlVo.getItemSeq());
				List<ItemPartAdmVo> bomList =  itemPartAdmService.itemMotorEbomList(bomVo);	//bom리스트
				
				if(bomList.size()>0) {
					String spNo2 = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
					for(int i=0; i<bomList.size(); i++) {
						float remainQty = outputQty;
						
						while(remainQty>0) {
							WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
							workOrderMatrlUpdVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
							workOrderMatrlUpdVo.setWorkProgNo(workOrderMatrlVo.getWorkProgNo());
							workOrderMatrlUpdVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
							workOrderMatrlUpdVo.setOrdLotNo(workOrderMatrlVo.getOrdLotNo());
							workOrderMatrlUpdVo.setLocationCd(workOrderMatrlVo.getLocationCd());
							workOrderMatrlUpdVo.setItemSeq(bomList.get(i).getItemSeq());
							
							WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoListByBongjae(workOrderMatrlUpdVo);	//자재투입 데이터
							if(vo==null) {
								jsonData.put("result", "lack");
								jsonData.put("message", "자재가 부족합니다.");
								break;
							}
							
							float matrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
							float consumpt = Float.parseFloat(bomList.get(i).getItemConsumpt()); //소요량
							float totalSanSangQty = (remainQty*consumpt);	//생산량
							float totalMatrlQty = matrlQty;
							
							logger.info("matrlQty:"+matrlQty);
							logger.info("consumpt:"+consumpt);
							logger.info("totalMatrlQty:"+totalSanSangQty); 
							
							stockPaymentAdmVo.setSpNo(spNo2);
							stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
							stockPaymentAdmVo.setSpType(vo.getItemGubun());
							stockPaymentAdmVo.setSpCd(vo.getItemSeq());
							stockPaymentAdmVo.setSpGubun("002");
							stockPaymentAdmVo.setSpSubGubun("자재투입");
							stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
							stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
							stockPaymentAdmVo.setSourceNo(workOrderMatrlUpdVo.getOrdLotNo());
							stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
							stockPaymentAdmVo.setLocationNo(vo.getLocationNo());
							stockPaymentAdmVo.setRegId(Utils.getUserId());
							
							//투입보다 생산량이 많을 경우  310
							if(totalMatrlQty<totalSanSangQty) {	//100<300
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(totalMatrlQty)));  //출고량
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalMatrlQty))); //사용량
								remainQty = totalSanSangQty-totalMatrlQty;
							}else {
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(totalSanSangQty)));
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalSanSangQty)));
								remainQty = 0;
							}
							workOrderMatrlUpdVo.setBarcodeNo(vo.getBarcodeNo());
							workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlUpdVo);
							jsonData.put("result", "ok");
						}
					}
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
	
	// 작지 삭제처리
	@RequestMapping(value = "/po/workOrdDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdDel(WorkOrderPrcssVo workOrderPrcssVo,WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작지 수정처리: " + workOrderPrcssVo);
		try {
			
			//작업지시 불량수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setFaultyQty(workOrderPrcssVo.getFaultyQty());
			workOrderService.prcssDelFaultyUpdate(workOrderVo);
			
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderService.workOrdOutputDelete(workOrderVo);
			
			//생산실적 삭제
			workOrderPrcssService.workOrderPrcssDelete(workOrderPrcssVo);
			
			//불량 삭제
			workOrderFaultyTypeVo.setMinorPrcssCd("0");
			workOrderFaultyTypeVo.setMiddlePrcssCd("0");
			workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			
			if(workOrderPrcssVo.getWorkStatus().equals("002")) {
				//제품입출고 테이블 삭제
				itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getBarcodeNo());
				itemWhsAdmService.itemOutWhsDelete(itemWhsAdmVo);
				
				//수불관리 테이블 삭제
				stockPaymentAdmVo.setSourceNo(workOrderPrcssVo.getBarcodeNo());
				stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
			}
			
			// 총 생산수량
			String outputQty = workOrderService.workOrdRead(workOrderVo).getOutputQty();
			String faultyQty = workOrderService.workOrdRead(workOrderVo).getFaultyQty();
			float fairQty = Float.parseFloat(outputQty)-Float.parseFloat(faultyQty);
			
			logger.info("생산수량:"+outputQty);
			logger.info("불량수량:"+faultyQty);
			logger.info("양품수량:"+fairQty);
			
			jsonData.put("outputQty", outputQty);
			jsonData.put("faultyQty", faultyQty);
			jsonData.put("fairQty", fairQty);
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//생산 lotNo 생성(사출)
	public String getOrdLotNo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		
		EquipCodeAdmVo eqVo = new EquipCodeAdmVo();
		eqVo.setEquipCd(workOrderPrcssVo.getEquipCd());
		String eqInitial = equipCodeAdmService.equipCodeAdmRead(eqVo).getEquipInitial();
		
		String yearString = workOrderPrcssVo.getOrdLotNoDate().substring(2,4);
		String monString = workOrderPrcssVo.getOrdLotNoDate().substring(4,6);
		String dayString = workOrderPrcssVo.getOrdLotNoDate().substring(6,8);
		String mString = "";
		
		switch (monString) {
			case "01": mString="A"; break;case "02": mString="B"; break;case "03": mString="C"; break;
			case "04": mString="D"; break;case "05": mString="E"; break;case "06": mString="F"; break;
			case "07": mString="G"; break;case "08": mString="H"; break;case "09": mString="I"; break;
			case "10": mString="J"; break;case "11": mString="K"; break;case "12": mString="L"; break;
			default: break;
		}
		
		String ordLotNoString = "DR"+eqInitial+yearString+mString+dayString;
		workOrderPrcssVo.setOrdLotNo(ordLotNoString);
		String ordLotSeq = workOrderPrcssService.getOrdlotNo(workOrderPrcssVo);
		String ordLotNo = ordLotNoString+ordLotSeq;
		
		return ordLotNo;
	}
	
	//생산 lotNo 생성(봉제)
	public String getOrdLotNoByBongjae(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		
		String yearString = workOrderPrcssVo.getOrdLotNoDate().substring(2,4);
		String monString = workOrderPrcssVo.getOrdLotNoDate().substring(4,6);
		String dayString = workOrderPrcssVo.getOrdLotNoDate().substring(6,8);
		String mString = "";
		
		switch (monString) {
			case "01": mString="A"; break;case "02": mString="B"; break;case "03": mString="C"; break;
			case "04": mString="D"; break;case "05": mString="E"; break;case "06": mString="F"; break;
			case "07": mString="G"; break;case "08": mString="H"; break;case "09": mString="I"; break;
			case "10": mString="J"; break;case "11": mString="K"; break;case "12": mString="L"; break;
			default: break;
		}
		
		String ordLotNoString = "DR"+yearString+mString+dayString;
		workOrderPrcssVo.setOrdLotNo(ordLotNoString);
		String ordLotSeq = workOrderPrcssService.getOrdlotNo(workOrderPrcssVo);
		String ordLotNo = ordLotNoString+ordLotSeq;
		
		return ordLotNo;
	}

	
	// 작지 생산LOT별 수정처리
	@RequestMapping(value = "/po/workOrdPrcssEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssEdit(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 수정처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(workOrderPrcssVo);
			
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getDiffOutputQty());
			workOrderService.update(workOrderVo);
			
			// 총 생산수량
			String outputQty = workOrderService.workOrdRead(workOrderVo).getOutputQty();
			String faultyQty = workOrderService.workOrdRead(workOrderVo).getFaultyQty();
			float fairQty = Float.parseFloat(outputQty)-Float.parseFloat(faultyQty);
			
			logger.info("생산수량:"+outputQty);
			logger.info("불량수량:"+faultyQty);
			logger.info("양품수량:"+fairQty);
			
			jsonData.put("outputQtyVal", outputQty);
			jsonData.put("fairQtyVal", fairQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 작지 생산LOT별 수정처리(봉제)
	@RequestMapping(value = "/po/workOrdPrcssEditByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssEditByBongjae(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 수정처리(봉제): " + workOrderPrcssVo);
		try {
			int faultyQty = Integer.parseInt(workOrderPrcssVo.getFaultyQty());
			if (faultyQty <= 0) {//불량수량이 0 이하이면 불량등록 삭제
				workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			}
			
			WorkOrderPrcssVo updVo1 = new WorkOrderPrcssVo();
			updVo1.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			updVo1.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
			updVo1.setWorkGubun(workOrderPrcssVo.getWorkGubun());
			updVo1.setWorkChargr(workOrderPrcssVo.getWorkChargr());
			updVo1.setInspectGubun(workOrderPrcssVo.getInspectGubun());
			updVo1.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(updVo1);
			
			WorkOrderPrcssVo updVo2 = new WorkOrderPrcssVo();
			updVo2.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			updVo2.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
			updVo2.setOutputQty(workOrderPrcssVo.getOutputQty());
			updVo2.setFairQty(workOrderPrcssVo.getFairQty());
			updVo2.setFaultyQty(workOrderPrcssVo.getFaultyQty());
			workOrderPrcssService.updateQtybong(updVo2);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작지 생산LOT별 삭제처리(봉제)
	@RequestMapping(value = "/po/workOrdPrcssDelByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssDelByBongjae(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 삭제처리(봉제): " + workOrderPrcssVo);
		try {
			//투입 사용량 수정
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			stockPaymentAdmVo.setSourceNo(workOrderPrcssVo.getOrdLotNo());
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmVo);
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getSpSubGubun().equals("자재투입")) {
					int spQty = Integer.parseInt(list.get(i).getSpQty());	//투입수량
					WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
					workOrderMatrlVo.setUseQty(Integer.toString((spQty*-1)));
					workOrderMatrlVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
					workOrderMatrlVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
					workOrderMatrlVo.setBarcodeNo(list.get(i).getBarcodeNo());
					
					workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlVo);
					logger.info("투입 사용량 수정");
				}
			}
			//stockPayment sourceNo 삭제
			stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
			logger.info("수불테이블 삭제");
			//생산실적등록 삭제
			workOrderPrcssService.workOrderPrcssDelete(workOrderPrcssVo);
			logger.info("실적테이블 삭제");
			//불량등록 삭제
			workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			logger.info("불량등록 삭제");
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	// 작지 생산LOT별 수정처리
	@RequestMapping(value = "/po/workOrdPrcssEdit2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssEdit2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 수정처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(workOrderPrcssVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	// 작지번호 스캔
	@RequestMapping(value = "/po/workOrdNoScan", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdNoScan(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지번호 스캔: " + workOrderVo);
		try {
			if (workOrderService.chekWorkOrdExsit(workOrderVo) == 0) {
				jsonData.put("message", "등록되지않은 작지번호입니다.");
				jsonData.put("result", "fail");
			} else {
				workOrderVo = workOrderService.workOrdRead(workOrderVo);
				jsonData.put("data", workOrderVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업지시 공정별 자재투입 목록조회(ADM)
	@RequestMapping(value = "/po/workOrdMatrlListAdm", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlListAdm(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 목록조회(ADM): " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = workOrderMatrlService.workOrdMatrlListAdm(workOrderMatrlVo);
			
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업지시 공정별 자재투입 목록조회(DTL)
	@RequestMapping(value = "/po/workOrdMatrlListDtl", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlListDtl(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 목록조회(DTL): " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = new ArrayList<WorkOrderMatrlVo>();
			workOrderMatrlList = workOrderMatrlService.workOrdMatrlListDtl(workOrderMatrlVo);
			logger.info(workOrderMatrlList.toString());
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자재투입
	@RequestMapping(value = "/po/matrlBarcodeNoScan", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScan(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			logger.info("1.바코드별 재고파악");
			StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
			stockVo.setRealQtyOption("Y");
			stockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			stockVo.setLocationCd(workOrderMatrlVo.getLocationCd());
			stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			
			if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size()<=0) {
				logger.info("2.해당 창고에 바코드 존재파악");
				logger.info("2-1.해당 창고에 없을 경우");
				
				String locationCdVal = workOrderMatrlVo.getLocationCd().equals("003")?"004":"003";
				String locationNmVal = workOrderMatrlVo.getLocationCd().equals("003")?"사출2호기":"사출1호기";
				
				StockPaymentAdmVo stockVo2 = new StockPaymentAdmVo();
				stockVo2.setRealQtyOption("Y");
				stockVo2.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				stockVo2.setLocationCd(locationCdVal);
				stockVo2.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				
				if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2).size()>0) {
					stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2).get(0);
					if(stockPaymentAdmVo.getRealQty()=="0.000") {
						logger.info("남은잔량이 없는 바코드입니다.");
						jsonData.put("result", "fail");
						jsonData.put("message", "남은잔량이 없는 바코드입니다.");
					}else {
						if(workOrderMatrlService.getMatrlWorkStatus(workOrderMatrlVo).equals("Y")) {
							
							StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							stockTempVo.setRealQtyOption("Y");
							stockTempVo.setBarcodeNo("");
							stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
							stockTempVo.setLocationCd(locationCdVal);
							stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							//선입선출 조건
							stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
							stockTempVo.setFifoOption("Y");
							List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
							
							if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
									|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
								jsonData.put("result", "popup");
								jsonData.put("message", locationNmVal+"창고에 자재가 있습니다. 그래도 투입하시겠습니까?");
							}else {
								jsonData.put("result","fifo");
								jsonData.put("message", "이전LOT가 있습니다.");
							}
						}else {
							logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료가 아님");
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 진행 중인 작업지시에 투입된 바코드입니다.");
						}
					}
				}else {
					logger.info("해당 바코드가 원재료 창고에 있을 경우");
					
					StockPaymentAdmVo stockVo3 = new StockPaymentAdmVo();
					stockVo3.setRealQtyOption("Y");
					stockVo3.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
					stockVo3.setLocationCd("001");
					stockVo3.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					
					if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo3).size()>0) {
						stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo3).get(0);
						if(stockPaymentAdmVo.getRealQty()=="0.000") {
							logger.info("남은잔량이 없는 바코드입니다.");
							jsonData.put("result", "fail");
							jsonData.put("message", "남은잔량이 없는 바코드입니다.");
						}else {
							logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
							ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
							itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
							itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
							itemPartVo.setItemLvl("0");
							
							if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
								StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
								stockTempVo.setRealQtyOption("Y");
								stockTempVo.setBarcodeNo("");
								stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								stockTempVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
								stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
								//선입선출 조건
								stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockTempVo.setFifoOption("Y");
								List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
								
								if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
										|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
									
									//이동전표 발생
									String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
									
									//1.출고
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
									stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("002");
									stockPaymentAdmVo.setSpSubGubun("이동출고");
									stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
									stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
									stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
									stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									//입고
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
									stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("001");
									stockPaymentAdmVo.setSpSubGubun("이동입고");
									stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
									stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
									stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
									stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
									matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
									matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
									matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
									matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
									matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
									matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
									matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
									matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
									matrlVo.setRegId(Utils.getUserId());
									workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
									
									jsonData.put("result", "ok");
									jsonData.put("message", "자재투입되었습니다.");
								}else {
									jsonData.put("result","fifo");
									jsonData.put("message", "이전LOT가 있습니다.");
								}
							}else {
								logger.info("해당 제품의 개발관리에 등록되어 있는 자재");
								jsonData.put("result", "fail");
								jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 자재바코드입니다.");
							}
						}
					}else {
						logger.info("입고되지 않은 바코드이거나 잔량이 없음");
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
					}
				}
			}else {
				stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).get(0);	
				
				logger.info("2-2.해당 창고에 있을 경우");
				ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
				itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
				itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
				itemPartVo.setItemLvl("0");
				
				logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
				if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
					logger.info("3-1.해당 제품의 개발관리에 등록되어 있는 자재인 경우");
					
					logger.info("4.남은수량 파악");
					logger.info("realqty:");
					if(stockPaymentAdmVo.getRealQty()=="0.000") {
						logger.info("4-1.남은수량이 없는 경우");
						jsonData.put("result", "fail");
						jsonData.put("message", "남은잔량이 없는 바코드입니다.");
					}else {
						logger.info("4-2.남은수량이 있는 경우");
						logger.info("5.자재투입내역에 있는지 파악");
						if(workOrderMatrlService.workOrdMatrlList(workOrderMatrlVo)>0) {
							logger.info("5-1.자재투입내역에 있는 자재");
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 투입된 바코드입니다.");
						}else {
							logger.info("5-2.자재투입내역에 있는 자재");
							String matrlWorkStatus = workOrderMatrlService.getMatrlWorkStatus(workOrderMatrlVo);
							if(matrlWorkStatus==null || matrlWorkStatus.equals("Y")) {
								
								StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
								stockTempVo.setRealQtyOption("Y");
								stockTempVo.setBarcodeNo("");
								stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								stockTempVo.setLocationCd("001");
								stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
								//선입선출 조건
								stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockTempVo.setFifoOption("Y");
								List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
								
								if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
										|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
										
									logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료임");
									WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
									matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
									matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
									matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
									matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
									matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
									matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
									matrlVo.setTotalConsumpt(Float.parseFloat((stockPaymentAdmVo.getRealQty())));
									matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
									matrlVo.setRegId(Utils.getUserId());
									workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
									
									jsonData.put("result", "ok");
									jsonData.put("message", "자재투입되었습니다.");
								}else {
									jsonData.put("result","fifo");
									jsonData.put("message", "이전LOT가 있습니다.");
								}
							}else {
								logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료가 아님");
								jsonData.put("result", "fail");
								jsonData.put("message", "이미 진행 중인 작업지시에 투입된 바코드입니다.");
							}
						}
					}
				}else {
					logger.info("3-2.해당 제품의 개발관리에 등록되어있지 않은 자재인 경우");
					jsonData.put("result", "fail");
					jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 자재바코드입니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 자재투입(봉제)
	@RequestMapping(value = "/po/matrlBarcodeNoScanByBongjea", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScanByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			logger.info("1.바코드별 재고파악");
			StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
			stockVo.setRealQtyOption("Y");
			stockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			stockVo.setLocationCd(workOrderMatrlVo.getLocationCd());
			stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			
			logger.info("2.해당 창고에 바코드 존재파악");
			if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size()<=0) {
				logger.info("2-1.해당 창고에 없을 경우");
				logger.info("해당 바코드가 원재료 창고에 있을 경우");
				
				StockPaymentAdmVo stockVo3 = new StockPaymentAdmVo();
				stockVo3.setRealQtyOption("Y");
				stockVo3.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				stockVo3.setLocationCd("006");
				stockVo3.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				
				if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo3).size()>0) {
					stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo3).get(0);
					if(stockPaymentAdmVo.getRealQty()=="0.000") {
						logger.info("남은잔량이 없는 바코드입니다.");
						jsonData.put("result", "fail");
						jsonData.put("message", "남은잔량이 없는 바코드입니다.");
					}else {
						logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
						ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
						itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
						itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
						itemPartVo.setItemLvl("0");
						
						if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
							StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							stockTempVo.setRealQtyOption("Y");
							stockTempVo.setBarcodeNo("");
							stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
							stockTempVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
							stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							//선입선출 조건
							stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
							stockTempVo.setFifoOption3("Y");
							List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
							
							if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
									|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
								
								//이동전표 발생
								String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
								
								//1.출고
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
								stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("002");
								stockPaymentAdmVo.setSpSubGubun("이동출고");
								stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
								stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
								stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
								stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								//입고
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
								stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("001");
								stockPaymentAdmVo.setSpSubGubun("이동입고");
								stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
								stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
								stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
								stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
								matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
								matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
								matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
								matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
								matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
								matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
								matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
								matrlVo.setRegId(Utils.getUserId());
								workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
								
								jsonData.put("result", "ok");
								jsonData.put("message", "자재투입되었습니다.");
							}else {
								jsonData.put("result","fifo");
								jsonData.put("message", "이전LOT가 있습니다.");
							}
						}else {
							logger.info("해당 제품의 개발관리에 등록되어 있는 자재");
							jsonData.put("result", "fail");
							jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 자재바코드입니다.");
						}
					}
				}else {
					logger.info("해당 바코드가 제품 창고에 있을 경우");
					StockPaymentAdmVo stockVo4 = new StockPaymentAdmVo();
					stockVo4.setRealQtyOption("Y");
					stockVo4.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
					stockVo4.setLocationCd("007");
					stockVo4.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					
					if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo4).size()>0) {
						stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo4).get(0);
						if(stockPaymentAdmVo.getRealQty()=="0.000") {
							logger.info("남은잔량이 없는 바코드입니다.");
							jsonData.put("result", "fail");
							jsonData.put("message", "남은잔량이 없는 바코드입니다.");
						}else {
							logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
							ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
							itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
							itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
							itemPartVo.setItemLvl("0");
							
							if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
								StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
								stockTempVo.setRealQtyOption("Y");
								stockTempVo.setBarcodeNo("");
								stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								stockTempVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
								stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
								//선입선출 조건
								stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockTempVo.setFifoOption3("Y");
								List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
								
								if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
										|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
									
									//이동전표 발생
									String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
									
									//1.출고
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
									stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("002");
									stockPaymentAdmVo.setSpSubGubun("이동출고");
									stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
									stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
									stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
									stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									//입고
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
									stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("001");
									stockPaymentAdmVo.setSpSubGubun("이동입고");
									stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
									stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
									stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
									stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
									matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
									matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
									matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
									matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
									matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
									matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
									matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
									matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
									matrlVo.setRegId(Utils.getUserId());
									workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
									
									jsonData.put("result", "ok");
									jsonData.put("message", "반제품 투입되었습니다.");
								}else {
									jsonData.put("result","fifo");
									jsonData.put("message", "이전LOT가 있습니다.");
								}
							}else {
								logger.info("해당 제품의 개발관리에 등록되어 있는 자재");
								jsonData.put("result", "fail");
								jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 반제품바코드입니다.");
							}
						}
						
					}else {
						logger.info("입고되지 않은 바코드이거나 잔량이 없음");
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
					
					}
				}
				
			}else {
				stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).get(0);	
				
				logger.info("2-2.해당 공정 창고에 있을 경우");
				ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
				itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
				itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
				itemPartVo.setItemLvl("0");
				
				logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
				if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
					logger.info("3-1.해당 제품의 개발관리에 등록되어 있는 자재인 경우");
					
					logger.info("4.남은수량 파악");
					if(stockPaymentAdmVo.getRealQty()=="0.000") {
						logger.info("4-1.남은수량이 없는 경우");
						jsonData.put("result", "fail");
						jsonData.put("message", "남은잔량이 없는 바코드입니다.");
					}else {
						logger.info("4-2.남은수량이 있는 경우");
						logger.info("5.자재투입내역에 있는지 파악");
						if(workOrderMatrlService.workOrdMatrlList(workOrderMatrlVo)>0) {
							logger.info("5-1.자재투입내역에 있는 자재");
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 투입된 바코드입니다.");
						}else {
							logger.info("5-2.자재투입내역에 있는 자재");
							String matrlWorkStatus = workOrderMatrlService.getMatrlWorkStatusByBongjae(workOrderMatrlVo);
							if(matrlWorkStatus==null || matrlWorkStatus.equals("Y")) {
								logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료임");
								StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
								stockTempVo.setRealQtyOption("Y");
								stockTempVo.setBarcodeNo("");
								stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								stockTempVo.setLocationCd(stockVo.getLocationCd());
								stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
								//선입선출 조건
								stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockTempVo.setFifoOption3("Y");
								List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
								
								if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
										|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
										
									WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
									matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
									matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
									matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
									matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
									matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
									matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
									matrlVo.setTotalConsumpt(Float.parseFloat((stockPaymentAdmVo.getRealQty())));
									matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
									matrlVo.setRegId(Utils.getUserId());
									workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
									
									jsonData.put("result", "ok");
									jsonData.put("message", "자재투입되었습니다.");
								}else {
									jsonData.put("result","fifo");
									jsonData.put("message", "이전LOT가 있습니다.");
								}
							}else {
								logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료가 아님");
								jsonData.put("result", "fail");
								jsonData.put("message", "이미 진행 중인 작업지시에 투입된 바코드입니다.");
							}
						}
					}
				}else {
					logger.info("3-2.해당 제품의 개발관리에 등록되어있지 않은 자재인 경우");
					jsonData.put("result", "fail");
					jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 자재바코드입니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 투입취소
	@RequestMapping(value = "/po/moveMatrlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moveMatrlDel(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("투입취소: " + workOrderPrcssVo);
		try {
			WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
			workOrderMatrlVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderMatrlVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
			workOrderMatrlVo.setBarcodeNo(workOrderPrcssVo.getBarcodeNo());
			workOrderMatrlService.workOrdMatrlDel(workOrderMatrlVo);
			logger.info("자재투입 테이블 삭제");
			
			//투입 사용량 수정
			StockPaymentAdmVo stockPaymentAdmReadVo = new StockPaymentAdmVo();
			stockPaymentAdmReadVo.setLocationCd(workOrderPrcssVo.getLocCd());
			stockPaymentAdmReadVo.setSourceNo(workOrderPrcssVo.getBarcodeNo());
			
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmReadVo);
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getSpSubGubun().equals("이동입고")) {
					StockPaymentAdmVo stockPaymentAdmDelVo = new StockPaymentAdmVo();
					stockPaymentAdmDelVo.setSpNo(list.get(i).getSpNo());
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmDelVo);
					logger.info("수불테이블 이동출고/입고 삭제");
				}
			}
			jsonData.put("result", "투입취소 되었습니다.");
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//자재투입(이동)
	@RequestMapping(value = "/po/moveMatrlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moveMatrlList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작업지시 공정별 자재투입 barcode Scan: " + workOrderMatrlVo);
		try {
			String locationCdVal = workOrderMatrlVo.getLocationCd().equals("003")?"004":"003";
			
			StockPaymentAdmVo stockVo2 = new StockPaymentAdmVo();
			stockVo2.setRealQtyOption("Y");
			stockVo2.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			stockVo2.setLocationCd(locationCdVal);
			stockVo2.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			
			stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2).get(0);
					
			//이동전표 발생
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			
			//1.출고
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("002");
			stockPaymentAdmVo.setSpSubGubun("이동출고");
			stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
			stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
			stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			//입고
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("001");
			stockPaymentAdmVo.setSpSubGubun("이동입고");
			stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
			stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
			stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
			stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
			matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
			matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
			matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
			matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
			matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
			matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
			matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
			matrlVo.setRegId(Utils.getUserId());
			workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
				
			jsonData.put("result", "ok");
			jsonData.put("message", "자재투입되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	// 작업지시 공정별 자재투입 수정
	@RequestMapping(value = "/po/workOrdMatrlEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlEdit(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 수정: " + workOrderMatrlVo);
		try {
			workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// -------------자주검사-------------
	// 자주검사 초기화
	@RequestMapping(value = "/po/workOrderJajuInspectReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectReset(WorkOrderJajuInspectVo workOrderJajuInspectVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자주검사 초기화");
		try {
			List<WorkOrderJajuInspectVo> workOrderJajuInspectList = new ArrayList<WorkOrderJajuInspectVo>();
			jsonData.put("data", workOrderJajuInspectList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 조회
	@RequestMapping(value = "/po/workOrderJajuInspectRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			/*
			 * int existData =
			 * workOrderJajuInspectService.existWorkOrderJajuInspect(workOrderJajuInspectVo)
			 * ; if(existData>0) { List<WorkOrderJajuInspectVo> workOrderJajuInspectList =
			 * workOrderJajuInspectService.workOrderJajuInspectRead(workOrderJajuInspectVo);
			 * jsonData.put("data", workOrderJajuInspectList); } else {
			 * List<WorkOrderJajuInspectVo> workOrderJajuInspectList =
			 * workOrderJajuInspectService.jajuInspectRead(workOrderJajuInspectVo);
			 * jsonData.put("data", workOrderJajuInspectList); } jsonData.put("result",
			 * "ok");
			 * 
			 */
			List<WorkOrderJajuInspectVo> workOrderJajuInspectList = workOrderJajuInspectService
					.workOrderJajuInspectRead(workOrderJajuInspectVo);
			jsonData.put("data", workOrderJajuInspectList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 관리항목 조회
	@RequestMapping(value = "/po/workOrderJajuInspectItemNmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectItemNmList(
			WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int existData = workOrderJajuInspectService.existWorkOrderJajuInspect(workOrderJajuInspectVo);
			List<WorkOrderJajuInspectVo> workOrderJajuInspectList;
			String itemNm = "";
			if (existData > 0) {
				workOrderJajuInspectList = workOrderJajuInspectService.workOrderJajuInspectRead(workOrderJajuInspectVo);
				itemNm = workOrderJajuInspectList.get(0).getItemNm();
			} else {
				workOrderJajuInspectList = workOrderJajuInspectService.jajuInspectRead(workOrderJajuInspectVo);
				for (int i = 0; i < 5; i++) {
					// 관리 항목이 값이 없으면
					if (i + 1 > workOrderJajuInspectList.size()) {
						if (i == 4) {

						} else {
							itemNm += "/";
						}
					}
					// 관리 항목이 값이 있으면
					else {
						if (i == 4) {
							itemNm += workOrderJajuInspectList.get(i).getItemNm();
						} else {
							itemNm += workOrderJajuInspectList.get(i).getItemNm() + "/";
						}
					}
				}
			}
			logger.info("값 : " + itemNm);
			jsonData.put("itemNmList", itemNm);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 등록
	@RequestMapping(value = "/po/workOrderJajuInspectCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderJajuInspectCreate(
			@RequestBody List<Map<String, Object>> workCondContList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderJajuInspectVo workOrderJajuInspectVo = new WorkOrderJajuInspectVo();
		logger.info("자주검사 등록 : " + workOrderJajuInspectVo);
		try {
			int sequence = 1;
			workOrderJajuInspectVo.setWorkOrdNo(workCondContList.get(0).get("workOrdNo").toString());
			workOrderJajuInspectVo.setWorkOrdSeq(workCondContList.get(0).get("workOrdSeq").toString());
			workOrderJajuInspectVo.setMinorPrcssCd(workCondContList.get(0).get("minorPrcssCd").toString());
			workOrderJajuInspectVo.setMiddlePrcssCd(workCondContList.get(0).get("middlePrcssCd").toString());
			for (Map<String, Object> m : workCondContList) {
				if (sequence == 1) {
					workOrderJajuInspectService.workOrderJajuInspectDelete(workOrderJajuInspectVo);
				}

				if (m.get("itemCont").toString().equals("allDelete")) {
					jsonData.put("result", "ok");
					return jsonData;
				}
				workOrderJajuInspectVo.setJajuSeq(sequence);
				workOrderJajuInspectVo.setJajuDesc(m.get("jajuDesc").toString());
				workOrderJajuInspectVo.setJajuRegDate(m.get("jajuRegDate").toString());
				workOrderJajuInspectVo.setItemNm(m.get("itemNm").toString());
				workOrderJajuInspectVo.setItemCont(m.get("itemCont").toString());
				workOrderJajuInspectVo.setRegId(Utils.getUserId().toString());
				// 첫번째 수정하기전 삭제후 등록

				workOrderJajuInspectService.workOrderJajuInspectCreate(workOrderJajuInspectVo);
				sequence++;
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 수정
	@RequestMapping(value = "/po/workOrderJajuInspectUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderJajuInspectUpdate(
			@RequestBody List<Map<String, Object>> workCondContList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderJajuInspectVo workOrderJajuInspectVo = new WorkOrderJajuInspectVo();
		try {
			int sequence = 1;
			workOrderJajuInspectVo.setWorkOrdNo(workCondContList.get(0).get("workOrdNo").toString());
			workOrderJajuInspectVo.setWorkOrdSeq(workCondContList.get(0).get("workOrdSeq").toString());
			workOrderJajuInspectVo.setMinorPrcssCd(workCondContList.get(0).get("minorPrcssCd").toString());
			workOrderJajuInspectVo.setMiddlePrcssCd(workCondContList.get(0).get("middlePrcssCd").toString());

			for (Map<String, Object> m : workCondContList) {
				workOrderJajuInspectVo.setJajuSeq(sequence);
				workOrderJajuInspectVo.setJajuDesc(m.get("jajuDesc").toString());
				workOrderJajuInspectVo.setJajuRegDate(m.get("jajuRegDate").toString());
				workOrderJajuInspectVo.setItemNm(m.get("itemNm").toString());
				workOrderJajuInspectVo.setItemCont(m.get("itemCont").toString());
				workOrderJajuInspectVo.setRegId(Utils.getUserId().toString());
				;

				// 첫번째 수정하기전 삭제후 등록
				if (sequence == 1) {
					workOrderJajuInspectService.workOrderJajuInspectDelete(workOrderJajuInspectVo);
				}

				workOrderJajuInspectService.workOrderJajuInspectCreate(workOrderJajuInspectVo);
				sequence++;
			}

			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// -------------비가동등록-------------
	// 비가동등록 초기화
	@RequestMapping(value = "/po/workOrderNonOperationReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectReset(WorkOrderNonOperationVo workOrderNonOperationVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderNonOperationVo> WorkOrderNonOperationList = new ArrayList<WorkOrderNonOperationVo>();
			jsonData.put("data", WorkOrderNonOperationList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 비가동등록 조회
	@RequestMapping(value = "/po/workOrderNonOperationRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderNonOperationRead(WorkOrderNonOperationVo workOrderNonOperationVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			logger.info("비가동 데이터 : " + workOrderNonOperationVo);
			if (workOrderNonOperationVo.getWorkOrdNo() == "") {

				List<WorkOrderNonOperationVo> WorkOrderNonOperationList = new ArrayList<WorkOrderNonOperationVo>();
				jsonData.put("data", WorkOrderNonOperationList);
				jsonData.put("result", "ok");
				logger.info("비가동 데이터가 없어..");
				return jsonData;
			}
			logger.info("비가동 데이터가 있어..");
			List<WorkOrderNonOperationVo> WorkOrderNonOperationList = workOrderNonOperationService
					.workOrderNonOperationRead(workOrderNonOperationVo);
			jsonData.put("data", WorkOrderNonOperationList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 비가동등록 등록
	@RequestMapping(value = "/po/workOrderNonOperationCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationCreate(
			@RequestBody List<Map<String, Object>> WorkOrderNonOperationList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderNonOperationVo workOrderNonOperationVo = new WorkOrderNonOperationVo();
		try {
			int sequence = 1;
			workOrderNonOperationVo.setWorkOrdNo(WorkOrderNonOperationList.get(0).get("workOrdNo").toString());
			workOrderNonOperationVo.setWorkOrdSeq("0");
			workOrderNonOperationVo.setMinorPrcssCd("0");
			workOrderNonOperationVo.setMiddlePrcssCd("0");
			for (Map<String, Object> m : WorkOrderNonOperationList) {
				if (sequence == 1) {
					workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
				}
				if (m.get("noGubun").toString() == "") {
					jsonData.put("result", "ok");
					return jsonData;
				}
				workOrderNonOperationVo.setNoSeq(Integer.toString(sequence));
				workOrderNonOperationVo.setNoGubun(m.get("noGubun").toString());
				workOrderNonOperationVo.setNoReason(m.get("noReason").toString());
				workOrderNonOperationVo.setNoStartTime(m.get("noStartTime").toString());
				workOrderNonOperationVo.setNoEndTime(m.get("noEndTime").toString());
				workOrderNonOperationVo.setNoStartDate(m.get("noStartDate").toString());
				workOrderNonOperationVo.setNoEndDate(m.get("noEndDate").toString());
				workOrderNonOperationVo.setNoTime(m.get("noTime").toString());
				//workOrderNonOperationVo.setNoDesc(m.get("noDesc").toString());
				workOrderNonOperationVo.setRegId(Utils.getUserId().toString());

				workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
				sequence++;
			}
			//workOrderNonOperationService.workOrderPrcssNonOperation(workOrderNonOperationVo);
			
			//작업지시서 상태값 수정
			workOrderVo.setWorkOrdNo(workOrderNonOperationVo.getWorkOrdNo());
			workOrderVo.setWorkStatusCd("NS");
			workOrderService.update(workOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 비가동등록 수정
	@RequestMapping(value = "/po/workOrderNonOperationUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationUpdate(WorkOrderVo workOrderVo,WorkOrderMatrlVo workOrderMatrlVo,WorkOrderPrcssVo workOrderPrcssVo, WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("가동시작/가종종료 버튼 클릭");
		try {
			
			//가동시작일 경우
			if(workOrderNonOperationVo.getNoStartDate()!=null && !workOrderNonOperationVo.getNoStartTime().equals("")) {
				if(!workOrderService.workOrdRead(workOrderVo).getWorkStatusCd().equals("PS")) {
					String noSeq = workOrderNonOperationService.createNoSeq(workOrderNonOperationVo);
					workOrderNonOperationVo.setNoSeq(noSeq);
					workOrderNonOperationVo.setRegId(Utils.getUserId().toString());
					workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
					
					workOrderService.update(workOrderVo);
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "noRespon");
				}
			
				
			//가동종료일 경우
			}else {
				logger.info("vo:"+workOrderService.workOrdRead(workOrderVo).getWorkStatusCd());
				if(!workOrderService.workOrdRead(workOrderVo).getWorkStatusCd().equals("PE")) {
					//자재잔량
					int outputQty = workOrderPrcssService.workOrdPrcssDayQty(workOrderPrcssVo);	//총 생산수량310
					float fuzz = Float.parseFloat(workOrderVo.getFuzzQty())*0.001F;
					float runner = Float.parseFloat(workOrderVo.getRunnerQty())*0.001F;
					int addQty = Math.round(fuzz+runner);
					float remainQty = outputQty+addQty;
		
					if(outputQty==0) {
						jsonData.put("result", "fail");
						jsonData.put("message", "생산실적을 등록해주세요.");
					}else {
						//비가동 등록 시작
						workOrderNonOperationVo.setNoSeq(workOrderNonOperationService.getNoSeq(workOrderNonOperationVo));
						List<WorkOrderNonOperationVo> list = workOrderNonOperationService.workOrderNonOperationRead(workOrderNonOperationVo);
						
						while(remainQty>0) {
							
							WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoList(workOrderMatrlVo);	//자재투입 데이터
							if(vo==null) {
								jsonData.put("result", "lack");
								jsonData.put("message", "자재가 부족합니다.");
								break;
							}
							
							float matrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
							
							ItemPartAdmVo partVo = new ItemPartAdmVo();	
							partVo.setItemSeq(vo.getItemSeq());
							partVo.setUpperItemSeq(workOrderMatrlVo.getItemSeq());
							List<ItemPartAdmVo> partList =  itemPartAdmService.itemMotorEbomList(partVo);
							float consumpt = Float.parseFloat(partList.get(0).getItemConsumpt()); //소요량
							float totalSanSangQty = (remainQty*consumpt)+addQty;	//생산량
							float totalMatrlQty = matrlQty;
							
							logger.info("matrlQty:"+matrlQty);
							logger.info("consumpt:"+consumpt);
							logger.info("totalMatrlQty:"+totalSanSangQty);	//4.65
							logger.info("totalMatrlQty:"+matrlQty);	//100
							
							
							stockPaymentAdmVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
							stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
							stockPaymentAdmVo.setSpType(vo.getItemGubun());
							stockPaymentAdmVo.setSpCd(vo.getItemSeq());
							stockPaymentAdmVo.setSpGubun("002");
							stockPaymentAdmVo.setSpSubGubun("자재투입");
							stockPaymentAdmVo.setSpDate(list.get(0).getNoStartDate());
							stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
							stockPaymentAdmVo.setSourceNo(vo.getBarcodeNo());
							stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
							stockPaymentAdmVo.setAreaCd(vo.getAreaCd());
							stockPaymentAdmVo.setFloorCd(vo.getFloorCd());
							stockPaymentAdmVo.setLocationNo(vo.getLocationNo());
							stockPaymentAdmVo.setRegId(Utils.getUserId());
							
							//투입보다 생산량이 많을 경우  310
							if(totalMatrlQty<totalSanSangQty) {	//100<300
								logger.info(totalMatrlQty+"<<<<<"+totalSanSangQty);
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(totalMatrlQty)));  //출고량
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								workOrderMatrlVo.setUseQty(Integer.toString(Math.round(totalMatrlQty))); //사용량
								remainQty = totalSanSangQty-totalMatrlQty;
								logger.info("remainQty:"+remainQty);
							}else {
								logger.info(totalMatrlQty+">>>>>"+totalSanSangQty);
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(totalSanSangQty)));
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								workOrderMatrlVo.setUseQty(Integer.toString(Math.round(totalSanSangQty)));
								remainQty = 0;
								logger.info("remainQty:"+remainQty);
							}
							
							workOrderMatrlVo.setBarcodeNo(vo.getBarcodeNo());
							workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlVo);
							
							
							String sd = list.get(0).getNoStartDate()+" "+list.get(0).getNoStartTime();
							String ed = workOrderNonOperationVo.getNoEndDate()+" "+workOrderNonOperationVo.getNoEndTime();
							
							logger.info("sd:"+sd);
							logger.info("ed:"+ed);
							
							//분 계산 
							SimpleDateFormat format = new SimpleDateFormat("yyyymmddHH:mm");
							Date sDate = null;
							Date eDate = null;
							
							sDate = format.parse(sd);
							eDate = format.parse(ed);
							
							long diff = eDate.getTime() - sDate.getTime();
							long diffMinutes = diff / (60 * 1000);
							
							workOrderNonOperationVo.setNoTime(Long.toString(diffMinutes));
							workOrderNonOperationVo.setUpdId(Utils.getUserId().toString());
							workOrderNonOperationService.workOrderNonOperationUpdate(workOrderNonOperationVo);
							workOrderService.update(workOrderVo);
							
							jsonData.put("result", "ok");
						}
					}
				}else {
					jsonData.put("result", "noRespon");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//비가동 삭제
	@RequestMapping(value = "/po/workOrderNonOperationDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationDelete(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderNonOperationVo.setMinorPrcssCd("0");
			workOrderNonOperationVo.setMiddlePrcssCd("0");
			workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 생산실적 수집
	// 생산수량 변경
	@RequestMapping(value = "/po/workOrderPrcssQtyUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderPrcssQtyUpdate(WorkOrderPrcssVo workOrderPrcssVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderPrcssVo.setUpdId(Utils.getUserId().toString());
			workOrderPrcssService.workOrderPrcssQtyUpdate(workOrderPrcssVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업지시 공정별 불량유형
	// --------------------------------------------------------------------------

	//불량코드별 불량수량 합계
	@RequestMapping(value = "/po/getFaultyTypeSumQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getFaultyTypeSumQty(WorkOrderFaultyTypeVo workOrderFaultyTypeVo)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int faultyTypeSumQty = workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo);
			jsonData.put("data", faultyTypeSumQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 공정별 불량유형 목록조회
	@RequestMapping(value = "/po/workOrderFaultyTypeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderFaultyTypeList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 불량유형 목록조회: " + workOrderFaultyTypeVo);
		try {
			List<WorkOrderFaultyTypeVo> workOrderFaultyTypeList = workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo);
			jsonData.put("data", workOrderFaultyTypeList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//작업지시 불량등록(사출)
	@RequestMapping(value = "/po/workOrdInsertQty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdInsertQty(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작업지시 불량등록(사출): " + workOrderPrcssVo);
		try {
			
			//작업지시 총 불량수정
			workOrderVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			workOrderVo.setFaultyQty(workOrdList.get(0).get("faultyQtySum").toString());
			workOrderService.update(workOrderVo);
			
			workOrderVo.setOutputQty(workOrdList.get(0).get("outputQty").toString());
			workOrderService.workOrdOutputUpdate(workOrderVo);
			
			workOrderPrcssVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			
			ArrayList<String> list1 = new ArrayList<String>();
			ArrayList<Integer> list2 = new ArrayList<Integer>();
			int count =0;
 			for(Map<String, Object> m :workOrdList) {
				
				logger.info("list size:"+list1.size());
				
				if(list1.size()>0) {
					for(int i=0; i<list1.size(); i++) {
						
						logger.info("i:"+i);
						logger.info("list1:"+list1.get(i));
						logger.info("list2:"+list2.get(i));
						logger.info("seq:"+m.get("workOrdSeq").toString());
						
						if(list1.get(i).equals(m.get("workOrdSeq").toString())) {
							int faultyQty =  list2.get(i)+Integer.parseInt(m.get("faultyQty").toString());
							logger.info("불량수량:"+faultyQty);
							list2.set(i, faultyQty);
							count++;
							break;
						}
					}
					if(count==0) {
						list1.add(m.get("workOrdSeq").toString());
						list2.add(Integer.parseInt(m.get("faultyQty").toString()));
					}
					count=0;
				}else {
					logger.info("workOrdSeq:"+m.get("workOrdSeq").toString());
					list1.add(m.get("workOrdSeq").toString());
					list2.add(Integer.parseInt(m.get("faultyQty").toString()));
				}
			}
			
			for(int i=0; i<list1.size(); i++) {
				logger.info("seq:"+list1.get(i));
				logger.info("qty:"+list2.get(i));
				workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(list1.get(i)));
				workOrderPrcssVo.setFaultyQty(Integer.toString(list2.get(i)));
				
				workOrderPrcssService.updateQty(workOrderPrcssVo);		
			}
			
			//작업지시 lotNo별 불량유형 등록 
			for(Map<String, Object> m :workOrdList) {
				
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd("0");
				workOrderFaultyTypeVo.setMiddlePrcssCd("0");
				workOrderFaultyTypeVo.setFaultyTypeSeq("0");
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setFaultyCavity(m.get("faultyCavity").toString());
				workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyQty").toString());
				workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
				workOrderFaultyTypeVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
				
				logger.info("vo:"+workOrderFaultyTypeVo);
				logger.info("list size:"+workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size());
				//작업지시 lotNo별 불량유형이 있을 경우 -> 수정
				if(workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size()!=0) {
					workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
					workOrderFaultyTypeService.update(workOrderFaultyTypeVo);
				  
				}else {
					//작업지시 lotNo별 불량유형이 없을 경우 -> 등록
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo); 
				}
			}
			
			workOrderFaultyTypeVo.setFaultyTypeCd("000026");
			int faultyTypeSumQty = workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo);
			jsonData.put("faultyTypeSumQty", faultyTypeSumQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	/*
	 * //작업지시 불량등록(봉제)
	 * 
	 * @RequestMapping(value = "/po/workOrdFaultyQty", method = RequestMethod.POST)
	 * public @ResponseBody Map<String, Object> workOrdFaultyQty(@RequestBody
	 * List<Map<String, Object>> workOrdList) throws Exception {
	 * logger.info("작업지시 불량등록(봉제)"); Map<String, Object> jsonData = new
	 * HashMap<String, Object>(); // WorkOrderVo workOrderVo = new WorkOrderVo(); //
	 * WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
	 * WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
	 * try { //작업지시 총 불량수정 //
	 * workOrderVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString()); //
	 * workOrderVo.setFaultyQty(workOrdList.get(0).get("faultyQtySum").toString());
	 * // workOrderService.update(workOrderVo);
	 * 
	 * // workOrderVo.setOutputQty(workOrdList.get(0).get("outputQty").toString());
	 * // workOrderService.workOrdOutputUpdate(workOrderVo);
	 * 
	 * //
	 * workOrderPrcssVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString())
	 * ;
	 * 
	 * // ArrayList<String> list1 = new ArrayList<String>(); // ArrayList<Integer>
	 * list2 = new ArrayList<Integer>(); // int count = 0; // for(Map<String,
	 * Object> m :workOrdList) { // if ( list1.size() > 0 ) { // for ( int i=0; i <
	 * list1.size(); i++ ) { // if (
	 * list1.get(i).equals(m.get("workOrdSeq").toString()) ) { // int faultyQty =
	 * list2.get(i) + Integer.parseInt(m.get("faultyQty").toString()); //
	 * list2.set(i, faultyQty); // count++; // break; // } // } // if (count == 0) {
	 * // list1.add(m.get("workOrdSeq").toString()); //
	 * list2.add(Integer.parseInt(m.get("faultyQty").toString())); // } // count =
	 * 0; // } else { // list1.add(m.get("workOrdSeq").toString()); //
	 * list2.add(Integer.parseInt(m.get("faultyQty").toString())); // } // } // //
	 * for(int i=0; i<list1.size(); i++) { //
	 * workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(list1.get(i))); //
	 * workOrderPrcssVo.setFaultyQty(Integer.toString(list2.get(i))); // //
	 * workOrderPrcssService.updateQty(workOrderPrcssVo); // }
	 * 
	 * //1. 불량등록 데이터 전체 삭제
	 * workOrderFaultyTypeVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").
	 * toString());
	 * workOrderFaultyTypeVo.setMiddlePrcssCd(workOrdList.get(0).get("middlePrcssCd"
	 * ).toString());
	 * workOrderFaultyTypeVo.setMinorPrcssCd(workOrdList.get(0).get("minorPrcssCd").
	 * toString());
	 * workOrderFaultyTypeVo.setWorkOrdSeq(workOrdList.get(0).get("workOrdSeq").
	 * toString()); workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
	 * 
	 * //2. 작업지시 lotNo별 불량유형 등록 for(Map<String, Object> m :workOrdList) {
	 * 
	 * workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
	 * workOrderFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
	 * workOrderFaultyTypeVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
	 * workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
	 * workOrderFaultyTypeVo.setFaultyTypeSeq("0");
	 * workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
	 * workOrderFaultyTypeVo.setFaultyCavity("");
	 * workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
	 * workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
	 * workOrderFaultyTypeVo.setApprovalYn("");
	 * workOrderFaultyTypeVo.setFaultyTypeDesc("");
	 * 
	 * //작업지시 lotNo별 불량유형이 있을 경우 -> 수정 if
	 * (workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size() > 0) {
	 * workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
	 * workOrderFaultyTypeService.update(workOrderFaultyTypeVo); } else { //작업지시
	 * lotNo별 불량유형이 없을 경우 -> 등록 workOrderFaultyTypeVo.setRegId(Utils.getUserId());
	 * workOrderFaultyTypeService.createList(workOrderFaultyTypeVo); }
	 * 
	 * }
	 * 
	 * // workOrderFaultyTypeVo.setFaultyTypeCd("000026"); // int faultyTypeSumQty =
	 * workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo); //
	 * jsonData.put("faultyTypeSumQty", faultyTypeSumQty); jsonData.put("result",
	 * "ok"); } catch (Exception e) { e.printStackTrace(); jsonData.put("result",
	 * "error"); jsonData.put("message", Utils.getErrorMessage()); } return
	 * jsonData; }
	 */
	
	
	// 작업지시 불량 삭제
	@RequestMapping(value = "/po/workOrdFaultyDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdFaultyDelete(WorkOrderFaultyTypeVo workOrderFaultyTypeVo,WorkOrderVo workOrderVo, WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<WorkOrderFaultyTypeVo> list =  workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo);
			if(list.size()!=0) {
				//작업지시 총 불량수정
				workOrderVo.setFaultyQty(Integer.toString(Integer.parseInt(workOrderVo.getFaultyQty())-Integer.parseInt(workOrderFaultyTypeVo.getFaultyTypeQty())));
				workOrderService.update(workOrderVo);
				
				//작업지시 생산lot별 불량수정
				workOrderPrcssVo.setFaultyQty(workOrderFaultyTypeVo.getFaultyTypeQty());
				workOrderPrcssService.workOrdPrcssFaultyQtyDelete(workOrderPrcssVo);	
				
				//불량삭제
				workOrderFaultyTypeVo.setMinorPrcssCd("0");
				workOrderFaultyTypeVo.setMiddlePrcssCd("0");
				workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			}
			
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	};

	// 작업지시 공정별 불량유형 목록조회
	@RequestMapping(value = "/po/workOrderFaultyApprove", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderFaultyApprove(
			@RequestBody List<Map<String, Object>> workOrderFaultyType) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작업지시 공정별 불량유형 승인조회: " + workOrderFaultyType);
		try {

			workOrderFaultyTypeVo.setWorkOrdNo(workOrderFaultyType.get(0).get("workOrdNo").toString());
			workOrderFaultyTypeVo.setWorkOrdSeq(workOrderFaultyType.get(0).get("workOrdSeq").toString());
			workOrderFaultyTypeVo.setMinorPrcssCd(workOrderFaultyType.get(0).get("minorPrcssCd").toString());
			workOrderFaultyTypeVo.setMiddlePrcssCd(workOrderFaultyType.get(0).get("middlePrcssCd").toString());
			workOrderFaultyTypeVo.setUpdId(Utils.getUserId());

			for (Map<String, Object> m : workOrderFaultyType) {

				workOrderFaultyTypeVo.setFaultyTypeSeq(m.get("faultyTypeSeq").toString());
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setApprovalYn("001");

				// 승인 등록
				workOrderFaultyTypeService.approvalUpdate(workOrderFaultyTypeVo);
			}

			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업표준서
	// --------------------------------------------------------------------------

	// 작업표준서 다운로드
	@RequestMapping(value = "/po/workStandardDownload", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workStandardDownload(HttpServletResponse res, HttpServletRequest req, WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		ItemMotorVo vo = new ItemMotorVo();
		try {

			itemMotorVo.setItemCd(workOrderPrcssVo.getItemCd());
			itemMotorVo.setItemRev(workOrderPrcssVo.getItemRev());
		

			vo = itemMotorService.itemWorkStandardRead(itemMotorVo);

			if (vo == null) {
				jsonData.put("result", "notExist");
			} else {
				if (vo.getWorkStandard() == null) {
					jsonData.put("result", "downOk");
				} else {
					String workStandard = new String(Base64.encodeBase64(vo.getWorkStandard()));
					jsonData.put("data", workStandard);
					jsonData.put("result", "openOk");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업표준서 보기
	@RequestMapping(value = "/po/workStandardDownloadNew", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workStandardDownloadNew(HttpServletResponse res, HttpServletRequest req, ItemMotorVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		
		try {

			itemMotorVo.setItemSeq(vo.getItemSeq());
			itemMotorVo.setWorkStandardSeq(vo.getWorkStandardSeq());
		

			vo = itemMotorService.itemWorkStandardPreView(itemMotorVo);

			if (vo == null) {
				jsonData.put("result", "notExist");
			} else {
				if (vo.getWorkStandard() == null) {
					jsonData.put("result", "downOk");
				} else {
					String workStandard = new String(Base64.encodeBase64(vo.getWorkStandard()));
					jsonData.put("data", workStandard);
					jsonData.put("result", "openOk");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업표준서 download
	@RequestMapping(value = "/po/downloadFile", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req, ItemMotorVo itemMotorVo)
			throws Exception {
		ItemMotorVo vo = new ItemMotorVo();
		try {
			// 파일명 가져오기
			vo = itemMotorService.itemWorkStandardRead(itemMotorVo);
			String dFile = vo.getWorkStandardNm();
			logger.info(dFile);
			String newFileName = itemMotorVo.getPrcssCd() + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info(newFileName);
			String path = file_Item_Standard_Path + "\\" + itemMotorVo.getItemCd() + "\\" + itemMotorVo.getItemRev()
					+ "\\" + newFileName;

			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=" + dFile + ";");

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
	
	// 작업표준서 이미지 파일 외  파일 download
	@RequestMapping(value = "/po/downloadFileNew", method = RequestMethod.GET)
	public @ResponseBody void downloadFileNew(HttpServletResponse res, HttpServletRequest req, ItemMotorVo itemMotorVo)
			throws Exception {
		ItemMotorVo vo = new ItemMotorVo();
		try {
			// 파일명 가져오기
			vo = itemMotorService.itemWorkStandardPreView(itemMotorVo);
			String dFile = vo.getWorkStandardNm();
			logger.info(dFile);
			String newFileName = vo.getItemSeq() + vo.getWorkStandardSeq() + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info(newFileName);
			String path = file_Item_Standard_Path + "/" + vo.getItemSeq() + "/" + vo.getWorkStandardSeq()+ "/" + newFileName;

			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=" + dFile + ";");

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

	// 작지별 소공정 모니터링 목록조회
	@RequestMapping(value = "/po/workOrdPrcssMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdPrcssMonitoringList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			List<WorkOrderPrcssVo> list = workOrderPrcssService.workOrdPrcssMonitoringList(workOrderPrcssVo);
			if (list == null) {
				list = new ArrayList<>();
			}

			jsonData.put("result", "ok");
			jsonData.put("data", list);

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	
	// 작업조건
	// --------------------------------------------------------------------------
	
	//작업지시 작업조건 유무
	@RequestMapping(value = "/po/eqWorkHisAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> eqWorkHisAdmListCount(EqWorkHisAdmVo eqWorkHisAdmVo, EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		EqWorkHisAdmVo vo = new EqWorkHisAdmVo();
		EquipCodeAdmVo eqCondVo = new EquipCodeAdmVo();
		EquipCodeAdmVo eqStandVo = new EquipCodeAdmVo();
		logger.info("작업지시 작업조건 목록 vo:"+eqWorkHisAdmVo);
		try {

			int count = eqWorkHisAdmService.listCount(eqWorkHisAdmVo);
			if(count>0) {
				logger.info("이미 등록된 작업조건이 있음");
				vo = eqWorkHisAdmService.listAll(eqWorkHisAdmVo);
				jsonData.put("data", vo);
				jsonData.put("result", "ok");
				return jsonData;
			}else {
				logger.info("이미 등록된 작업조건이 없음:"+ equipCodeAdmVo);
				
				equipCodeAdmVo.setWorkcondiCheck("stand");
				eqStandVo = equipCodeAdmService.eqWorkStandAdmRead(equipCodeAdmVo);
				
				equipCodeAdmVo.setWorkcondiCheck("cond");
				eqCondVo = equipCodeAdmService.eqWorkStandAdmRead(equipCodeAdmVo);
				
				jsonData.put("standData", eqStandVo);
				jsonData.put("condData", eqCondVo);
				jsonData.put("result", "ok");
				return jsonData;
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	//작업지시 작업조건 등록
	@RequestMapping(value = "/po/eqWorkHisAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> eqWorkHisAdmCreate(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업조건 vo:"+eqWorkHisAdmVo);
		try {

			if(eqWorkHisAdmService.listCount(eqWorkHisAdmVo)>0) {
				eqWorkHisAdmVo.setUpdId(Utils.getUserId());
				eqWorkHisAdmService.update(eqWorkHisAdmVo);
				
				logger.info("작업조건 수정완료");
			}else {
				eqWorkHisAdmVo.setRegId(Utils.getUserId());
				eqWorkHisAdmService.create(eqWorkHisAdmVo);
				logger.info("작업조건 등록완료");
			}

			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//작업지시 생산시간,비가동시간 계산
	@RequestMapping(value = "/po/getWorkTimeMin", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getWorkTimeMin(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업조건 vo:"+workOrderPrcssVo);
		try {
	
			String workTime = workOrderPrcssService.getWorkTime(workOrderPrcssVo);  
			String workNonTime = workOrderNonOperationService.getWorkNonTime(workOrderNonOperationVo); 
			
			int realWorkTime = 0;
			int nonWorkTime = 0;
			
			//생산실적 시간이 없을 경우
			if(workTime!=null && workTime!="") {
				realWorkTime = Integer.parseInt(workTime);
			}
			
			//비가동 시간이 없을 경우
			if(workNonTime!=null && workNonTime!="") {
				nonWorkTime = Integer.parseInt(workNonTime);
			}
			
			jsonData.put("realWorkTime", realWorkTime);
			jsonData.put("nonWorkTime", nonWorkTime);
			jsonData.put("result", "ok");
	
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
	
		return jsonData;
	}
	
	//작업지시 생산시간,비가동시간 계산
	@RequestMapping(value = "/po/getWorkTime", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getWorkTime(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업조건 vo:"+workOrderPrcssVo);
		try {
	
			String workTime = workOrderPrcssService.getWorkTime(workOrderPrcssVo);  
			String workNonTime = workOrderNonOperationService.getWorkNonTime(workOrderNonOperationVo); 
			
			int realWorkHour = 0;
			int realWorkMin = 0;
			int nonWorkHour = 0;
			int nonWorkMin = 0;
			
			//생산실적 시간이 없을 경우
			if(workTime!=null && workTime!="") {
				int realWorkTime = Integer.parseInt(workTime) - Integer.parseInt(workNonTime);
				
				if(realWorkTime>=60) {
					realWorkHour = realWorkTime/60;
					realWorkMin = realWorkTime%60;
				}else {
					realWorkMin = realWorkTime;
				}
			}
			
			int nonWorkTime = Integer.parseInt(workNonTime);
			
			if(nonWorkTime>=60) {
				nonWorkHour = nonWorkTime/60;
				nonWorkMin = nonWorkTime%60;
			}else {
				nonWorkMin = nonWorkTime;
			}
			
			jsonData.put("realWorkHour", realWorkHour);
			jsonData.put("realWorkMin", realWorkMin);
			jsonData.put("nonWorkHour", nonWorkHour);
			jsonData.put("nonWorkMin", nonWorkMin);
			jsonData.put("result", "ok");
	
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
	
		return jsonData;
	}
	
	// pda 출고요청 바코드 스캔
	@RequestMapping(value = "/po/pdaLotNoScan", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcss(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회: " + workOrderPrcssVo);
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		try {
			int workOrderPrcssExist = workOrderPrcssService.workOrderPrcssExist(workOrderPrcssVo);
			//TB_WORK_ORDER_PRCSS의 ORD_LOT_NO 존재 여부 확인
			if(workOrderPrcssExist>0) {
				
				StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
				stockVo.setRealQtyOption("Y");
				stockVo.setBarcodeNo(workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo).getOrdLotNo());
				stockVo.setLocationCd("002");
				stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				
				if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size()>0) {
					StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
					stockTempVo.setRealQtyOption("Y");
					stockTempVo.setBarcodeNo("");
					stockTempVo.setItemSeq(workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo).getItemSeq());
					stockTempVo.setLocationCd("002");
					stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					//선입선출 조건
					stockTempVo.setFifoBarcodeNo(workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo).getOrdLotNo());
					stockTempVo.setFifoOption2("Y");
					List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
					
					if(stockTempList.size()>0) {
						jsonData.put("result", "fifo");
						jsonData.put("message", "이전 LOT가 있습니다.");
					}else {
						//deliveryOrderAdmVo.setLotNo(workOrderPrcssVo.getOrdLotNo());
						//int deliveryOrderDtlExist = deliveryOrderAdmService.deliveryOrderDtlExist(deliveryOrderAdmVo);
						//TB_DELIVERY_ORDER_DTL에 이미 등록된 데이터인지 확인
						/*
						 * if(deliveryOrderDtlExist > 0) { //이미 등록되어 있는 데이터는 알림 표시
						 * jsonData.put("result", "fail"); jsonData.put("message",
						 * "이미 요청된 바코입니다. 확인해주세요."); } else { //등록되지 않았으면 데이터 조회 후 표시 workOrderPrcssVo =
						 * workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo); //조회한 데이터의
						 * work_status가 003이면 불량 if(workOrderPrcssVo.getWorkStatus().equals("003")) {
						 * jsonData.put("result", "fail"); jsonData.put("message", "불량 LOTNO입니다."); }
						 * else { jsonData.put("data", workOrderPrcssVo); jsonData.put("result", "ok");
						 * } }
						 */
					}
				}else {
					jsonData.put("result", "fail");
					jsonData.put("message", "제품창고에 없는 바코드입니다. 확인해주세요.");
				}
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "등록되지 않은 바코드입니다. 확인해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	

	// pda 출고요청 바코드 스캔
		@RequestMapping(value = "/po/pdaLotNoScanByBongjae", method = RequestMethod.GET)
		public @ResponseBody Map<String, Object> pdaLotNoScanByBongjae(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
			Map<String, Object> jsonData = new HashMap<String, Object>();
			logger.info("생산실적등록 목록조회: " + workOrderPrcssVo);
			DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
			try {
				int workOrderPrcssExist = workOrderPrcssService.workOrderPrcssExist(workOrderPrcssVo);
				//TB_WORK_ORDER_PRCSS의 ORD_LOT_NO 존재 여부 확인
				if(workOrderPrcssExist>0) {
					WorkOrderPrcssVo vo = workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo);
					//거래처에 해당하는 제품인지 확인
					
					if(workOrderPrcssVo.getPoCorpCd()!=null && workOrderPrcssVo.getPoCorpCd().equals(vo.getItemCus())) {
						
						StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
						stockVo.setRealQtyOption("Y");
						stockVo.setBarcodeNo(vo.getOrdLotNo());
						stockVo.setLocationCd(vo.getLocCd());
						stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
						if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size()>0) {
							
							//deliveryOrderAdmVo.setLotNo(workOrderPrcssVo.getOrdLotNo());
							//int deliveryOrderDtlExist = deliveryOrderAdmService.deliveryOrderDtlExist(deliveryOrderAdmVo);
							//TB_DELIVERY_ORDER_DTL에 이미 등록된 데이터인지 확인
							/*
							 * if(deliveryOrderDtlExist > 0) { //이미 등록되어 있는 데이터는 알림 표시
							 * jsonData.put("result", "fail"); jsonData.put("message",
							 * "이미 요청된 바코입니다. 확인해주세요."); } else { //등록되지 않았으면 데이터 조회 후 표시 workOrderPrcssVo =
							 * workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo); //조회한 데이터의
							 * work_status가 003이면 불량 if(workOrderPrcssVo.getWorkStatus().equals("003")) {
							 * jsonData.put("result", "fail"); jsonData.put("message", "불량 LOTNO입니다."); }
							 * else { jsonData.put("data", workOrderPrcssVo); jsonData.put("result", "ok");
							 * } }
							 */
							
							/*
							 * StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							 * stockTempVo.setRealQtyOption("Y"); stockTempVo.setBarcodeNo("");
							 * stockTempVo.setItemSeq(workOrderPrcssService.workOrderPrcssRead(
							 * workOrderPrcssVo).getItemSeq()); stockTempVo.setLocationCd("007");
							 * stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6)); //선입선출 조건
							 * stockTempVo.setFifoBarcodeNo(workOrderPrcssService.workOrderPrcssRead(
							 * workOrderPrcssVo).getOrdLotNo()); stockTempVo.setFifoOption2("Y");
							 * List<StockPaymentAdmVo> stockTempList =
							 * stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);
							 * 
							 * if(stockTempList.size()>0) { jsonData.put("result", "fifo");
							 * jsonData.put("message", "이전 LOT가 있습니다."); }else {
							 * 
							 * }
							 */
						}else {
							jsonData.put("result", "fail");
							jsonData.put("message", "창고에 없는 바코드입니다. 확인해주세요.");
						}
					}else {
						jsonData.put("result", "fail");
						jsonData.put("message", "해당 발주처에 출하하는 품목이 아닙니다. 확인해주세요.");
					}
				} else {
					jsonData.put("result", "fail");
					jsonData.put("message", "등록되지 않은 바코드입니다. 확인해주세요.");
				}
			} catch (Exception e) {
				e.printStackTrace();
				jsonData.put("result", "error");
				jsonData.put("message", Utils.getErrorMessage());
			}
			return jsonData;
		}
	
	
	//생산실적(봉제)****************************************************************
	//소공정 조회
	@RequestMapping(value = "/po/workOrderPrcssCdList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcssCdList(WorkOrderPrcssVo workOrderPrcssVo)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderPrcssVo> list = new ArrayList<WorkOrderPrcssVo>();
			if(workOrderPrcssVo.getItemSeq()!=null && !workOrderPrcssVo.getItemSeq().equals("")) {
				list = workOrderPrcssService.workOrderPrcssCdList(workOrderPrcssVo);
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 공정별 작지목록 조회
	@RequestMapping(value = "/po/prcssToWorkOrdNoList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssToWorkOrdNoList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정별 작지목록 조회: " + workOrderPrcssVo); 
		try {
			String workOrdNo = workOrderPrcssVo.getWorkOrdNo();
			
			if (workOrdNo.equals("")) { // 초기 상태
				List<WorkOrderPrcssVo> workOrderPrcssListEmpty = new ArrayList<WorkOrderPrcssVo>();
				jsonData.put("data", workOrderPrcssListEmpty);
				jsonData.put("result", "ok");
			} else {
				
				if (workOrderPrcssService.workOrdPrcssListDtl(workOrderPrcssVo).size() == 0) { // 해당 공정에 작지가 없을 경우
					WorkOrderPrcssVo workOrderPrcssInfo = new WorkOrderPrcssVo();
					workOrderPrcssInfo = workOrderPrcssService.getPrcssInfo(workOrderPrcssVo); // 해당 공정의 이전,이후 공정 정보 읽기
					if (workOrderPrcssInfo.getPrcssSeq().equals("1")) { // 해당 공정이 작지의 첫번째 공정일 경우
						List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
						WorkOrderPrcssVo workOrderPrcssEmpty = new WorkOrderPrcssVo();
						workOrderPrcssList.add(workOrderPrcssEmpty);
						workOrderPrcssList.get(0).setWorkOrdNo(workOrdNo);

						WorkOrderVo workOrderVo = new WorkOrderVo();
						workOrderVo.setWorkOrdNo(workOrdNo);
						workOrderVo = workOrderService.workOrdRead(workOrderVo); // 작업지시 정보 읽기
						workOrderPrcssList.get(0).setWorkOrdSeq(1);
						workOrderPrcssList.get(0).setItemCd(workOrderVo.getItemCd());
						workOrderPrcssList.get(0).setItemNm(workOrderVo.getItemNm());
						workOrderPrcssList.get(0).setItemGubun(workOrderVo.getItemGubun());
						workOrderPrcssList.get(0).setItemGubunNm(workOrderVo.getItemGubunNm());
						workOrderPrcssList.get(0).setTargetQty(workOrderVo.getWorkOrdQty());
						workOrderPrcssList.get(0).setEquipCd(workOrderVo.getEquipCd());
						workOrderPrcssList.get(0).setEquipNm(workOrderVo.getEquipNm());
						workOrderPrcssList.get(0).setWorkStatus("");

						jsonData.put("data", workOrderPrcssList);
						jsonData.put("result", "ok");
					} else { // 해당 공정이 작지의 첫번째 공정이 아닐 경우
						logger.info(workOrderPrcssInfo.toString());
						WorkOrderPrcssVo workOrderPrcssNew = new WorkOrderPrcssVo();
						workOrderPrcssNew.setWorkOrdNo(workOrdNo);
						workOrderPrcssNew.setMinorPrcssCd(workOrderPrcssInfo.getPrevLowerPrcssCd());
						workOrderPrcssNew.setMiddlePrcssCd(workOrderPrcssInfo.getPrevMiddlePrcssCd());
						if (workOrderPrcssService.workOrdPrcssListDtl(workOrderPrcssNew).size() == 0) { // 이전 공정에 대한 작지도
																										// 없을 경우
							jsonData.put("data", "");
							jsonData.put("result", "ok");
						} else { // 이전공정에 작지가 있을 경우
							List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
							WorkOrderPrcssVo workOrderPrcssEmpty = new WorkOrderPrcssVo();
							workOrderPrcssList.add(workOrderPrcssEmpty);
							workOrderPrcssList.get(0).setWorkOrdNo(workOrdNo);

							WorkOrderVo workOrderVo = new WorkOrderVo();
							workOrderVo.setWorkOrdNo(workOrdNo);
							workOrderVo = workOrderService.workOrdRead(workOrderVo); // 작업지시 정보 읽기
							workOrderPrcssList.get(0).setWorkOrdSeq(1);
							workOrderPrcssList.get(0).setItemCd(workOrderVo.getItemCd());
							workOrderPrcssList.get(0).setItemNm(workOrderVo.getItemNm());
							workOrderPrcssList.get(0).setItemGubun(workOrderVo.getItemGubun());
							workOrderPrcssList.get(0).setItemGubunNm(workOrderVo.getItemGubunNm());
							workOrderPrcssInfo.setWorkOrdNo(workOrdNo);
							workOrderPrcssList.get(0).setTargetQty(Integer.toString(workOrderPrcssService.getOutQty(workOrderPrcssInfo)));
							workOrderPrcssList.get(0).setEquipCd(workOrderVo.getEquipCd());
							workOrderPrcssList.get(0).setEquipNm(workOrderVo.getEquipNm());
							workOrderPrcssList.get(0).setWorkStatus("");

							if (workOrderPrcssService.getOutQty(workOrderPrcssInfo) == 0) {
								workOrderPrcssList.remove(0);
							}

							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
						}
					}
				} else { // 해당 공정에 작지가 있을 경우
					List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
					workOrderPrcssList = workOrderPrcssService.workOrdPrcssListDtl(workOrderPrcssVo);

					WorkOrderPrcssVo workOrderPrcssInfo = new WorkOrderPrcssVo();
					workOrderPrcssInfo = workOrderPrcssService.getPrcssInfo(workOrderPrcssVo); // 해당 공정의 이전,이후 공정 정보 읽기

					boolean exsit = true;
					for (int i = 0; i < workOrderPrcssList.size(); i++) {
						if (workOrderPrcssList.get(i).getWorkStatus().equals("PD")) { // 대기상태인 작지가 있을 경우
							workOrderPrcssInfo.setWorkOrdNo(workOrdNo);
							if (!workOrderPrcssInfo.getPrcssSeq().equals("1")) { // 해당 공정이 작지의 첫번째 공정이 아닐 경우
								workOrderPrcssList.get(i).setTargetQty(Integer.toString(workOrderPrcssService.getOutToTargetSumNotPD(workOrderPrcssInfo)));
							}
							exsit = false;
							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
							break;
						}
					}
					if (exsit) { // 대기상태인 작지가 없을 경우
						workOrderPrcssVo.setPrevLowerPrcssCd(workOrderPrcssInfo.getPrevLowerPrcssCd());
						workOrderPrcssVo.setPrevMiddlePrcssCd(workOrderPrcssInfo.getPrevMiddlePrcssCd());
						if (workOrderPrcssService.getOutToTargetSum(workOrderPrcssVo) == 0) { // 이전공정출고수량이 현재공정에서 이미
																								// 투입되었을 경우
							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
						} else {
							WorkOrderPrcssVo workOrderPrcssEmpty = new WorkOrderPrcssVo();
							workOrderPrcssList.add(workOrderPrcssEmpty);
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setWorkOrdNo(workOrdNo);

							WorkOrderVo workOrderVo = new WorkOrderVo();
							workOrderVo.setWorkOrdNo(workOrdNo);
							workOrderVo = workOrderService.workOrdRead(workOrderVo); // 작업지시 정보 읽기
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setWorkOrdSeq(workOrderPrcssList.size());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemCd(workOrderVo.getItemCd());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemNm(workOrderVo.getItemNm());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemGubun(workOrderVo.getItemGubun());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemGubunNm(workOrderVo.getItemGubunNm());

							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setTargetQty(Integer.toString(workOrderPrcssService.getOutToTargetSum(workOrderPrcssVo)));
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setEquipCd(workOrderVo.getEquipCd());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setEquipNm(workOrderVo.getEquipNm());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setWorkStatus("");

							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작지 등록처리
	@RequestMapping(value = "/po/workOrdAdd2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAdd2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setWorkStartTime(DateUtil.getToday("yyyy-mm-dd hh:mm:ss:ms").substring(0,19));
			workOrderPrcssVo.setRegId(Utils.getUserId());
			workOrderPrcssService.create(workOrderPrcssVo);
			
			jsonData.put("count", 0);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작지 수정처리
	@RequestMapping(value = "/po/workOrdEdit2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdEdit2(WorkOrderVo workOrderVo,WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 수정처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setWorkEndTime(DateUtil.getToday("yyyy-mm-dd hh:mm:ss:ms").substring(0,19));
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			
			if(workOrderPrcssVo.getWorkStatus().equals("WC")) {
				workOrderPrcssService.update(workOrderPrcssVo);
				workOrderPrcssService.updateQtybong(workOrderPrcssVo);
				logger.info("작지 종료시 vo : "+workOrderPrcssVo);
				
			} else{
				workOrderPrcssService.update(workOrderPrcssVo);
			} 
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 비가동등록 등록
	@RequestMapping(value = "/po/workOrderNonOperationCreate2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationCreate2(
			@RequestBody List<Map<String, Object>> WorkOrderNonOperationList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderNonOperationVo workOrderNonOperationVo = new WorkOrderNonOperationVo();
		try {
			int sequence = 1;
			workOrderNonOperationVo.setWorkOrdNo(WorkOrderNonOperationList.get(0).get("workOrdNo").toString());
			workOrderNonOperationVo.setWorkOrdSeq(WorkOrderNonOperationList.get(0).get("workOrdSeq").toString());
			workOrderNonOperationVo.setMiddlePrcssCd(WorkOrderNonOperationList.get(0).get("middlePrcssCd").toString());
			workOrderNonOperationVo.setMinorPrcssCd(WorkOrderNonOperationList.get(0).get("minorPrcssCd").toString());
			for (Map<String, Object> m : WorkOrderNonOperationList) {
				if (sequence == 1) {
					workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
				}
				if (m.get("noGubun").toString() == "") {
					jsonData.put("result", "ok");
					return jsonData;
				}
				workOrderNonOperationVo.setNoSeq(Integer.toString(sequence));
				workOrderNonOperationVo.setNoGubun(m.get("noGubun").toString());
				workOrderNonOperationVo.setNoReason(m.get("noReason").toString());
				workOrderNonOperationVo.setNoStartTime(m.get("noStartTime").toString());
				workOrderNonOperationVo.setNoEndTime(m.get("noEndTime").toString());
				workOrderNonOperationVo.setNoStartDate(m.get("noStartDate").toString());
				workOrderNonOperationVo.setNoEndDate(m.get("noEndDate").toString());
				workOrderNonOperationVo.setNoTime(m.get("noTime").toString());
				workOrderNonOperationVo.setRegId(Utils.getUserId().toString());

				workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
				sequence++;
			}
			
			//작업지시서 상태값 수정
			workOrderVo.setWorkOrdNo(workOrderNonOperationVo.getWorkOrdNo());
			workOrderVo.setWorkStatusCd("NS");
			workOrderService.update(workOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//비가동 삭제
	@RequestMapping(value = "/po/workOrderNonOperationDelete2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationDelete2(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	// 작업지시 불량 등록
	@RequestMapping(value = "/po/workOrdInsertQty2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdInsertQty2(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작지 불량수량 입력: " + workOrderPrcssVo);
		try {
			//작업지시 총 불량수정
			workOrderPrcssVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(workOrdList.get(0).get("workOrdSeq").toString()));
			workOrderPrcssVo.setMiddlePrcssCd(workOrdList.get(0).get("middlePrcssCd").toString());
			workOrderPrcssVo.setMinorPrcssCd(workOrdList.get(0).get("minorPrcssCd").toString());
			
			workOrderPrcssVo.setFairQty(workOrdList.get(0).get("fairQty").toString());
			workOrderPrcssVo.setFaultyQty(workOrdList.get(0).get("faultyQtySum").toString());
			workOrderPrcssService.updateQtybong(workOrderPrcssVo);
			
			for(Map<String, Object> m :workOrdList) {
				
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
				workOrderFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				workOrderFaultyTypeVo.setFaultyTypeSeq("0");
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyQty").toString());
				workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
				workOrderFaultyTypeVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
				
				logger.info("vo:"+workOrderFaultyTypeVo);
				logger.info("list size:"+workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size());
				//작업지시 lotNo별 불량유형이 있을 경우 -> 수정
				if(workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size()!=0) {
					workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
					workOrderFaultyTypeService.update(workOrderFaultyTypeVo);
				  
				}else {
					//작업지시 lotNo별 불량유형이 없을 경우 -> 등록
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo); 
				}
			}
			
			workOrderFaultyTypeVo.setFaultyTypeCd("000026");
			int faultyTypeSumQty = workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo);
			jsonData.put("faultyTypeSumQty", faultyTypeSumQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 자재투입
	@RequestMapping(value = "/po/matrlBarcodeNoScan2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScan2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
			matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
			matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
			matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
			matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
			matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			matrlVo.setItemSeq(workOrderMatrlVo.getBarcodeNo().substring(0,6));
			matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
			matrlVo.setTotalConsumpt(Float.parseFloat("0.00"));
			matrlVo.setRegId(Utils.getUserId());
			workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	/*
	 * //불량등록 조회
	 * 
	 * @RequestMapping(value = "/po/workOrderFaultyList", method =
	 * RequestMethod.GET) public @ResponseBody Map<String, Object>
	 * workOrderFaultyList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws
	 * Exception { Map<String, Object> jsonData = new HashMap<String, Object>();
	 * logger.info("불량등록 조회: " + workOrderFaultyTypeVo); try {
	 * List<WorkOrderFaultyTypeVo> list =
	 * workOrderFaultyTypeService.workOrderFaultyList(workOrderFaultyTypeVo);
	 * jsonData.put("data", list); jsonData.put("result", "ok"); } catch (Exception
	 * e) { e.printStackTrace(); jsonData.put("result", "error");
	 * jsonData.put("message", Utils.getErrorMessage()); }
	 * 
	 * return jsonData; }
	 */
	//이전 자재 조회
	@RequestMapping(value = "po/stockPaymentAdmBarcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmBarcodeList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이전 자재 조회: "+stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if(stockPaymentAdmVo.getLocationCd()!=null && !stockPaymentAdmVo.getLocationCd().equals("")) {
				list =  stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if(list==null || list.size()==0) {
					list = new ArrayList<StockPaymentAdmVo>();
				}
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
}