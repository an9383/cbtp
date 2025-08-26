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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.PrcssCodeAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PrcssCodeAdmController {

	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private PrcssCodeAdmService prcssCodeAdmService;
	
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(PrcssCodeAdmController.class);
	
	//공정정보관리(서브) 메인화면
	@RequestMapping(value = "/bmsc0040")
	public String bmsc0040(Locale locale, Model model)throws Exception{
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> prcssCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", prcssCodeList );
			
			//구분 공통코드
			commonCodeVo.setBaseGroupCd("112"); // 구분
			prcssCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("prcssGubun", prcssCodeList );
			
			//외주여부 공통코드
			commonCodeVo.setBaseGroupCd("043"); // 외주여부
			prcssCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("osrcYn", prcssCodeList );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "bm/bmsc0040";
	}
	
	//공정정보관리(마스터) 메인화면
	@RequestMapping(value = "/bmsc0130")
	public String bmsc0130(Locale locale, Model model)throws Exception{
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> useYnList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", useYnList );
			
			//구분 공통코드
			commonCodeVo.setBaseGroupCd("112"); // 구분
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> prcssGubunList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("prcssGubun", prcssGubunList );
			
			//외주여부 공통코드
			commonCodeVo.setBaseGroupCd("043"); // 외주여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> osrcYnList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("osrcYn", osrcYnList );
			
			//main(설비/사출)구분 공통코드
			commonCodeVo.setBaseGroupCd("112"); //main(설비/사출)
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> mainGubunList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", mainGubunList );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "bm/bmsc0130";
	}
	
	//공정정보관리 전체조회
	@RequestMapping(value="bm/prcssCodeAdmAllList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeAdmAllList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리 전체목록조회 : " + prcssCodeAdmVo);
		try {
			
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmAllList(prcssCodeAdmVo);
			
			if(prcssCodeAdmList==null || prcssCodeAdmList.size()==0) {
				prcssCodeAdmList = new ArrayList<PrcssCodeAdmVo>();
			}
			jsonData.put("data", prcssCodeAdmList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보관리(자재/제품) 작업장 조회
	@RequestMapping(value="bm/prcssItemWorkplace" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssItemWorkplace(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(자재/제품) 작업장 조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssItemWorkplace(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(봉제조립) 목록조회
	@RequestMapping(value="bm/prcssCodeAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeAdmList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(봉제조립) 목록조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(봉제조립) 상세조회
	@RequestMapping(value="bm/prcssCodeAdmRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeAdmRead(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(봉제조립) 상세조회 : " + prcssCodeAdmVo);
		try {
			PrcssCodeAdmVo list = prcssCodeAdmService.prcssCodeAdmRead(prcssCodeAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(Master)-sub 조회
	@RequestMapping(value="bm/prcssCodeSubList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeSubList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(봉제조립) 목록조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeSubList(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//개발관리-공정매칭 조회
	@RequestMapping(value="bm/prcssEbomList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssEbomList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리-공정매칭 목록조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssEbomList = prcssCodeAdmService.prcssEbomList(prcssCodeAdmVo);
			jsonData.put("data", prcssEbomList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(봉제조립) 등록
	@RequestMapping(value="bm/prcssCodeAdmCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeAdmCreate(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(봉제조립) 등록 : " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo.setRegId(Utils.getUserId());
			prcssCodeAdmService.prcssCodeAdmCreate(prcssCodeAdmVo);
			jsonData.put("result", "ok");    
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//공정정보관리(봉제조립) 수정
	@RequestMapping(value="bm/prcssCodeAdmUpdate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeAdmUpdate(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(봉제조립) 상세조회 : " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo.setUpdId(Utils.getUserId());
			prcssCodeAdmService.prcssCodeAdmUpdate(prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(소공정) 공정시퀀스코드정보
	@RequestMapping(value="bm/getPrcssCodeSeqCd" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> selectPrcssCodeSeqCd(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("공정시퀀스코드정보");
		try {
			String seq=prcssCodeAdmService.getPrcssCodeSeqCd(prcssCodeAdmVo);
			jsonData.put("seq", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	}
	
	//공정정보관리(중공정) 목록조회
	@RequestMapping(value="bm/prcssCodeMidList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeMidList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(중공정) 목록조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(중공정) 목록조회
	@RequestMapping(value="bm/prcssCodeMidDtlList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeMidDtlList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("중공정에 따른 소공정 목록조회");
			
			if(prcssCodeAdmVo.getPrcssCd()==null || prcssCodeAdmVo.getPrcssCd().equals("")) {
				List<PrcssCodeAdmVo> list = new ArrayList<>();
				jsonData.put("data", list);
			}else {
				List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeMidDtlList(prcssCodeAdmVo);
				jsonData.put("data", prcssCodeAdmList);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리(중공정) 공정시퀀스코드정보
	@RequestMapping(value="bm/getPrcssCodeMidSeqCd" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getPrcssCodeMidSeqCd(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("공정시퀀스코드정보");
		try {
//			prcssCodeAdmVo.setPrcssType("002");
			String seq=prcssCodeAdmService.getPrcssCodeSeqCd(prcssCodeAdmVo);
			jsonData.put("seq", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	}
	
	//공정정보관리(중공정) 등록
	@RequestMapping(value="bm/prcssCodeMidCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeMidCreate(@RequestBody List<Map<String, Object>> prcssCodeAdmList)throws Exception{
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(중공정) 등록 : " + prcssCodeAdmVo);
		try {
			
			prcssCodeAdmVo.setPrcssCd(prcssCodeAdmList.get(0).get("prcssMidCd").toString());
			prcssCodeAdmVo.setPrcssNm(prcssCodeAdmList.get(0).get("prcssNm").toString());
			prcssCodeAdmVo.setPrcssGubun(prcssCodeAdmList.get(0).get("prcssGubun").toString());
			prcssCodeAdmVo.setPrcssInitial(prcssCodeAdmList.get(0).get("prcssInitial").toString());
			prcssCodeAdmVo.setUseYn(prcssCodeAdmList.get(0).get("useYn").toString());
			prcssCodeAdmVo.setEtc1(prcssCodeAdmList.get(0).get("etc1").toString());
			prcssCodeAdmVo.setEtc2(prcssCodeAdmList.get(0).get("etc2").toString());
			prcssCodeAdmVo.setPrcssDesc(prcssCodeAdmList.get(0).get("prcssDesc").toString());
			prcssCodeAdmVo.setRegId(Utils.getUserId());
			
			//중공정명 중복검사
			
			if (prcssCodeAdmService.overlapPrcssNm(prcssCodeAdmVo) == 0) {

				for (Map<String, Object> m : prcssCodeAdmList) {
//					prcssCodeAdmVo.setLowerPrcssCd(m.get("prcssCd").toString());

					if (prcssCodeAdmService.overlapPrcssCd(prcssCodeAdmVo) == 0) {

//						prcssCodeAdmVo.setPrcssSeq(prcssCodeAdmService.getPrcssSeq(prcssCodeAdmVo));
						prcssCodeAdmService.prcssCodeAdmCreate(prcssCodeAdmVo);
						jsonData.put("result", "ok");

					} else {
						jsonData.put("result", "overlapPrcssCd");
						prcssCodeAdmService.prcssCodeAdmDelete(prcssCodeAdmVo);
						return jsonData;
					}
				}

//				prcssCodeAdmVo.setLowerPrcssCd(prcssCodeAdmVo.getPrcssCd());
//				prcssCodeAdmVo.setPrcssSeq(1);
				prcssCodeAdmService.prcssCodeAdmCreate(prcssCodeAdmVo);
			} else {
				jsonData.put("result", "overlapPrcssMidCd");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//공정정보관리(중공정) 수정
	@RequestMapping(value="bm/prcssCodeMidUpdate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeMidUpdate(@RequestBody List<Map<String, Object>> prcssCodeAdmList)throws Exception{
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(중공정) 수정 : " + prcssCodeAdmVo);
		try {
		
			prcssCodeAdmVo.setPrcssCd(prcssCodeAdmList.get(0).get("prcssMidCd").toString());
			prcssCodeAdmVo.setPrcssNm(prcssCodeAdmList.get(0).get("prcssNm").toString());
			prcssCodeAdmVo.setPrcssGubun(prcssCodeAdmList.get(0).get("prcssGubun").toString());
			prcssCodeAdmVo.setPrcssInitial(prcssCodeAdmList.get(0).get("prcssInitial").toString());
			prcssCodeAdmVo.setUseYn(prcssCodeAdmList.get(0).get("useYn").toString());
			prcssCodeAdmVo.setEtc1(prcssCodeAdmList.get(0).get("etc1").toString());
			prcssCodeAdmVo.setEtc2(prcssCodeAdmList.get(0).get("etc2").toString());
			prcssCodeAdmVo.setPrcssDesc(prcssCodeAdmList.get(0).get("prcssDesc").toString());
			prcssCodeAdmVo.setRegId(Utils.getUserId());
			prcssCodeAdmVo.setUpdId(Utils.getUserId());
			prcssCodeAdmService.prcssCodeAdmUpdate(prcssCodeAdmVo);
			logger.info("중공정 상단 테이블 수정 성공!");
			
			
			// dtl 삭제
			prcssCodeAdmService.prcssCodeAdmDelete(prcssCodeAdmVo);

			for (Map<String, Object> m : prcssCodeAdmList) {

//				prcssCodeAdmVo.setLowerPrcssCd(m.get("prcssCd").toString());

				if (prcssCodeAdmService.overlapPrcssCd(prcssCodeAdmVo) == 0) {
					int prcssSeq = prcssCodeAdmService.getPrcssSeq(prcssCodeAdmVo);
//					prcssCodeAdmVo.setPrcssSeq(prcssSeq);

					prcssCodeAdmService.prcssCodeAdmCreate(prcssCodeAdmVo);
					jsonData.put("result", "ok");
				} else {
					jsonData.put("result", "overlapPrcssCd");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//설비정보 전체조회
	@RequestMapping(value="bm/prcssEquipAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssEquipAdmList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비정보 전체조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssEquipAdmList(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리 설비정보 삭제
	@RequestMapping(value="bm/prcssEquipDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssEquipDelete(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			prcssCodeAdmService.prcssEquipDelete(prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 공정정보관리 설비정보 등록
	@RequestMapping(value = "/bm/prcssCodeEqCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeEqCreate(@RequestBody List<Map<String, Object>> prcssCodeAdmList) throws Exception {
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리 설비정보 등록: " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo.setPrcssCd(prcssCodeAdmList.get(0).get("prcssCd").toString());
			prcssCodeAdmService.prcssEquipAllDelete(prcssCodeAdmVo);
			for(Map<String, Object> list : prcssCodeAdmList) {
				if(list.get("equipCd") != null) {
					prcssCodeAdmVo.setPrcssCd(list.get("prcssCd").toString());
					prcssCodeAdmVo.setEquipCd(list.get("equipCd").toString());
					prcssCodeAdmVo.setPrcssDesc(list.get("prcssDesc").toString());
					prcssCodeAdmVo.setRegId(Utils.getUserId());
					
					prcssCodeAdmService.prcssCodeEqCreate(prcssCodeAdmVo);
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
	
	// 공정정보관리(Sub)-자재 등록
	@RequestMapping(value = "/bm/prcssCodeItemCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeItemCreate(@RequestBody List<Map<String, Object>> prcssCodeAdmList) throws Exception {
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(Sub)-자재 등록: " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo.setPrcssCd(prcssCodeAdmList.get(0).get("prcssCd").toString());
			prcssCodeAdmService.prcssItemAllDelete(prcssCodeAdmVo);
			for(Map<String, Object> list : prcssCodeAdmList) {
				if(list.get("itemSeq") != null) {
					prcssCodeAdmVo.setPrcssCd(list.get("prcssCd").toString());
					prcssCodeAdmVo.setItemSeq(list.get("itemSeq").toString());
					prcssCodeAdmVo.setItemConsumpt(list.get("itemConsumpt").toString());
					prcssCodeAdmVo.setRegId(Utils.getUserId());
					
					prcssCodeAdmService.prcssCodeItemCreate(prcssCodeAdmVo);
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
	
	// 공정정보관리(Master)-Sub 등록
	@RequestMapping(value = "/bm/prcssCodeSubCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeSubCreate(@RequestBody List<Map<String, Object>> prcssCodeSubList) throws Exception {
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리(Master)-Sub 등록: " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo.setPrcssCd(prcssCodeSubList.get(0).get("prcssCd").toString());
			prcssCodeAdmVo.setPrcssType(prcssCodeSubList.get(0).get("prcssType").toString());
			prcssCodeAdmService.prcssSubAllDelete(prcssCodeAdmVo);
			for(Map<String, Object> list : prcssCodeSubList) {
				if(list.get("prcssCd") != null) {
					prcssCodeAdmVo.setPrcssCd(list.get("prcssCd").toString());
					prcssCodeAdmVo.setPrcssType(list.get("prcssType").toString());
					prcssCodeAdmVo.setLowerPrcssCd(list.get("lowerPrcssCd").toString());
					prcssCodeAdmVo.setPrcssSeq(prcssCodeAdmService.getPrcssSeq(prcssCodeAdmVo).toString());
					prcssCodeAdmVo.setRegId(Utils.getUserId());
					
					prcssCodeAdmService.prcssCodeAdmCreate(prcssCodeAdmVo);
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
	
	//공정정보관리 자재 삭제
	@RequestMapping(value="bm/prcssItemDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssItemDelete(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			prcssCodeAdmService.prcssItemDelete(prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//기본정보-자재 전체조회
	@RequestMapping(value="bm/prcssItemAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssItemAdmList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기본정보-자재 전체조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssItemAdmList = prcssCodeAdmService.prcssItemAdmList(prcssCodeAdmVo);
			jsonData.put("data", prcssItemAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//개발관리 BOM 전체조회
	@RequestMapping(value="bm/prcssEbomAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssEbomAdmList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 BOM 전체조회 : " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> prcssEbomAdmList = prcssCodeAdmService.prcssEbomAdmList(prcssCodeAdmVo);
			jsonData.put("data", prcssEbomAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리 자재 삭제
	@RequestMapping(value="bm/prcssAdmDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			prcssCodeAdmService.prcssAdmDelete(prcssCodeAdmVo); //기본정보 삭제
			prcssCodeAdmService.prcssWorkerDelete(prcssCodeAdmVo); //작업자 등록 삭제
			
			String prcssType = prcssCodeAdmVo.getPrcssType();
			if(prcssType.equals("002")) {
				prcssCodeAdmService.prcssEquipAllDelete(prcssCodeAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리 자재 삭제
	@RequestMapping(value="bm/prcssSubDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssSubDelete(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			prcssCodeAdmService.prcssSubDelete(prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리 작업자 둥록 목록조회
	@RequestMapping(value="bm/prcssWorkerAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssWorkerAdmList(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정정보관리 작업자 둥록 목록조회: " + prcssCodeAdmVo);
		try {
			List<PrcssCodeAdmVo> list = new ArrayList<PrcssCodeAdmVo>();
			if ( prcssCodeAdmVo.getPrcssCd() != null && !prcssCodeAdmVo.getPrcssCd().equals("") ) {
				list = prcssCodeAdmService.prcssWorkerAdmList(prcssCodeAdmVo);
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
	
	//공정정보관리 작업자 둥록 create
	@RequestMapping(value = "bm/prcssWorkerCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssWorkerCreate(@RequestBody List<Map<String, Object>> prcssCodeAdmlist) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		logger.info("공정정보관리 작업자 둥록 create");
		try {
			for(Map<String, Object> m : prcssCodeAdmlist) {
				
				prcssCodeAdmVo.setPrcssCd(m.get("prcssCd").toString());
				prcssCodeAdmVo.setPrcssType(m.get("prcssType").toString());
				prcssCodeAdmVo.setLowerPrcssCd(m.get("lowerPrcssCd").toString());
				prcssCodeAdmVo.setPrcssSeq(m.get("prcssSeq").toString());
				prcssCodeAdmVo.setSeqCheck("seqCheck");
				List<PrcssCodeAdmVo> list = prcssCodeAdmService.prcssWorkerAdmList(prcssCodeAdmVo);
				prcssCodeAdmVo.setWorkerSeq(list.size() > 0 ? Integer.toString(Integer.parseInt(list.get(0).getWorkerSeq()) + 1) : "0");
				prcssCodeAdmVo.setUserNumber(m.get("userNumber").toString());
				prcssCodeAdmVo.setRegId(Utils.getUserId());
				
				prcssCodeAdmService.prcssWorkerCreate(prcssCodeAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정정보관리 작업자 둥록 삭제
	@RequestMapping(value="bm/prcssWorkerDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssWorkerDelete(PrcssCodeAdmVo prcssCodeAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			prcssCodeAdmService.prcssWorkerDelete(prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}