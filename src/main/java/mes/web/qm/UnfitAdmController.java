package mes.web.qm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.time.DateUtils;
import org.apache.poi.util.Units;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.po.WorkOrderAdmVo;
import mes.domain.qm.UnfitAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.po.WorkOrderAdmService;
import mes.service.qm.UnfitAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;


@Controller
public class UnfitAdmController {
	private static final Logger logger = LoggerFactory.getLogger(UnfitAdmController.class);
	
	@Inject
	private UnfitAdmService unfitAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private LocationAdmService locationAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private WorkOrderAdmService workOrderAdmService;
	
	
	//부적합관리대장(레이저) 페이지
	@RequestMapping(value = "/qmsc0170")
	public String qmsc0170(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0170";
	}
	
	//부적합관리대장조회(레이저) 페이지
	@RequestMapping(value = "/qmsc0260")
	public String qmsc0260(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0260";
	}
	
	//부적합관리대장(봉제) 페이지
	@RequestMapping(value = "/qmsc0250")
	public String qmsc0250(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0250";
	}

	//부적합관리대장(정밀가공) 페이지
	@RequestMapping(value = "/qmsc0360")
	public String qmsc0360(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0360";
	}
	
	//부적합관리대장조회(봉제) 페이지
	@RequestMapping(value = "/qmsc0270")
	public String qmsc0270(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0270";
	}
	
	//부적합관리대장조회(정밀가공) 페이지
	@RequestMapping(value = "/qmsc0370")
	public String qmsc0370(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0370";
	}
	
