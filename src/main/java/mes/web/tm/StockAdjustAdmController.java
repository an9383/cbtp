package mes.web.tm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.math3.analysis.function.Abs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.OutWhsAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.tm.StockAdjustAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.service.tm.StockAdjustAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class StockAdjustAdmController {
 	
	private static final Logger logger = LoggerFactory.getLogger(StockAdjustAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private StockAdjustAdmService stockAdjustAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private OutWhsAdmService outWhsAdmService;
	
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	//기초재고관리 메인
	@RequestMapping(value = "/tmsc0010", method = RequestMethod.GET)
	public String tmsc0010(Locale locale, Model model) throws Exception {
		logger.info("기초재고관리 메인");
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("073"); // 창고구분
		List<CommonCodeAdmVo> locationCdList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("locationCd", locationCdList);
		
		commonCodeVo.setBaseGroupCd("067"); // 구역구분
		List<CommonCodeAdmVo> areaCdList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("areaCd", areaCdList);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "tm/tmsc0010";
	}
	
	//재고조정관리 메인
	@RequestMapping(value = "/tmsc0040", method = RequestMethod.GET)
	public String tmsc0040(Locale locale, Model model) throws Exception {
		logger.info("재고조정관리 메인");
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("073"); // 창고구분
		List<CommonCodeAdmVo> locationCdList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("locationCd", locationCdList);
		
		commonCodeVo.setBaseGroupCd("067"); // 구역구분
		List<CommonCodeAdmVo> areaCdList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("areaCd", areaCdList);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		
		List<CommonCodeAdmVo> saTypeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("saType", saTypeList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "tm/tmsc0040";
	}
	
	//재고위치관리 메인
	@RequestMapping(value = "/tmsc0020", method = RequestMethod.GET)
	public String tmsc0020(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> saTypeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("saType", saTypeList);
	
		return "tm/tmsc0020";
	}
	
	
	//자재,제품 목록조회
	@RequestMapping(value = "tm/itemAllList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemAllList(StockAdjustAdmVo stockAdjustAdmVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재,제품 목록조회 : "+stockAdjustAdmVo);
		try {
			
			
			String start = request.getParameter("start"); 
			String length = request.getParameter("length");
			String searchVal = request.getParameter("search[value]");	
			String ordDir = request.getParameter("order[0][dir]");
			String ordColumnIdx = request.getParameter("order[0][column]");
			String ordColumn = request.getParameter("columns["+ ordColumnIdx +"][data]");
			
			logger.info("start = "+ start + ",length = " +length + ",searchVal = " +searchVal + ",ordColumn = " +ordColumn + ",ordDir = " +ordDir);
			
			stockAdjustAdmVo.setSearchVal(searchVal);
			ordColumn =  Utils.convert2UnderscoreCase(ordColumn);
			stockAdjustAdmVo.setOrdDir(ordDir);
			stockAdjustAdmVo.setOrdColumn(ordColumn);
			
			
			List<StockAdjustAdmVo> list=  stockAdjustAdmService.itemAllList(stockAdjustAdmVo);
			List<StockAdjustAdmVo> itemPartList = new ArrayList<StockAdjustAdmVo>();
			List<StockAdjustAdmVo> itemMotorList = new ArrayList<StockAdjustAdmVo>();
			
			for(int i=0; i<list.size(); i++) {
				
				if(list.get(i).getSaType().equals("001")) {
					itemPartList.add(list.get(i));
				}else if(list.get(i).getSaType().equals("002")) {
					itemMotorList.add(list.get(i));
				}
			}
			
			int totalCount = 0;
			
			//원자재
			if(stockAdjustAdmVo.getGubun().equals("001")) {
				
				if(itemPartList.size() > 0) {
					totalCount = itemPartList.get(0).getTotalCount();
				}
				jsonData.put("data", itemPartList);
			}else if(stockAdjustAdmVo.getGubun().equals("002")) {
				
				if(itemMotorList.size() > 0) {
					totalCount = itemMotorList.get(0).getTotalCount();
				}
				
				jsonData.put("data", itemMotorList);
			}else {
				if(list.size() > 0) {
					totalCount = list.get(0).getTotalCount();
				}
				
				jsonData.put("data", list);
			}
			
			jsonData.put("recordsTotal", totalCount);
			jsonData.put("recordsFiltered", totalCount);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//품목조회 팝업 DTL테이블 초기화
	@RequestMapping(value = "tm/itemAllTempTableReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemAllTempTableReset(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고반영 목록조회 : "+stockAdjustAdmVo);
		try {
			List<StockAdjustAdmVo> list =  new ArrayList<StockAdjustAdmVo>();
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
		
	
	//초기재고관리 목록조회
	@RequestMapping(value = "tm/preStockList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preStockList(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고반영 목록조회 : "+stockAdjustAdmVo);
		try {
			List<StockAdjustAdmVo> list =  stockAdjustAdmService.preStockList(stockAdjustAdmVo);

			if(list.size()==0) {
				list = new ArrayList<StockAdjustAdmVo>();
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
	
	
	//초기재고관리 등록
	@RequestMapping(value = "tm/preStockCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> preStockCreate(@RequestBody List<Map<String, Object>> stockAdjustAdmList) throws Exception {
		StockAdjustAdmVo stockAdjustAdmVo = new StockAdjustAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		//WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("초기재고등록 : "+stockAdjustAdmVo);
		try {
			stockAdjustAdmVo.setLocationCd(stockAdjustAdmList.get(0).get("locationCd").toString());
			stockAdjustAdmVo.setStockChargr(stockAdjustAdmList.get(0).get("stockChargr").toString());
			
			String date = DateUtil.getToday("yyyyMMdd");
			stockAdjustAdmVo.setDate(date);
			stockAdjustAdmVo.setSaNo(date+"-"+stockAdjustAdmService.getSaNo(stockAdjustAdmVo));
			
			for(Map<String, Object> m :stockAdjustAdmList) {
				
				stockAdjustAdmVo.setSaSeq(stockAdjustAdmService.getSaSeq(stockAdjustAdmVo));
				stockAdjustAdmVo.setSaCd(m.get("saCd").toString());
				stockAdjustAdmVo.setLotDate(m.get("lotDate").toString());
				stockAdjustAdmVo.setSaType(m.get("saType").toString());
				stockAdjustAdmVo.setSaDesc(m.get("saDesc").toString());
				stockAdjustAdmVo.setCmptStockQty("0");
				stockAdjustAdmVo.setRealStockQty(m.get("realStockQty").toString());
				stockAdjustAdmVo.setDiffQty(Float.toString(Float.parseFloat(stockAdjustAdmVo.getRealStockQty())*-1));
				stockAdjustAdmVo.setLocationNo(m.get("locationNo").toString());
				stockAdjustAdmVo.setApprovalDate(m.get("approvalDate").toString());
				stockAdjustAdmVo.setApprovalYn("N");
				stockAdjustAdmVo.setStockType("001");
				stockAdjustAdmVo.setRegId(Utils.getUserId());
				
				stockAdjustAdmService.preStockCreate(stockAdjustAdmVo);
				
				jsonData.put("result", "ok");
				
			}
			
		jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//생산 lotNo 생성
	public String getOrdLotNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		
		String eqInitial = "A00";
		String yearString = stockPaymentAdmVo.getOrdLotNoDate().substring(2,4);
		String monString = stockPaymentAdmVo.getOrdLotNoDate().substring(4,6);
		String dayString = stockPaymentAdmVo.getOrdLotNoDate().substring(6,8);
		String mString = "";
		
		switch (monString) {
			case "01": mString="A"; break;case "02": mString="B"; break;case "03": mString="C"; break;
			case "04": mString="D"; break;case "05": mString="E"; break;case "06": mString="F"; break;
			case "07": mString="G"; break;case "08": mString="H"; break;case "09": mString="I"; break;
			case "10": mString="J"; break;case "11": mString="K"; break;case "12": mString="L"; break;
			default: break;
		}
		
		String ordLotNoString = "DR"+eqInitial+yearString+mString+dayString;
		stockPaymentAdmVo.setBarcodeNo(ordLotNoString);
		String ordLotSeq = stockPaymentAdmService.getItemBarcodeNo(stockPaymentAdmVo);
		String ordLotNo = ordLotNoString+ordLotSeq;
		
		return ordLotNo;
	}
	
	
	
	//재고조정관리
	//자재,제품 목록조회
	@RequestMapping(value = "tm/itemAllList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemAllList2(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재,제품 목록조회 : "+stockAdjustAdmVo);
		try {
			
			List<StockAdjustAdmVo> list2 = new ArrayList<StockAdjustAdmVo>();
			//List<StockAdjustAdmVo> itemMotorList = new ArrayList<StockAdjustAdmVo>();
			
			/*
			 * for(int i=0; i<list.size(); i++) {
			 * 
			 * if(list.get(i).getSaType().equals("001")) { itemPartList.add(list.get(i));
			 * }else { itemMotorList.add(list.get(i)); } }
			 */
			//원자재
			/*
			 * if(stockAdjustAdmVo.getGubun().equals("001")) { jsonData.put("data",
			 * itemPartList); }else if(stockAdjustAdmVo.getGubun().equals("002")) {
			 * jsonData.put("data", itemMotorList); }else { jsonData.put("data", list); }
			 */
			
			List<StockAdjustAdmVo> list=  stockAdjustAdmService.itemAllList2(stockAdjustAdmVo);
			
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getCmptStockQty()!=null && !list.get(i).getCmptStockQty().equals("0.000")) {
					list2.add(list.get(i));
				}
			}
			
			jsonData.put("data", list2);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
						);
		}
		return jsonData;
	}

	//재고조정관리 등록
	@RequestMapping(value = "tm/stockAdjustCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockAdjustCreate(@RequestBody List<Map<String, Object>> stockAdjustAdmList) throws Exception {
		StockAdjustAdmVo stockAdjustAdmVo = new StockAdjustAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("초기재고등록 : "+stockAdjustAdmVo);
		try {
			stockAdjustAdmVo.setLocationCd(stockAdjustAdmList.get(0).get("locationCd").toString());
			stockAdjustAdmVo.setStockChargr(stockAdjustAdmList.get(0).get("stockChargr").toString());
			
				for(Map<String, Object> m :stockAdjustAdmList) {
					
					String date = DateUtil.getToday("yyyyMMdd");
					stockAdjustAdmVo.setDate(date);
					stockAdjustAdmVo.setSaNo(date+"-"+stockAdjustAdmService.getSaNo(stockAdjustAdmVo));
					stockAdjustAdmVo.setSaSeq(stockAdjustAdmService.getSaSeq(stockAdjustAdmVo));
					stockAdjustAdmVo.setSaCd(m.get("saCd").toString());
					//stockAdjustAdmVo.setSaRev(m.get("saRev").toString());
					stockAdjustAdmVo.setSaType(m.get("saType").toString());
					stockAdjustAdmVo.setSaDesc(m.get("saDesc").toString());
					
					stockAdjustAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
					stockAdjustAdmVo.setCmptStockQty(m.get("cmptStockQty").toString());
					stockAdjustAdmVo.setRealStockQty(m.get("realStockQty").toString());
					stockAdjustAdmVo.setDiffQty(m.get("diffQty").toString());
					//stockAdjustAdmVo.setAreaCd(m.get("areaCd").toString());
					//stockAdjustAdmVo.setFloorCd(m.get("floorCd").toString());
					stockAdjustAdmVo.setLocationNo(m.get("locationNo").toString());
					stockAdjustAdmVo.setApprovalDate(m.get("approvalDate").toString());
					stockAdjustAdmVo.setApprovalYn("N");
					stockAdjustAdmVo.setStockType("002");
					stockAdjustAdmVo.setRegId(Utils.getUserId());
					
					stockAdjustAdmService.preStockCreate(stockAdjustAdmVo);
					
					jsonData.put("result", "ok");
					
				}
				
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//재고반영 수정
	@RequestMapping(value = "tm/approvalYnUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> approvalYnUpdate(@RequestBody List<Map<String, Object>> stockAdjustAdmList) throws Exception {
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockAdjustAdmVo stockAdjustAdmVo = new StockAdjustAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고반영 수정 : "+stockAdjustAdmVo);
		try {

			
			for(Map<String, Object> m :stockAdjustAdmList) {
				
				stockAdjustAdmVo.setSaNo(m.get("saNo").toString());
				stockAdjustAdmVo.setSaSeq(m.get("saSeq").toString());
				stockAdjustAdmVo.setApprovalYn(m.get("value").toString());
				stockAdjustAdmVo.setUpdId(Utils.getUserId());
				int count = stockAdjustAdmService.approvalYnUpdate(stockAdjustAdmVo);
				if(count<0) {
					logger.info("등록되지 않았습니다");
				}else {
					logger.info("등록되었습니다.");
				}
				
				//재고반영일 경우
				if(stockAdjustAdmVo.getApprovalYn().equals("Y")) {
					
					//수불관리 Create
					stockPaymentAdmVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType(m.get("saType").toString());
					stockPaymentAdmVo.setSpCd(m.get("saCd").toString());
					stockPaymentAdmVo.setLocationNo(m.get("locationNo").toString());
					stockPaymentAdmVo.setLocationCd(m.get("locationCd").toString());
					
					//초기재고/재고조정 - 하위구분추가
					if(m.get("spSubGubun").toString().equals("초기재고")) {
						stockPaymentAdmVo.setSpSubGubun("초기재고");
						if(Float.parseFloat(m.get("diffQty").toString())<0) {
							stockPaymentAdmVo.setSpGubun("001");
						}else {
							stockPaymentAdmVo.setSpGubun("002");
						}
					}else if(m.get("spSubGubun").toString().equals("재고조정")) {
						if(Float.parseFloat(m.get("diffQty").toString())<0) {
							stockPaymentAdmVo.setSpSubGubun("조정입고");
							stockPaymentAdmVo.setSpGubun("001");
						}else {
							stockPaymentAdmVo.setSpSubGubun("조정출고");
							stockPaymentAdmVo.setSpGubun("001");
						}
					}
					
					stockPaymentAdmVo.setSpDate(m.get("approvalDate").toString());
					stockPaymentAdmVo.setSpDesc(m.get("saDesc").toString());
					stockPaymentAdmVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("diffQty").toString()))));
					
					//바코드 생성
					String barcodeNo="";
					String seq = "";
					
					switch(m.get("saType").toString()) {
					case "001": case "002": case "003" :
						stockPaymentAdmVo.setOrdLotNoDate(m.get("approvalDate").toString());
						barcodeNo = getOrdLotNo(stockPaymentAdmVo);
						break;
					case "004" : case "005": 
						barcodeNo = stockPaymentAdmVo.getSpCd()+"-"+stockPaymentAdmVo.getSpDate().substring(2,8);		
						seq = stockAdjustAdmService.getPartBarcodeSeq(barcodeNo);
						barcodeNo = barcodeNo+"-"+ seq;
						break;
					default:
						barcodeNo = stockPaymentAdmVo.getSpCd()+"-"+stockPaymentAdmVo.getSpDate().substring(2,8);		
						seq = stockAdjustAdmService.getPartBarcodeSeq(barcodeNo);
						barcodeNo = barcodeNo+"-"+ seq;
					}
					
					stockPaymentAdmVo.setBarcodeNo(barcodeNo);
					stockPaymentAdmVo.setSourceNo(stockAdjustAdmVo.getSaNo()+"-"+stockAdjustAdmVo.getSaSeq());
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					
					jsonData.put("result", "ok");
					
				//반영취소일 경우	
				}else {
					
					//수불관리 Delete
					stockPaymentAdmVo.setSourceNo(stockAdjustAdmVo.getSaNo()+"-"+stockAdjustAdmVo.getSaSeq());
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
					
					//재공창고일 경우 
					if(m.get("locationNo").toString().equals("20210825-001")){
						
						outWhsAdmVo.setBarcodeNo(stockAdjustAdmVo.getBarcodeNo());
						
						//재공창고에서 투입된 경우 -> 이미 투입된 자재여서 반영취소 불가
						if(outWhsAdmService.barcodeOutStatusCheck(outWhsAdmVo).equals("P")) {
							
							jsonData.put("result", "fail");
							jsonData.put("result", "해당 바코드로 이미 투입된 자재가 있어 반영취소가 불가합니다. 확인해주세요.");
						
						//재공창고에서 투입되지 않은 경우 -> 출고테이블 삭제 , 수불관리 테이블(출고) 삭제
						}else {
							stockAdjustAdmService.stockPaymentAdmDelete(stockAdjustAdmVo);
							stockAdjustAdmService.outWhsAdmDelete(stockAdjustAdmVo);
							
							jsonData.put("result", "ok");
						}
						
				    }else {
				    	jsonData.put("result", "ok");
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


	//초기재고관리 , 재고조정관리 삭제
	@RequestMapping(value = "tm/stockAdjustDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockAdjustDelete(@RequestBody List<Map<String, Object>> stockAdjustAdmList) throws Exception {
		StockAdjustAdmVo stockAdjustAdmVo = new StockAdjustAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고관리 삭제 : "+stockAdjustAdmVo);
		try {

			for(Map<String, Object> m :stockAdjustAdmList) {
				
				stockAdjustAdmVo.setSaNo(m.get("saNo").toString());
				stockAdjustAdmVo.setSaSeq(m.get("saSeq").toString());
				
				//재고조정관리 Delete
				stockAdjustAdmService.stockAdjustAdmDelete(stockAdjustAdmVo);

				//수불관리 Delete
				stockPaymentAdmVo.setSourceNo(stockAdjustAdmVo.getSaNo()+"-"+stockAdjustAdmVo.getSaSeq());
				stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

}
