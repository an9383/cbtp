package mes.web.po;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcraft.jsch.Session;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPrcssAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.domain.bs.BizOrderAdmVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemPrcssAdmService;
import mes.service.bm.PrcssCodeAdmService;
import mes.service.bs.BizOrderAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.service.po.WorkOrderService;
import mes.service.sm.MatrlUserService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkOrderController {
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	@Inject
	private BizOrderAdmService bizOrderAdmService;
	
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	@Inject
	private ItemPrcssAdmService itemPrcssAdmService;
	
	@Inject
	private MatrlUserService matrlUserService;
	
	@Inject
	private PrcssCodeAdmService prcssCodeAdmService;

	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderController.class);
	
	//긴급작업지시 메인
	@RequestMapping(value = "/wmsc0040", method = RequestMethod.GET)
	public String wmsc0040Get(Locale locale, Model model) throws Exception {
		logger.info("긴급작업지시 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("060"); // 긴급여부
			List<CommonCodeAdmVo> workEmerYnList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("workEmerYnCode", workEmerYnList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0040";
	}
	//작업순위조정 메인
	@RequestMapping(value = "/wmsc0050", method = RequestMethod.GET)
	public String wmsc0050Get(Locale locale, Model model) throws Exception {
		logger.info("작업순위조정 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("060"); // 긴급여부
			List<CommonCodeAdmVo> workEmerYnList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("workEmerYnCode", workEmerYnList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0050";
	}
	
	//일일작업계획 메인
	@RequestMapping(value = "/wmsc0060", method = RequestMethod.GET)
	public String wmsc0060Get(Locale locale, Model model) throws Exception {
		logger.info("일일작업계획 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("060"); // 긴급여부
			List<CommonCodeAdmVo> workEmerYnList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("workEmerYnCode", workEmerYnList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0060";
	}
	
	//작업지시 목록조회
	@RequestMapping(value = "/po/workOrderDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderDataList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 목록조회: "+workOrderVo);
		try {
			List<WorkOrderVo> workOrderDataList = workOrderService.listAll(workOrderVo);
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//작업지시 목록조회
	@RequestMapping(value = "/po/workOrderModalDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderModalDataList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 목록조회: "+workOrderVo);
		try {
			List<WorkOrderVo> workOrderDataList = workOrderService.workOrdList(workOrderVo);
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//작업지시 기간 목록조회
	@RequestMapping(value = "/po/workOrderDayDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderDayDataList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 목록조회: "+workOrderVo);
		try {
			List<WorkOrderVo> workOrderDataList = workOrderService.workOrdListAll(workOrderVo);
			
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//생산지시현황(사출) 목록조회
	@RequestMapping(value = "/po/workOrdListAllBybomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdListAllBybomList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산지시현황(사출) 목록조회: " + workOrderVo);
		try {
			List<WorkOrderVo> list = workOrderService.workOrdListAllBybomList(workOrderVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산지시현황(봉제) 목록조회
	@RequestMapping(value = "/po/workOrdListSewingList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdListSewingList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산지시현황(봉제) 목록조회: " + workOrderVo);
		try {
			List<WorkOrderVo> list = workOrderService.workOrdListSewingList(workOrderVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 작업지시 등록(사출)
	@RequestMapping(value = "po/workOrderAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmCreate(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		logger.info("작업지시 등록: " + workOrdList);
		try {		
		
			for(Map<String, Object> m : workOrdList) {		
				
				workOrderVo = new WorkOrderVo();		
				if(m.get("workOrdNo") == null || m.get("workOrdNo").equals("")) {
					
					//작업지시 번호 생성 시작-------
					String preString = "DRPDO";
					String yearString = DateUtil.getToday("yyyyMMdd").substring(2,4);
					String monString = DateUtil.getToday("yyyyMMdd").substring(4,6);
					String mString = "";
					
					switch (monString) {
						case "01": mString="A"; break;
						case "02": mString="B"; break;
						case "03": mString="C"; break;
						case "04": mString="D"; break;
						case "05": mString="E"; break;
						case "06": mString="F"; break;
						case "07": mString="G"; break;
						case "08": mString="H"; break;
						case "09": mString="I"; break;
						case "10": mString="J"; break;
						case "11": mString="K"; break;
						case "12": mString="L"; break;
						default: break;
					}
					 
					String dayString = DateUtil.getToday("yyyyMMdd").substring(6,8);
					String workOrdNo = preString+yearString+mString+dayString;
					logger.info("작업지시번호 앞부분 : "+workOrdNo);
					
					int seqString = Integer.parseInt(workOrderService.getWorkOrdNoSeq(workOrdNo));
					logger.info("작업지시번호 끝부분 : "+seqString);
					
					//작업지시 번호 생성 종료-------
					
					workOrderVo.setWorkOrdNo(workOrdNo +  String.format("%02d",seqString));	
					workOrderVo.setOrdLotNo(workOrderVo.getWorkOrdNo());
				} else {
					workOrderVo.setWorkOrdNo(m.get("workOrdNo").toString());
					workOrderVo.setOrdLotNo(workOrderVo.getWorkOrdNo());
				}					
				workOrderVo.setDtlOrdCnt(Integer.parseInt(m.get("dtlOrdCnt").toString())); 	//생산수량
				workOrderVo.setItemSeq(m.get("itemSeq").toString());
				workOrderVo.setItemGubun(m.get("itemGubun").toString());					
				workOrderVo.setOrdDate(DateUtil.getToday("yyyyMMdd").toString());	//작업지시등록일
				workOrderVo.setWorkOrdDate(m.get("outputDate").toString());			//작업지시일
				workOrderVo.setWorkStatusCd("W".toString());
				workOrderVo.setDtlOrdQty(m.get("dtlOrdQty").toString());			//주문수량
				workOrderVo.setWorkOrdQty(m.get("workOrdQty").toString());			//지시수량			
				workOrderVo.setOutputDate(m.get("outputDate").toString());			//생산예정일
				workOrderVo.setDlvDate(m.get("dlvDate").toString());				//납기일
				workOrderVo.setWorkEmerYn(m.get("workEmerYn").toString());			//긴급작업여부
				workOrderVo.setEquipCd(m.get("equipCd").toString());				//설비코드
				
				EquipCodeAdmVo vo = new EquipCodeAdmVo();
				vo.setEquipCd(workOrderVo.getEquipCd());
				vo = equipCodeAdmService.equipCodeAdmRead(vo);
				workOrderVo.setMainWorkChargr(vo.getWorkerJung());    				//주작업자
				workOrderVo.setSubWorkChargr(m.get("subWorkChargr").toString());	//부작업자
				workOrderVo.setReworkYn("N");										//재작업여부(N:정상)
				workOrderVo.setRegId(Utils.getUserId());
				workOrderService.create(workOrderVo);	
				
			}			
		
			jsonData.put("result", "ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 작업지시 등록(봉제)
	@RequestMapping(value = "po/workOrderAdmCreateByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmCreateByBongjae(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		logger.info("작업지시 등록(봉제): " + workOrdList);
		try {		
		
			for(Map<String, Object> m : workOrdList) {
				if(m.get("tbGubun").equals("top")) {
					workOrderVo = new WorkOrderVo();		
					
					//작업지시 번호 생성 시작-------
					String preString = "DRPDO";
					String yearString = DateUtil.getToday("yyyyMMdd").substring(2,4);
					String monString = DateUtil.getToday("yyyyMMdd").substring(4,6);
					String mString = "";
					
					switch (monString) {
						case "01": mString="A"; break;
						case "02": mString="B"; break;
						case "03": mString="C"; break;
						case "04": mString="D"; break;
						case "05": mString="E"; break;
						case "06": mString="F"; break;
						case "07": mString="G"; break;
						case "08": mString="H"; break;
						case "09": mString="I"; break;
						case "10": mString="J"; break;
						case "11": mString="K"; break;
						case "12": mString="L"; break;
						default: break;
					}
					 
					String dayString = DateUtil.getToday("yyyyMMdd").substring(6,8);
					String workOrdNo = preString+yearString+mString+dayString;
					logger.info("작업지시번호 앞부분 : "+workOrdNo);
					
					int seqString = Integer.parseInt(workOrderService.getWorkOrdNoSeq(workOrdNo));
					logger.info("작업지시번호 끝부분 : "+seqString);
					
					//작업지시 번호 생성 종료-------
					
					workOrderVo.setWorkOrdNo(workOrdNo +  String.format("%02d",seqString));	
					workOrderVo.setOrdLotNo(workOrderVo.getWorkOrdNo());
								
					workOrderVo.setDtlOrdCnt(Integer.parseInt(m.get("dtlOrdCnt").toString())); 	//생산수량
					workOrderVo.setItemSeq(m.get("itemSeq").toString());
					workOrderVo.setItemGubun(m.get("itemGubun").toString());					
					workOrderVo.setOrdDate(DateUtil.getToday("yyyyMMdd").toString());	//작업지시등록일
					workOrderVo.setWorkOrdDate(m.get("outputDate").toString());			//작업지시일
					workOrderVo.setWorkStatusCd("W".toString());
					workOrderVo.setDtlOrdQty(m.get("dtlOrdQty").toString());			//주문수량
					workOrderVo.setWorkOrdQty(m.get("workOrdQty").toString());			//지시수량			
					workOrderVo.setOutputDate(m.get("outputDate").toString());			//생산예정일
					workOrderVo.setDlvDate(m.get("dlvDate").toString());				//납기일
					workOrderVo.setWorkEmerYn(m.get("workEmerYn").toString());			//긴급작업여부
					workOrderVo.setEquipCd(m.get("equipCd").toString());				//설비코드
					
					EquipCodeAdmVo vo = new EquipCodeAdmVo();
					vo.setEquipCd(workOrderVo.getEquipCd());
					vo = equipCodeAdmService.equipCodeAdmRead(vo);
					workOrderVo.setMainWorkChargr(vo.getWorkerJung());    				//주작업자
					workOrderVo.setSubWorkChargr(m.get("subWorkChargr").toString());	//부작업자
					workOrderVo.setReworkYn("N");										//재작업여부(N:정상)
					workOrderVo.setRegId(Utils.getUserId());
					workOrderService.create(workOrderVo);	
					
					
					int progSeq = 1;
					//공정 작업지시 등록
					for(Map<String, Object> m2 : workOrdList) {
						if(m2.get("tbGubun").equals("bottom")) {
//							if(m2.get("upperItemSeq").equals(workOrderVo.getItemSeq())) {
								WorkOrderVo workOrderVo2 = new WorkOrderVo();
								workOrderVo2.setWorkProgNo(workOrderVo.getWorkOrdNo()+"-"+(progSeq>9?progSeq:"0"+progSeq));
								workOrderVo2.setWorkOrdNo(workOrderVo.getWorkOrdNo());
								workOrderVo2.setMiddlePrcssCd("");
								workOrderVo2.setMinorPrcssCd(m2.get("minorPrcssCd").toString());
								workOrderVo2.setItemSeq(m2.get("itemSeq").toString());
								workOrderVo2.setWorkProgDate(m2.get("workProgDate").toString());
								workOrderVo2.setWorkProgQty(m2.get("workProgQty").toString());
								workOrderVo2.setWorkProgOrd(Integer.toString(progSeq));
								workOrderVo2.setWorkProgCorp(m2.get("workProgCorp").toString());
								workOrderVo2.setWorkStatus(m2.get("workStatus").toString());
								workOrderVo2.setRegId(Utils.getUserNumber());
								
								workOrderService.workOrderProgressIns(workOrderVo2);
								progSeq++;
//							}
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
		
	// 영업주문상세 삭제
	@RequestMapping(value = "po/workOrderAdmDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderAdmDelete(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("작업지시 삭제: " + workOrderVo);
		try {
			int count = workOrderPrcssService.checkWorkOrdNoExsit(workOrderVo);
			if(count==0) {
				workOrderService.deleteWorkOrdNo(workOrderVo);
				logger.info("삭제되었습니다");
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "exist");
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 작업지시서 수정
	@RequestMapping(value = "po/workOrderAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderAdmUpdate(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시서 수정: ");
		try {
			workOrderVo.setUpdId(Utils.getUserId());
			workOrderService.update(workOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	// 작업지시 긴급여부 및 작업지시일 수정
	@RequestMapping(value = "po/workOrderDateUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderDateUpdate(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업지시일 수정: ");
		try {
			workOrderService.updateWorkOrdDate(workOrderVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//모니터링 수주진행현황
	@RequestMapping(value = "/po/monitoringBizOrdDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> monitoringBizOrdDataList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("모니터링 수주진행현황: "+workOrderVo);
		try {
			List<WorkOrderVo> workOrderDataList = workOrderService.monitoringBizOrd(workOrderVo);
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//제품라벨 발행시 바코드 생성
	@RequestMapping(value = "po/barcodeNoUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeNoUpdate(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품라벨발행시 바코드 생성 : "+workOrderVo);
		try {
			int count = workOrderService.completeWorkOrdNoCnt(workOrderVo);
			if(count==0) {
				jsonData.put("result", "notWC");
			}else {
				
				workOrderVo.setBarcodeNo("M"+workOrderVo.getWorkOrdNo());
				String workEndTime = workOrderService.getWorkEndTime(workOrderVo);
				workOrderService.updateBarcodeNo(workOrderVo);
				logger.info(""+workOrderVo.getBarcodeNo());
				jsonData.put("data",workOrderVo.getBarcodeNo());
				jsonData.put("workEndTime",workEndTime);
				jsonData.put("result", "ok");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//작지종료시간 가져오기
	@RequestMapping(value = "/po/getWorkEndTime", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getWorkEndTime(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String workEndTime = workOrderService.getWorkEndTime(workOrderVo);
			jsonData.put("dataTo", workEndTime);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//작업지시 작업자 조회
	@RequestMapping(value = "/po/selectWorkChargrList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> selectWorkChargrList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderVo> list = workOrderService.selectWorkChargrList(workOrderVo);
			
			logger.info("list.size:"+list.size());
			
			for(int i=0; i<list.size(); i++) {
				logger.info(list.get(i).getUserNumber());
				if(list.get(i).getUserNumber()!=null && list.get(i).getUserNumber().equals("0")) {
					list.remove(i);
				}
			}
			
			//로그인한 사용자 추가
			WorkOrderVo vo = new WorkOrderVo();
			vo.setUserNumber(Utils.getUserNumber());
			
			MatrlUserVo userVo = new MatrlUserVo();
			userVo.setUserNumber(vo.getUserNumber());
			userVo = matrlUserService.read(userVo);
			
			vo.setUserNm(userVo.getUserNm());
			vo.setDepartmentNm(userVo.getDepartmentNm());
			vo.setChargeDutyNm(userVo.getChargeDutyNm());
			vo.setPostNm(userVo.getPostNm());
			
			list.add(vo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	

	//작업지시 공정관리 ***************************************************************************************
	//작업지시 공정조회
	@RequestMapping(value = "/po/workOrderProgressList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderProgressList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정조회 vo: " + workOrderVo);
		try {
			List<WorkOrderVo> list =  new ArrayList<WorkOrderVo>();
			if ( workOrderVo.getWorkProgNoArr().length > 0 ) {
				list = workOrderService.workOrderProgressList(workOrderVo);
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
	
	//작업지시 공정상세조회
	@RequestMapping(value = "/po/workOrderProgressRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderProgressRead(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("작업지시 공정조회 vo: " + workOrderVo);
		try {
			List<WorkOrderVo> list =  new ArrayList<WorkOrderVo>();
			if(workOrderVo.getMinorPrcssCd()!=null && !workOrderVo.getMinorPrcssCd().equals("")) {
				list = workOrderService.workOrderProgressList(workOrderVo);
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
	
	//작업지시 공정수정
	@RequestMapping(value = "/po/workOrderProgressUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderProgressUpd(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("작업지시 공정수정 vo: " + workOrderVo);
		try {
			workOrderVo.setUpdId(Utils.getUserNumber());
			int count =  workOrderService.workOrderProgressUpd(workOrderVo);
			if(count>0) {
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	



}