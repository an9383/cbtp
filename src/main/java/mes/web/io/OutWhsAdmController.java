package mes.web.io;

import java.net.URLDecoder;
import java.util.ArrayList;
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

import com.mysql.jdbc.Util;

import lombok.Data;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.OutWhsAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class OutWhsAdmController {

	private static final Logger logger = LoggerFactory.getLogger(OutWhsAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private OutWhsAdmService outWhsAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	
	// 자제출고(레이저) 메인
	@RequestMapping(value = "/iosc0140", method = RequestMethod.GET)
	public String iosc0140(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "io/iosc0140";
	}
	
	// 자제출고(후가공) 메인
	@RequestMapping(value = "/iosc0340", method = RequestMethod.GET)
	public String iosc0340(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "io/iosc0340";
	}
	
	// 자제출고(정밀가공) 메인
	@RequestMapping(value = "/iosc0440", method = RequestMethod.GET)
	public String iosc0440(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "io/iosc0440";
	}
		
	// 자제출고(공통) 메인
	@RequestMapping(value = "/iosc0180", method = RequestMethod.GET)
	public String iosc0180(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io//iosc0180";
	}
	
	// 사출자제출고현황 메인
	@RequestMapping(value = "/iosc0150", method = RequestMethod.GET)
	public String iosc0150(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0150";
	}
	
	// 봉제자제출고현황 메인
	@RequestMapping(value = "/iosc0260", method = RequestMethod.GET)
	public String iosc0260(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		List<CommonCodeAdmVo> list = new ArrayList<CommonCodeAdmVo>();
		CommonCodeAdmVo vo = new CommonCodeAdmVo();
		vo.setBaseGroupCd("073");
		vo.setEtc1("봉제");
		list = commonCodeAdmService.CommonCodeList(vo);
		model.addAttribute("locCd",list);
		
		return "io/iosc0260";
	}
		
	//개별출고 목록조회
	@RequestMapping(value = "io/preOutWhsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsAdmList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 목록조회 : "+outWhsAdmVo);
		try {
			logger.info("outCase:"+outWhsAdmVo.getOutCase());
			List<OutWhsAdmVo> preOutWhsAdmList = outWhsAdmService.preOutWhsAdmList(outWhsAdmVo);
			
			jsonData.put("data", preOutWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고 목록조회
	@RequestMapping(value = "io/outWhsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outWhsAdmList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 목록조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outWhsAdmList = outWhsAdmService.outWhsAdmList(outWhsAdmVo);
			jsonData.put("data", outWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//자재출고 목록조회
	@RequestMapping(value = "io/preOutWhsAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsAdmRead(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 상세조회 : " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> preOutWhsAdmList = outWhsAdmService.preOutWhsAdmRead(outWhsAdmVo);
			jsonData.put("data", preOutWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고현황(봉제) 목록조회
	@RequestMapping(value = "io/preOutWhsSewingList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsSewingList(OutWhsAdmVo outWhsAdmVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고현황(봉제) 목록조회 : " + outWhsAdmVo);
		try {
			String searchVal = outWhsAdmVo.getSearchVal();
			outWhsAdmVo.setSearchVal(URLDecoder.decode(searchVal, "UTF-8"));
			
			String ordDir = request.getParameter("order[0][dir]");
			String ordColumnIdx = request.getParameter("order[0][column]");
			String ordColumn = request.getParameter("columns["+ ordColumnIdx +"][data]");
			ordColumn =  Utils.convert2UnderscoreCase(ordColumn);
			outWhsAdmVo.setOrdDir(ordDir);
			outWhsAdmVo.setOrdColumn(ordColumn);
			
			List<OutWhsAdmVo> list = new ArrayList<OutWhsAdmVo>();
			list = outWhsAdmService.preOutWhsSewingList(outWhsAdmVo);
			
			int totalCount = 0;
			if(list.size() > 0) {
				totalCount = list.get(0).getTotalCount();
			}
			jsonData.put("recordsTotal", totalCount);
			jsonData.put("recordsFiltered", totalCount);
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고 목록조회
	@RequestMapping(value = "io/preOutWhsAdmRead2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsAdmRead2(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 상세조회 : "+outWhsAdmVo);
		try {
			
			 List<OutWhsAdmVo> preOutWhsAdmList;
			 if(outWhsAdmVo.getWorkOrdNo()!=null && !outWhsAdmVo.getWorkOrdNo().equals("")) {
				 preOutWhsAdmList = outWhsAdmService.preOutWhsAdmRead(outWhsAdmVo);
			 }else {
				 preOutWhsAdmList = new ArrayList<OutWhsAdmVo>();
			 }
			
			jsonData.put("data", preOutWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//현품표조회 상세조회
	@RequestMapping(value = "io/barcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeList(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("바코드 상세조회 : "+outWhsAdmVo);
		try {
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				
				logger.info("재고수불테이블로 확인!!!!!");
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun(vo.getMainGubun());
				stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if(stockList.size()==0) {
					jsonData.put("result","fail");
					jsonData.put("message", "등록되지 않은 바코드입니다.");
					jsonData.put("itemNm", "");
					jsonData.put("remainQty", "0");
				}else {
					//for문 돌리면서 0보다 큰 값만 나오도록 하고, 투입가능한 것도 아래에 위치별로 나오도록 수정!
					if(stockList.get(0).getRealQty().toString().equals("0.000")) {
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
						jsonData.put("itemNm", stockList.get(0).getSpNm());
						jsonData.put("remainQty", stockList.get(0).getRealQty());
					}else {
						StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
						stockTempVo.setRealQtyOption("Y");
						stockTempVo.setBarcodeNo("");
						stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
						stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
						stockTempVo.setLocationCd(vo.getLocationCd());
						stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
						stockTempVo.setMainGubun("001");
						
						if(vo.getLocationCd().equals("001")) {
							stockTempVo.setFifoOption("Y");
						}else {
							stockTempVo.setFifoOption2("Y");
						}
						
						List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
						
						if(stockList.get(0).getItemFifoGubun().equals("002") 
								|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) {
							jsonData.put("result", "ok");
							jsonData.put("message", "투입 가능한 LOT 입니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
							jsonData.put("data", stockList);
						}else {
							jsonData.put("result","fifo");
							jsonData.put("message", "이전LOT가 있습니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
							jsonData.put("data", stockTempList);
						}
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//현품표조회 상세조회
	@RequestMapping(value = "io/barcodeList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeList2(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("바코드 상세조회 : "+outWhsAdmVo);
		try {
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				
				logger.info("재고수불테이블로 확인!!!!!");
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun(vo.getMainGubun());
				stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if(stockList.size()==0) {
					jsonData.put("result","fail");
					jsonData.put("message", "등록되지 않은 바코드입니다.");
					jsonData.put("itemNm", "");
					jsonData.put("remainQty", "0");
				}else {
					//for문 돌리면서 0보다 큰 값만 나오도록 하고, 투입가능한 것도 아래에 위치별로 나오도록 수정!
					if(stockList.get(0).getRealQty().toString().equals("0.000")) {
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
						jsonData.put("itemNm", stockList.get(0).getSpNm());
						jsonData.put("remainQty", stockList.get(0).getRealQty());
					}else {
						StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
						stockTempVo.setRealQtyOption("Y");
						stockTempVo.setBarcodeNo("");
						stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
						stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
						stockTempVo.setLocationCd(vo.getLocationCd());
						stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
						stockTempVo.setMainGubun("001");
						
						if(vo.getLocationCd().equals("001")) {
							stockTempVo.setFifoOption("Y");
						}else {
							stockTempVo.setFifoOption2("Y");
						}
						
						List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
						
						if(stockList.get(0).getItemFifoGubun().equals("002") 
								|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) {
							jsonData.put("result", "ok");
							jsonData.put("message", "투입 가능한 LOT 입니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
							jsonData.put("data", stockList);
						}else {
							stockTempList.add(stockList.get(0));
							jsonData.put("result","fifo");
							jsonData.put("message", "이전LOT가 있습니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
							jsonData.put("data", stockTempList);
						}
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//현품표조회 상세조회(봉제)
	@RequestMapping(value = "io/barcodeListByBongjae", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeListByBongjae(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("바코드 상세조회 : "+outWhsAdmVo);
		try {
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				
				logger.info("재고수불테이블로 확인!!!!!");
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun("002");
				stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if(stockList.size()==0) {
					
					jsonData.put("result","fail");
					jsonData.put("message", "등록되지 않았거나 원자재 창고에 없는 바코드입니다.");
					jsonData.put("itemNm", "");
					jsonData.put("remainQty", "0");
				}else {
					//for문 돌리면서 0보다 큰 값만 나오도록 하고, 투입가능한 것도 아래에 위치별로 나오도록 수정!
					if(stockList.get(0).getRealQty().toString().equals("0.000")) {
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
						jsonData.put("itemNm", stockList.get(0).getSpNm());
						jsonData.put("remainQty", stockList.get(0).getRealQty());
					}else {
						StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
						stockTempVo.setRealQtyOption("Y");
						stockTempVo.setBarcodeNo("");
						stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
						stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
						stockTempVo.setLocationCd(vo.getLocationCd());
						stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
						
						if(vo.getLocationCd().equals("006")) {
							stockTempVo.setFifoOption3("Y");
						}else {
							stockTempVo.setFifoOption4("Y");
						}
						
						List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
						
						if(stockList.get(0).getItemFifoGubun().equals("002") 
								|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) {
							jsonData.put("result", "ok");
							jsonData.put("message", "투입 가능한 LOT 입니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
						}else {
							jsonData.put("result","fifo");
							jsonData.put("message", "이전LOT가 있습니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
							jsonData.put("data", stockTempList);
						}
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//자재출고(공통) 상세조회
	@RequestMapping(value = "io/barcodeCommonList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeCommonList(InOutWhsAdmVo vo ,OutWhsAdmVo vo2) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo2 = new OutWhsAdmVo();
		logger.info("바코드 상세조회 : "+vo);
		try {
			
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				//자재입고 확인
				inOutWhsAdmVo = inOutWhsAdmService.inOutWhsAdmBarcodeRead(vo);	//입고 테이블 조회
				
				if(inOutWhsAdmVo==null) {
					
					vo2.setBarcodeNo(vo.getBarcodeNo());
					vo2.setLocationCd("001");
					outWhsAdmVo2 = outWhsAdmService.itemPartRead(vo2);		//수불관리 테이블 조회
					
					if(outWhsAdmVo2==null) {
						jsonData.put("result", "empty");
					}else {
						if(outWhsAdmVo2.getRemainQty()==0.000 || outWhsAdmVo2.getRemainQty()==null) {
							jsonData.put("result", "notRemainQty");
						}else {
							/*
							 * int preOutQty = outWhsAdmService.getConsumpt(outWhsAdmVo);
							 * logger.info("출고량(총소모량):"+preOutQty);
							 * 
							 * jsonData.put("preOutQty", preOutQty);
							 */
							jsonData.put("data", outWhsAdmVo2);
							jsonData.put("result", "ok");
						}
					}
					
				}else {
					
					//자재상태가 가입고, 수입검사, 승인상태인지 확인
					if(inOutWhsAdmVo.getStatusCd().equals("S")||inOutWhsAdmVo.getStatusCd().equals("I")||inOutWhsAdmVo.getStatusCd().equals("A")) {
						jsonData.put("result", "notInWhs");
					}else if(inOutWhsAdmVo.getStatusCd().equals("P")){
						jsonData.put("result", "already");
					}else {
						
						//남은수량 확인
						if(inOutWhsAdmVo.getRemainQty().equals("0.000") || inOutWhsAdmVo.getRemainQty()==null) {
							jsonData.put("result", "notRemainQty");
						}else {
							/*
							 * int preOutQty = outWhsAdmService.getConsumpt(outWhsAdmVo);
							 * logger.info("출고량(총소모량):"+preOutQty);
							 * 
							 * jsonData.put("preOutQty", preOutQty);
							 */
							jsonData.put("data", inOutWhsAdmVo);
							jsonData.put("result", "ok");
						}
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//출고수량과 총소료량 비교 조회 
	@RequestMapping(value = "io/compareConsumptPreOutQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> compareConsumptPreOutQty(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 출고량과 총소요량조회 : "+outWhsAdmVo);
		try {

			int count = 0;
			
			List<OutWhsAdmVo> list = outWhsAdmService.compareConsumptPreOutQty(outWhsAdmVo);
			
			if(list.size()==0) {
				jsonData.put("result", "notConfirm");
				jsonData.put("message", "미출고된 자재가 있습니다. 확인해주세요.");
			}else {

				for(int i=0; i<list.size(); i++) {
					
					if(list.get(i).getDiffQty().equals("N")) count++;
				}
				
				if(count==0) {
					
					//작지 테이블에 확정컬럼 추가
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "notConfirm");
					jsonData.put("message", "미출고된 자재가 있습니다. 확인해주세요.");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//자재출고 등록
	@RequestMapping(value = "io/outWhsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outWhsAdmCreate(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("자재출고(봉제) 등록: " + outWhsAdmList);
		try {
			//outSlipNo(출고전표번호) 생성
			
			for(Map<String, Object> m : outWhsAdmList) {
				// 1.자재출고관리(TB_OUT_WHS_ADM) 데이터 등록
				outWhsAdmVo = new OutWhsAdmVo();
				outWhsAdmVo.setOutSlipSeq(outWhsAdmService.getOutSlipSeq(outWhsAdmVo));
				String today = DateUtil.getToday("YYYYMMdd");
				outWhsAdmVo.setToday(today);
				String outSlipNo = outWhsAdmService.getOutSlipNo(outWhsAdmVo);
				outWhsAdmVo.setOutSlipNo(today + "-" + outSlipNo);
//				outWhsAdmVo.setOutGubun(m.get("outGubun").toString());
				outWhsAdmVo.setLotNo(m.get("lotNo").toString());
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				outWhsAdmVo.setItemSeq(m.get("itemSeq").toString());
				outWhsAdmVo.setOutQty(m.get("outQty").toString());
				outWhsAdmVo.setOutWhsDate(m.get("outWhsDate").toString());
				outWhsAdmVo.setOutWorker(m.get("outWorker").toString());
				outWhsAdmVo.setLocationNo(m.get("locationNo").toString());
				outWhsAdmVo.setLocationCd(m.get("locationCd").toString());
				outWhsAdmVo.setOutLocationNo(m.get("outLocationNo").toString());
				outWhsAdmVo.setOutLocationCd(m.get("outLocationCd").toString());
				outWhsAdmVo.setStatusCd(m.get("statusCd").toString());
				outWhsAdmVo.setInWhsDesc(m.get("inWhsDesc").toString());
				outWhsAdmVo.setRegId(Utils.getUserId());
				outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
					
				// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 데이터 등록
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				// 2-1. 자재출고 or 이동출고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq("0");
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
				stockPaymentAdmVo.setSpGubun("002");
				//stockPaymentAdmVo.setSpSubGubun(m.get("inWhsCheck").toString().equals("Y") ? "이동출고" : "자재출고"); //이동출고 or 자재출고
				stockPaymentAdmVo.setSpSubGubun("이동출고");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getOutWhsDate());
				stockPaymentAdmVo.setSpQty(outWhsAdmVo.getOutQty());
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationNo(m.get("locationNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("locationCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				//입고처
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq("1");
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("이동입고");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getOutWhsDate());
				stockPaymentAdmVo.setSpQty(outWhsAdmVo.getOutQty());
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationNo(m.get("outLocationNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("outLocationCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//자재출고 등록
	@RequestMapping(value = "io/preOutWhsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> preOutWhsAdmCreate(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("자재출고 등록 : "+outWhsAdmList);
		try {
			
			outWhsAdmVo.setItemSeq(outWhsAdmList.get(0).get("itemSeq").toString());
			outWhsAdmVo.setWorkOrdNo(outWhsAdmList.get(0).get("workOrdNo").toString());
			outWhsAdmVo.setPreOutWhsDate(outWhsAdmList.get(0).get("preOutWhsDate").toString());
			outWhsAdmVo.setPreWorkCharger(outWhsAdmList.get(0).get("preWorkCharger").toString());
			logger.info("aaaaaa");
			
			outWhsAdmVo.setInWhsDesc(outWhsAdmList.get(0).get("inWhsDesc").toString());
			outWhsAdmVo.setOutCase(outWhsAdmList.get(0).get("outCase").toString());
			
			logger.info("리스트 사이즈>>>"+outWhsAdmList.size());
			
			//중복제거
			List<String> outWhsAdmDistinctList = new ArrayList<String>();
			for(Map<String, Object> m : outWhsAdmList){
	            if(!outWhsAdmDistinctList.contains(m.get("itemSeq").toString())) {
	            	outWhsAdmDistinctList.add(m.get("itemSeq").toString());
	            }
	        }
			
			logger.info("outWhsAdmDistinctList:"+outWhsAdmDistinctList);
			
			for(Map<String, Object> m : outWhsAdmList) {
				
				//발주번호 없을 경우 생성(조정데이터)
				if(m.get("poNo").toString()==null || m.get("poNo").toString().equals("")) {
					
					String today = DateUtil.getToday("YYMMdd");
					String poNoSeq = inOutWhsAdmService.getPoNo(today);
					String poNo = "I"+today+"-"+poNoSeq;
					
					outWhsAdmVo.setPoNo(poNo);
					outWhsAdmVo.setPoSeq(0);
					outWhsAdmVo.setInSeq(0);
				}else {
					outWhsAdmVo.setPoNo(m.get("poNo").toString());
					outWhsAdmVo.setPoSeq(Integer.parseInt(m.get("poSeq").toString()));
					outWhsAdmVo.setInSeq(Integer.parseInt(m.get("inSeq").toString()));
				}
				outWhsAdmVo.setLotNo(m.get("barcodeNo").toString());
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				outWhsAdmVo.setItemSeq(m.get("itemSeq").toString());
				outWhsAdmVo.setPreOutQty(Float.parseFloat(m.get("preOutQty").toString()));
				outWhsAdmVo.setLocationCd(m.get("locationCd").toString());
				outWhsAdmVo.setAreaCd(m.get("areaCd").toString());
				outWhsAdmVo.setFloorCd(m.get("floorCd").toString());
				outWhsAdmVo.setLocationNo(m.get("locationNo").toString());
				outWhsAdmVo.setStatusCd("O");
				outWhsAdmVo.setOutSeq(outWhsAdmService.getOutSeq(outWhsAdmVo));
				outWhsAdmVo.setRegId(Utils.getUserId());
				outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
				
				//입고 테이블 update
				if(outWhsAdmVo.getPoNo()!=null && !outWhsAdmVo.getPoNo().equals("")) {
					outWhsAdmService.updateRemainQty(outWhsAdmVo);
				}
					
				//수불테이블 Create
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				
				//1.출고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(outWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getPreOutWhsDate());
				stockPaymentAdmVo.setSpQty(Float.toString(outWhsAdmVo.getPreOutQty()));
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(m.get("preLocationCd").toString());
				stockPaymentAdmVo.setAreaCd(m.get("preAreaCd").toString());
				stockPaymentAdmVo.setFloorCd(m.get("preFloorCd").toString());
				stockPaymentAdmVo.setLocationNo(m.get("preLocationNo").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				//입고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(outWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getPreOutWhsDate());
				stockPaymentAdmVo.setSpQty(Float.toString(outWhsAdmVo.getPreOutQty()));
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(outWhsAdmVo.getLocationCd().toString());
				stockPaymentAdmVo.setAreaCd(outWhsAdmVo.getAreaCd().toString());
				stockPaymentAdmVo.setFloorCd(outWhsAdmVo.getFloorCd().toString());
				stockPaymentAdmVo.setLocationNo(outWhsAdmVo.getLocationNo().toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
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
	
	//개별출고 등록
	@RequestMapping(value = "io/preOutWhsAdmCommonCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> preOutWhsAdmCommonCreate(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("개별출고 등록 : "+outWhsAdmList);
		try {
			
			for(Map<String, Object> m : outWhsAdmList) {
				//출고테이블
				
				if(m.get("poNo").toString().equals("null") || m.get("poNo").toString()==null) {
					//발주번호
					String today = DateUtil.getToday("YYMMdd");
					String poNoSeq = inOutWhsAdmService.getPoNo(today);
					String poNo = "I"+today+"-"+poNoSeq;
					
					outWhsAdmVo.setPoNo(poNo);
					outWhsAdmVo.setPoSeq(0);
					outWhsAdmVo.setInSeq(0);
					outWhsAdmVo.setLotNo(m.get("barcodeNo").toString());
				}else {
					outWhsAdmVo.setPoNo(m.get("poNo").toString());
					outWhsAdmVo.setPoSeq(Integer.parseInt(m.get("poSeq").toString()));
					outWhsAdmVo.setInSeq(Integer.parseInt(m.get("inSeq").toString()));
					outWhsAdmVo.setLotNo(m.get("lotNo").toString());
				}
					
				outWhsAdmVo.setOutSeq(outWhsAdmService.getOutSeq(outWhsAdmVo));
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				outWhsAdmVo.setPartCd(m.get("partCd").toString());
				outWhsAdmVo.setPartRev(m.get("partRev").toString());
				outWhsAdmVo.setPreOutQty(Float.parseFloat(m.get("preOutQty").toString()));
				outWhsAdmVo.setLocationCd(m.get("locationCd").toString());
				outWhsAdmVo.setAreaCd(m.get("areaCd").toString());
				outWhsAdmVo.setFloorCd(m.get("floorCd").toString());
				outWhsAdmVo.setLocationNo(m.get("locationNo").toString());
				outWhsAdmVo.setStatusCd("O");
				outWhsAdmVo.setPreOutWhsDate(outWhsAdmList.get(0).get("preOutWhsDate").toString());
				outWhsAdmVo.setPreWorkCharger(outWhsAdmList.get(0).get("preWorkCharger").toString());
				outWhsAdmVo.setInWhsDesc(outWhsAdmList.get(0).get("inWhsDesc").toString());
				outWhsAdmVo.setOutCase(outWhsAdmList.get(0).get("outCase").toString());
			
					
				outWhsAdmVo.setRegId(Utils.getUserId());
				outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
				//출고테이블에 해당 바코드 여부확인
				//출고테이블 update
				/*if(outWhsAdmService.barcodeExsitCheck(outWhsAdmVo)>0) {	
					
					logger.info("존재함");
					
					outWhsAdmVo.setUpdId(Utils.getUserId());
					outWhsAdmService.updatePreOutQty(outWhsAdmVo);
					
				//출고테이블 create	
				}else {													
					
					logger.info("존재NONONONO");
					
					outWhsAdmVo.setRegId(Utils.getUserId());
					outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
				}
				*/
				//입고 테이블 update
				if(outWhsAdmVo.getPoNo()!=null && !outWhsAdmVo.getPoNo().equals("")) {
					outWhsAdmService.updateRemainQty(outWhsAdmVo);
				}
					
				//수불테이블 Create
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType("001");
				stockPaymentAdmVo.setSpCd(outWhsAdmVo.getPartCd());
				stockPaymentAdmVo.setSpRev(outWhsAdmVo.getPartRev());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getPreOutWhsDate());
				stockPaymentAdmVo.setSpQty(Float.toString(outWhsAdmVo.getPreOutQty()));
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(outWhsAdmVo.getLocationCd());
				stockPaymentAdmVo.setAreaCd(outWhsAdmVo.getAreaCd());
				stockPaymentAdmVo.setFloorCd(outWhsAdmVo.getFloorCd());
				stockPaymentAdmVo.setLocationNo(outWhsAdmVo.getLocationNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
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
	
	
	//자재출고 출고량 수정
	@RequestMapping(value = "io/updatePreOutQty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatePreOutQty(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		logger.info("자재출고 출고량 수정 : "+outWhsAdmList);
		try {
			outWhsAdmVo.setUpdId(Utils.getUserId());
			
			for(Map<String, Object> m : outWhsAdmList) {
				
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				
				//입고수량과 비교해야함
				
				
				outWhsAdmService.updatePreOutQty(outWhsAdmVo);
				
				//입출고 남은수량 수정
				outWhsAdmService.updateRemainQty(outWhsAdmVo);
				
				jsonData.put("result", "ok");
					
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//자재출고 확정여부수정
	@RequestMapping(value = "io/updateConfirmYn", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updateConfirmYn(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 확정여부 수정 : "+outWhsAdmVo);
		try {
			outWhsAdmVo.setUpdId(Utils.getUserId());
			
			outWhsAdmService.updateConfirmYn(outWhsAdmVo);
			jsonData.put("result", "ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고현황 작지번호 모달 조회
	@RequestMapping(value = "io/workOrdNoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdNoList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고현황 작지번호 모달 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> workOrdNoList = outWhsAdmService.workOrdNoList(outWhsAdmVo);
			jsonData.put("data", workOrdNoList);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//수주상세별 출고 모니터링 조회
	@RequestMapping(value = "io/outMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outMonitoringList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 출고 모니터링 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> list = outWhsAdmService.outMonitoringList(outWhsAdmVo);
			if(list==null) {
				list = new ArrayList<OutWhsAdmVo>();
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
	
	//재공창고현항
	//재공창고 기본조회
	@RequestMapping(value = "io/wareHouseList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> wareHouseList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 출고 모니터링 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> list = outWhsAdmService.wareHouseList(outWhsAdmVo);
			if(list==null) {
				list = new ArrayList<OutWhsAdmVo>();
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
	
	//재공창고 상세조회
	@RequestMapping(value = "io/wareHouseRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> wareHouseRead(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 출고 모니터링 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> list = outWhsAdmService.wareHouseRead(outWhsAdmVo);
			if(list==null) {
				list = new ArrayList<OutWhsAdmVo>();
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


