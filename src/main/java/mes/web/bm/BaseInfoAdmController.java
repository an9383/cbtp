
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

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class BaseInfoAdmController {
	private static final Logger logger = LoggerFactory.getLogger(BaseInfoAdmController.class);

	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	// 불량유형관리(사출) 페이지
	@RequestMapping(value = "/bmsc0090", method = RequestMethod.GET)
	public String baseInfoFtMain(Locale locale, Model model) throws Exception {
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("032"); // 불량유형구분
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("baseInfoGubun", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("103"); // 우선순위
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("etc1", commonCodeList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0090";
	}

	// 불량유형관리(봉제) 페이지
	@RequestMapping(value = "/bmsc0091", method = RequestMethod.GET)
	public String baseInfoFtMainByBongjae(Locale locale, Model model) throws Exception {
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("032"); // 불량유형구분
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("baseInfoGubun", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("103"); // 우선순위
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("etc1", commonCodeList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0091";
	}

	// 불량유형관리(정밀가공) 페이지
	@RequestMapping(value = "/bmsc0440", method = RequestMethod.GET)
	public String bmsc0440(Locale locale, Model model) throws Exception {
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("032"); // 불량유형구분
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("baseInfoGubun", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("103"); // 우선순위
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("etc1", commonCodeList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0440";
	}

	
	// 불량원인 전체 조회
	@RequestMapping(value = "bm/baseInfoFtList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFcList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발췌기준 목록조회: " + baseInfoAdmVo);
		try {
			List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
			jsonData.put("data", baseInfoAdmList);
			jsonData.put("listSize", baseInfoAdmList.size());
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 불량원인 상세 조회
	@RequestMapping(value = "/bm/baseInfoFtRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFtRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("불량원인 상세 정보 : " +baseInfoAdmVo);
		try {
			baseInfoAdmVo = baseInfoAdmService.baseInfoFtRead(baseInfoAdmVo);
			logger.info("검색 후 : " + baseInfoAdmVo);
			jsonData.put("data", baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 불량원인 등록
	@RequestMapping(value = "/bm/baseInfoFtCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoFtCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량원인 등록: " + baseInfoAdmVo);
		try {
			baseInfoAdmVo.setBaseInfoSeq(baseInfoAdmService.baseInfoSeq());
			baseInfoAdmVo.setBaseInfoCd(baseInfoAdmService.baseInfoCdSeq(baseInfoAdmVo));
			baseInfoAdmVo.setEtc2(baseInfoAdmService.faultyTypeSeq(baseInfoAdmVo));
			baseInfoAdmVo.setRegId(Utils.getUserId());
			
			baseInfoAdmService.baseInfoFtCreate(baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 불량원인 수정
	@RequestMapping(value = "/bm/baseInfoFtUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoFtUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			baseInfoAdmVo.setUpdId(Utils.getUserId());
			logger.info("불량원인 수정: " + baseInfoAdmVo);
			baseInfoAdmService.baseInfoFtUpdate(baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//전체 조회
	@RequestMapping(value = "/baseInfoItList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoItList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("검사항목관리 목록조회: " + baseInfoAdmVo);
		try {
			List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoItList();
			jsonData.put("data", baseInfoAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//상세 조회
	@RequestMapping(value = "/bm/baseInfoItRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoItRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("불량원인 상세 정보 : " +baseInfoAdmVo);
		try {
			baseInfoAdmVo = baseInfoAdmService.baseInfoItRead(baseInfoAdmVo);
			logger.info("검색 후 : " + baseInfoAdmVo);
			jsonData.put("data", baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//등록
	@RequestMapping(value = "/bm/baseInfoItCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoItCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량원인 등록: " + baseInfoAdmVo);
		try {
			String sequence = baseInfoAdmService.baseInfoSeq();
			logger.info("검색 후 SEQ : "+ sequence);
			baseInfoAdmVo.setBaseInfoSeq(sequence);
			baseInfoAdmVo.setRegId(Utils.getUserId());
			baseInfoAdmService.baseInfoItCreate(baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//수정
	@RequestMapping(value = "/bm/baseInfoItUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoItUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			baseInfoAdmVo.setUpdId(Utils.getUserId());
			logger.info("불량원인 수정: " + baseInfoAdmVo);
			baseInfoAdmService.baseInfoItUpdate(baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//코드 시퀀스
	@RequestMapping(value = "/bm/baseInfoCdSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoCdSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String sequence = baseInfoAdmService.baseInfoCdSeq(baseInfoAdmVo);
			logger.info("검색 후 CDSEQ : " + sequence);
			jsonData.put("baseInfoCd", sequence);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 삭제
	@RequestMapping(value = "/bm/baseInfoFtDataDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoFtDataDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			baseInfoAdmService.baseInfoFtDataDelete(baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 공정정보관리(봉제조립) 비가동항목설정 조회
	@RequestMapping(value = "bm/prcssCodeNoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeNoList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발췌기준 목록조회: " + baseInfoAdmVo);
		try {
			List<BaseInfoAdmVo> prcssCodeNoList = baseInfoAdmService.prcssCodeNoList(baseInfoAdmVo);
			jsonData.put("data", prcssCodeNoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 공정정보관리(봉제조립) 항목설정 등록
	@RequestMapping(value = "/bm/prcssCodeNoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeNoCreate(@RequestBody List<Map<String, Object>> baseInfoAdmList) throws Exception {
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(봉제조립) 항목설정 등록: " + baseInfoAdmVo);
		try {
			baseInfoAdmVo.setEtc3(baseInfoAdmList.get(0).get("etc3").toString());
			baseInfoAdmVo.setBaseInfoType(baseInfoAdmList.get(0).get("baseInfoType").toString());
			baseInfoAdmService.prcssCodeNoDelete(baseInfoAdmVo);
			for(Map<String, Object> list : baseInfoAdmList) {
				if(list.get("baseInfoNm")!=null) {
					String sequence = baseInfoAdmService.baseInfoSeq();
					logger.info("검색 후 SEQ : " + sequence);
					baseInfoAdmVo.setBaseInfoSeq(sequence);
					
					baseInfoAdmVo.setBaseInfoType(list.get("baseInfoType").toString());
					baseInfoAdmVo.setBaseInfoCd(list.get("baseInfoCd").toString());
					baseInfoAdmVo.setBaseInfoNm(list.get("baseInfoNm").toString());
					baseInfoAdmVo.setBaseInfoDesc(list.get("baseInfoDesc").toString());
					baseInfoAdmVo.setUseYn(list.get("useYn").toString());
					baseInfoAdmVo.setEtc3(list.get("etc3").toString());
					baseInfoAdmVo.setRegId(Utils.getUserId());
					
					baseInfoAdmService.prcssCodeNoCreate(baseInfoAdmVo);
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "ok");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
}

