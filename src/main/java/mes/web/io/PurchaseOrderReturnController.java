package mes.web.io;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.LocationAdmVo;
import mes.domain.io.PurchaseOrderReturnVo;
import mes.domain.qm.UnfitAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.io.PurchaseOrderReturnService;
import mes.service.qm.UnfitAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PurchaseOrderReturnController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderReturnController.class);
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private PurchaseOrderReturnService purchaseOrderReturnService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private LocationAdmService locationAdmService;
	
	@Inject
	private UnfitAdmService unfitAdmService;
	

	// 구매자재관리(업체반품) 메인
	@RequestMapping(value = "/iosc0100", method = RequestMethod.GET)
	public String iosc0100(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		return "io/iosc0100";
	}
	
	// 구매자재관리(업체반품) 메인
	@RequestMapping(value = "/iosc0101", method = RequestMethod.GET)
	public String iosc0101(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		return "io/iosc0101";
	}
	
	// 구매자재관리(업체반품,정밀가공) 메인
	@RequestMapping(value = "/iosc0450", method = RequestMethod.GET)
	public String iosc0450(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		return "io/iosc0450";
	}
	
	//반품번호 생성
	@RequestMapping(value="io/getRetnNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getRetnNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품번호 생성 : "+purchaseOrderReturnVo);
		try {
			
			String date = DateUtil.getToday("yyyyMMdd");
			purchaseOrderReturnVo.setDate(DateUtil.getToday("yyyyMMdd"));
			String retnNoSeq = purchaseOrderReturnService.getRetnNo(purchaseOrderReturnVo);
			String retnNo = date+"-"+retnNoSeq;
			
			jsonData.put("data", retnNo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	//반품번호 목록조회
	@RequestMapping(value="io/purchaseOrderReturnList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 목록조회 : "+purchaseOrderReturnVo);
		try {
			List<PurchaseOrderReturnVo> list = purchaseOrderReturnService.purchaseOrderReturnList(purchaseOrderReturnVo);
			logger.info("list:"+list);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//반품 등록
	@RequestMapping(value="io/purchaseOrderReturnCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderReturnCreate(@RequestBody List<Map<String, Object>> returnList) throws Exception{
		PurchaseOrderReturnVo purchaseOrderReturnVo = new PurchaseOrderReturnVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		
		
		try {					 
			 purchaseOrderReturnVo.setRetnNo(returnList.get(0).get("retnNo").toString());
			 purchaseOrderReturnVo.setUnfitResultNo(returnList.get(0).get("unfitResultNo").toString());
			 purchaseOrderReturnVo.setReturnQty(returnList.get(0).get("returnQty").toString());
			 purchaseOrderReturnVo.setReturnDate(returnList.get(0).get("returnDate").toString());
			 purchaseOrderReturnVo.setReturnChargr(returnList.get(0).get("returnChargr").toString());
			 purchaseOrderReturnVo.setReturnDesc(returnList.get(0).get("returnDesc").toString());
			 purchaseOrderReturnVo.setApprovalYn("N");	 
			purchaseOrderReturnVo.setRegId(Utils.getUserId());
			purchaseOrderReturnService.purchaseOrderReturnCreate(purchaseOrderReturnVo);
			logger.info("1번째 리스트 : "+ purchaseOrderReturnVo);
			
			UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
			unfitAdmVo.setUnfitNo(returnList.get(0).get("unfitNo").toString());
			unfitAdmVo.setUnfitResultNo(returnList.get(0).get("unfitResultNo").toString());
			unfitAdmVo.setItemGubun(returnList.get(0).get("itemGubun").toString());
			unfitAdmVo.setItemSeq(returnList.get(0).get("itemSeq").toString());
			unfitAdmVo.setMainGubun(returnList.get(0).get("mainGubun").toString());
			unfitAdmVo = unfitAdmService.unfitResultRead(unfitAdmVo);
			logger.info("2번째 리스트 : "+ unfitAdmVo);
			
			//반품 부적합창고에서 출고
			StockPaymentAdmVo stockPaymentAdmInsVo = new StockPaymentAdmVo();
			stockPaymentAdmInsVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
			stockPaymentAdmInsVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmInsVo));
			stockPaymentAdmInsVo.setSpType(returnList.get(0).get("itemGubun").toString());
			stockPaymentAdmInsVo.setSpCd(returnList.get(0).get("itemSeq").toString());
			stockPaymentAdmInsVo.setSpDate(DateUtil.getToday("yyyyMMdd"));
			stockPaymentAdmInsVo.setBarcodeNo(unfitAdmVo.getUnfitLot());
			stockPaymentAdmInsVo.setSourceNo(unfitAdmVo.getUnfitLot());
			stockPaymentAdmInsVo.setSpGubun("002");
			stockPaymentAdmInsVo.setSpSubGubun("이동출고");
			stockPaymentAdmInsVo.setSpQty(purchaseOrderReturnVo.getReturnQty());
			LocationAdmVo vo = new LocationAdmVo();
			vo.setMainGubun(returnList.get(0).get("mainGubun").toString());
			String mainGubun = returnList.get(0).get("mainGubun").toString();
			vo.setLocCd(mainGubun.equals("001")?"005":"009");	
			LocationAdmVo list0 = locationAdmService.locationAdmList(vo).get(0);						
			stockPaymentAdmInsVo.setLocationCd(list0.getLocCd());
			stockPaymentAdmInsVo.setLocationNo(list0.getLocNo());
			stockPaymentAdmInsVo.setRegId(Utils.getUserId());
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInsVo);
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

}
