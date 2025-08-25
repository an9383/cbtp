package mes.web.qm;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.qm.ItemPrcssCompleteAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.ItemPrcssCompleteAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemPrcssCompleteAdmController {

	@Inject
	private static final Logger logger = LoggerFactory.getLogger(ItemPrcssCompleteAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemPrcssCompleteAdmService itemPrcssCompleteService;
	
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	

	
	// 공정검사등록 메인
	@RequestMapping(value = "/qmsc0110", method = RequestMethod.GET)
	public String qmsc0110(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0110";
	}
	
	// 공정검사등록 메인
	@RequestMapping(value = "/qmsc0240", method = RequestMethod.GET)
	public String qmsc0240(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0240";
	}
	
	// 공정검사등록(정밀가공) 메인
	@RequestMapping(value = "/qmsc0310", method = RequestMethod.GET)
	public String qmsc0310(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0310";
	}
	
	// 자주/공정검사결과조회(사출) 메인
	@RequestMapping(value = "/qmsc0120", method = RequestMethod.GET)
	public String qmsc0120(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		return "qm/qmsc0120";
	}
	
	// 자주/공정검사결과조회(봉제) 메인
	@RequestMapping(value = "/qmsc0220", method = RequestMethod.GET)
	public String qmsc0220(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		return "qm/qmsc0220";
	}
	
	// 자주/공정검사결과조회(정밀가공) 메인
	@RequestMapping(value = "/qmsc0340", method = RequestMethod.GET)
	public String qmsc0340(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		return "qm/qmsc0340";
	}
	
	//공정검사관리 목록조회
	@RequestMapping(value="qm/itemPrcssCompleteAdmDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPrcssCompleteAdmDataList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정검사관리  vo:"+itemPrcssCompleteAdmVo);
		try {
			List<ItemPrcssCompleteAdmVo> itemCompleteAdmList = itemPrcssCompleteService.listAll(itemPrcssCompleteAdmVo);
				
			jsonData.put("data", itemCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//공정검사관리 목록조회(봉제)
	@RequestMapping(value="qm/itemPrcssCompleteAdmDataListByBongjae", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPrcssCompleteAdmDataListByBongjae(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정검사관리(봉제)  vo:"+itemPrcssCompleteAdmVo);
		try {
			List<ItemPrcssCompleteAdmVo> itemCompleteAdmList = itemPrcssCompleteService.listAllByBongjae(itemPrcssCompleteAdmVo);
				
			jsonData.put("data", itemCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//공정검사관리 상세조회
	@RequestMapping(value="qm/itemPrcssCompleteAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPrcssCompleteAdmRead(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정검사관리  vo:"+itemPrcssCompleteAdmVo);
		try {
			itemPrcssCompleteAdmVo =  itemPrcssCompleteService.read(itemPrcssCompleteAdmVo);				
			jsonData.put("data", itemPrcssCompleteAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//공정검사관리 원재료 목록조회
	@RequestMapping(value="qm/itemPrcssCompleteAdmMatrlDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPrcssCompleteAdmMatrlDataList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정검사관리  원재료 vo:"+itemPrcssCompleteAdmVo);
		try {
			List<ItemPrcssCompleteAdmVo> itemCompleteAdmList =  itemPrcssCompleteService.matrlList(itemPrcssCompleteAdmVo);
				
			jsonData.put("data", itemCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//공정검사관리 등록
	@RequestMapping(value="qm/itemPrcssCompleteAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPrcssCompleteAdmCreate(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공정검사관리 등록 : " + itemPrcssCompleteAdmVo);	
		
			itemPrcssCompleteAdmVo.setRegId(Utils.getUserId());
			itemPrcssCompleteService.create(itemPrcssCompleteAdmVo);			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//공정검사관리 수정
	@RequestMapping(value="qm/itemPrcssCompleteAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPrcssCompleteAdmUpdate( ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공정검사관리 수정:" + itemPrcssCompleteAdmVo);	
			
			itemPrcssCompleteAdmVo.setUpdId(Utils.getUserId());
			itemPrcssCompleteService.update(itemPrcssCompleteAdmVo);				
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//자주검사 목록조회
	@RequestMapping(value="qm/jajuAdmDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> jajuAdmDataList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자주검사  vo:"+itemPrcssCompleteAdmVo);
		try {
			List<ItemPrcssCompleteAdmVo> jajuList =  itemPrcssCompleteService.jajuList(itemPrcssCompleteAdmVo);
				
			jsonData.put("data", jajuList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 기간별 검사결과 조회(자주검사/공정검사) 목록조회
	@RequestMapping(value="qm/jajuPrcssTestResultDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> jajuPrcssTestResultDataList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(" 기간별 검사결과 조회(자주검사/공정검사) 목록조회 vo:"+itemPrcssCompleteAdmVo);
		try {
			List<ItemPrcssCompleteAdmVo> list =  itemPrcssCompleteService.testResultList(itemPrcssCompleteAdmVo);
				
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
