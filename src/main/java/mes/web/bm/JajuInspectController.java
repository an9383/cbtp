
package mes.web.bm;

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
import mes.domain.bm.JajuInspectVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.JajuInspectService;
import mes.web.ut.Utils;

@Controller
public class JajuInspectController {
	private static final Logger logger = LoggerFactory.getLogger(JajuInspectController.class);

	
	@Inject
	private JajuInspectService jajuInspectService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;


	// 자주검사관리 페이지
	@RequestMapping(value = "/bmsc0150", method = RequestMethod.GET)
	public String baseInfoFtMain(Locale locale, Model model) throws Exception {
		try {
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0150";
	}


	// 자주검사관리 전체 조회
	@RequestMapping(value = "bm/jajuInspectList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFcList(JajuInspectVo jajuInspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("발췌기준 목록조회: " + jajuInspectVo);
		try {
			List<JajuInspectVo> jajuInspectList = jajuInspectService.jajuInspectList();
			jsonData.put("data", jajuInspectList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 자주검사관리 상세 조회
	@RequestMapping(value = "/bm/jajuInspectRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFtRead(JajuInspectVo jajuInspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("불량원인 상세 정보 : " +jajuInspectVo);
		try {
			jajuInspectVo = jajuInspectService.jajuInspectRead(jajuInspectVo);
			logger.info("검색 후 : " + jajuInspectVo);
			jsonData.put("data", jajuInspectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 자주검사관리 관리항목 리스트  조회
	@RequestMapping(value = "/bm/jajuInspectDtlRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> jajuInspectDtlRead(JajuInspectVo jajuInspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("불량원인 상세 정보 : " +jajuInspectVo);
		try {
			List<JajuInspectVo> itemNmList = jajuInspectService.jajuInspectDtlRead(jajuInspectVo);
			logger.info("검색 후 : " + itemNmList);
			jsonData.put("data", itemNmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}


	// 불량원인 등록
	@RequestMapping(value = "/bm/jajuInspectCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> jajuInspectCreate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		JajuInspectVo jajuInspectVo = new JajuInspectVo();
		try {
			
			jajuInspectVo.setRegId(Utils.getUserId());
			jajuInspectVo.setMainChargr(list.get(0).get("mainChargr").toString());
			jajuInspectVo.setPrcssCd(list.get(0).get("prcssCd").toString());
			jajuInspectVo.setUseYn(list.get(0).get("useYn").toString());
			int checkPrcssCd = jajuInspectService.checkPrcssCdCreate(jajuInspectVo);
			if(checkPrcssCd>=1) {
				jsonData.put("result", "exist");
				return jsonData;
			}
			if(list.size()>=1) {
				if(list.get(0).get("itemNm")!=null) {
					jajuInspectVo.setItemNm1(list.get(0).get("itemNm").toString());
				}
			}
			if(list.size()>=2) {
				if(list.get(1).get("itemNm")!=null) {
					jajuInspectVo.setItemNm2(list.get(1).get("itemNm").toString());
				}
			}
			if(list.size()>=3) {
				if(list.get(2).get("itemNm")!=null) {
					jajuInspectVo.setItemNm3(list.get(2).get("itemNm").toString());
				}
			}
			if(list.size()>=4) {
				if(list.get(3).get("itemNm")!=null) {
					jajuInspectVo.setItemNm4(list.get(3).get("itemNm").toString());		
				}
			}
			if(list.size()>=5) {
				if(list.get(4).get("itemNm")!=null) {
					jajuInspectVo.setItemNm5(list.get(4).get("itemNm").toString());
				}
			}
			if(list.size()>=6) {
				if(list.get(5).get("itemNm")!=null) {
					jajuInspectVo.setItemNm6(list.get(5).get("itemNm").toString());
				}
			}
			if(list.size()>=7) {
				if(list.get(6).get("itemNm")!=null) {
					jajuInspectVo.setItemNm7(list.get(6).get("itemNm").toString());
				}
			}
			if(list.size()>=8) {
				if(list.get(7).get("itemNm")!=null) {
					jajuInspectVo.setItemNm8(list.get(7).get("itemNm").toString());
				}
			}
			if(list.size()>=9) {
				if(list.get(8).get("itemNm")!=null) {
					jajuInspectVo.setItemNm9(list.get(8).get("itemNm").toString());
				}
			}
			if(list.size()>=10) {
				if(list.get(9).get("itemNm")!=null) {
					jajuInspectVo.setItemNm10(list.get(8).get("itemNm").toString());
				}
			}
			String workCd = jajuInspectService.getWorkCd();
			if(workCd.length()==1) {
				workCd = "00"+workCd;
			} else if(workCd.length()==2) {
				workCd = "0"+workCd;
			} else {
				
			}
			logger.info("값 : " + workCd);
			jajuInspectVo.setWorkCd(workCd);
			logger.info("jajuInspectVo" + jajuInspectVo);
			jajuInspectService.jajuInspectCreate(jajuInspectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 불량원인 수정
	@RequestMapping(value = "/bm/jajuInspectUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> jajuInspectUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		JajuInspectVo jajuInspectVo = new JajuInspectVo();
		try {
			jajuInspectVo.setUpdId(Utils.getUserId());
			jajuInspectVo.setMainChargr(list.get(0).get("mainChargr").toString());
			jajuInspectVo.setPrcssCd(list.get(0).get("prcssCd").toString());
			jajuInspectVo.setUseYn(list.get(0).get("useYn").toString());
			jajuInspectVo.setWorkCd(list.get(0).get("workCd").toString());
			
			int checkPrcssCd = jajuInspectService.checkPrcssCdUpdate(jajuInspectVo);
			if(checkPrcssCd>=1) {
				jsonData.put("result", "exist");
				return jsonData;
			}
			
			if(list.size()>=1) {
				if(list.get(0).get("itemNm")!=null) {
					jajuInspectVo.setItemNm1(list.get(0).get("itemNm").toString());
				}
			}
			if(list.size()>=2) {
				if(list.get(1).get("itemNm")!=null) {
					jajuInspectVo.setItemNm2(list.get(1).get("itemNm").toString());
				}
			}
			if(list.size()>=3) {
				if(list.get(2).get("itemNm")!=null) {
					jajuInspectVo.setItemNm3(list.get(2).get("itemNm").toString());
				}
			}
			if(list.size()>=4) {
				if(list.get(3).get("itemNm")!=null) {
					jajuInspectVo.setItemNm4(list.get(3).get("itemNm").toString());		
				}
			}
			if(list.size()>=5) {
				if(list.get(4).get("itemNm")!=null) {
					jajuInspectVo.setItemNm5(list.get(4).get("itemNm").toString());
				}
			}
			if(list.size()>=6) {
				if(list.get(5).get("itemNm")!=null) {
					jajuInspectVo.setItemNm6(list.get(5).get("itemNm").toString());
				}
			}
			if(list.size()>=7) {
				if(list.get(6).get("itemNm")!=null) {
					jajuInspectVo.setItemNm7(list.get(6).get("itemNm").toString());
				}
			}
			if(list.size()>=8) {
				if(list.get(7).get("itemNm")!=null) {
					jajuInspectVo.setItemNm8(list.get(7).get("itemNm").toString());
				}
			}
			if(list.size()>=9) {
				if(list.get(8).get("itemNm")!=null) {
					jajuInspectVo.setItemNm9(list.get(8).get("itemNm").toString());
				}
			}
			if(list.size()>=10) {
				if(list.get(9).get("itemNm")!=null) {
					jajuInspectVo.setItemNm10(list.get(8).get("itemNm").toString());
				}
			}
			jajuInspectService.jajuInspectUpdate(jajuInspectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
}

