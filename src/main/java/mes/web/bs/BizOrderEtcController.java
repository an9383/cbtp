package mes.web.bs;

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
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.BizOrderAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class BizOrderEtcController {

	private static final Logger logger = LoggerFactory.getLogger(BizOrderEtcController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private BizOrderAdmService bizOrderAdmService;
	
	
	// 생산지시현황
	@RequestMapping(value = "/bssc0030", method = RequestMethod.GET)
	public String bssc0030(Locale locale, Model model) throws Exception {
		logger.info("영업등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("003"); // 사용여부
		List<CommonCodeAdmVo> etcDeptList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("etcDept", etcDeptList);
		
		return "bs/bssc0030";
	}
	
	// 생산지시현황 목록조회
	@RequestMapping(value = "bs/bizOrderEtcAdmList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderEtcAdmList2(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("생산지시현황 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderEtcAdmList = bizOrderAdmService.bizOrderEtcAdmList2(bizOrderAdmVo);
			jsonData.put("data", bizOrderEtcAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 생산지시현황 목록조회
	@RequestMapping(value = "bs/bizOrderEtcAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderEtcAdmList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("생산지시현황 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderEtcAdmList = bizOrderAdmService.bizOrderEtcAdmList(bizOrderAdmVo);
			jsonData.put("data", bizOrderEtcAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 생산지시현황 상세조회
	@RequestMapping(value = "bs/bizOrderEtcDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderEtcDtlList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("생산지시현황 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> bizOrderEtcDtlList = bizOrderAdmService.bizOrderEtcDtlList(bizOrderAdmVo);
			jsonData.put("data", bizOrderEtcDtlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 생산지시현황 등록
	@RequestMapping(value = "bs/bizOrderEtcDtlCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderEtcDtlCreate(@RequestBody List<Map<String, Object>> bizOrderEtcDtlList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		BizOrderAdmVo bizOrderAdmVo = new BizOrderAdmVo();
		logger.info("생산지시현황 등록: " + bizOrderAdmVo);
		try {
			bizOrderAdmVo.setEtcGubun(bizOrderEtcDtlList.get(0).get("etcGubun").toString());
			bizOrderAdmVo.setContDtlNo(bizOrderEtcDtlList.get(0).get("contDtlNo").toString());
			//bizOrderAdmVo.setContNo(bizOrderEtcDtlList.get(0).get("contNo").toString());
			
			bizOrderAdmService.bizOrderEtcDtlDelete(bizOrderAdmVo);
			
			bizOrderAdmVo.setRegId(Utils.getUserId().toString());
			
			for(Map<String, Object> m : bizOrderEtcDtlList) {
				String etcSeq = bizOrderAdmService.getEtcSeq();
				bizOrderAdmVo.setEtcSeq(etcSeq);
				
				String etcGubun = bizOrderAdmVo.getEtcGubun();
				
				if(etcGubun.equals("SD")) {
					if(m.get("etcDept").toString()==null || m.get("etcDept").toString().equals("")) {
						jsonData.put("result", "ok");
					}else {
						bizOrderAdmVo.setEtcDept(m.get("etcDept").toString());
						bizOrderAdmVo.setEtcCont(m.get("etcCont").toString());
						
						bizOrderAdmService.bizOrderEtcDtlCreate(bizOrderAdmVo);
						jsonData.put("result", "ok");
					}
					
				}else if(etcGubun.equals("DL")) {
					
					if(m.get("etcDate").toString()==null || m.get("etcDate").toString().equals("")) {
						jsonData.put("result", "ok");
					}else {
						bizOrderAdmVo.setEtcDate(m.get("etcDate").toString());
						bizOrderAdmVo.setEtcCont(m.get("etcCont").toString());
						
						bizOrderAdmService.bizOrderEtcDtlCreate(bizOrderAdmVo);
						jsonData.put("result", "ok");
					}
					
				}else if(etcGubun.equals("PC")) {
					bizOrderAdmVo.setEtcDate(m.get("etcDate").toString());
					bizOrderAdmVo.setEtcCont(m.get("etcCont").toString());
					int dtlOrdCnt = Integer.parseInt(m.get("dtlOrdCnt").toString());
					int dtlShipCnt = Integer.parseInt(m.get("dtlShipCnt").toString());
					
					if(dtlOrdCnt >= dtlShipCnt) {
						bizOrderAdmVo.setShipCnt(Integer.parseInt(m.get("dtlShipCnt").toString()));  //완료수량
						
						//완료수량 update문
						bizOrderAdmService.dtlShipCntUpdate(bizOrderAdmVo);
						//bizOrderAdmService.shipCntUpdate(bizOrderAdmVo);
						bizOrderAdmService.bizOrderEtcDtlCreate(bizOrderAdmVo);
						jsonData.put("result", "ok");
					}else {
						jsonData.put("result", "excess");
					}
					
				}else if(etcGubun.equals("DA")) {

					if(m.get("etcCharger").toString()==null || m.get("etcCharger").toString().equals("")) {
						jsonData.put("result", "ok");
					}else {
						bizOrderAdmVo.setEtcCharger(m.get("etcCharger").toString());
						bizOrderAdmVo.setEtcCont(m.get("etcCont").toString());
						
						bizOrderAdmService.bizOrderEtcDtlCreate(bizOrderAdmVo);
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
	
	// 생산지시현황 삭제
	@RequestMapping(value = "bs/bizOrderEtcDtlDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderEtcDtlDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산지시현황 삭제: " + bizOrderAdmVo);
		try {
			bizOrderAdmService.bizOrderEtcDelete(bizOrderAdmVo);
			logger.info("생산지시현황 상세 삭제완료!");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	// 생산지시현황 생산투입상태 목록조회
	@RequestMapping(value = "bs/approveProcList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approveProcList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산지시현황 생산투입상태 목록조회: " + bizOrderAdmVo);
		try {
			List<BizOrderAdmVo> list =  bizOrderAdmService.approveProcList(bizOrderAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
