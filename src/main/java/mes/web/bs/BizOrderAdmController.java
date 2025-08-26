package mes.web.bs;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import mes.domain.bs.BizOrderAdmVo;
import mes.domain.po.WorkOrderVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.BizOrderAdmService;
import mes.service.po.WorkOrderService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class BizOrderAdmController {

	private static final Logger logger = LoggerFactory.getLogger(BizOrderAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	@Inject
	private BizOrderAdmService bizOrderAdmService;
	
	@Inject
	private WorkOrderService workOrderService;

	// 수주등록 메인
	@RequestMapping(value = "/bssc0020", method = RequestMethod.GET)
	public String bssc0020(Locale locale, Model model) throws Exception {
		logger.info("영업등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("shipReqDate", DateUtil.getDay("yyyy-mm-dd", +14));
				
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("001"); // 사용여부
		List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("useYn", useYnList);

		commonCodeVo.setBaseGroupCd("044"); // 국내/국외
		List<CommonCodeAdmVo> inexGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inexGubun", inexGubunList);

		commonCodeVo.setBaseGroupCd("045"); // 수주구분
		List<CommonCodeAdmVo> contGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("contGubun", contGubunList);

		commonCodeVo.setBaseGroupCd("046"); // 확정여부
		List<CommonCodeAdmVo> confirmYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("confirmYn", confirmYnList);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(레이저/후가공)
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);

		return "bs/bssc0020";
	}

	// 수주조회 팝업모달
	@RequestMapping(value = "bs/bizOrderAllList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderAllList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문관리 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderAllList = bizOrderAdmService.bizOrderAllList(bizOrderAdmVo);
			jsonData.put("data", bizOrderAllList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	// 소요량조회 추가 모달
	@RequestMapping(value = "bs/bizOrderAllList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderAllList2(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info(" 소요량조회 추가 모달: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderAllList = bizOrderAdmService.bizOrderAllList2(bizOrderAdmVo);
			jsonData.put("data", bizOrderAllList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 소요량분석 상세목록 조회
	@RequestMapping(value = "bs/bizOrderDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderDataList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("소요량분석 상세목록 조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderAllList;
			if(bizOrderAdmVo.getMrpNo()!=null || !bizOrderAdmVo.getMrpNo().equals("")) {
				bizOrderAllList = bizOrderAdmService.bizOrderAllList3(bizOrderAdmVo);
				logger.info("vo:"+bizOrderAllList);
				
			}else {
				bizOrderAllList = new ArrayList<BizOrderAdmVo>();
			}
			
			jsonData.put("data", bizOrderAllList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	// 영업주문관리 목록조회
	@RequestMapping(value = "bs/bizOrderAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderAdmList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문관리 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderAdmList = bizOrderAdmService.bizOrderAdmList(bizOrderAdmVo);
			jsonData.put("data", bizOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}

	// 영업주문관리 상세조회
	@RequestMapping(value = "bs/bizOrderAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderAdmRead(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문관리 상세조회: " + bizOrderAdmVo);
		try {
			BizOrderAdmVo vo = bizOrderAdmService.bizOrderAdmRead(bizOrderAdmVo);
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 영업주문관리 상세조회
	@RequestMapping(value = "bs/bizOrderDtlRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderDtlRead(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문관리 상세조회: " + bizOrderAdmVo);
		try {
			BizOrderAdmVo vo = bizOrderAdmService.bizOrderDtlRead(bizOrderAdmVo);
			
			
			List<BizOrderAdmVo> bizOrderEtcDtlList = bizOrderAdmService.bizOrderEtcDaSdList(bizOrderAdmVo);
			
				StringBuilder etcDaData = new StringBuilder(); //생산지연사유
				StringBuilder etcSdData = new StringBuilder(); //전달사항
				for(int i=0; i<bizOrderEtcDtlList.size(); i++) {
					if(bizOrderEtcDtlList.get(i).getEtcGubun().toString().equals("DA")) {
						etcDaData.append(bizOrderEtcDtlList.get(i).getEtcCont().toString() +"\n");
					}else {
						etcSdData.append(bizOrderEtcDtlList.get(i).getEtcCont().toString() +"\n");
					}
				}
				
				jsonData.put("data", vo);
				//jsonData.put("etcGubun", bizOrderEtcDtlList.get(0).getEtcGubun()==null?"":bizOrderEtcDtlList.get(0).getEtcGubun());
				//jsonData.put("contDtlNo", bizOrderEtcDtlList.get(0).getContDtlNo()==null?"":bizOrderEtcDtlList.get(0).getContDtlNo());
				
				jsonData.put("etcDaData", etcDaData);
				jsonData.put("etcSdData", etcSdData);
				jsonData.put("result", "ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 수주번호 생성
	@RequestMapping(value = "bs/getContNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getContNo(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("수주번호 : " + bizOrderAdmVo);
		try {

			String bizGubun = bizOrderAdmVo.getBizGubun();
			String gubun="";
			if(bizGubun.equals("001")) {
				gubun = "S";
			}else if(bizGubun.equals("002")){
				gubun = "N";
			}
			
			String date = DateUtil.getToday("yyyyMMdd");
			bizOrderAdmVo.setDate(date);
			String contNoSeq = bizOrderAdmService.getContNo(bizOrderAdmVo); //여기부분에 DATE값이 들어가고 
			String contNo = gubun + date + "-"+ contNoSeq;
			
			jsonData.put("data", contNo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 영업주문관리 등록
	@RequestMapping(value = "bs/bizOrderAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문상세 등록: " + bizOrderAdmVo);
		try {
			if(bizOrderAdmService.overlapContNo(bizOrderAdmVo) == 0) {
				bizOrderAdmVo.setRegId(Utils.getUserId());
				bizOrderAdmService.bizOrderAdmCreate(bizOrderAdmVo);
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

	// 영업주문관리 수정
	@RequestMapping(value = "bs/bizOrderAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문상세 수정: " + bizOrderAdmVo);
		try {
			bizOrderAdmVo.setUpdId(Utils.getUserId());
			bizOrderAdmService.bizOrderAdmUpdate(bizOrderAdmVo);
			
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setContNo(bizOrderAdmVo.getContNo());
			
			//생산예정일 2주전으로 설정
			Calendar cal = Calendar.getInstance();
			Date date = null;
			DateFormat df = new SimpleDateFormat("yyyyMMdd");	
			date = df.parse(bizOrderAdmVo.getShipReqDate().toString());
		    cal.setTime(date);		    	   
		    cal.add(Calendar.DATE, -14);	
		    
		    logger.info("영업주문상세 등록: " + date);
		    String currentDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());	
			workOrderVo.setOutputDate(currentDate.toString().replace("-", ""));	
			workOrderVo.setDlvDate(bizOrderAdmVo.getShipReqDate());	//납기일	
			workOrderService.updateDlvDate(workOrderVo);
			
			//생산지시현황 납기일 추가
			BizOrderAdmVo bizOrderAdmVo2 = new BizOrderAdmVo();
			bizOrderAdmVo2.setContNo(bizOrderAdmVo.getContNo());	
			bizOrderAdmVo2.setEtcDate(bizOrderAdmVo.getShipReqDate());		
			bizOrderAdmService.etcDateUpdate(bizOrderAdmVo2);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 영업주문상세 목록조회
	@RequestMapping(value = "bs/bizOrderDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderDtlList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문상세 목록조회: " + bizOrderAdmVo);
		try {
			if (bizOrderAdmVo.getContNo() == null || bizOrderAdmVo.getContNo().equals("")) {
				List<BizOrderAdmVo> list = new ArrayList<BizOrderAdmVo>();
				jsonData.put("data", list);
			} else {
				List<BizOrderAdmVo> bizOrderDtlList = bizOrderAdmService.bizOrderDtlList(bizOrderAdmVo);
				jsonData.put("data", bizOrderDtlList);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 영업주문상세 등록
	@RequestMapping(value = "bs/bizOrderDtlCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlCreate(@RequestBody List<Map<String, Object>> list,BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("영업주문상세 등록: " + bizOrderAdmVo);
		try {
			
			for(Map<String, Object> m : list) {
				bizOrderAdmVo.setContNo(m.get("contNo").toString());
				bizOrderAdmVo.setBizGubun(m.get("bizGubun").toString());
				bizOrderAdmVo.setItemCd(m.get("itemCd").toString());
				bizOrderAdmVo.setItemRev("00");
				bizOrderAdmVo.setDtlOrdCnt(Integer.parseInt(m.get("dtlOrdCnt").toString()));
				bizOrderAdmVo.setDelayCnt(Integer.parseInt(m.get("dtlOrdCnt").toString()));
				bizOrderAdmVo.setShipCnt(0);
				bizOrderAdmVo.setUnitCost(Integer.parseInt(m.get("unitCost").toString()));
				bizOrderAdmVo.setOrdDtlDesc(m.get("ordDtlDesc").toString());
				bizOrderAdmVo.setDtlRegDate(DateUtil.getToday("YYYYMMDD"));
				
				if(m.get("contDtlNo")!=null && !m.get("contDtlNo").equals("")) {
					bizOrderAdmVo.setContDtlNo(m.get("contDtlNo").toString());
					bizOrderAdmVo.setUpdId(Utils.getUserId());
					bizOrderAdmService.bizOrderDtlUpdate(bizOrderAdmVo);
				}else {
					bizOrderAdmVo.setContDtlNo(bizOrderAdmService.getContDtlNoSeq(m.get("contNo").toString()));
					bizOrderAdmVo.setRegId(Utils.getUserId());
					bizOrderAdmService.bizOrderDtlCreate(bizOrderAdmVo);
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
	
	// 영업주문상세 수정
	@RequestMapping(value = "bs/bizOrderDtlUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlUpdate(@RequestBody List<Map<String, Object>> list,BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문상세 수정: " + bizOrderAdmVo);
		try {
			
			for(Map<String, Object> m : list) {
				bizOrderAdmVo.setContDtlNo(m.get("contDtlNo").toString());
				bizOrderAdmVo.setDtlOrdCnt(Integer.parseInt(m.get("dtlOrdCnt").toString()));
				bizOrderAdmVo.setUnitCost(Integer.parseInt(m.get("unitCost").toString()));
				bizOrderAdmVo.setOrdDtlDesc(m.get("ordDtlDesc").toString());
				bizOrderAdmVo.setUpdId(Utils.getUserId());
				bizOrderAdmService.bizOrderDtlUpdate(bizOrderAdmVo);
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
	@RequestMapping(value = "bs/bizOrderDtlDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("영업주문상세 삭제: " + bizOrderAdmVo);
		try {
			bizOrderAdmService.bizOrderDtlDelete(bizOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 수주상세번호 생성
	@RequestMapping(value = "bs/getContDtlNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getWorkOrdNo(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			String contDtlNoSeq = bizOrderAdmService.getContDtlNoSeq(bizOrderAdmVo.getContNo().toString()); //여기부분에 DATE값이 들어가고 
			String contDtlNo = bizOrderAdmVo.getContNo().toString() + "-"+ contDtlNoSeq;
			
			jsonData.put("data", contDtlNo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	 
	// 수주현황 메인
	@RequestMapping(value = "/bssc0040", method = RequestMethod.GET)
	public String bssc0040(Locale locale, Model model) throws Exception {
		logger.info("영업등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("112"); // 구분(레이저/후가공)
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("045"); // 수주구분
		List<CommonCodeAdmVo> bizGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("bizGubun", bizGubunList);
		
		return "bs/bssc0040";
	}
	
	// 수주현황 목록조회
	@RequestMapping(value = "bs/bizOrderAdmStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderAdmStatusList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("수주현황 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderAdmList = bizOrderAdmService.bizOrderAdmStatusList(bizOrderAdmVo);
			jsonData.put("data", bizOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	



}
