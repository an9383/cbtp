package mes.web.wm;

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

import com.mysql.jdbc.Util;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.service.po.WorkOrderService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemWhsAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemWhsAdmController.class);

	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private DealCorpAdmService dealCorpAdmService;

	// 제품입고 메인
	@RequestMapping(value = "/wmsc0160", method = RequestMethod.GET)
	public String wmsc0160(Locale locale, Model model, ItemWhsAdmVo itemWhsAdmVo) throws Exception {
		logger.info("제품입고 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		List<ItemWhsAdmVo> inlocList = itemWhsAdmService.getInLoc(itemWhsAdmVo);
		model.addAttribute("inLoc", inlocList);
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemList);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		commonCodeVo.setUseYn("001");
		itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemList);
		
		return "wm/wmsc0160";
	}
	
	// 출하현황(사출) 메인
	@RequestMapping(value = "/bssc0070", method = RequestMethod.GET)
	public String bssc0070(Locale locale, Model model) throws Exception {
	      model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	      model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	      model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
	      
	      CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	      commonCodeVo.setBaseGroupCd("097"); //LH/RH
	      List<CommonCodeAdmVo> commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
	      model.addAttribute("lhrhList", commonCodeList);
	      
	      commonCodeVo.setBaseGroupCd("112"); //사출/봉제
	      commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
	      model.addAttribute("mainGubun", commonCodeList);
	      
	      
	      DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
	      List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
	      model.addAttribute("itemCusList", itemCusList );
		
		return "bs/bssc0070";
	}
	
	// 출하현황(봉제) 메인
	@RequestMapping(value = "/bssc0071", method = RequestMethod.GET)
	public String bssc0071(Locale locale, Model model) throws Exception {
	      model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	      model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	      model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
	      
	      CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	      commonCodeVo.setBaseGroupCd("097"); //LH/RH
	      List<CommonCodeAdmVo> commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
	      model.addAttribute("lhrhList", commonCodeList);
	      
	      commonCodeVo.setBaseGroupCd("112"); //사출/봉제
	      commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
	      model.addAttribute("mainGubun", commonCodeList);
	      
	      
	      DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
	      List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
	      model.addAttribute("itemCusList", itemCusList );
		
		return "bs/bssc0071";
	}
	
	// 제품출고현황(정밀가공)
	@RequestMapping(value = "/bssc0300", method = RequestMethod.GET)
	public String bssc0300(Locale locale, Model model) throws Exception {
	      model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	      model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	      model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
	      
	      CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	      commonCodeVo.setBaseGroupCd("097"); //LH/RH
	      List<CommonCodeAdmVo> commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
	      model.addAttribute("lhrhList", commonCodeList);
	      
	      commonCodeVo.setBaseGroupCd("112"); //사출/봉제
	      commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
	      model.addAttribute("mainGubun", commonCodeList);
	      
	      
	      DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
	      List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
	      model.addAttribute("itemCusList", itemCusList );
		
		return "bs/bssc0300";
	}
	
	// 제품입고 목록조회
	@RequestMapping(value="wm/itemWhsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemWhsAdmList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품입고 목록조회");
		try {
			List<ItemWhsAdmVo> itemWhsAdmList = itemWhsAdmService.itemWhsAdmList(itemWhsAdmVo);
			logger.info("list 내용:"+itemWhsAdmList);
			jsonData.put("data", itemWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("messeage", Utils.getErrorMessage());
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 제품입고 상세조회
	@RequestMapping(value="wm/itemWhsAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemWhsAdmRead(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ItemWhsAdmVo itemWhsAdmRead;
			if(itemWhsAdmVo.getBarcodeNo()==null || itemWhsAdmVo.getBarcodeNo().equals("")) {
				itemWhsAdmRead = new ItemWhsAdmVo();
			}else {
				itemWhsAdmRead = itemWhsAdmService.itemWhsAdmRead(itemWhsAdmVo);
			}
			
			jsonData.put("data", itemWhsAdmRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("messeage", Utils.getErrorMessage());
			jsonData.put("result", "error");
		}
		return jsonData;
	}

	// 제품입고 등록
	@RequestMapping(value = "wm/itemWhsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemWhsAdmCreate(@RequestBody List<Map<String, Object>> itemWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("제품입고 등록: " + itemWhsAdmList);
		try {		
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
			
			for(Map<String, Object> m : itemWhsAdmList) {		
				itemWhsAdmVo.setBarcodeNo(m.get("workOrdNo").toString());	
				itemWhsAdmVo.setItemSeq(m.get("itemSeq").toString());	
				itemWhsAdmVo.setWorkOrdNo(m.get("workOrdNo").toString());
				itemWhsAdmVo.setInDate(m.get("inDate").toString());					
				itemWhsAdmVo.setInQty(Integer.parseInt(m.get("inQty").toString()));
				itemWhsAdmVo.setInLoc(m.get("inLoc").toString());
				itemWhsAdmVo.setInArea(m.get("inArea").toString());
				itemWhsAdmVo.setInFloor(m.get("inFloor").toString());
				itemWhsAdmVo.setLocationNo(m.get("locationNo").toString());
				itemWhsAdmVo.setRegId(Utils.getUserId());
				itemWhsAdmVo.setUpdId(Utils.getUserId());
				
				if(itemWhsAdmService.existItemWhsAdm(itemWhsAdmVo) > 0) {
					itemWhsAdmService.itemWhsAdmUpdate(itemWhsAdmVo);
				}else {
					itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
				}
				

				//수불테이블 Create
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType("002");
				stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
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
			}			
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 제품입고 바코드스캔 시 상세조회
	@RequestMapping(value="wm/barcodeNoScanInList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeNoScanInList(ItemWhsAdmVo itemWhsAdmVo, WorkOrderVo workOrderVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
		WorkOrderPrcssVo workOrderPrcssVo2 = new WorkOrderPrcssVo();
		try {
			//존재
			if(itemWhsAdmService.itemBarcodeNoCheck(itemWhsAdmVo) == 0) {
				jsonData.put("result", "fail");  
				jsonData.put("message", "등록되지 않은 바코드입니다. 확인해주세요.");  
			}else {
				ItemWhsAdmVo itemWhsAdmvo = itemWhsAdmService.itemWhsAdmRead(itemWhsAdmVo);
				
				//작업상태 : 종료
				workOrderPrcssVo.setOrdLotNo(itemWhsAdmVo.getBarcodeNo());
				workOrderPrcssVo2 = workOrderPrcssService.workOrdPrcssReadDtl(workOrderPrcssVo);
				if(workOrderPrcssVo2.getWorkStatus().equals("002")) {
					
					//완제품검사관리 승인확인
					WorkOrderVo vo = workOrderService.checkItemComplete(workOrderVo);
					
					if(vo == null) {
						jsonData.put("result", "fail");  
						jsonData.put("message","완제품 검사된 바코드가 아닙니다. 확인해주세요.");  
					} else { 
						
						// 승인여부 확인
						if(vo.getCompleteStatusCd() == null || vo.getCompleteStatusCd().equals("002")) {
							jsonData.put("result", "fail");
							jsonData.put("message","승인된 바코드가 아닙니다. 확인해주세요.");  
							
						}else {
							jsonData.put("data", itemWhsAdmvo);
							jsonData.put("result", "ok");
						}
					}
				}else {	//작업상태 : 시작
					jsonData.put("result", "fail");  
					jsonData.put("message", "작업 완료된 바코드가 아닙니다. 확인해주세요.");  
					
				}
				
					
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", Utils.getErrorMessage());
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 제품출고 바코드스캔 시 상세조회
	@RequestMapping(value="wm/barcodeNoScanOutList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeNoScanOutList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			//작업지시번호가 존재하는지
			if(itemWhsAdmService.itemBarcodeNoCheck(itemWhsAdmVo)==0) {
				jsonData.put("result", "fail"); 
				jsonData.put("message", "등록되지 않은 바코드입니다. 확인해주세요."); 
			}else {
				//제품입고 했는지
				ItemWhsAdmVo itemWhsAdmvo = itemWhsAdmService.itemWhsAdmRead(itemWhsAdmVo);

				if(itemWhsAdmvo.getInLoc()==null || itemWhsAdmvo.getInLoc().equals("")) {
					jsonData.put("result", "fail"); 
					jsonData.put("message", "제품입고되지 않은 바코드입니다. 확인해주세요."); 
				}else {
					
					//출고의뢰된 품명과 작업지시번호의 품명 일치확인
					if(itemWhsAdmvo.getItemSeq().equals(itemWhsAdmVo.getItemSeq())) {
						
						//남은 출고량 확인
						logger.info("남은수량:"+itemWhsAdmvo.getRemainQty());
						if(itemWhsAdmvo.getRemainQty()==0) {
							jsonData.put("result", "fail"); 
							jsonData.put("message", "남은수량이 없는 바코드입니다. 확인해주세요."); 
						}else {
							jsonData.put("data", itemWhsAdmvo);
							jsonData.put("result", "ok");
						}
					}else {
						jsonData.put("result", "fail");
						jsonData.put("message", "품번이 불일치한 바코드입니다. 확인해주세요."); 
					}
				}
			}
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	
	
	//구역정보 가져오기
	@RequestMapping(value = "wm/getInArea", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getInArea(ItemWhsAdmVo itemWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("구역정보 : "+itemWhsAdmVo);
		try {
			
			List<ItemWhsAdmVo> inAreaList = itemWhsAdmService.getInArea(itemWhsAdmVo);
			jsonData.put("data", inAreaList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//위치정보 가져오기
	@RequestMapping(value = "wm/getInFloor", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getInFloor(ItemWhsAdmVo itemWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("위치정보 : "+itemWhsAdmVo);
		try {
			
			List<ItemWhsAdmVo> inFloorList = itemWhsAdmService.getInFloor(itemWhsAdmVo);
			jsonData.put("data", inFloorList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	// 출하현황 상세조회
	@RequestMapping(value="wm/itemWhsOutList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemWhsOutList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemWhsAdmVo> list	= itemWhsAdmService.itemWhsOutList(itemWhsAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("messeage", Utils.getErrorMessage());
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}
