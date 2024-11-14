package mes.web.io;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.io.ItemUnitcostHisAdmService;
import mes.service.io.PurchaseOrderAdmService;
import mes.service.tm.StockAdjustAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.cm.Constants;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class InOutWhsAdmController {

	private static final Logger logger = LoggerFactory.getLogger(InOutWhsAdmController.class);

	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	@Inject
	private PurchaseOrderAdmService purchaseOrderAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private ItemUnitcostHisAdmService itemUnitcostHisAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private StockAdjustAdmService stockAdjustAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	
	// 가입고등록 사출 메인
	@RequestMapping(value = "/iosc0040", method = RequestMethod.GET)
	public String iosc0040(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
		List<CommonCodeAdmVo> inspectYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectYn", inspectYnList);

		commonCodeVo.setBaseGroupCd("075"); // 추가수량에 대한 무료/유료
		List<CommonCodeAdmVo> payYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("payYn", payYnList);
		
		commonCodeVo.setBaseGroupCd("153");
		List<CommonCodeAdmVo> poStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("poStatus", poStatusList);

		return "io/iosc0040";
	}
	
	// 가입고등록 봉제 메인
	@RequestMapping(value = "/iosc0320", method = RequestMethod.GET)
	public String iosc0320(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
		List<CommonCodeAdmVo> inspectYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectYn", inspectYnList);

		commonCodeVo.setBaseGroupCd("075"); // 추가수량에 대한 무료/유료
		List<CommonCodeAdmVo> payYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("payYn", payYnList);
		

		return "io/iosc0320";
	}

	// 가입고등록 정밀가공 메인
	@RequestMapping(value = "/iosc0430", method = RequestMethod.GET)
	public String iosc0430(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
		List<CommonCodeAdmVo> inspectYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectYn", inspectYnList);

		commonCodeVo.setBaseGroupCd("075"); // 추가수량에 대한 무료/유료
		List<CommonCodeAdmVo> payYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("payYn", payYnList);
		

		return "io/iosc0430";
	}
	
	// 입고등록 메인
	@RequestMapping(value = "/iosc0120", method = RequestMethod.GET)
	public String iosc0120(Locale locale, Model model, HttpSession session) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		if(!(session.getAttribute(Constants.PRCSS_GUBUN).equals(""))) {
			inOutWhsAdmVo.setMainGubun(session.getAttribute(Constants.PRCSS_GUBUN).toString());	
		}
		List<InOutWhsAdmVo> locationCdList = inOutWhsAdmService.getLocationCd(inOutWhsAdmVo);
		model.addAttribute("locationCd", locationCdList);
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemList);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		commonCodeVo.setUseYn("001");
		itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemList);
		
		return "io/iosc0120";
	}
	
	// 구매자재관리(입고현황-사출) 메인
	@RequestMapping(value = "/iosc0050", method = RequestMethod.GET)
	public String iosc0050(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverMonth", DateUtil.getToday("yyyy-mm-dd").substring(0, 7));
		
		return "io/iosc0050";
	}
	
	//기간별입고현황(봉제) 메인
	@RequestMapping(value = "/iosc0270", method = RequestMethod.GET)
	public String iosc0270(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverMonth", DateUtil.getToday("yyyy-mm-dd").substring(0, 7));
		return "io/iosc0270";
	}
	
	// 구매자재관리(입고라벨출력) 메인
	@RequestMapping(value = "/iosc0230", method = RequestMethod.GET)
	public String iosc0230(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0230";
	}
	
	// 구매자재관리(입고라벨출력) 메인
	@RequestMapping(value = "/iosc0280", method = RequestMethod.GET)
	public String iosc0280(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0280";
	}
	
	// 구매자재관리(입고라벨출력, 정밀가공) 메인
	@RequestMapping(value = "/iosc0460", method = RequestMethod.GET)
	public String iosc0460(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0460";
	}
	
	
	// 개별입고등록 메인
	@RequestMapping(value = "/iosc0210", method = RequestMethod.GET)
	public String iosc0210(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("075"); // 추가수량에 대한 무료/유료
		List<CommonCodeAdmVo> payYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("payYn", payYnList);
		
		commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
		List<CommonCodeAdmVo> inspectYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectYn", inspectYnList);
		
		return "io/iosc0210";
	}
	
	//가입고등록 상세조회
	@RequestMapping(value = "io/preInOutWhsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preInOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("가입고목록 : "+inOutWhsAdmVo);
		try {
			if((inOutWhsAdmVo.getPoNo()!=null && !inOutWhsAdmVo.getPoNo().equals(""))
					|| (inOutWhsAdmVo.getInSlipNo()!=null && !inOutWhsAdmVo.getInSlipNo().equals(""))) {
				
				List<InOutWhsAdmVo> inOutWhsAdmList = inOutWhsAdmService.preInOutWhsAdmList(inOutWhsAdmVo);
				jsonData.put("data", inOutWhsAdmList);
			}else {
				List<InOutWhsAdmVo> list = new ArrayList<InOutWhsAdmVo>();
				jsonData.put("data", list);
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
	
	//가입고등록 등록
	@RequestMapping(value="io/preInOutWhsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> preInOutWhsAdmCreate(@RequestBody List<Map<String, Object>> inOutWhsAdmList) throws Exception{
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("가입고등록:"+inOutWhsAdmVo);
		try {
			float sum = Float.parseFloat(inOutWhsAdmList.get(0).get("sum").toString());
			float ordQty = Float.parseFloat(inOutWhsAdmList.get(0).get("ordQty").toString()); //발주수량	
			
			logger.info("sum : "+sum);
			logger.info("ordQty : "+ordQty);
			
			inOutWhsAdmVo.setPoNo(inOutWhsAdmList.get(0).get("poNo").toString());
			inOutWhsAdmVo.setPoSeq(inOutWhsAdmList.get(0).get("poSeq").toString());
			inOutWhsAdmVo.setItemSeq(inOutWhsAdmList.get(0).get("itemSeq").toString());
			inOutWhsAdmVo.setItemCd(inOutWhsAdmList.get(0).get("itemCd").toString());
			inOutWhsAdmVo.setOrdQty(inOutWhsAdmList.get(0).get("ordQty").toString());
			
			logger.info("inSeq:"+inOutWhsAdmList.get(0).get("inSeq").toString());
			
			
			int count = 0;
			for(Map<String, Object> m :inOutWhsAdmList) {
				logger.info("count"+count);
				
				if(m.get("inSlipNo").toString().equals("")||m.get("inSlipNo").toString()==null) {
					if(count==0) {
						//입고전표번호구하기
						String today = DateUtil.getToday("YYYYMMdd");
						inOutWhsAdmVo.setToday(today);
						String inSlipNo = inOutWhsAdmService.getInSlipNo(inOutWhsAdmVo);
						logger.info("입고전표번호:"+today+"-"+inSlipNo);
						
						inOutWhsAdmVo.setInSlipNo(today+"-"+inSlipNo);
						
						count++;
					}
				}else {
					inOutWhsAdmVo.setInSlipNo(m.get("inSlipNo").toString());
				}
				
				inOutWhsAdmVo.setPreInWhsDate(m.get("preInWhsDate").toString());
				inOutWhsAdmVo.setPreInWhsQty(m.get("preInWhsQty").toString());
				inOutWhsAdmVo.setLotNo(m.get("lotNo").toString());
				
				if(m.get("inSlipNo").toString().equals("")||m.get("inSlipNo").toString()==null) {
					
					//입고전표시퀀스구하기
					logger.info("입고전표시퀀스:"+inOutWhsAdmService.getInSlipSeq(inOutWhsAdmVo));
					inOutWhsAdmVo.setInSlipSeq(inOutWhsAdmService.getInSlipSeq(inOutWhsAdmVo));
					inOutWhsAdmVo.setInSeq(inOutWhsAdmService.getInSeq(inOutWhsAdmVo));
					
					String date = inOutWhsAdmVo.getItemSeq()+"-"+inOutWhsAdmVo.getPreInWhsDate().substring(2,8);
					String poSeq = inOutWhsAdmService.getBarcodeSeq(date);
					String barcodeNo = date+"-"+ poSeq;
					logger.info("barcodeNo:"+barcodeNo);
					
					inOutWhsAdmVo.setBarcodeNo(barcodeNo);
					inOutWhsAdmVo.setRegId(Utils.getUserId());
					
					//창고 정보
					inOutWhsAdmVo.setLocationCd(m.get("locationCd").toString());
					inOutWhsAdmVo.setAreaCd(m.get("areaCd").toString());
					inOutWhsAdmVo.setFloorCd(m.get("floorCd").toString());
					inOutWhsAdmVo.setLocationNo(m.get("locationNo").toString());
					
					inOutWhsAdmService.preInOutWhsAdmCreate(inOutWhsAdmVo);
					
				}else {
					inOutWhsAdmVo.setInSlipSeq(m.get("inSlipSeq").toString());
					inOutWhsAdmVo.setInSeq(m.get("inSeq").toString());
					
					//창고 정보
					inOutWhsAdmVo.setLocationCd(m.get("locationCd").toString());
					inOutWhsAdmVo.setAreaCd(m.get("areaCd").toString());
					inOutWhsAdmVo.setFloorCd(m.get("floorCd").toString());
					inOutWhsAdmVo.setLocationNo(m.get("locationNo").toString());
					
					inOutWhsAdmVo.setUpdId(Utils.getUserId());
					inOutWhsAdmService.preInOutWhsAdmUpdate(inOutWhsAdmVo);
					
					logger.info("수정성공!");
				}
				
				
				//발주상세테이블(발주상태값 수정)
				PurchaseOrderAdmVo purchaseOrderAdmVo = new PurchaseOrderAdmVo();
				purchaseOrderAdmVo.setPoNo(inOutWhsAdmVo.getPoNo());
				purchaseOrderAdmVo.setPoSeq(inOutWhsAdmVo.getPoSeq());
				
				if(sum==ordQty) {
					purchaseOrderAdmVo.setPoStatus("003"); //발주완료
				}else {
					purchaseOrderAdmVo.setPoStatus("001"); //발주진행
				}
				
				logger.info("발주상태갑수정");
				purchaseOrderAdmService.poStatusUpdate(purchaseOrderAdmVo);
				
				jsonData.put("result", "ok");
			}
			
			/*
			 * if(sum<=ordQty) { }else { jsonData.put("result", "fail");
			 * jsonData.put("message", "발주수량값을 초과하였습니다. 확인해주세요"); }
			 */
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//가입고등록 삭제
	@RequestMapping(value = "io/preInOutWhsAdmDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preInOutWhsAdmDelete(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("가입고등록 삭제 : "+inOutWhsAdmVo);
		try {
			if(inOutWhsAdmVo.getInSlipNo()!=null || !inOutWhsAdmVo.getInSlipNo().equals("")) {
				if(!inOutWhsAdmService.statusCdCheck(inOutWhsAdmVo).equals("S")) {
					jsonData.put("result", "fail");
					jsonData.put("message", "이미 수입검사되어 삭제할 수 없습니다.");
				}else {
					inOutWhsAdmService.preInOutWhsAdmDelete(inOutWhsAdmVo);
					jsonData.put("result", "ok");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//가입고등록 자재상태 확인
	@RequestMapping(value = "io/statusCdCheck", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> statusCdCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재상태 확인 : "+inOutWhsAdmVo);
		try {
			
			if(inOutWhsAdmService.statusCdCheck(inOutWhsAdmVo).equals("L")) {
				jsonData.put("result", "ok");	//승인된 건 수정안됨
				jsonData.put("data", "L");
			}else if(inOutWhsAdmService.statusCdCheck(inOutWhsAdmVo).equals("S")) {
				jsonData.put("result", "ok");   //입고일자,입고수량,LOTNO,창고 수정 가능
				jsonData.put("data", "S");
			}else if(inOutWhsAdmService.statusCdCheck(inOutWhsAdmVo).equals("I")) {
				jsonData.put("result", "ok");	//창고 수정 가능
				jsonData.put("data", "I");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//입고등록 상세조회
	@RequestMapping(value = "io/inOutWhsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고목록 : " + inOutWhsAdmVo);
		try {
			List<InOutWhsAdmVo> inOutWhsAdmList = inOutWhsAdmService.inOutWhsAdmList(inOutWhsAdmVo);
			jsonData.put("data", inOutWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//기간별입고현황(봉제) 목록 조회
	@RequestMapping(value = "io/inOutWhsSewingList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsSewingList(InOutWhsAdmVo inOutWhsAdmVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별입고현황(봉제) 목록 조회 : " + inOutWhsAdmVo);
		try {
			String searchVal = inOutWhsAdmVo.getSearchVal();
			inOutWhsAdmVo.setSearchVal(URLDecoder.decode(searchVal, "UTF-8"));
			
			String ordDir = request.getParameter("order[0][dir]");
			String ordColumnIdx = request.getParameter("order[0][column]");
			String ordColumn = request.getParameter("columns["+ ordColumnIdx +"][data]");
			ordColumn =  Utils.convert2UnderscoreCase(ordColumn);
			inOutWhsAdmVo.setOrdDir(ordDir);
			inOutWhsAdmVo.setOrdColumn(ordColumn);
			
			List<InOutWhsAdmVo> inOutWhsAdmList = inOutWhsAdmService.inOutWhsSewingList(inOutWhsAdmVo);
			
			int totalCount = 0;
			if(inOutWhsAdmList.size() > 0) {
				totalCount = inOutWhsAdmList.get(0).getTotalCount();
			}
			jsonData.put("recordsTotal", totalCount);
			jsonData.put("recordsFiltered", totalCount);
			jsonData.put("data", inOutWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주현황 삭제 확인
	@RequestMapping(value = "io/inOutWhsDataCheck", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsDataCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주현황 삭제 확인 : "+inOutWhsAdmVo);
		try {
			String inOutWhsDataCheck = inOutWhsAdmService.inOutWhsDataCheck(inOutWhsAdmVo);
			jsonData.put("data", inOutWhsDataCheck);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//입고등록 목록조회
	@RequestMapping(value = "io/inOutWhsAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsAdmRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("입고상세목록 : " + inOutWhsAdmVo);
		try {
			InOutWhsAdmVo vo;
			
			if(inOutWhsAdmVo.getBarcodeNo() == null || inOutWhsAdmVo.getBarcodeNo().equals("")) {
				 vo = new InOutWhsAdmVo();
				 jsonData.put("data", vo);
				 jsonData.put("result", "ok");
				
			}else {
				vo = inOutWhsAdmService.inOutWhsAdmRead(inOutWhsAdmVo);
				
				if(vo==null) {
				
					jsonData.put("result", "empty");
				
				}else {
				
//					if(vo.getPairCnt() == null || vo.getPairCnt().equals("0.000")) {
//						jsonData.put("result", "notRemain");
//					} else {
					
						//수입검사 여부 : Y
						if(vo.getImportYn()!=null) {
							if(vo.getImportYn().equals("001")) {
								if(vo.getStatusCd().equals("I")) {
									jsonData.put("result", "notApproval");
								}else if(vo.getStatusCd().equals("S")) {
									jsonData.put("result", "notInspect");
								}else {
									jsonData.put("data", vo);
									jsonData.put("result", "ok");
								}
							}else {
								jsonData.put("data", vo);
								jsonData.put("result", "ok");
							}
						}else {
							jsonData.put("result", "ok");
						}
//					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//입고등록 등록
	@RequestMapping(value = "io/inOutWhsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inOutWhsAdmCreate(@RequestBody List<Map<String, Object>> inOutWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
//		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
//		ItemUnitcostHisAdmVo vo= new ItemUnitcostHisAdmVo();
		
		logger.info("입고등록 : " + inOutWhsAdmVo);   
		 
		try {
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			inOutWhsAdmVo.setInWhsDate(inOutWhsAdmList.get(0).get("inWhsDate").toString());
			inOutWhsAdmVo.setLocationNo(inOutWhsAdmList.get(0).get("locationNo").toString());
			inOutWhsAdmVo.setLocationCd(inOutWhsAdmList.get(0).get("locationCd").toString());
			inOutWhsAdmVo.setAreaCd(inOutWhsAdmList.get(0).get("areaCd").toString());
			inOutWhsAdmVo.setFloorNm(inOutWhsAdmList.get(0).get("floorNm").toString());
			inOutWhsAdmVo.setUpdId(Utils.getUserId());
			
			for(Map<String, Object> m : inOutWhsAdmList) {
				
				inOutWhsAdmVo.setPoNo(m.get("poNo").toString());
				inOutWhsAdmVo.setPoSeq(m.get("poSeq").toString());
				inOutWhsAdmVo.setInSeq(m.get("inSeq").toString());
				inOutWhsAdmVo.setItemSeq(m.get("itemSeq").toString());
				inOutWhsAdmVo.setInWhsQty(m.get("inWhsQty").toString());
				inOutWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				
				inOutWhsAdmVo.setInOutWhsCheck("true");
				inOutWhsAdmVo.setItemInspectCheck("false");
				
				//수입검사 승인 여부 체크필요
				inOutWhsAdmService.inOutWhsAdmCreate(inOutWhsAdmVo);
				
				// 수불관리 insert
//				stockPaymentAdmVo.setSpNo(spNo);
//				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
//				stockPaymentAdmVo.setSpType("001");
//				stockPaymentAdmVo.setSpCd(inOutWhsAdmVo.getItemSeq());
//				stockPaymentAdmVo.setSpDate(inOutWhsAdmVo.getInWhsDate());
//				stockPaymentAdmVo.setSpQty(inOutWhsAdmVo.getInWhsQty());
//				stockPaymentAdmVo.setBarcodeNo(inOutWhsAdmVo.getBarcodeNo());
				
				// 수불관리 update
				stockPaymentAdmVo.setSourceNo(inOutWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setLocationCd(inOutWhsAdmVo.getLocationCd());
				stockPaymentAdmVo.setAreaCd(inOutWhsAdmVo.getAreaCd());
				stockPaymentAdmVo.setFloorCd(inOutWhsAdmVo.getFloorNm());
				stockPaymentAdmVo.setLocationNo(inOutWhsAdmVo.getLocationNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());

				//insert가 아닌 update
				stockPaymentAdmService.stockPaymentAdmUpdate(stockPaymentAdmVo);
				
				//자재단가이력 Create
//				vo.setPartCd(inOutWhsAdmVo.getPartCd());
//				vo.setPartRev(inOutWhsAdmVo.getPartRev());
//				int lastUnitCost = itemUnitcostHisAdmService.getLastUnitCost(vo);
//				int unitCost = inOutWhsAdmService.getPartUnitCost(inOutWhsAdmVo);
//				
//				if(unitCost == 0) {
//					if(unitCost!=lastUnitCost) {
//						int partSeq = itemUnitcostHisAdmService.getPartSeq(vo);
//						
//						//이전 이력 종료일 Update
//						vo.setPartSeq(partSeq-1);
//						vo.setEndDate(DateUtil.getToday("yyyymmddhhmmss"));
//						vo.setUpdId(Utils.getUserId());
//						itemUnitcostHisAdmService.itemUnitcostHisAdmUpdate(vo);
//						
//						//자재이력관리 Create
//						vo.setUnitCost(unitCost);
//						vo.setStartDate(DateUtil.getToday("yyyymmddhhmmss"));
//						vo.setRegId(Utils.getUserId());
//						vo.setPartSeq(partSeq);
//						
//						itemUnitcostHisAdmService.itemUnitcostHisAdmCreate(vo);
//						
//						
//						//품목정보관리(부품) Update
//						//itemPartAdmVo.setPartCd(inOutWhsAdmVo.getPartCd());
//						//itemPartAdmVo.setPartRev(inOutWhsAdmVo.getPartRev());
//						//itemPartAdmVo.setUnitCost(unitCost);
//						itemPartAdmService.updateUnitCost(itemPartAdmVo);
//						
//					}
//				}
			}
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//창고바코드 스캔(창고,구역,위치 값  가져오기)
	@RequestMapping(value = "io/getLocInfo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getLocInfo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("창고/구역/위치 정보 vo : "+inOutWhsAdmVo);
		try {
			
			InOutWhsAdmVo locInfoList = inOutWhsAdmService.getLocInfo(inOutWhsAdmVo);
			
			if(locInfoList==null) {
				jsonData.put("result", "empty");
			}else{
				
				if(inOutWhsAdmVo.getStatus().equals("part")) {
					if(!locInfoList.getLocationCd().equals("001")) {
						jsonData.put("result", "notPartLocCd");
					}else {
						jsonData.put("result", "ok");
						jsonData.put("data", locInfoList);
					}
					
				}else if(inOutWhsAdmVo.getStatus().equals("item")) {
					if(!locInfoList.getLocationCd().equals("002")) {
						jsonData.put("result", "notItemLocCd");
					}else {
						jsonData.put("result", "ok");
						jsonData.put("data", locInfoList);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//구역정보 가져오기
	@RequestMapping(value = "io/getAreaCd", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAreaCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("구역정보 : "+inOutWhsAdmVo);
		try {
			List<InOutWhsAdmVo> areaCdList = inOutWhsAdmService.getAreaCd(inOutWhsAdmVo);
			jsonData.put("data", areaCdList);
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
	@RequestMapping(value = "io/getFloorCd", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getFloorCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("위치정보 : "+inOutWhsAdmVo);
		try {
			
			List<InOutWhsAdmVo> floorCdList = inOutWhsAdmService.getFloorCd(inOutWhsAdmVo);
			jsonData.put("data", floorCdList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//입고현황 목록조회
	@RequestMapping(value = "io/inOutWhsStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsStatusList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고현황 : "+inOutWhsAdmVo);
		try {
			
			List<InOutWhsAdmVo> inOutWhsStatusList = inOutWhsAdmService.inOutWhsStatusList(inOutWhsAdmVo);
			jsonData.put("data", inOutWhsStatusList);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}

	//발주대비 미입고현황 목록조회
	@RequestMapping(value = "io/inOutWhsStatusList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsStatusList2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주대비 미입고현황 : "+inOutWhsAdmVo);
		try {
			
			List<InOutWhsAdmVo> inOutWhsStatusList2 = inOutWhsAdmService.inOutWhsStatusList2(inOutWhsAdmVo);
			jsonData.put("data", inOutWhsStatusList2);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}


	//재고현황 목록조회
	@RequestMapping(value = "io/partInventoryDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partInventoryDtlList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고현황 목록조회 : "+inOutWhsAdmVo);
		try {
			
			List<InOutWhsAdmVo> partInventoryDtlList;
			
			if(inOutWhsAdmVo.getPartCd()==null || inOutWhsAdmVo.getPartCd().equals("")) {
				partInventoryDtlList = new ArrayList<>();
			}else {
				partInventoryDtlList = inOutWhsAdmService.partInventoryDtlList(inOutWhsAdmVo);
			}
			jsonData.put("data", partInventoryDtlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//수주상세별 입고 모니터링 목록조회
	@RequestMapping(value = "io/inMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inMonitoringList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 입고 모니터링 목록조회 : "+inOutWhsAdmVo);
		try {
			
			List<InOutWhsAdmVo> list = inOutWhsAdmService.inMonitoringList(inOutWhsAdmVo);
			if(list==null) {
				list = new ArrayList<InOutWhsAdmVo>();
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
	
	
	//******************개별입고**************************
	//개별입고 목록조회
	@RequestMapping(value = "io/individualAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> individualAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개별입고 목록조회 : "+inOutWhsAdmVo);
		try {
			
			List<InOutWhsAdmVo> list = inOutWhsAdmService.individualAdmList(inOutWhsAdmVo);
			if(list==null) {
				list = new ArrayList<InOutWhsAdmVo>();
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
	
	//개별입고 등록
	@RequestMapping(value="io/individualAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> individualAdmCreate(@RequestBody List<Map<String, Object>> inOutWhsAdmList) throws Exception{
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("개별입고등록:"+inOutWhsAdmVo);
		try {
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			
			for(Map<String, Object> m :inOutWhsAdmList) {
				//기본정보
				inOutWhsAdmVo.setPartCd(m.get("partCd").toString());
				inOutWhsAdmVo.setPartRev(m.get("partRev").toString());
				inOutWhsAdmVo.setPayYn(m.get("payYn").toString());
				inOutWhsAdmVo.setPreInWhsDate(m.get("preInWhsDate").toString());
				inOutWhsAdmVo.setPreInWhsQty(m.get("preInWhsQty").toString());
				inOutWhsAdmVo.setInWhsDesc(m.get("inWhsDesc").toString());
				inOutWhsAdmVo.setSpplyCorpCd(m.get("spplyCorpCd").toString());
				inOutWhsAdmVo.setInspectYn(m.get("inspectYn").toString());
				inOutWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				
				//수입검사여부
				//if(m.get("inspectYn").toString().equals("001"))	//수입검사 : Y
				
		
				logger.info("여기까지 들어옴");
				
				if(m.get("poNo").toString()=="" || m.get("poNo").toString()==null) {
					//발주번호
					String today = DateUtil.getToday("YYMMdd");
					String poNoSeq = inOutWhsAdmService.getPoNo(today);
					String poNo = "I"+today+"-"+poNoSeq;
					
					//바코드번호, lot번호
					String date = inOutWhsAdmVo.getPartCd()+"-"+DateUtil.getToday("yyyyMMdd").substring(2,8);
					String poSeq = inOutWhsAdmService.getBarcodeSeq(date);   
					String barcodeNo = date+"-"+ poSeq;
					
					inOutWhsAdmVo.setPoNo(poNo);
					inOutWhsAdmVo.setPoSeq("0");
					inOutWhsAdmVo.setInSeq("0");
					inOutWhsAdmVo.setBarcodeNo(barcodeNo);
					inOutWhsAdmVo.setLotNo(barcodeNo);
					inOutWhsAdmVo.setRegId(Utils.getUserId());
					inOutWhsAdmService.preInOutWhsAdmCreate(inOutWhsAdmVo);
					
				}else {
					inOutWhsAdmVo.setPoNo(m.get("poNo").toString());
					inOutWhsAdmVo.setPoSeq(m.get("poSeq").toString());
					inOutWhsAdmVo.setInSeq(m.get("inSeq").toString());
					inOutWhsAdmVo.setUpdId(Utils.getUserId());
					inOutWhsAdmService.preInOutWhsAdmUpdate(inOutWhsAdmVo);
				}
				
				//수입검사 : N -> 입고
				if(inOutWhsAdmVo.getInspectYn().equals("002")) {
					logger.info("수입검사 여부 확인 해야함");
					
					inOutWhsAdmVo.setInWhsDate(m.get("preInWhsDate").toString());
					inOutWhsAdmVo.setLocationNo(m.get("locationNo").toString());
					inOutWhsAdmVo.setLocationCd(m.get("locationCd").toString());
					inOutWhsAdmVo.setAreaCd(m.get("areaCd").toString());
					inOutWhsAdmVo.setFloorNm(m.get("floorNm").toString());
					inOutWhsAdmVo.setInWhsQty(m.get("preInWhsQty").toString());
					inOutWhsAdmVo.setUpdId(Utils.getUserId());
					
					//수입검사 승인 여부 체크필요
					inOutWhsAdmService.inOutWhsAdmCreate(inOutWhsAdmVo);
				
					
					// 수불관리 Create 
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType("001");
					stockPaymentAdmVo.setSpCd(inOutWhsAdmVo.getPartCd());
					stockPaymentAdmVo.setSpRev(inOutWhsAdmVo.getPartRev());
					stockPaymentAdmVo.setSpGubun("001");
					stockPaymentAdmVo.setSpDate(inOutWhsAdmVo.getInWhsDate());
					stockPaymentAdmVo.setSpQty(inOutWhsAdmVo.getInWhsQty());
					stockPaymentAdmVo.setBarcodeNo(inOutWhsAdmVo.getBarcodeNo());
					stockPaymentAdmVo.setSourceNo(inOutWhsAdmVo.getBarcodeNo());
					stockPaymentAdmVo.setLocationCd(inOutWhsAdmVo.getLocationCd());
					stockPaymentAdmVo.setAreaCd(inOutWhsAdmVo.getAreaCd());
					stockPaymentAdmVo.setFloorCd(inOutWhsAdmVo.getFloorNm());
					stockPaymentAdmVo.setLocationNo(inOutWhsAdmVo.getLocationNo());
					stockPaymentAdmVo.setRegId(Utils.getUserId());

					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				}	
				
				
				jsonData.put("result", "ok");
			}
				
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//라벨출력처리
	@RequestMapping(value = "io/preInOutWhsAdmLabelPrint", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preInOutWhsAdmLabelPrint(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("가입고등록 삭제 : "+inOutWhsAdmVo);
		try {
			inOutWhsAdmService.preInOutWhsAdmLabelPrint(inOutWhsAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//입고현황 목록조회
	@RequestMapping(value = "io/pdaItemList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> pdaItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("PDA품목 목록 : "+inOutWhsAdmVo);
		try {
				
			List<InOutWhsAdmVo> inOutWhsStatusList = inOutWhsAdmService.pdaItemList(inOutWhsAdmVo);
			jsonData.put("data", inOutWhsStatusList);
				
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
