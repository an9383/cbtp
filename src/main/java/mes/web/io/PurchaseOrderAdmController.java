package mes.web.io;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.opc.PackagingURIHelper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.PurchaseOrderAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PurchaseOrderAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	@Inject
	private PurchaseOrderAdmService purchaseOrderAdmService;

	//발주관리(사출) 메인
	@RequestMapping(value = "/iosc0010", method = RequestMethod.GET)
	public String iosc0010(Locale locale, Model model) throws Exception {
		logger.info("발주관리(사출) 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("051"); // 입고구분
		List<CommonCodeAdmVo> receiptGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("receiptGubun", receiptGubunList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0010";
	}
	
	//발주관리(봉제) 메인
	@RequestMapping(value = "/iosc0300", method = RequestMethod.GET)
	public String iosc0300(Locale locale, Model model) throws Exception {
		logger.info("발주관리(봉제) 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("051"); // 입고구분
		List<CommonCodeAdmVo> receiptGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("receiptGubun", receiptGubunList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0300";
	}
	
	//발주관리(정밀가공) 메인
	@RequestMapping(value = "/iosc0410", method = RequestMethod.GET)
	public String iosc0410(Locale locale, Model model) throws Exception {
		logger.info("발주관리(정밀가공) 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("051"); // 입고구분
		List<CommonCodeAdmVo> receiptGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("receiptGubun", receiptGubunList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0410";
	}
	
	// 발주관리 메인(사출)
	@RequestMapping(value = "/iosc0190", method = RequestMethod.GET)
	public String iosc0190(Locale locale, Model model) throws Exception {
		logger.info("영업등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		//품목구분 공통코드
		commonCodeVo.setBaseGroupCd("120");
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList );
		
		//구분 공통코드
		commonCodeVo.setBaseGroupCd("112");
		commonCodeVo.setUseYn("001");
		itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemGubunList );
		
		commonCodeVo.setBaseGroupCd("051"); // 입고구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> receiptGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("receiptGubun", receiptGubunList);
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0190";
	}
	
	// 발주관리 메인(봉제)
	@RequestMapping(value = "/iosc0250", method = RequestMethod.GET)
	public String iosc0250(Locale locale, Model model) throws Exception {
		logger.info("영업등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		//품목구분 공통코드
		commonCodeVo.setBaseGroupCd("120");
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList );
		
		//구분 공통코드
		commonCodeVo.setBaseGroupCd("112");
		commonCodeVo.setUseYn("001");
		itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemGubunList );
		
		commonCodeVo.setBaseGroupCd("051"); // 입고구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> receiptGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("receiptGubun", receiptGubunList);
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0250";
	}
	
	// 발주관리 메인(정밀가공)
	@RequestMapping(value = "/iosc0420", method = RequestMethod.GET)
	public String iosc0420(Locale locale, Model model) throws Exception {
		logger.info("영업등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		//품목구분 공통코드
		commonCodeVo.setBaseGroupCd("120");
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList );
		
		//구분 공통코드
		commonCodeVo.setBaseGroupCd("112");
		commonCodeVo.setUseYn("001");
		itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemGubunList );
		
		commonCodeVo.setBaseGroupCd("051"); // 입고구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> receiptGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("receiptGubun", receiptGubunList);
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0420";
	}
	
	// 발주현황
	@RequestMapping(value = "/iosc0020", method = RequestMethod.GET)
	public String iosc0020(Locale locale, Model model) throws Exception {
		logger.info("발주현황 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("001"); // 사용여부
		List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("useYn", useYnList);
		
		return "io/iosc0020";
	}
	
	//발주대비미입고현황(레이저) 메인
	@RequestMapping(value = "/iosc0060", method = RequestMethod.GET)
	public String iosc0060(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("153");
		List<CommonCodeAdmVo> poStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("poStatus", poStatusList);
		
		return "io/iosc0060";
	}
	
	//발주대비미입고현황(후가공) 메인
	@RequestMapping(value = "/iosc0061", method = RequestMethod.GET)
	public String iosc0061(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("153");
		List<CommonCodeAdmVo> poStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("poStatus", poStatusList);
		
		return "io/iosc0061";
	}
	
	//발주대비미입고현황(정밀가공) 메인
	@RequestMapping(value = "/iosc0470", method = RequestMethod.GET)
	public String iosc0470(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("153");
		List<CommonCodeAdmVo> poStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("poStatus", poStatusList);
		
		return "io/iosc0470";
	}

	//발주관리 목록조회
	@RequestMapping(value="io/purchaseOrderList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주관리 목록조회");
			List<PurchaseOrderAdmVo> purchaseOrderList = purchaseOrderAdmService.purchaseOrderList(purchaseOrderAdmVo);
			logger.info("발주관리 목록조회 끝");
			logger.info("vo2:"+purchaseOrderList);
			jsonData.put("result", "ok");
			jsonData.put("data", purchaseOrderList);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주관리 상세조회
	@RequestMapping(value="io/purchaseOrderRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderRead(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			List<PurchaseOrderAdmVo> list = new ArrayList<PurchaseOrderAdmVo>();
			
			if(purchaseOrderAdmVo.getMrpNo() !=null && !purchaseOrderAdmVo.getMrpNo().equals("")) {
				list = purchaseOrderAdmService.purchaseOrderRead(purchaseOrderAdmVo);
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//발주관리 상세조회
	@RequestMapping(value="io/purchaseOrderDetailRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderDetailRead(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<PurchaseOrderAdmVo> list;
			list = new ArrayList<PurchaseOrderAdmVo>(); 
			
			logger.info("여기?");
			list = purchaseOrderAdmService.purchaseOrderDetailRead(purchaseOrderAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주상세 목록조회
	@RequestMapping(value="io/purchaseOrderDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderDtlList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주관리 목록조회:"+purchaseOrderAdmVo);
			if(purchaseOrderAdmVo.getPoNo()==null || purchaseOrderAdmVo.getPoNo().equals("")) {
				List<PurchaseOrderAdmVo> list = new ArrayList<PurchaseOrderAdmVo>();
				jsonData.put("data", list);
			}else {
				List<PurchaseOrderAdmVo> purchaseOrderDtlList = purchaseOrderAdmService.purchaseOrderDtlList(purchaseOrderAdmVo);
				jsonData.put("data", purchaseOrderDtlList);
			}
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}


	/*
	 * //부품정보 등록
	 * 
	 * @RequestMapping(value="io/purchaseOrderDtlCreate", method =
	 * RequestMethod.POST) public @ResponseBody Map<String, Object>
	 * purchaseOrderDtlCreate(@RequestBody List<Map<String, Object>>
	 * purchaseOrderDtlList) throws Exception{ PurchaseOrderAdmVo purchaseOrderAdmVo
	 * = new PurchaseOrderAdmVo(); Map<String , Object> jsonData = new
	 * HashMap<String, Object>(); try {
	 * purchaseOrderAdmVo.setRegId(Utils.getUserId());
	 * purchaseOrderAdmVo.setPoNo(purchaseOrderDtlList.get(0).get("poNo").toString()
	 * ); purchaseOrderAdmService.purchaseOrderDtlDelete(purchaseOrderAdmVo);
	 * 
	 * for(Map<String, Object> m :purchaseOrderDtlList) {
	 * if(m.get("partCd").toString()==null || m.get("partCd").toString().equals(""))
	 * { jsonData.put("result", "ok"); }else {
	 * 
	 * 
	 * int poSeq = purchaseOrderAdmService.getPoSeq(purchaseOrderAdmVo);
	 * 
	 * purchaseOrderAdmVo.setPartCd(m.get("partCd").toString());
	 * purchaseOrderAdmVo.setPartRev(m.get("partRev").toString());
	 * purchaseOrderAdmVo.setInspectYn(m.get("inspectYn").toString());
	 * purchaseOrderAdmVo.setPartQty(Integer.parseInt(m.get("partQty").toString()));
	 * purchaseOrderAdmVo.setPartUnitCost(Integer.parseInt(m.get("partUnitCost").
	 * toString()));
	 * purchaseOrderAdmVo.setPartAmt(Integer.parseInt(m.get("partAmt").toString()));
	 * purchaseOrderAdmVo.setDlvDate(m.get("dlvDate").toString());
	 * 
	 * 
	 * purchaseOrderAdmVo.setPoStatus("001"); purchaseOrderAdmVo.setPoSeq(poSeq);
	 * purchaseOrderAdmService.purchaseOrderDtlCreate(purchaseOrderAdmVo); } }
	 * 
	 * jsonData.put("result", "ok"); } catch (Exception e) { jsonData.put("result",
	 * "error"); jsonData.put("message", Utils.getErrorMessage()); } return
	 * jsonData; }
	 */
	
	
	//발주관리 등록
	@RequestMapping(value="io/purchaseOrderAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmCreate(@RequestBody List<Map<String, Object>> purchaseOrderDtlList) throws Exception{
		PurchaseOrderAdmVo purchaseOrderAdmVo = new PurchaseOrderAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주정보 등록 ");
			
			purchaseOrderAdmVo.setPoNo(purchaseOrderDtlList.get(0).get("poNo").toString());
			
			//발주번호 중복확인
			if(purchaseOrderAdmService.overlapPoNo(purchaseOrderAdmVo)==0) {
				purchaseOrderAdmVo.setDealCorpCd(purchaseOrderDtlList.get(0).get("dealCorpCd").toString());
				purchaseOrderAdmVo.setMainChargr(purchaseOrderDtlList.get(0).get("mainChargr").toString());
				purchaseOrderAdmVo.setPoDate(purchaseOrderDtlList.get(0).get("poDate").toString());
				purchaseOrderAdmVo.setReceiptGubun(purchaseOrderDtlList.get(0).get("receiptGubun").toString());
				purchaseOrderAdmVo.setPoDesc(purchaseOrderDtlList.get(0).get("poDesc").toString());
				purchaseOrderAdmVo.setRegId(Utils.getUserId());
				
				purchaseOrderAdmService.purchaseOrderAdmCreate(purchaseOrderAdmVo);
				
				for(Map<String, Object> m :purchaseOrderDtlList) {
					
					purchaseOrderAdmVo.setItemSeq(m.get("itemSeq").toString());
					purchaseOrderAdmVo.setOrdQty(m.get("ordQty").toString());
					//purchaseOrderAdmVo.setOrdUnitCost(m.get("ordUnitCost").toString());
					purchaseOrderAdmVo.setDlvDate(m.get("dlvDate").toString());
					
					//소요량전개 후 등록일 경우
					if(m.get("mrpNo").toString()!=null && !m.get("mrpNo").toString().equals("")) {	
						purchaseOrderAdmVo.setMrpNo(m.get("mrpNo").toString());
					    
					    //발주예정수량과 발주수량 비교 -> 발주예정수량 <= 발주수량 : Y / 발주예정수량 > 발주수량 : N
					    //Y인 경우 같은 (소요량,수주상세번호,코드)발주항목에 Y로 변경
					    PurchaseOrderAdmVo compareVo = purchaseOrderAdmService.compareOrderQty(purchaseOrderAdmVo);
					    
					    float ordPredQty = Float.parseFloat(compareVo.getOrdPredQty());		//발주예정수량
					    float ordTotalQty = Float.parseFloat(compareVo.getOrdQty());		//이전 총 발주수량
					    float ordQty = Float.parseFloat(purchaseOrderAdmVo.getOrdQty());	//현재 발주수량
					    
					    if(ordPredQty <=(ordTotalQty+ordQty)) {
					    	purchaseOrderAdmVo.setPoStatus("002");
					    	
					    	//발주예정수량<=발주수량 : Y로 변경
					    	purchaseOrderAdmService.poStatusYUpdate(purchaseOrderAdmVo);
					    }else {
					    	purchaseOrderAdmVo.setPoStatus("001");
					    }
					}
		
					logger.info("발주등록vo"+purchaseOrderAdmVo);
					purchaseOrderAdmVo.setPoSeq(purchaseOrderAdmService.getPoSeq(purchaseOrderAdmVo).toString());
					purchaseOrderAdmService.purchaseOrderDtlCreate(purchaseOrderAdmVo);
					purchaseOrderAdmService.ordAmtUpdate(purchaseOrderAdmVo);
				}
				
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "fail");
				jsonData.put("message", "동일한 발주번호가 등록되어있습니다. 새로고침 버튼을 클릭해주세요.");
			}
			
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
		
	//발주관리 수정
	@RequestMapping(value="io/purchaseOrderAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주관리 수정");
			purchaseOrderAdmVo.setUpdId(Utils.getUserId());
			purchaseOrderAdmService.purchaseOrderAdmUpdate(purchaseOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//발주상세 수정
	@RequestMapping(value="io/purchaseOrderDtlUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dlvChangeDateUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주 수정");
			purchaseOrderAdmVo.setUpdId(Utils.getUserId());
			purchaseOrderAdmService.purchaseOrderDtlUpdate(purchaseOrderAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//발주관리 삭제
	@RequestMapping(value="io/purchaseOrderDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDelete(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주관리 삭제");
			purchaseOrderAdmService.purchaseOrderDelete(purchaseOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//발주상세 삭제
	@RequestMapping(value="io/purchaseOrderDtlDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlDelete(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주상세 삭제");
			purchaseOrderAdmService.purchaseOrderDtlDelete(purchaseOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//발주번호 생성
	@RequestMapping(value="io/getPoNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getPoNo(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주관리 발주번호생성");
			String toDay = DateUtil.getToday("YYMMdd");
			purchaseOrderAdmVo.setToday(toDay);
			String poNoSeq = purchaseOrderAdmService.getPoNo(purchaseOrderAdmVo);
			String poNo = "P"+toDay+"-"+poNoSeq;
			logger.info(poNo);
			jsonData.put("result", "ok");
			jsonData.put("data", poNo);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//뱔주현황
	@RequestMapping(value="io/purchaseOrderStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderStatusList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주현황 : " + purchaseOrderAdmVo);
			
			List<PurchaseOrderAdmVo> purchaseOrderStatusList = purchaseOrderAdmService.purchaseOrderStatusList(purchaseOrderAdmVo);
			jsonData.put("data", purchaseOrderStatusList);
		
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//입고등록(봉제) 공급사 조회
	@RequestMapping(value="io/purchaseDealCorpList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseDealCorpList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		logger.info("입고등록(봉제) 공급사 조회 : " + purchaseOrderAdmVo);
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			List<PurchaseOrderAdmVo> purchaseDealCorpList = purchaseOrderAdmService.purchaseDealCorpList(purchaseOrderAdmVo);
			jsonData.put("data", purchaseDealCorpList);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//수입검사 관리대장 목록조회
	@RequestMapping(value="io/itemInspectMasterAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectMasterAdmList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("수입검사 관리대장 : " + purchaseOrderAdmVo);
			
			List<PurchaseOrderAdmVo> list = purchaseOrderAdmService.itemInspectMasterAdmList(purchaseOrderAdmVo);
			jsonData.put("data", list);
		
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//발주서 사출 출력 메인
	@RequestMapping(value = "/iosc0200", method = RequestMethod.GET)
	public String prcssCodeBomMain(Locale locale, Model model) throws Exception {
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "io/iosc0200";
	}
	
	//발주서 봉제 출력 메인
		@RequestMapping(value = "/iosc0310", method = RequestMethod.GET)
		public String prcssCodeBomMain2(Locale locale, Model model) throws Exception {
			try {
				model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
				model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
				model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
			} catch(Exception e) {
				e.printStackTrace();
			}
			return "io/iosc0310";
		}
	
	//뱔주서출력 목록조회
	@RequestMapping(value="io/purchaseOrderPrintList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderPrintList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주서출력 목록조회");
			List<PurchaseOrderAdmVo> purchaseOrderPrintList = purchaseOrderAdmService.purchaseOrderPrintList(purchaseOrderAdmVo);
			logger.info("list:"+purchaseOrderPrintList);
			jsonData.put("data", purchaseOrderPrintList);
		
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//뱔주서출력 목록조회2
	@RequestMapping(value="io/purchaseOrderPrintToList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderPrintToList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("****************발주서출력 목록조회**************" +purchaseOrderAdmVo);
			logger.info("poNo"+purchaseOrderAdmVo.getPoNo());
			List<PurchaseOrderAdmVo> purchaseOrderPrintToList = purchaseOrderAdmService.purchaseOrderPrintToList(purchaseOrderAdmVo);
			logger.info("list:"+purchaseOrderPrintToList);
			jsonData.put("data", purchaseOrderPrintToList);
		
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주서 출력 표1 목록 조회
	@RequestMapping(value="io/purchaseOrderPrintTableList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderPrintTableList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주서출력 표 목록조회");
			logger.info("poNo"+purchaseOrderAdmVo.getPoNo());
			List<PurchaseOrderAdmVo> purchaseOrderPrintTableList = purchaseOrderAdmService.purchaseOrderPrintTableList(purchaseOrderAdmVo);
			logger.info("list:"+purchaseOrderPrintTableList);
			jsonData.put("data", purchaseOrderPrintTableList);
		
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//발주서출력 상세조회
	@RequestMapping(value="io/purchaseOrderStatusRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderStatusRead(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주서출력 상세조회");
			PurchaseOrderAdmVo purchaseOrderStatusRead = purchaseOrderAdmService.purchaseOrderStatusRead(purchaseOrderAdmVo);
			logger.info("발주서출력 상세조회 제목Vo : " +purchaseOrderAdmVo.getTitle());
			jsonData.put("result", "ok");
			jsonData.put("data", purchaseOrderStatusRead);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//발주서출력 수정
	@RequestMapping(value="io/purchaseOrderPrintUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderPrintUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			purchaseOrderAdmService.purchaseOrderPrintUpdate(purchaseOrderAdmVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주서출력 수정
	@RequestMapping(value="io/purchaseOrderPrintWhetherUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderPrintWhetherUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo, HttpServletRequest request) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
//		logger.info("추가테이블 수정처리 >>>>>>..>>>>>>>..>>>>>...>>>>>...>>>>>>>: " + purchaseOrderAdmVo.getArrayData());
//		logger.info("출력 여부"+purchaseOrderAdmVo.getPrintWhether());
		logger.info("출력 여부"+purchaseOrderAdmVo);
		try {
//			JSONParser jsonParser = new JSONParser();
//			JSONObject jsonObj = new JSONObject();
//			JSONArray jsonArray = (JSONArray) jsonParser.parse(purchaseOrderAdmVo.getArrayData());
//			PurchaseOrderAdmVo purchaseOrderAdmVo1 = new PurchaseOrderAdmVo();
			
//			for(int i=0;i<jsonArray.size();i++){
//				jsonObj.put(i, jsonArray.get(i));
//				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
//				purchaseOrderAdmVo1.setPoNo(jsonObjDtl.get("poNo").toString());
//				purchaseOrderAdmVo1.setPrintWhether("Y");
//				logger.info("들어왔다.");
			purchaseOrderAdmVo.setUpdId(Utils.getUserId());
			purchaseOrderAdmService.purchaseOrderPrintWhetherUpdate(purchaseOrderAdmVo);
//			}
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//발주서출력 취소
	@RequestMapping(value="io/purchaseOrderPrintCancel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object>purchaseOrderPrintCancel(PurchaseOrderAdmVo purchaseOrderAdmVo, HttpServletRequest request) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("발주서 출력 취소 >>>>>>..>>>>>>>..>>>>>...>>>>>...>>>>>>>: " + purchaseOrderAdmVo.getArrayData());
		logger.info("출력 취소"+purchaseOrderAdmVo.getPrintWhether());
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(purchaseOrderAdmVo.getArrayData());
			PurchaseOrderAdmVo purchaseOrderAdmVo2 = new PurchaseOrderAdmVo();
			
			for(int i=0;i<jsonArray.size();i++){
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				purchaseOrderAdmVo2.setPoNo(jsonObjDtl.get("poNo").toString());
				purchaseOrderAdmVo2.setPrintWhether("N");
				purchaseOrderAdmVo2.setUpdId(Utils.getUserId());
				logger.info("들어왔다.");
				purchaseOrderAdmService.purchaseOrderPrintWhetherUpdate(purchaseOrderAdmVo2);
			}
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주마감
	@RequestMapping(value = "/iosc0030", method = RequestMethod.GET)
	public String iosc0030(Locale locale, Model model) throws Exception {
		logger.info("발주마감 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("001"); // 사용여부
		List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("useYn", useYnList);
		
		//PurchaseOrderAdmVo purchaseOrderAdmVo = new PurchaseOrderAdmVo();
		//PurchaseOrderAdmVo vo = purchaseOrderAdmService.poDateList(purchaseOrderAdmVo);
		//model.addAttribute("serverDateFrom", vo.getStartDate());
		//model.addAttribute("serverDateTo", vo.getEndDate());

		return "io/iosc0030";
	}
	
	
	//발주마감 발주종료일 수정
	@RequestMapping(value="io/poEndDateUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> poEndDateUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			purchaseOrderAdmService.poEndDateUpdate(purchaseOrderAdmVo);
		
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//발주마감 발주상태 수정
	@RequestMapping(value="io/poStatusUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> poStatusUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			//String poStatus = purchaseOrderAdmService.poStatusCheck(purchaseOrderAdmVo);
			
			purchaseOrderAdmVo.setPoStatus("002"); //발주마감
			purchaseOrderAdmService.poStatusUpdate(purchaseOrderAdmVo);
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주 모니터링 목록조회
	@RequestMapping(value="io/poMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> poMonitoringList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("발주 모니터링 목록조회 vo:"+purchaseOrderAdmVo);
			List<PurchaseOrderAdmVo> list = purchaseOrderAdmService.poMonitoringList(purchaseOrderAdmVo);
			if(list==null) {
				list = new ArrayList<PurchaseOrderAdmVo>();
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			}
			return jsonData;
	}
	
	//기간별 수입검사 결과 목록조회
	@RequestMapping(value="io/inspTestResultList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspTestResultList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("기간별 수입검사 결과 목록조회");
			List<PurchaseOrderAdmVo> purchaseOrderList = purchaseOrderAdmService.inspTestResultList(purchaseOrderAdmVo);
		
			jsonData.put("result", "ok");
			jsonData.put("data", purchaseOrderList);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}


}
