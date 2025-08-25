package mes.web.po;

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
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.po.WorkOrderAdmVo;
import mes.domain.po.WorkOrderFaultyTypeVo;
import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderNonOperationVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.po.WorkOrderAdmService;
import mes.service.po.WorkOrderFaultyTypeService;
import mes.service.po.WorkOrderMatrlService;
import mes.service.po.WorkOrderNonOperationService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkOrderAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderAdmController.class);
	
	@Inject
	private WorkOrderAdmService workOrderAdmService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	@Inject
	private LocationAdmService locationAdmService;
	@Inject
	private WorkOrderFaultyTypeService workOrderFaultyTypeService;
	@Inject
	private WorkOrderMatrlService workOrderMatrlService;
	@Inject
	private ItemPartAdmService itemPartAdmService;
	@Inject
	private WorkOrderNonOperationService workOrderNonOperationService;
	
	// 생산실적관리(레이저) 메인
	@RequestMapping(value = "/posc0021", method = RequestMethod.GET)
		public String posc0021(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		CommonCodeAdmVo systemCommonCodeVo  = new CommonCodeAdmVo();
		systemCommonCodeVo.setBaseGroupCd("152"); // 온습도 범위
		List<CommonCodeAdmVo>  systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("tempHumiRangeCd", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("154"); //작업상태
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workStatus", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("151"); //비가동사유
		systemCommonCodeVo.setBaseAbbr("003"); //비가동사유
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workNonList", systemCommonCodeList );
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("001");
		equipCodeAdmVo.setEquipGubun("001");
		List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", equipList );
		  
		
		return "po/posc0021";
	}
	
	// 생산실적관리(레이저)_css조정 메인
	@RequestMapping(value = "/posc0022", method = RequestMethod.GET)
		public String posc0022(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		CommonCodeAdmVo systemCommonCodeVo  = new CommonCodeAdmVo();
		systemCommonCodeVo.setBaseGroupCd("152"); // 온습도 범위
		List<CommonCodeAdmVo>  systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("tempHumiRangeCd", systemCommonCodeList );
		return "po/posc0022";
	}
	
	// 생산실적관리(후가공) 메인
	@RequestMapping(value = "/wmsc0271", method = RequestMethod.GET)
		public String wmsc0271(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo systemCommonCodeVo  = new CommonCodeAdmVo();
		systemCommonCodeVo.setBaseGroupCd("152"); // 온습도 범위
		List<CommonCodeAdmVo>  systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("tempHumiRangeCd", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("155"); //작업상태
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workStatus", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("151"); //비가동사유
		systemCommonCodeVo.setBaseAbbr("003"); //비가동사유
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workNonList", systemCommonCodeList );
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("002");
		equipCodeAdmVo.setEquipGubun("001");
		List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", equipList );
		
		logger.info("DateUtil.getToday(\"yyyymmdd\").substring(0,6)"+DateUtil.getToday("yyyymmdd").substring(0,6));
		
		return "wm/wmsc0271";
	}
	
	// 생산실적관리(정밀가공) 메인
	@RequestMapping(value = "/wmsc0430", method = RequestMethod.GET)
		public String wmsc0430(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo systemCommonCodeVo  = new CommonCodeAdmVo();
		systemCommonCodeVo.setBaseGroupCd("152"); // 온습도 범위
		List<CommonCodeAdmVo>  systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("tempHumiRangeCd", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("155"); //작업상태
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workStatus", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("151"); //비가동사유
		systemCommonCodeVo.setBaseAbbr("003"); //비가동사유
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workNonList", systemCommonCodeList );
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("002");
		equipCodeAdmVo.setEquipGubun("001");
		List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", equipList );
		
		logger.info("DateUtil.getToday(\"yyyymmdd\").substring(0,6)"+DateUtil.getToday("yyyymmdd").substring(0,6));
		
		return "wm/wmsc0430";
	}
	
	//생산지시현황(레이저) 메인
	@RequestMapping(value = "/wmsc0010", method = RequestMethod.GET)
	public String wmsc0010(Locale locale, Model model) throws Exception {
		logger.info("생산지시현황(레이저) 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("091"); // 품목구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemGubunList);
			
			commonCodeVo.setBaseGroupCd("045"); // 수주구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> contGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("contGubun", contGubunList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0010";
	}
		
	//생산지시현황(후가공) 메인
	@RequestMapping(value = "/wmsc0011", method = RequestMethod.GET)
	public String wmsc0011(Locale locale, Model model) throws Exception {
		logger.info("생산지시현황(후가공) 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("091"); // 품목구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemGubunList);
			
			commonCodeVo.setBaseGroupCd("045"); // 수주구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> contGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("contGubun", contGubunList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0011";
	}
		
	//생산지시현황(정밀가공) 메인
	@RequestMapping(value = "/wmsc0420", method = RequestMethod.GET)
	public String wmsc0420(Locale locale, Model model) throws Exception {
		logger.info("생산지시현황(정밀가공) 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("091"); // 품목구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemGubunList);
			
			commonCodeVo.setBaseGroupCd("045"); // 수주구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> contGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("contGubun", contGubunList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0420";
	}
	
	@RequestMapping(value = "po/workStartGetWorkOrdNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workStartGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String workOrdNo = workOrderAdmService.workStartGetWorkOrdNo(workOrderAdmVo);
			if(workOrdNo!=null && !workOrdNo.equals("")) {
				jsonData.put("workOrdNo", workOrdNo);
				jsonData.put("result", "ok");
			}else {
				jsonData.put("message", "현재 "+workOrderAdmVo.getEquipCd()+" 설비에 가공중인 작업지시가 없습니다. 설비를 다시 확인해주세요.");
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//작업지시번호 존재여부
	@RequestMapping(value = "po/workOrdNoExist", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workYnGetCount(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			int count = workOrderAdmService.workOrdNoExist(workOrderAdmVo);
			if(count>0) {
				jsonData.put("workOrdNo", workOrderAdmVo.getWorkOrdNo());
				jsonData.put("result", "ok");
			}else {
				jsonData.put("message", "존재하지 않는 작업지시번호입니다. 작업지시번호를 다시 확인해주세요.");
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(레이저) 정보
	@RequestMapping(value = "po/workOrderOperRaserList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderRaserListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("VO:"+workOrderAdmVo);
		try {
			WorkOrderAdmVo accData = workOrderAdmService.workOrderRaserAccList(workOrderAdmVo);
			
			WorkOrderAdmVo infoData = new WorkOrderAdmVo();
			List<WorkOrderAdmVo> list = workOrderAdmService.workOrderRaserListByWorkOrdNo(workOrderAdmVo);
			if(list.size()>0) {
				infoData = workOrderAdmService.workOrderRaserListByWorkOrdNo(workOrderAdmVo).get(0);
				
				//비가동테이블 INS
				if(infoData.getWorkStopDate()!=null && !infoData.getWorkStopDate().equals("")) {
					
				}
				
				//생산실적 테이블 UPD
				if(infoData.getWorkStatus()!=null && infoData.getWorkStatus().equals("E")) {
					if(infoData.getLotNo()==null) {
						workOrderAdmVo.setWorkOrdNo(infoData.getWorkOrdNo());
						workOrderAdmVo.setWorkStatus(infoData.getWorkStatus());
						workOrderAdmVo.setLotNo(workOrderAdmVo.getWorkOrdNo());
						workOrderAdmVo.setWorkChargr(Utils.getUserNumber());
						
						String yyyymmdd = infoData.getWorkStartDate();
						String yyyy = yyyymmdd.substring(0, 4);
						String mm  = yyyymmdd.substring(5,7);
						String dd  = yyyymmdd.substring(8,10);
						workOrderAdmVo.setWorkOrdDate(yyyy+mm+dd);
						
						workOrderAdmVo.setWorkStartDate(infoData.getWorkStartDate());
						workOrderAdmVo.setWorkEndDate(infoData.getWorkEndDate());
						workOrderAdmVo.setCheckStatus(infoData.getCheckStatus());
						workOrderAdmVo.setCheckStartDate(infoData.getCheckStartDate());
						//수동 workOrderAdmVo.setCheckEndDate(infoData.getCheckEndDate());
						workOrderAdmVo.setOutputQty("1");
						workOrderAdmVo.setFairQty("1");
						workOrderAdmVo.setFaultyQty("0");
						workOrderAdmVo.setUpdId(Utils.getUserNumber());
						workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
						
						//수불예외처리 구현
						StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
						String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo.setSpNo(spNo);
						stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
						stockPaymentAdmVo.setSpType(infoData.getItemGubun());
						stockPaymentAdmVo.setSpCd(infoData.getItemSeq());
						stockPaymentAdmVo.setSpGubun("001");
						stockPaymentAdmVo.setSpSubGubun("제품입고"); 
						stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo.setSpQty("1");
						stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
						stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
						LocationAdmVo locationAdmVo = new LocationAdmVo();
						locationAdmVo.setMainGubun(infoData.getMainGubun());
						locationAdmVo.setLocCd(infoData.getMainGubun().equals("001")?"016":"017");	
						LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
						stockPaymentAdmVo.setLocationCd(list0.getLocCd());
						stockPaymentAdmVo.setLocationNo(list0.getLocNo());
						stockPaymentAdmVo.setRegId(Utils.getUserId());
						stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
						
						//1.자재투입건 확인
						//2.bom리스트확인
						//3.수불 자재 확인 
						//4.자재투입 ins
						//5.수불(자재출고) ins
						WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
						workOrderMatrlVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
						if(workOrderMatrlService.workOrdMatrlListAdm(workOrderMatrlVo).size()==0) {
							ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
							itemPartAdmVo.setUpperItemSeq(infoData.getItemSeq());
							itemPartAdmVo = itemPartAdmService.itemMotorEbomList(itemPartAdmVo).get(0);
							
							
							StockPaymentAdmVo stockPaymentAdmMatrlVo = new StockPaymentAdmVo();
							stockPaymentAdmMatrlVo.setItemSeq(itemPartAdmVo.getItemSeq());
							stockPaymentAdmMatrlVo.setLocationCd("014"); //레이저 현장창고
							stockPaymentAdmMatrlVo.setTmMon(yyyy+mm);
							List<StockPaymentAdmVo> list2 = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmMatrlVo);
							if(list2.size()>0) {
								
								WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
								workOrderMatrlUpdVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
								workOrderMatrlUpdVo.setWorkOrdSeq("0");
								workOrderMatrlUpdVo.setMiddlePrcssCd("0");
								workOrderMatrlUpdVo.setMinorPrcssCd("0");
								workOrderMatrlUpdVo.setItemSeq(list2.get(0).getItemSeq());
								workOrderMatrlUpdVo.setTotalConsumpt(Float.parseFloat("1"));
								workOrderMatrlUpdVo.setUseQty("1");
								workOrderMatrlUpdVo.setMatrlDate(yyyy+mm+dd);
								workOrderMatrlUpdVo.setBarcodeNo(list2.get(0).getBarcodeNo());
								workOrderMatrlUpdVo.setRegId(Utils.getUserNumber());
								workOrderMatrlService.workOrdMatrlAdd(workOrderMatrlUpdVo);
								
								//수불예외처리 구현
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType("004");
								stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("002");
								stockPaymentAdmVo.setSpSubGubun("자재투입"); 
								stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
								stockPaymentAdmVo.setSpQty("1");
								stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
								stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
								locationAdmVo.setMainGubun(infoData.getMainGubun());
								locationAdmVo.setLocCd(infoData.getMainGubun().equals("001")?"014":"015");	
								LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
								stockPaymentAdmVo.setLocationCd(list1.getLocCd());
								stockPaymentAdmVo.setLocationNo(list1.getLocNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
							}else {
								logger.info("투입할 자재가 없습니다.");
							
							}
							
						}else {
							logger.info("이미투입했습니다.");
						}
					}
					
				}else {
					workOrderAdmVo.setWorkOrdNo(infoData.getWorkOrdNo());
					workOrderAdmVo.setWorkChargr(Utils.getUserNumber());
					if(infoData.getWorkStartDate()!=null) {
						workOrderAdmVo.setWorkStatus("S");
						String yyyymmdd = infoData.getWorkStartDate();
						String yyyy = yyyymmdd.substring(0, 4);
						String mm  = yyyymmdd.substring(5,7);
						String dd  = yyyymmdd.substring(8,10);
						workOrderAdmVo.setWorkOrdDate(yyyy+mm+dd);
					}
					
					workOrderAdmVo.setUpdId(Utils.getUserNumber());
					workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
				}
				
				jsonData.put("infoData", infoData);
				jsonData.put("accData", accData);
				jsonData.put("result", "ok");
			}else {
				jsonData.put("message", "해당 설비에 가동중인 작업지시가 없습니다. 설비를 다시 확인해주세요.");
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(레이저) 생산현황 조회
	@RequestMapping(value = "po/workOrderStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderStatusList(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("VO:"+workOrderAdmVo);
		try {
			List<WorkOrderAdmVo> list = workOrderAdmService.workOrderRaserListByWorkOrdNo(workOrderAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//생산실적(레이저) 작업지시등록
	@RequestMapping(value = "po/workOrderAdmLaserIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmLaserIns(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적(레이저) 작업지시등록 :" + workOrderAdmVo);
		try {
			int dtlOrdCnt = Integer.parseInt(workOrderAdmVo.getDtlOrdCnt());
			String contDtlNo = workOrderAdmVo.getContDtlNo();
			String workOrdNo = workOrderAdmService.workOrderAdmGetWorkOrdNo(workOrderAdmVo);
			String equipCd = workOrderAdmVo.getEquipCd();
			String itemSeq = workOrderAdmVo.getItemSeq();
			
			List<WorkOrderAdmVo> workOrderAdmVoList = new ArrayList<WorkOrderAdmVo>();
			for(int i=0;i<dtlOrdCnt;i++){
				WorkOrderAdmVo workOrderAdmEmptyVo = new WorkOrderAdmVo();
				workOrderAdmEmptyVo.setContDtlNo(contDtlNo);
				workOrderAdmEmptyVo.setWorkOrdNo(workOrdNo + "-" + String.format("%03d", i+1));
				workOrderAdmEmptyVo.setEquipCd(equipCd);
				workOrderAdmEmptyVo.setItemSeq(itemSeq);
				workOrderAdmEmptyVo.setRegId(Utils.getUserNumber());
				workOrderAdmVoList.add(workOrderAdmEmptyVo);
			};
			
			// 생산실적(레이저) 작업지시등록할 항목이 있을 경우
			if(workOrderAdmVoList.size() != 0) {
				workOrderAdmService.workOrderAdmIns(workOrderAdmVoList); // 생산실적(레이저) 작업지시등록
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(후가공) 작업지시등록
	@RequestMapping(value = "po/workOrderAdmFinishIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmFinishIns(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적(후가공) 작업지시등록 :" + workOrderAdmVo);
		try {
			int dtlOrdCnt = Integer.parseInt(workOrderAdmVo.getDtlOrdCnt());
			String contDtlNo = workOrderAdmVo.getContDtlNo();
			String workOrdNo = workOrderAdmService.workOrderAdmGetWorkOrdNo(workOrderAdmVo);
			String equipCd = workOrderAdmVo.getEquipCd();
			String itemSeq = workOrderAdmVo.getItemSeq();
			
			List<WorkOrderAdmVo> workOrderAdmVoList = new ArrayList<WorkOrderAdmVo>();
			for(int i=0;i<1;i++){ // 후가공은 계획 하나당 작지 하나 생성
				WorkOrderAdmVo workOrderAdmEmptyVo = new WorkOrderAdmVo();
				workOrderAdmEmptyVo.setContDtlNo(contDtlNo);
				workOrderAdmEmptyVo.setWorkOrdNo(workOrdNo + "-" + String.format("%03d", i+1));
				workOrderAdmEmptyVo.setEquipCd(equipCd);
				workOrderAdmEmptyVo.setItemSeq(itemSeq);
				workOrderAdmEmptyVo.setRegId(Utils.getUserNumber());
				workOrderAdmVoList.add(workOrderAdmEmptyVo);
			};
			
			// 생산실적(레이저) 작업지시등록할 항목이 있을 경우
			if(workOrderAdmVoList.size() != 0) {
				workOrderAdmService.workOrderAdmIns(workOrderAdmVoList); // 생산실적(레이저) 작업지시등록
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(레이저) 삭제
	@RequestMapping(value = "po/workOrderAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적(레이저) 삭제");
		try {
			workOrderAdmService.workOrderAdmDel(workOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//생산실적(레이저) 수정
	@RequestMapping(value = "po/workOrderAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmUpd() throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderAdmVo vo = new WorkOrderAdmVo();
		logger.info("생산실적(레이저) 수정");
		try {
			//workOrderAdmVo.setWorkStatus("E");
			List<WorkOrderAdmVo> list = workOrderAdmService.workOrderRaserListByWorkOrdNo(vo);
			
			if(list.size()>0) {
				for(int i=0; i<list.size(); i++) {
					
					//등록되지 않은 경우
					if(list.get(i).getWorkStatus()!=null && list.get(i).getWorkStatus().equals("E")) {
						if(list.get(i).getLotNo()==null) {
							
							WorkOrderAdmVo workOrderAdmVo = new WorkOrderAdmVo();
							
							workOrderAdmVo.setWorkOrdNo(list.get(i).getWorkOrdNo());
							workOrderAdmVo.setWorkStatus(list.get(i).getWorkStatus());
							workOrderAdmVo.setLotNo(list.get(i).getWorkOrdNo());
							workOrderAdmVo.setWorkChargr(Utils.getUserNumber());
							String yyyymmdd = list.get(i).getWorkStartDate();
							String yyyy = yyyymmdd.substring(0, 4);
							String mm  = yyyymmdd.substring(5,7);
							String dd  = yyyymmdd.substring(8,10);
							workOrderAdmVo.setWorkOrdDate(yyyy+mm+dd);
							workOrderAdmVo.setWorkStartDate(list.get(i).getWorkStartDate());
							workOrderAdmVo.setWorkEndDate(list.get(i).getWorkEndDate());
							workOrderAdmVo.setCheckStatus(list.get(i).getCheckStatus());
							workOrderAdmVo.setCheckStartDate(list.get(i).getCheckStartDate());
							//수동으로등록 workOrderAdmVo.setCheckEndDate(list.get(i).getCheckEndDate());
							workOrderAdmVo.setOutputQty("1");
							workOrderAdmVo.setFairQty("1");
							workOrderAdmVo.setFaultyQty("0");
							workOrderAdmVo.setUpdId(Utils.getUserNumber());
							workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
							
							
							//수불예외처리 구현!
							StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
							stockPaymentAdmVo.setSourceNo(list.get(i).getWorkOrdNo());
							stockPaymentAdmVo.setLocationCd(list.get(i).getMainGubun().equals("001")?"016":"017"); 
							
							String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
							stockPaymentAdmVo.setSpNo(spNo);
							stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
							stockPaymentAdmVo.setSpType(list.get(i).getItemGubun());
							stockPaymentAdmVo.setSpCd(list.get(i).getItemSeq());
							stockPaymentAdmVo.setSpGubun("001");
							stockPaymentAdmVo.setSpSubGubun("제품입고");
							stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
							stockPaymentAdmVo.setSpQty("1");
							stockPaymentAdmVo.setBarcodeNo(list.get(i).getWorkOrdNo());
							stockPaymentAdmVo.setSourceNo(list.get(i).getWorkOrdNo());
							LocationAdmVo locationAdmVo = new LocationAdmVo();
							locationAdmVo.setMainGubun(list.get(i).getMainGubun());
							locationAdmVo.setLocCd(list.get(i).getMainGubun().equals("001")?"016":"017");	
							LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
							stockPaymentAdmVo.setLocationCd(list0.getLocCd());
							stockPaymentAdmVo.setLocationNo(list0.getLocNo());
							stockPaymentAdmVo.setRegId(Utils.getUserId());
							stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
							
							//1.자재투입건 확인
							//2.bom리스트확인
							//3.수불 자재 확인 
							//4.자재투입 ins
							//5.수불(자재출고) ins
							WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
							workOrderMatrlVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
							if(workOrderMatrlService.workOrdMatrlListAdm(workOrderMatrlVo).size()==0) {
								ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
								itemPartAdmVo.setUpperItemSeq(list.get(i).getItemSeq());
								itemPartAdmVo = itemPartAdmService.itemMotorEbomList(itemPartAdmVo).get(0);
								
								
								StockPaymentAdmVo stockPaymentAdmMatrlVo = new StockPaymentAdmVo();
								stockPaymentAdmMatrlVo.setItemSeq(itemPartAdmVo.getItemSeq());
								stockPaymentAdmMatrlVo.setLocationCd("014"); //레이저 현장창고
								stockPaymentAdmMatrlVo.setTmMon(yyyy+mm);
								List<StockPaymentAdmVo> list2 = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmMatrlVo);
								if(list2.size()>0) {
									
									WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
									workOrderMatrlUpdVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
									workOrderMatrlUpdVo.setWorkOrdSeq("0");
									workOrderMatrlUpdVo.setMiddlePrcssCd("0");
									workOrderMatrlUpdVo.setMinorPrcssCd("0");
									workOrderMatrlUpdVo.setItemSeq(list2.get(0).getItemSeq());
									workOrderMatrlUpdVo.setTotalConsumpt(Float.parseFloat("1"));
									workOrderMatrlUpdVo.setUseQty("1");
									workOrderMatrlUpdVo.setMatrlDate(yyyy+mm+dd);
									workOrderMatrlUpdVo.setBarcodeNo(list2.get(0).getBarcodeNo());
									workOrderMatrlUpdVo.setRegId(Utils.getUserNumber());
									workOrderMatrlService.workOrdMatrlAdd(workOrderMatrlUpdVo);
									
									//수불예외처리 구현
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType("004");
									stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("002");
									stockPaymentAdmVo.setSpSubGubun("자재투입"); 
									stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
									stockPaymentAdmVo.setSpQty("1");
									stockPaymentAdmVo.setBarcodeNo(list.get(i).getWorkOrdNo());
									stockPaymentAdmVo.setSourceNo(list.get(i).getWorkOrdNo());
									locationAdmVo.setMainGubun(list.get(i).getMainGubun());
									locationAdmVo.setLocCd(list.get(i).getMainGubun().equals("001")?"014":"015");	
									LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
									stockPaymentAdmVo.setLocationCd(list1.getLocCd());
									stockPaymentAdmVo.setLocationNo(list1.getLocNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
								}else {
									logger.info("투입할 자재가 없습니다.");
								
								}
								
							}else {
								logger.info("이미투입했습니다.");
							}
						}
						
					}else {
						if(list.get(i).getWorkRegYn()!=null && list.get(i).getWorkRegYn().equals("N")) {
							WorkOrderAdmVo workOrderAdmVo2 = new WorkOrderAdmVo();
							workOrderAdmVo2.setWorkOrdNo(list.get(i).getWorkOrdNo());
							workOrderAdmVo2.setWorkChargr(Utils.getUserNumber());
							
							if(list.get(i).getWorkStartDate()!=null) {
								workOrderAdmVo2.setWorkStatus("S");
								String yyyymmdd = list.get(i).getWorkStartDate().toString();
								logger.info("???");
								String yyyy = yyyymmdd.substring(0, 4);
								String mm  = yyyymmdd.substring(5,7);
								String dd  = yyyymmdd.substring(8,10);
								workOrderAdmVo2.setWorkOrdDate(yyyy+mm+dd);
							}
							
							workOrderAdmVo2.setUpdId(Utils.getUserNumber());
							workOrderAdmService.workOrderAdmUpd(workOrderAdmVo2);
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
	

	//생산지시현황 (수주지시별)
	@RequestMapping(value = "po/contNoAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> contNoAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("VO:"+workOrderAdmVo);
		try {
			List<WorkOrderAdmVo> list = workOrderAdmService.contNoAdmList(workOrderAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//생산지시현황 (작업지시별)
	@RequestMapping(value = "po/workOrderAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("VO:"+workOrderAdmVo);
		try {
			List<WorkOrderAdmVo> list = workOrderAdmService.workOrderAdmList(workOrderAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(후가공) 생산현황 조회
	@RequestMapping(value = "po/workOrderOperFinishList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderOperFinishList(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("VO:"+workOrderAdmVo);
		try {
			List<WorkOrderAdmVo> list = workOrderAdmService.workOrderFinishListByWorkOrdNo(workOrderAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(후가공) 정보
	@RequestMapping(value = "po/workOrderOperFinishRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderOperFinishRead(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();                                  
		logger.info("생산실적(후가공) 정보:"+workOrderAdmVo);
		try {
			
			List<WorkOrderAdmVo> list = workOrderAdmService.workOrderFinishListByWorkOrdNo(workOrderAdmVo);
			jsonData.put("data", list.get(0));
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산실적(후가공) 수정
	@RequestMapping(value = "po/workOrderAdmFinishUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmFinishUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>(); 
		LocationAdmVo locationAdmVo = new LocationAdmVo();
		
		logger.info("생산실적(후가공) 수정:"+workOrderAdmVo);
		try {
			workOrderAdmVo.setWorkChargr(Utils.getUserNumber());
			workOrderAdmVo.setUpdId(Utils.getUserNumber());
			if(workOrderAdmVo.getWorkStatus()!=null && workOrderAdmVo.getWorkStatus().equals("S")) {
				workOrderAdmVo.setLotNo(workOrderAdmVo.getWorkOrdNo());
				workOrderAdmVo.setWorkChargr(Utils.getUserNumber());
				workOrderAdmVo.setWorkOrdDate(DateUtil.getCurrentYyyymmdd());
				workOrderAdmVo.setWorkStartDate(DateUtil.getToday("yyyy-mm-dd hh:mm:ss:ms"));
				workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
			}else {
				
				workOrderAdmVo.setWorkEndDate(DateUtil.getToday("yyyy-mm-dd hh:mm:ss:ms"));
				workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
				
				//수불테이블 저장
				WorkOrderAdmVo infoData = workOrderAdmService.workOrderFinishListByWorkOrdNo(workOrderAdmVo).get(0);
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpNo(spNo);
				
				//양품창고(제품창고) 입고
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(infoData.getItemGubun());
				stockPaymentAdmVo.setSpCd(infoData.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("제품입고");
				stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpQty(infoData.getCapOutputCount());
				stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
				stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
				locationAdmVo.setMainGubun(infoData.getMainGubun());
				locationAdmVo.setLocCd("007");	
				LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmVo.setLocationCd(list0.getLocCd());
				stockPaymentAdmVo.setLocationNo(list0.getLocNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				//불량창고(부적합창고) 입고
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(infoData.getItemGubun());
				stockPaymentAdmVo.setSpCd(infoData.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("제품입고");
				stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpQty(infoData.getPackFaultyCount());
				stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
				stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
				locationAdmVo.setMainGubun(infoData.getMainGubun());
				locationAdmVo.setLocCd(infoData.getMainGubun().equals("001")?"005":"009");	
				LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmVo.setLocationCd(list1.getLocCd());
				stockPaymentAdmVo.setLocationNo(list1.getLocNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				
				//1.자재투입건 확인
				//2.bom리스트확인
				//3.수불 자재 확인 
				//4.자재투입 ins
				//5.수불(자재출고) ins
				WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
				workOrderMatrlVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
				if(workOrderMatrlService.workOrdMatrlListAdm(workOrderMatrlVo).size()==0) {
					ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
					itemPartAdmVo.setUpperItemSeq(infoData.getItemSeq());
					List<ItemPartAdmVo> matrlList = itemPartAdmService.itemMotorEbomList(itemPartAdmVo);
					if(matrlList.size()>0) {
						for(int i=0; i<matrlList.size(); i++) {
							StockPaymentAdmVo stockPaymentAdmMatrlVo = new StockPaymentAdmVo();
							stockPaymentAdmMatrlVo.setItemSeq(matrlList.get(i).getItemSeq());
							stockPaymentAdmMatrlVo.setLocationCd("015"); //레이저 현장창고
							stockPaymentAdmMatrlVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							List<StockPaymentAdmVo> list2 = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmMatrlVo);
							
							if(list2.size()>0) {
								int outputQty  = Integer.parseInt(infoData.getCapInputCount());
								float consumpt = Float.parseFloat(matrlList.get(i).getItemConsumpt());
								float totalQty = outputQty*consumpt;
								
								for(int j=0; j<list2.size(); j++) {
									if(totalQty>0) {
										float tmQty = Float.parseFloat(list2.get(j).getRealQty());
										float useQty = totalQty>tmQty?tmQty:totalQty;
										totalQty -= useQty;
										
										WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
										workOrderMatrlUpdVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
										workOrderMatrlUpdVo.setWorkOrdSeq("0");
										workOrderMatrlUpdVo.setMiddlePrcssCd("0");
										workOrderMatrlUpdVo.setMinorPrcssCd("0");
										workOrderMatrlUpdVo.setItemSeq(list2.get(j).getItemSeq());
										workOrderMatrlUpdVo.setTotalConsumpt(Float.parseFloat(Float.toString(useQty)));
										workOrderMatrlUpdVo.setUseQty(Float.toString(useQty));
										workOrderMatrlUpdVo.setMatrlDate(DateUtil.getCurrentYyyymmdd());
										workOrderMatrlUpdVo.setBarcodeNo(list2.get(j).getBarcodeNo());
										workOrderMatrlUpdVo.setRegId(Utils.getUserNumber());
										workOrderMatrlService.workOrdMatrlAdd(workOrderMatrlUpdVo);
										
										//수불예외처리 구현
										stockPaymentAdmVo.setSpNo(spNo);
										stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
										stockPaymentAdmVo.setSpType("004");
										stockPaymentAdmVo.setSpCd(list2.get(j).getItemSeq());
										stockPaymentAdmVo.setSpGubun("002");
										stockPaymentAdmVo.setSpSubGubun("자재투입"); 
										stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
										stockPaymentAdmVo.setSpQty(Float.toString(useQty));
										stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
										stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
										locationAdmVo.setMainGubun(infoData.getMainGubun());
										locationAdmVo.setLocCd(infoData.getMainGubun().equals("001")?"014":"015");	
										LocationAdmVo list3 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
										stockPaymentAdmVo.setLocationCd(list3.getLocCd());
										stockPaymentAdmVo.setLocationNo(list3.getLocNo());
										stockPaymentAdmVo.setRegId(Utils.getUserId());
										stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									}else {
										logger.info("실적수량만큼 투입했습니다");
									}
								}
							}else {
								logger.info("투입할 자재가 없습니다.");
							}
						}
					}else {
						logger.info("개발관리에 등록이 안되어있습니다.");
					}
						
				}else {
					logger.info("이미투입했습니다.");
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
	
	
	//불량등록 조회
	@RequestMapping(value = "/po/workOrderFaultyList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderFaultyList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량등록 조회: " + workOrderFaultyTypeVo);
		try {
			List<WorkOrderFaultyTypeVo> list = workOrderFaultyTypeService.workOrderFaultyList(workOrderFaultyTypeVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//작업지시 불량등록(레이저)
	@RequestMapping(value = "/po/workOrdFaultyRaserIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdFaultyRaserIns(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		logger.info("작업지시 불량등록(봉제)");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		try {
			
			int faultyQty = 0;
			
			for(Map<String, Object> m :workOrdList) {
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq("0");
				workOrderFaultyTypeVo.setMinorPrcssCd("0");
				workOrderFaultyTypeVo.setMiddlePrcssCd("0");
				workOrderFaultyTypeVo.setFaultyTypeSeq("0");
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setFaultyCavity("");
				workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
				workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
				workOrderFaultyTypeVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
				
				if(workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size()==0) {
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo);
				}else {
					workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
					workOrderFaultyTypeService.update(workOrderFaultyTypeVo);
				}
				
				
				if(m.get("faultyTypeQty")!=null && !m.get("faultyTypeQty").equals("0")) {
					faultyQty++;
				}
				
			}
			
			//생산실적 수정
			WorkOrderAdmVo workOrderAdmVo = new WorkOrderAdmVo();
			workOrderAdmVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			
			if(faultyQty>0) {
				workOrderAdmVo.setCheckPass("NG");
				workOrderAdmVo.setFairQty("0");
				workOrderAdmVo.setFaultyQty("1");
			}else {
				workOrderAdmVo.setCheckPass("OK");
				workOrderAdmVo.setFairQty("1");
				workOrderAdmVo.setFaultyQty("0");
			}
			workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
			
			if(faultyQty>0) {
				
				WorkOrderAdmVo infoData = workOrderAdmService.workOrderRaserListByWorkOrdNo(workOrderAdmVo).get(0);

				LocationAdmVo locationAdmVo = new LocationAdmVo();
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(infoData.getItemGubun());
				stockPaymentAdmVo.setSpCd(infoData.getItemSeq());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun("이동출고"); 
				stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpQty("1");
				stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
				stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
				locationAdmVo.setMainGubun(infoData.getMainGubun());
				locationAdmVo.setLocCd(infoData.getMainGubun().equals("001")?"016":"017");	
				LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmVo.setLocationCd(list0.getLocCd());
				stockPaymentAdmVo.setLocationNo(list0.getLocNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(infoData.getItemGubun());
				stockPaymentAdmVo.setSpCd(infoData.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("이동입고"); 
				stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpQty("1");
				stockPaymentAdmVo.setBarcodeNo(infoData.getWorkOrdNo());
				stockPaymentAdmVo.setSourceNo(infoData.getWorkOrdNo());
				locationAdmVo.setMainGubun(infoData.getMainGubun());
				locationAdmVo.setLocCd(infoData.getMainGubun().equals("001")?"005":"009");	
				LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
				stockPaymentAdmVo.setLocationCd(list1.getLocCd());
				stockPaymentAdmVo.setLocationNo(list1.getLocNo());
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


	//작업지시 불량등록(후가공)
	@RequestMapping(value = "/po/workOrdFaultyFinishIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdFaultyFinishIns(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		logger.info("작업지시 불량등록(봉제)");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		try {
			workOrderFaultyTypeVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			
			for(Map<String, Object> m :workOrdList) {
				if(m.get("faultyTypeQty")!=null && !m.get("faultyTypeQty").equals("0")) {
					workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
					workOrderFaultyTypeVo.setMiddlePrcssCd("0");
					workOrderFaultyTypeVo.setMinorPrcssCd("0");
					workOrderFaultyTypeVo.setWorkOrdSeq("0");
					workOrderFaultyTypeVo.setFaultyTypeSeq("0");
					workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
					workOrderFaultyTypeVo.setFaultyCavity("");
					workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
					workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
					workOrderFaultyTypeVo.setApprovalYn("");
					workOrderFaultyTypeVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo);
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
	
	//후가공-박스라벨
	//박스라벨 조회
	@RequestMapping(value = "po/boxLabelAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> boxLabelAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderAdmVo> list = workOrderAdmService.boxLabelAdmList(workOrderAdmVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//박스라벨 등록
	@RequestMapping(value = "po/boxLabelAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> boxLabelAdmIns(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적(후가공) 박스라벨 등록 :" + workOrderAdmVo);
		try {
			int insCount = workOrderAdmService.boxLabelAdmList(workOrderAdmVo).size();//16
			int boxCount = Integer.parseInt(workOrderAdmVo.getBoxLoadCount());
			int labelAddCount = boxCount-insCount;
			
			String boxIdx = workOrderAdmService.getBoxIdx(workOrderAdmVo);
			String boxLabelNo = workOrderAdmService.getBoxLabelNo(workOrderAdmVo);
			int cnt = 0;
				
			List<WorkOrderAdmVo> workOrderAdmVoList = new ArrayList<WorkOrderAdmVo>();
			
			for(int i=0; i<labelAddCount; i++) {
				WorkOrderAdmVo workOrderAdmEmptyVo = new WorkOrderAdmVo();
				workOrderAdmEmptyVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
				workOrderAdmEmptyVo.setBoxIdx(boxIdx);
				workOrderAdmEmptyVo.setBoxLabelNo(boxLabelNo.substring(0,15)+String.format("%03d", Integer.parseInt(boxLabelNo.substring(15,18))+cnt));
				workOrderAdmEmptyVo.setEquipCd(workOrderAdmVo.getEquipCd());
				workOrderAdmEmptyVo.setBoxLabelDate(DateUtil.getCurrentYyyymmdd());
				workOrderAdmEmptyVo.setBoxLabelChargr(Utils.getUserNumber());
				workOrderAdmEmptyVo.setLabelPrintYn("N");
				workOrderAdmEmptyVo.setRegId(Utils.getUserNumber());
				workOrderAdmVoList.add(workOrderAdmEmptyVo);
				logger.info("ddd!!!!!!!!!:"+workOrderAdmEmptyVo.getBoxLabelNo());
				cnt++;
			}
			

			for ( int finishIdx = 0; finishIdx < workOrderAdmVoList.size(); finishIdx+=999 ) {
				if ( finishIdx+999 >= workOrderAdmVoList.size()) {
					List<WorkOrderAdmVo> tempList = workOrderAdmVoList.subList(finishIdx, workOrderAdmVoList.size());
					workOrderAdmService.boxLabelAdmIns(tempList); 
				} else {
					List<WorkOrderAdmVo> tempList = workOrderAdmVoList.subList(finishIdx, finishIdx+999);
					workOrderAdmService.boxLabelAdmIns(tempList);
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
	
	//비가동 리스트 조회
	@RequestMapping(value = "po/workOrderNonOperationList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderNonOperationList(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderNonOperationVo> list = workOrderNonOperationService.workOrderNonOperationRead(workOrderNonOperationVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//작업지시 비가동 등록
	@RequestMapping(value = "po/workOrderNonOperationInsert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationInsert(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderNonOperationVo.setMiddlePrcssCd("0");
			workOrderNonOperationVo.setMinorPrcssCd("0");
			workOrderNonOperationVo.setWorkOrdSeq("0");
			workOrderNonOperationVo.setNoGubun(workOrderNonOperationVo.getNoReason());
			workOrderNonOperationVo.setRegId(Utils.getUserNumber());
			workOrderNonOperationVo.setNoSeq(workOrderNonOperationService.createNoSeq(workOrderNonOperationVo));
			workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//총 양/불/실적 수량 조회
	@RequestMapping(value = "po/getTotalWorkQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getTotalWorkQty(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			WorkOrderAdmVo vo = workOrderAdmService.getTotalWorkQty(workOrderAdmVo);
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//측정종료
	@RequestMapping(value = "/po/checkEndUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkEndUpdate(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("측정종료 수정: " + workOrderAdmVo);
		try {
			workOrderAdmVo.setWorkOrdNo(workOrderAdmVo.getWorkOrdNo());
			workOrderAdmVo.setCheckEndDate(DateUtil.getToday("yyyy-mm-dd hh:mm:ss"));
			workOrderAdmVo.setCheckPass("OK");
			workOrderAdmVo.setCheckStatus("E");
			workOrderAdmVo.setUpdId(Utils.getUserNumber());
			workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//측정종료
	@RequestMapping(value = "/po/checkEndListUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkEndListUpdate(@RequestBody List<Map<String,Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("측정종료 수정: ");
		try {
			
			WorkOrderAdmVo workOrderAdmVo = new WorkOrderAdmVo();
			for(Map<String, Object> m : list) {
				workOrderAdmVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderAdmVo.setCheckEndDate(DateUtil.getToday("yyyy-mm-dd hh:mm:ss"));
				workOrderAdmVo.setCheckPass("OK");
				workOrderAdmVo.setCheckStatus("E");
				workOrderAdmVo.setUpdId(Utils.getUserNumber());
				workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
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
