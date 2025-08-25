package mes.web.bm;

import java.text.DateFormat;
import java.util.ArrayList;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.InspAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.InspAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;


@Controller
public class InspAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(InspAdmController.class);
	
	@Inject
	private InspAdmService inspAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	// 검사항목관리 페이지 (사출)
	@RequestMapping(value = "/bmsc0100", method = RequestMethod.GET)
	public String baseInfoGbMain(Locale locale, Model model) throws Exception {
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("111"); // 검사항목관리유형
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspChkGrp", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("methodCodeList", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("134"); // 확인방법
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspCheck", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("141"); // 공정순서
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspOrder", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("142"); // 기준구분
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspStandGubun", commonCodeList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0100";
	}
	
	// 검사항목관리 페이지 (봉제)
	@RequestMapping(value = "/bmsc0300", method = RequestMethod.GET)
	public String baseInfoGbMainBj(Locale locale, Model model) throws Exception {
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("147"); // 검사항목관리유형(봉제)
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspChkGrp", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("methodCodeList", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("134"); // 확인방법
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspCheck", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("141"); // 공정순서
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspOrder", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("142"); // 기준구분
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspStandGubun", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", commonCodeList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0300";
	}
	
	// 검사항목관리 페이지 (정밀가공 )
	@RequestMapping(value = "/bmsc0430", method = RequestMethod.GET)
	public String bmsc0430(Locale locale, Model model) throws Exception {
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("147"); // 검사항목관리유형(봉제)
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspChkGrp", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("methodCodeList", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("134"); // 확인방법
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspCheck", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("141"); // 공정순서
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspOrder", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("142"); // 기준구분
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspStandGubun", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", commonCodeList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0430";
	}
	
	//검사항목관리 구분목록조회
	@RequestMapping(value = "bm/inspTypeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspTypeList(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("126"); // 검사구분
			commonCodeVo.setEtc1(inspAdmVo.getInspType()); // 검사유형(제품,공정,수입)
			
			List<CommonCodeAdmVo> typeList = new ArrayList<CommonCodeAdmVo>();
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			for(int i=0; i<commonCodeList.size(); i++) {
				if(commonCodeList.get(i).getEtc1().equals(commonCodeVo.getEtc1())) {
					typeList.add(commonCodeList.get(i));
				}
			}
			jsonData.put("data", typeList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//검사항목관리 조회
	@RequestMapping(value = "bm/inspAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspAdmList(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("검사항목관리 조회 : " + inspAdmVo);
		try {
			List<InspAdmVo> inspAdmList = inspAdmService.inspAdmList(inspAdmVo);
			jsonData.put("data", inspAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 검사항목관리 등록
	@RequestMapping(value = "/bm/inspAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspAdmCreate(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("검사항목관리 등록: " + inspAdmVo);
		try {
			inspAdmVo.setRegId(Utils.getUserId());
			inspAdmService.inspAdmCreate(inspAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 검사항목관리 상세 조회
	@RequestMapping(value = "/bm/inspAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspAdmRead(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("검사항목관리 상세 정보 : " + inspAdmVo);
		try {
			inspAdmVo = inspAdmService.inspAdmRead(inspAdmVo);
			logger.info("검색 후 : " + inspAdmVo);
			jsonData.put("data", inspAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//검사항목관리 수정
	@RequestMapping(value = "/bm/inspAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspAdmUpdate(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspAdmVo.setUpdId(Utils.getUserId());
			logger.info("검사항목관리 수정: " + inspAdmVo);
			inspAdmService.inspAdmUpdate(inspAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//검사항목관리 삭제
	@RequestMapping(value = "/bm/inspAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspAdmDelete(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspAdmService.inspAdmDelete(inspAdmVo);
			inspAdmService.inspDtlDelete(inspAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//코드 시퀀스
	@RequestMapping(value = "/bm/inspAdmSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspAdmSeq(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String sequence = inspAdmService.inspAdmSeq(inspAdmVo);
			logger.info("검색 후 seq : " + sequence);
			jsonData.put("inspCd", sequence);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//검사항목상세 조회
	@RequestMapping(value = "bm/inspDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspExtAdmList(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("검사항목관리 외관 조회 : " + inspAdmVo);
		try {
			List<InspAdmVo> inspExtAdmList = new ArrayList<InspAdmVo>();
			if(inspAdmVo.getInspCd()!=null && !inspAdmVo.getInspCd().equals("")) {
				inspExtAdmList = inspAdmService.inspDtlList(inspAdmVo);
			}
			
			jsonData.put("data", inspExtAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	
	//검사항목 상세 등록
	@RequestMapping(value = "/bm/inspDtlCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspExtAdmCreate(@RequestBody List<Map<String, Object>> inspExtAdmList) throws Exception {
		InspAdmVo inspAdmVo = new InspAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("검사항목관리 외관 등록: " + inspAdmVo);
		try {
			inspAdmVo.setInspCd(inspExtAdmList.get(0).get("inspCd").toString());
			inspAdmVo.setInspType(inspExtAdmList.get(0).get("inspType").toString());
			inspAdmService.inspDtlDelete(inspAdmVo);
			
			for(Map<String, Object> list : inspExtAdmList) {
				if(list.get("inspCd") != null) {
					
					String sequence = inspAdmService.getInspSeq(inspAdmVo);
					logger.info("검색 후 SEQ : " + sequence);
					inspAdmVo.setInspSeq(sequence);
					
					switch (inspAdmVo.getInspType()) {
					case "001":
						inspAdmVo.setInspList(list.get("inspList").toString());
						inspAdmVo.setInspCheck(list.get("inspCheck").toString());
						break;
					case "002":
						if(list.get("inspSpc").toString()!=null && !list.get("inspSpc").toString().equals("")) {
							inspAdmVo.setInspSpc(list.get("inspSpc").toString());
						}
						
						if(list.get("inspOrder").toString()!=null && !list.get("inspOrder").toString().equals("")) {
							inspAdmVo.setInspOrder(list.get("inspOrder").toString());
						}
						
						inspAdmVo.setInspList(list.get("inspList").toString());
						inspAdmVo.setInspStandUpper(list.get("inspStandUpper").toString());
						inspAdmVo.setInspStandLower(list.get("inspStandLower").toString());
						inspAdmVo.setInspCheck(list.get("inspCheck").toString());
						inspAdmVo.setInspStandGubun(list.get("inspStandGubun").toString());
						break;
						
					case "003":
						inspAdmVo.setInspList(list.get("inspList").toString());
						inspAdmVo.setInspStandUpper(list.get("inspStandUpper").toString());
						inspAdmVo.setInspStandLower(list.get("inspStandLower").toString());
						inspAdmVo.setInspCheck(list.get("inspCheck").toString());
						inspAdmVo.setInspStandGubun(list.get("inspStandGubun").toString());
						break;
				
					case "004":
						inspAdmVo.setInspPlanDate(list.get("inspPlanDate").toString());
						inspAdmVo.setInspPlan(list.get("inspPlan").toString());
						inspAdmVo.setInspReport(list.get("inspReport").toString());
						break;
						
					case "005": 
						if(list.get("inspSpc").toString()!=null && !list.get("inspSpc").toString().equals("")) {
							inspAdmVo.setInspSpc(list.get("inspSpc").toString());
						}
						
						inspAdmVo.setInspList(list.get("inspList").toString());
						inspAdmVo.setInspStandUpper(list.get("inspStandUpper").toString());
						inspAdmVo.setInspStandLower(list.get("inspStandLower").toString());
						inspAdmVo.setInspCheck(list.get("inspCheck").toString());
						inspAdmVo.setInspStandGubun(list.get("inspStandGubun").toString());
						break;

					}
					inspAdmVo.setInspInputMethod(list.get("inspInputMethod").toString());
					inspAdmVo.setRegId(Utils.getUserId());
					
					inspAdmService.inspDtlCreate(inspAdmVo);
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
	

	
	//외관, 치수, 신뢰성 삭제
	@RequestMapping(value = "/bm/inspDtlDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspAdmEachDelete(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspAdmService.inspDtlDelete(inspAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//검사항목 결과조회
	//검사항목 결과조회
	@RequestMapping(value = "/bm/inspResultAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspResultAdmList(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("검사항목관리 조회 : " + inspAdmVo);
		try {
			List<InspAdmVo> list = inspAdmService.inspResultAdmList(inspAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//캐비티 상세 조회
	@RequestMapping(value = "/bm/inspCavityAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspCavityAdmRead(InspAdmVo inspAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("캐비티 상세 정보 : " + inspAdmVo);
		try {
			inspAdmVo = inspAdmService.inspCavityAdmRead(inspAdmVo);
			jsonData.put("data", inspAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//검사항목결과등록
	@RequestMapping(value = "bm/inspResultAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspResultAdmCreate(@RequestBody List<Map<String, Object>> inspList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InspAdmVo inspAdmVo = new InspAdmVo();
		logger.info("검사항목관리 등록 : " + inspList);
		try {
			for(Map<String, Object> m :inspList) {
				
				inspAdmVo.setInspResultGubun(m.get("inspResultGubun").toString());
				inspAdmVo.setInspSourceNo(m.get("inspSourceNo").toString());
				inspAdmVo.setInspSourceSubNo(m.get("inspSourceSubNo").toString());
				
				inspAdmVo.setInspCd(m.get("inspCd").toString());
				inspAdmVo.setInspType(m.get("inspType").toString());
				inspAdmVo.setInspSeq(m.get("inspSeq").toString());
				
				if (m.get("inspCavity") != null && !m.get("inspCavity").toString().equals("")) {
					inspAdmVo.setInspCavity(m.get("inspCavity").toString());
				} else {
					inspAdmVo.setInspCavity("001");
				}
				
				inspAdmVo.setInspResult(m.get("inspResult").toString());
				inspAdmVo.setInspX1(m.get("inspX1").toString());
				inspAdmVo.setInspX2(m.get("inspX2").toString());
				inspAdmVo.setInspX3(m.get("inspX3").toString());
				inspAdmVo.setInspX4(m.get("inspX4").toString());
				inspAdmVo.setInspX5(m.get("inspX5").toString());
				
				try {// 수입검사관리대장(봉제) - 치수
					inspAdmVo.setInspX6(m.get("inspX6").toString());
					inspAdmVo.setInspX7(m.get("inspX7").toString());
					inspAdmVo.setInspX8(m.get("inspX8").toString());
					inspAdmVo.setInspX9(m.get("inspX9").toString());
					inspAdmVo.setInspX10(m.get("inspX10").toString());
					inspAdmVo.setInspX11(m.get("inspX11").toString());
					inspAdmVo.setInspX12(m.get("inspX12").toString());
					inspAdmVo.setInspX13(m.get("inspX13").toString());
					inspAdmVo.setInspX14(m.get("inspX14").toString());
					inspAdmVo.setInspX15(m.get("inspX15").toString());
					inspAdmVo.setInspX16(m.get("inspX16").toString());
					inspAdmVo.setInspX17(m.get("inspX17").toString());
					inspAdmVo.setInspX18(m.get("inspX18").toString());
					inspAdmVo.setInspX19(m.get("inspX19").toString());
					inspAdmVo.setInspX20(m.get("inspX20").toString());
					inspAdmVo.setInspX21(m.get("inspX21").toString());
					inspAdmVo.setInspX22(m.get("inspX22").toString());
					inspAdmVo.setInspX23(m.get("inspX23").toString());
					inspAdmVo.setInspX24(m.get("inspX24").toString());
				} catch (NullPointerException e) {// 그 외
					
				}
				
				if(m.get("inspectGubun") != null) {
					inspAdmVo.setInspectGubun(m.get("inspectGubun").toString());
				} else {
					inspAdmVo.setInspectGubun("");
				}
				if(m.get("inspPass") != null) {
					inspAdmVo.setInspPass(m.get("inspPass").toString());
				} else {
					inspAdmVo.setInspPass("");
				}
				
				inspAdmVo.setRegId(Utils.getUserId());
			
				if (inspAdmService.inspResultAdmRead(inspAdmVo) == 0) {
					logger.info("등록 성공!!!!");
					inspAdmService.inspResultAdmCreate(inspAdmVo);
					logger.info("등록 성공!!!!");
				} else {
					logger.info("수정 성공!!!!");
					inspAdmService.inspResultAdmUpdate(inspAdmVo);
					logger.info("수정 성공!!!!");
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
	
	//공정검사관리대장 - 검사항목결과등록
	@RequestMapping(value = "bm/inspPrcResultAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspPrcResultAdmCreate(@RequestBody List<Map<String, Object>> inspList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InspAdmVo inspAdmVo = new InspAdmVo();
		logger.info("공정검사관리대장 검사항목관리 등록 : " + inspList);
		try {
			for(Map<String, Object> m :inspList) {
				
				inspAdmVo.setInspResultGubun(m.get("inspResultGubun").toString());
				inspAdmVo.setInspSourceNo(m.get("inspSourceNo").toString());
				inspAdmVo.setInspSourceSubNo(m.get("inspSourceSubNo").toString());
				
				inspAdmVo.setInspCd(m.get("inspCd").toString());
				inspAdmVo.setInspType(m.get("inspType").toString());
				inspAdmVo.setInspSeq(m.get("inspSeq").toString());
				
				if (m.get("inspCavity") != null && !m.get("inspCavity").toString().equals("")) {
					inspAdmVo.setInspCavity(m.get("inspCavity").toString());
				} else {
					inspAdmVo.setInspCavity("001");
				}
				
				inspAdmVo.setInspResult(m.get("inspResult").toString());
				inspAdmVo.setInspX1(m.get("inspX1").toString());
				inspAdmVo.setInspX2(m.get("inspX2").toString());
				inspAdmVo.setInspX3(m.get("inspX3").toString());
				inspAdmVo.setInspX4(m.get("inspX4").toString());
				inspAdmVo.setInspX5(m.get("inspX5").toString());
				inspAdmVo.setInspX6(m.get("inspX6").toString());
				inspAdmVo.setInspX7(m.get("inspX7").toString());
				inspAdmVo.setInspX8(m.get("inspX8").toString());
				inspAdmVo.setInspX9(m.get("inspX9").toString());
				inspAdmVo.setInspX10(m.get("inspX10").toString());
				try {// 생산실적(사출), 공정검사관리대장(사출/봉제)
					inspAdmVo.setInspX11(m.get("inspX11").toString());
					inspAdmVo.setInspX12(m.get("inspX12").toString());
					inspAdmVo.setInspX13(m.get("inspX13").toString());
					inspAdmVo.setInspX14(m.get("inspX14").toString());
					inspAdmVo.setInspX15(m.get("inspX15").toString());
					inspAdmVo.setInspX16(m.get("inspX16").toString());
					inspAdmVo.setInspX17(m.get("inspX17").toString());
					inspAdmVo.setInspX18(m.get("inspX18").toString());
					inspAdmVo.setInspX19(m.get("inspX19").toString());
					inspAdmVo.setInspX20(m.get("inspX20").toString());
					inspAdmVo.setInspX21(m.get("inspX21").toString());
					inspAdmVo.setInspX22(m.get("inspX22").toString());
					inspAdmVo.setInspX23(m.get("inspX23").toString());
					inspAdmVo.setInspX24(m.get("inspX24").toString());
				} catch (NullPointerException e) {// 생산실적(봉제)
					
				}
				
				if(m.get("inspectGubun") != null) {
					inspAdmVo.setInspectGubun(m.get("inspectGubun").toString());
				} else {
					inspAdmVo.setInspectGubun("");
				}
				if(m.get("inspPass") != null) {
					inspAdmVo.setInspPass(m.get("inspPass").toString());
				} else {
					inspAdmVo.setInspPass("");
				}
				
				inspAdmVo.setRegId(Utils.getUserId());
			
				if (inspAdmService.inspResultAdmRead(inspAdmVo) == 0) {
					logger.info("등록 성공!!!!");
					inspAdmService.inspResultAdmCreate(inspAdmVo);
					logger.info("등록 성공!!!!");
				} else {
					logger.info("수정 성공!!!!");
					inspAdmService.inspResultAdmUpdate(inspAdmVo);
					logger.info("수정 성공!!!!");
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
	
	//출하검사관리대장 - 검사항목결과등록
	@RequestMapping(value = "bm/inspComResultAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspComResultAdmCreate(@RequestBody List<Map<String, Object>> inspList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InspAdmVo inspAdmVo = new InspAdmVo();
		logger.info("출하검사관리대장 검사항목관리 등록 : " + inspList);
		try {
			for(Map<String, Object> m :inspList) {
				
				inspAdmVo.setInspResultGubun(m.get("inspResultGubun").toString());
				inspAdmVo.setInspSourceNo(m.get("inspSourceNo").toString());
				inspAdmVo.setInspSourceSubNo("");
				
				inspAdmVo.setInspCd(m.get("inspCd").toString());
				inspAdmVo.setInspType(m.get("inspType").toString());
				inspAdmVo.setInspSeq(m.get("inspSeq").toString());
				
				if (m.get("inspCavity") != null && !m.get("inspCavity").toString().equals("")) {
					inspAdmVo.setInspCavity(m.get("inspCavity").toString());
				} else {
					inspAdmVo.setInspCavity("001");
				}
				
				inspAdmVo.setInspResult(m.get("inspResult").toString());
				inspAdmVo.setInspX1(m.get("inspX1").toString());
				inspAdmVo.setInspX2(m.get("inspX2").toString());
				inspAdmVo.setInspX3(m.get("inspX3").toString());
				inspAdmVo.setInspX4(m.get("inspX4").toString());
				inspAdmVo.setInspX5(m.get("inspX5").toString());
				
				if(m.get("inspectGubun") != null) {
					inspAdmVo.setInspectGubun(m.get("inspectGubun").toString());
				} else {
					inspAdmVo.setInspectGubun("");
				}
				if(m.get("inspPass") != null) {
					inspAdmVo.setInspPass(m.get("inspPass").toString());
				} else {
					inspAdmVo.setInspPass("");
				}
				
				inspAdmVo.setRegId(Utils.getUserId());
			
				if (inspAdmService.inspResultAdmRead(inspAdmVo) == 0) {
					logger.info("등록 성공!!!!");
					inspAdmService.inspResultAdmCreate(inspAdmVo);
					logger.info("등록 성공!!!!");
				} else {
					logger.info("수정 성공!!!!");
					inspAdmService.inspResultAdmUpdate(inspAdmVo);
					logger.info("수정 성공!!!!");
				}
				
				//cavity 등록/수정
				inspAdmVo.setCavityNo1(m.get("cavityNo1").toString());
				inspAdmVo.setCavityNo2(m.get("cavityNo2").toString());
				inspAdmVo.setCavityNo3(m.get("cavityNo3").toString());
				inspAdmVo.setCavityNo4(m.get("cavityNo4").toString());
				inspAdmVo.setCavityNo5(m.get("cavityNo5").toString());
				
				if (inspAdmService.inspCavityAdmRead(inspAdmVo) == null) {
					inspAdmService.inspCavityAdmCreate(inspAdmVo);
				} else {
					inspAdmService.inspCavityAdmUpdate(inspAdmVo);
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
		
	
	//검사항목 결과조회
	@RequestMapping(value = "bm/getInspResult", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getInspResult(InspAdmVo inspAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("검사항목 판정 등록 컨트롤러 ");
			String result = inspAdmService.getInspResult(inspAdmVo);
			logger.info("검사항목 판정 등록:"+result);
			jsonData.put("data", result);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
		
	}
	
	
	
	
}
