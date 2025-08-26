package mes.web.bs;

import java.util.ArrayList;
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
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.bs.DeliveryProcDtlVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.bs.DeliveryProcDtlService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class DeliveryProcDtlController {

	private static final Logger logger = LoggerFactory.getLogger(DeliveryProcDtlController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;
	
	@Inject
	private DeliveryProcDtlService deliveryProcDtlService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	

	// 출고처리 메인
	@RequestMapping(value = "/bssc0100", method = RequestMethod.GET)
	public String bssc0100(Locale locale, Model model) throws Exception {
		logger.info("출고처리 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("157"); //출하상태
		List<CommonCodeAdmVo> doStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("doStatus", doStatusList);
		
		commonCodeVo.setBaseGroupCd("112"); //레이저/후가공
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);

		return "bs/bssc0100";
	}
	
	// 영업(출고마감) 메인
	@RequestMapping(value = "/bssc0080", method = RequestMethod.GET)
	public String bssc0080(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("061"); //출고상태
		List<CommonCodeAdmVo> bssc0080List = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("doStatusGubun", bssc0080List);
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
		List<DealCorpAdmVo> dealCorpList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("doCorpNmgubun", dealCorpList );
		
		return "bs/bssc0080";
	}
	
	// 출고처리 목록조회
	@RequestMapping(value="bs/deliveryProcDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<DeliveryProcDtlVo> deliveryProcDtlList = new ArrayList<DeliveryProcDtlVo>();
			
			if(deliveryProcDtlVo.getDoNo()!=null && !deliveryProcDtlVo.getDoNo().equals("")) {
				deliveryProcDtlList =  deliveryProcDtlService.deliveryProcDtlList(deliveryProcDtlVo);
			}
			jsonData.put("data", deliveryProcDtlList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//출고처리 등록
	@RequestMapping(value="bs/deliveryProcDtlIns" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryProcDtlIns(@RequestBody List<Map<String, Object>> deliveryProcDtlList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		DeliveryProcDtlVo deliveryProcDtlVo = new DeliveryProcDtlVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("출고처리 등록 : "+ deliveryProcDtlVo);
		try {
			
			int targetQty = Integer.parseInt(deliveryProcDtlList.get(0).get("targetQty").toString());
			int totalDpQty = 0;
			
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			for(Map<String, Object> m :deliveryProcDtlList) {
				if(m.get("dpNo")!=null && !m.get("dpNo").equals("")) {
					deliveryProcDtlVo.setDpNo(m.get("dpNo").toString());
					deliveryProcDtlService.deliveryProcDtlDel(deliveryProcDtlVo);
					
					stockPaymentAdmVo.setSourceNo(m.get("dpNo").toString());
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
				}
				
				deliveryProcDtlVo.setDoNo(m.get("doNo").toString());
				deliveryProcDtlVo.setDate(DateUtil.getCurrentYyyymmdd());
				deliveryProcDtlVo.setDpNo(deliveryProcDtlService.getDpNo(deliveryProcDtlVo));
				deliveryProcDtlVo.setItemSeq(m.get("itemSeq").toString());
				deliveryProcDtlVo.setBarcodeNo(m.get("barcodeNo").toString());
				deliveryProcDtlVo.setDpQty(m.get("dpQty").toString());
				deliveryProcDtlVo.setDpDate(m.get("dpDate").toString());
				deliveryProcDtlVo.setDpDesc(m.get("dpDesc").toString());
				deliveryProcDtlVo.setRegId(Utils.getUserId());
				logger.info("vo:"+deliveryProcDtlVo);
				deliveryProcDtlService.deliveryProcDtlIns(deliveryProcDtlVo);
				
				totalDpQty+=Integer.parseInt(deliveryProcDtlVo.getDpQty());
				
				//수불테이블 Create
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(m.get("spType").toString());
				stockPaymentAdmVo.setSpCd(deliveryProcDtlVo.getItemSeq());
				stockPaymentAdmVo.setSpRev("00");
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun("제품출고");
				stockPaymentAdmVo.setSpDate(deliveryProcDtlVo.getDpDate());
				stockPaymentAdmVo.setSpQty(deliveryProcDtlVo.getDpQty());
				stockPaymentAdmVo.setBarcodeNo(deliveryProcDtlVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(deliveryProcDtlVo.getDpNo());
				stockPaymentAdmVo.setLocationNo(m.get("locationNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("locationCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			}
			
			
			//출고요청 수정 
			deliveryOrderAdmVo.setDoNo(deliveryProcDtlList.get(0).get("doNo").toString());
			if(targetQty<=totalDpQty) { 
				deliveryOrderAdmVo.setDoStatus("004");
			}else { 
				deliveryOrderAdmVo.setDoStatus("003");
			}
			deliveryOrderAdmVo.setUpdId(Utils.getUserNumber());
			deliveryOrderAdmService.deliveryOrderAdmUpd(deliveryOrderAdmVo);
			
			jsonData.put("result", "ok");
				
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}


	// 출고삭제
	@RequestMapping(value = "bs/deliveryProcDtlDel" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryProcDtlDel(DeliveryProcDtlVo deliveryProcDtlVo, DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고삭제 vo:"+deliveryProcDtlVo);
		try {
			//수불테이블 삭제
			int deleteTotalDpQty = 0;
			int[] dpQtyArr = deliveryProcDtlVo.getDpQtyArr();
			String[] dpNoArr = deliveryProcDtlVo.getDpNoArr();
			for(int i=0; i<dpNoArr.length; i++) {
				StockPaymentAdmVo vo = new StockPaymentAdmVo();
				vo.setSourceNo(dpNoArr[i]);
				stockPaymentAdmService.stockPaymentAdmDelete(vo);
				deleteTotalDpQty += dpQtyArr[i];
			}
			
			
			List<DeliveryOrderAdmVo> list = deliveryOrderAdmService.deliveryOrderAdmList(deliveryOrderAdmVo);
			int targetQty = Integer.parseInt(list.get(0).getDoQty());
			int totalDpQty = Integer.parseInt(list.get(0).getDoQty());
			totalDpQty = totalDpQty - deleteTotalDpQty;
			System.out.println("출고요청값 : " + targetQty);
			System.out.println("삭제값 : " + deleteTotalDpQty);
			System.out.println("삭제후 출고값 : " + totalDpQty);
			if(targetQty <= totalDpQty) { 
				deliveryOrderAdmVo.setDoStatus("004");
			}else { 
				deliveryOrderAdmVo.setDoStatus("003");
			}
			deliveryOrderAdmVo.setUpdId(Utils.getUserNumber());
			deliveryOrderAdmService.deliveryOrderAdmUpd(deliveryOrderAdmVo);

			//출고처리 테이블 삭제
			deliveryProcDtlService.deliveryProcDtlDel(deliveryProcDtlVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 바코드별 제품출고 모니터링 조회 
	@RequestMapping(value="bs/itemWhsAdmMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("바코드별 제품출고 모니터링 조회 : "+deliveryProcDtlVo);
		try {
			
			List<DeliveryProcDtlVo> list = deliveryProcDtlService.itemWhsAdmMonitoringList(deliveryProcDtlVo);
			if(list==null) {
				list = new ArrayList<>();
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
		
}