	//부적합관리대장(수입) 목록조회
	@RequestMapping(value = "qm/unfitAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(수입) 목록조회 : " + unfitAdmVo);
		try {
			
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			logger.info("gubun:"+unfitAdmVo.getUnfitGubun());
			if(unfitAdmVo.getUnfitGubun().equals("001")) {
				list = unfitAdmService.unfitInspectAdmList(unfitAdmVo);
			}else if(unfitAdmVo.getUnfitGubun().equals("002")){
				list = unfitAdmService.unfitPrcssAdmList(unfitAdmVo);
			}else if(unfitAdmVo.getUnfitGubun().equals("003")){
				list = unfitAdmService.unfitCompleteAdmList(unfitAdmVo);
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
		
	
	//부적합관리대장(수입) 목록조회
	@RequestMapping(value = "qm/unfitInspectAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitInspectAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(수입) 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> unfitInspectAdmList = unfitAdmService.unfitInspectAdmList(unfitAdmVo);
			jsonData.put("data", unfitInspectAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(공정) 목록조회
	@RequestMapping(value = "qm/unfitPrcssAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitPrcssAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(공정) 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> unfitPrcssAdmList = unfitAdmService.unfitPrcssAdmList(unfitAdmVo);
			jsonData.put("data", unfitPrcssAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(출하) 목록조회
	@RequestMapping(value = "qm/unfitCompleteAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitCompleteAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(출하) 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> unfitCompleteAdmList = unfitAdmService.unfitCompleteAdmList(unfitAdmVo);
			jsonData.put("data", unfitCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(레이저) 등록, 수정
	@RequestMapping(value = "qm/unfitAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitAdmCreate(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(레이저) 등록, 수정 : " + unfitAdmVo);
		try {
			if (unfitAdmService.unfitAdmCheck(unfitAdmVo) == 0) {//데이터가 없으면 등록
				//부적합번호(PK) 구하기
				String unfitToday = DateUtil.getToday("YYYYMMdd");
				unfitAdmVo.setUnfitToday(unfitToday);
				String unfitNo = unfitAdmService.getUnfitNo(unfitAdmVo);
				unfitAdmVo.setUnfitNo(unfitToday + "-" + unfitNo);
				
				unfitAdmVo.setRegId(Utils.getUserId());
				unfitAdmService.unfitAdmCreate(unfitAdmVo);
				jsonData.put("addEditCheck", "등록");
			} else {//데이터가 있으면 수정
				unfitAdmVo.setUpdId(Utils.getUserId());
				unfitAdmService.unfitAdmUpdate(unfitAdmVo);
				jsonData.put("addEditCheck", "수정");
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//불량유형 합계(공정)
	@RequestMapping(value = "qm/faultyTypeTotalList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeTotalList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량유형 합계(공정) : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if(unfitAdmVo.getUnfitGubun().equals("001")) {
				list = unfitAdmService.faultyTypeTotalList2(unfitAdmVo);
			}else if(unfitAdmVo.getUnfitGubun().equals("002")) {
				list = unfitAdmService.faultyTypeTotalList(unfitAdmVo);
			}else {
				list = unfitAdmService.faultyTypeTotalList3(unfitAdmVo);
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
	
	//불량유형 합계(수입)
	@RequestMapping(value = "qm/faultyTypeTotalList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeTotalList2(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량유형 합계(수입) : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.faultyTypeTotalList2(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//불량유형 합계(출하)
	@RequestMapping(value = "qm/faultyTypeTotalList3", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeTotalList3(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량유형 합계(출하) : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.faultyTypeTotalList3(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//불량cavity
	@RequestMapping(value = "qm/faultyTypeCavityList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeCavityList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량cavity : " + unfitAdmVo);
		try {
			
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if(unfitAdmVo.getFaultyCd()!=null && !unfitAdmVo.getFaultyCd().equals("")) {
				list = unfitAdmService.faultyTypeCavityList(unfitAdmVo);
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
	
	
	//부적합관리대장(봉제) 결과 등록
	@RequestMapping(value = "qm/unfitResultCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultCreate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
		logger.info("부적합관리대장(봉제) 결과 등록, 수정 : " );
		try {					
			
			
			for(Map<String, Object> m :list) {
				if(m.get("unfitNo")==null || m.get("unfitNo").toString().equals("")) {
					unfitAdmVo.setUnfitToday(DateUtil.getCurrentYyyymmdd());
					String unfitNo = unfitAdmService.getUnfitNo(unfitAdmVo);
					unfitAdmVo.setUnfitNo(DateUtil.getCurrentYyyymmdd() + "-" + unfitNo);
					unfitAdmVo.setUnfitLot(m.get("unfitLot").toString());
					
					unfitAdmVo.setUnfitGubun(m.get("unfitGubun").toString());
					unfitAdmVo.setFaultyCd(m.get("faultyCd").toString());
					unfitAdmVo.setApprovalYn(m.get("approvalYn").toString());
					unfitAdmVo.setUnfitProc(m.get("unfitProc").toString());
					unfitAdmVo.setUnfitFaultyDate(m.get("unfitFaultyDate").toString());
					unfitAdmVo.setUnfitFaultyChargr(m.get("unfitFaultyChargr").toString());
					unfitAdmVo.setUnfitPairCnt(m.get("unfitPairCnt").toString());
					unfitAdmVo.setUnfitFaultyCnt(m.get("unfitFaultyCnt").toString());
					unfitAdmVo.setUnfitDesc(m.get("unfitDesc").toString());
					
					unfitAdmVo.setRegId(Utils.getUserId());
					unfitAdmService.unfitAdmCreate(unfitAdmVo);
					
					unfitAdmVo.setRegId(Utils.getUserId());
					unfitAdmService.unfitResultCreate(unfitAdmVo);
					
					jsonData.put("addEditCheck", "등록");		
				}else {
					
					unfitAdmVo.setUnfitNo(m.get("unfitNo").toString());
					unfitAdmVo.setUnfitLot(m.get("unfitLot").toString());
					unfitAdmVo.setUnfitProc(m.get("unfitProc").toString());
					unfitAdmVo.setUnfitFaultyDate(m.get("unfitFaultyDate").toString());
					unfitAdmVo.setUnfitFaultyChargr(m.get("unfitFaultyChargr").toString());
					unfitAdmVo.setUnfitPairCnt(m.get("unfitPairCnt").toString());
					unfitAdmVo.setUnfitFaultyCnt(m.get("unfitFaultyCnt").toString());
					unfitAdmVo.setUnfitDesc(m.get("unfitDesc").toString());
					
					if(unfitAdmVo.getUnfitResultNo()==null || unfitAdmVo.getUnfitResultNo().equals("")) {
						unfitAdmVo.setRegId(Utils.getUserId());
						unfitAdmService.unfitResultCreate(unfitAdmVo);
						jsonData.put("addEditCheck", "등록");		
					}else {
						unfitAdmVo.setUnfitResultNo(m.get("unfitResultNo").toString());
						unfitAdmVo.setUpdId(Utils.getUserId());
						unfitAdmService.unfitResultUpdate(unfitAdmVo);
						jsonData.put("addEditCheck", "수정");
					}
				}
				
				//승인판정
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				LocationAdmVo locationAdmVo = new LocationAdmVo();
				
				StockPaymentAdmVo stockPaymentAdmInsVo = new StockPaymentAdmVo();
				stockPaymentAdmInsVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
				stockPaymentAdmInsVo.setSpType(m.get("spType").toString());
				stockPaymentAdmInsVo.setSpCd(m.get("spCd").toString());
				stockPaymentAdmInsVo.setSpDate(m.get("spDate").toString());
				stockPaymentAdmInsVo.setBarcodeNo(unfitAdmVo.getUnfitLot());
				stockPaymentAdmInsVo.setSourceNo(unfitAdmVo.getUnfitLot());
				locationAdmVo.setMainGubun(m.get("mainGubun").toString());
				stockPaymentAdmInsVo.setRegId(Utils.getUserId());
				
				//부적합 창고 출고
				stockPaymentAdmInsVo.setSpGubun("002");
				stockPaymentAdmInsVo.setSpSubGubun("이동출고");
				stockPaymentAdmInsVo.setSpQty(unfitAdmVo.getUnfitFaultyCnt());
				locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"005":"009");	
				LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmInsVo.setLocationCd(list0.getLocCd());
				stockPaymentAdmInsVo.setLocationNo(list0.getLocNo());
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
				
				//반품 창고 입고
				if(unfitAdmVo.getUnfitProc().equals("002")) {
					stockPaymentAdmInsVo.setSpGubun("001");
					stockPaymentAdmInsVo.setSpSubGubun("이동입고");
					stockPaymentAdmInsVo.setSpQty(unfitAdmVo.getUnfitFaultyCnt());
					locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"010":"011");	
					LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
					stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
					stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
				}
				unfitAdmService.unfitApprovalYnUpdate(unfitAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(봉제) 결과 수정
	@RequestMapping(value = "qm/unfitResultUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultUpdate(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(봉제) 결과 등록, 수정 : " + unfitAdmVo);
		try {				
				unfitAdmVo.setUpdId(Utils.getUserId());
				unfitAdmService.unfitResultUpdate(unfitAdmVo);
				jsonData.put("addEditCheck", "수정");
				jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(봉제) 결과 삭제
	@RequestMapping(value = "qm/unfitResultDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultDel(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(봉제) 결과 삭제 : " + unfitAdmVo);
		try {				
				unfitAdmService.unfitResultDel(unfitAdmVo);
				jsonData.put("addEditCheck", "수정");
				jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//부적합관리대장 조회
	@RequestMapping(value = "qm/unfitResultList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitResultList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 조회: "+ unfitAdmVo);
		try {
			
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			list = unfitAdmService.unfitResultList(unfitAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	

	//부적합관리대장 상세조회
	@RequestMapping(value = "/qm/unfitResultRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitResultRead(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 상세조회: "+ unfitAdmVo);
		try {
			unfitAdmVo = unfitAdmService.unfitResultRead(unfitAdmVo);
			jsonData.put("data", unfitAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//부적합관리대장 승인처리(수입/출하)
	@RequestMapping(value = "/qm/unfitResultAppr", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultAppr(UnfitAdmVo unfitAdmVo, StockPaymentAdmVo stockPaymentAdmVo, InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 승인처리: "+ unfitAdmVo);
		try {
			LocationAdmVo locationAdmVo = new LocationAdmVo();
			
			int fairQty = Integer.parseInt(unfitAdmVo.getFairQty());
			int faultyQty = Integer.parseInt(unfitAdmVo.getFaultyQty());
			int totalQty = fairQty + faultyQty;
			logger.info("fairQty:"+fairQty);
			logger.info("faultyQty:"+faultyQty);
			logger.info("totalQty:"+totalQty);
			
			StockPaymentAdmVo stockPaymentAdmInsVo = new StockPaymentAdmVo();
			stockPaymentAdmInsVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
			stockPaymentAdmInsVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmInsVo.setSpCd(stockPaymentAdmVo.getSpCd());
			stockPaymentAdmInsVo.setSpDate(stockPaymentAdmVo.getSpDate());
			stockPaymentAdmInsVo.setBarcodeNo(unfitAdmVo.getLotNo());
			stockPaymentAdmInsVo.setSourceNo(unfitAdmVo.getLotNo());
			locationAdmVo.setMainGubun(unfitAdmVo.getMainGubun());
			stockPaymentAdmInsVo.setRegId(Utils.getUserId());
			
			//부적합 창고 출고
			if(totalQty>0) {
				stockPaymentAdmInsVo.setSpGubun("002");
				stockPaymentAdmInsVo.setSpSubGubun("이동출고");
				stockPaymentAdmInsVo.setSpQty(Integer.toString(totalQty));
				locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"005":"009");	
				LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmInsVo.setLocationCd(list0.getLocCd());
				stockPaymentAdmInsVo.setLocationNo(list0.getLocNo());
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			}
			
			//자재/제품 창고 입고
			if(fairQty>0) {
				stockPaymentAdmInsVo.setSpGubun("001");
				stockPaymentAdmInsVo.setSpSubGubun("이동입고");
				stockPaymentAdmInsVo.setSpQty(Integer.toString(fairQty));
				
				if(stockPaymentAdmVo.getSpType()!=null && stockPaymentAdmVo.getSpType().equals("004")) {
					stockPaymentAdmInsVo.setLocationCd(inOutWhsAdmService.preInOutWhsAdmList(inOutWhsAdmVo).get(0).getLocationCd());
					stockPaymentAdmInsVo.setLocationNo(inOutWhsAdmService.preInOutWhsAdmList(inOutWhsAdmVo).get(0).getLocationCd());
				}else {
					//제품일경우
					locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"002":"007");	
					LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
					stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
				}
				
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			}
			
			//폐기 창고 입고
			if(faultyQty>0) {
				if(unfitAdmVo.getUnfitProc().equals("003")) {
					stockPaymentAdmInsVo.setSpGubun("001");
					stockPaymentAdmInsVo.setSpSubGubun("이동입고");
					stockPaymentAdmInsVo.setSpQty(Integer.toString(faultyQty));
					locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"010":"011");	
					LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
					stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
					stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
				}
			}
			
			unfitAdmService.unfitApprovalYnUpdate(unfitAdmVo);
			
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
		
	
	//부적합관리대장 승인처리(공정)
	@RequestMapping(value = "/qm/unfitResultPrcssAppr", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultPrcssAppr(UnfitAdmVo unfitAdmVo, StockPaymentAdmVo stockPaymentAdmVo, InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(공정) 승인처리: "+ unfitAdmVo);
		try {
			LocationAdmVo locationAdmVo = new LocationAdmVo();
			
			int fairQty = Integer.parseInt(unfitAdmVo.getFairQty());
			int faultyQty = Integer.parseInt(unfitAdmVo.getFaultyQty());
			int totalQty = fairQty + faultyQty;
			logger.info("fairQty:"+fairQty);
			logger.info("faultyQty:"+faultyQty);
			logger.info("totalQty:"+totalQty);
			
			StockPaymentAdmVo stockPaymentAdmInsVo = new StockPaymentAdmVo();
			stockPaymentAdmInsVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
			stockPaymentAdmInsVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmInsVo.setSpCd(stockPaymentAdmVo.getSpCd());
			stockPaymentAdmInsVo.setSpDate(stockPaymentAdmVo.getSpDate());
			stockPaymentAdmInsVo.setBarcodeNo(unfitAdmVo.getLotNo());
			stockPaymentAdmInsVo.setSourceNo(unfitAdmVo.getLotNo());
			locationAdmVo.setMainGubun(unfitAdmVo.getMainGubun());
			stockPaymentAdmInsVo.setRegId(Utils.getUserId());
			
			//부적합 창고 출고
			if(totalQty>0) {
				stockPaymentAdmInsVo.setSpGubun("002");
				stockPaymentAdmInsVo.setSpSubGubun("이동출고");
				stockPaymentAdmInsVo.setSpQty(Integer.toString(totalQty));
				locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"005":"009");	
				LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmInsVo.setLocationCd(list0.getLocCd());
				stockPaymentAdmInsVo.setLocationNo(list0.getLocNo());
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			}
			
			//양품
			if(fairQty>0) {
				//생산실적테이블 upd
				WorkOrderAdmVo workOrderAdmVo = new WorkOrderAdmVo();
				workOrderAdmVo.setWorkOrdNo(unfitAdmVo.getLotNo());
				workOrderAdmVo.setFairQty(unfitAdmVo.getFairQty());
				workOrderAdmService.workOrderAdmQtyUpd(workOrderAdmVo);
				
				//수불테이블
				stockPaymentAdmInsVo.setSpGubun("001");
				stockPaymentAdmInsVo.setSpSubGubun("이동입고");
				stockPaymentAdmInsVo.setSpQty(Integer.toString(fairQty));
				locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"016":"017");	
				LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
				stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			}
			
			//불량 
			if(faultyQty>0) {
				if(unfitAdmVo.getUnfitProc().equals("003")) {	//폐기
					stockPaymentAdmInsVo.setSpGubun("001");
					stockPaymentAdmInsVo.setSpSubGubun("이동입고");
					stockPaymentAdmInsVo.setSpQty(Integer.toString(faultyQty));
					locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"010":"011");	
					LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
					stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
					stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
					
				}else if(unfitAdmVo.getUnfitProc().equals("004")) {	//재작업
					stockPaymentAdmInsVo.setSpGubun("001");
					stockPaymentAdmInsVo.setSpSubGubun("이동입고");
					stockPaymentAdmInsVo.setSpQty(Integer.toString(faultyQty));
					locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"012":"013");	
					LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
					stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
					stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
				}
			}
			
			unfitAdmService.unfitApprovalYnUpdate(unfitAdmVo);
			
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//부적합관리대장 승인처리(공정)
	@RequestMapping(value = "/qm/unfitResultPrcssAppr2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultPrcssAppr2(UnfitAdmVo unfitAdmVo, StockPaymentAdmVo stockPaymentAdmVo, InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(공정) 승인처리: "+ unfitAdmVo);
		try {
			LocationAdmVo locationAdmVo = new LocationAdmVo();
			
			int fairQty = Integer.parseInt(unfitAdmVo.getFairQty());
			int faultyQty = Integer.parseInt(unfitAdmVo.getFaultyQty());
			int totalQty = fairQty + faultyQty;
			logger.info("fairQty:"+fairQty);
			logger.info("faultyQty:"+faultyQty);
			logger.info("totalQty:"+totalQty);
			
			StockPaymentAdmVo stockPaymentAdmInsVo = new StockPaymentAdmVo();
			stockPaymentAdmInsVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
			stockPaymentAdmInsVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmInsVo.setSpCd(stockPaymentAdmVo.getSpCd());
			stockPaymentAdmInsVo.setSpDate(stockPaymentAdmVo.getSpDate());
			stockPaymentAdmInsVo.setBarcodeNo(unfitAdmVo.getLotNo());
			stockPaymentAdmInsVo.setSourceNo(unfitAdmVo.getLotNo());
			locationAdmVo.setMainGubun(unfitAdmVo.getMainGubun());
			stockPaymentAdmInsVo.setRegId(Utils.getUserId());
			
			//부적합 창고 출고
			if(totalQty>0) {
				stockPaymentAdmInsVo.setSpGubun("002");
				stockPaymentAdmInsVo.setSpSubGubun("이동출고");
				stockPaymentAdmInsVo.setSpQty(Integer.toString(totalQty));
				locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"005":"009");	
				LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmInsVo.setLocationCd(list0.getLocCd());
				stockPaymentAdmInsVo.setLocationNo(list0.getLocNo());
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			}
			
			//양품
			if(fairQty>0) {
				//생산실적테이블 upd
				WorkOrderAdmVo workOrderAdmVo = new WorkOrderAdmVo();
				workOrderAdmVo.setWorkOrdNo(unfitAdmVo.getLotNo());
				workOrderAdmVo.setFairQty(unfitAdmVo.getFairQty());
				workOrderAdmService.workOrderAdmQtyUpd(workOrderAdmVo);
				
				//수불테이블
				stockPaymentAdmInsVo.setSpGubun("001");
				stockPaymentAdmInsVo.setSpSubGubun("이동입고");
				stockPaymentAdmInsVo.setSpQty(Integer.toString(fairQty));
				locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"002":"007");	
				LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
				stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
				stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			}
			
			//불량 
			if(faultyQty>0) {
				if(unfitAdmVo.getUnfitProc().equals("003")) {	//폐기
					stockPaymentAdmInsVo.setSpGubun("001");
					stockPaymentAdmInsVo.setSpSubGubun("이동입고");
					stockPaymentAdmInsVo.setSpQty(Integer.toString(faultyQty));
					locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"010":"011");	
					LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmInsVo.setLocationCd(list1.getLocCd());
					stockPaymentAdmInsVo.setLocationNo(list1.getLocNo());
					stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
				}
			}
			
			unfitAdmService.unfitApprovalYnUpdate(unfitAdmVo);
			
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
		
	
}
