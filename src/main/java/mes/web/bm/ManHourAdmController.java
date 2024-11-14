
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ManHourAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ManHourAdmService;
import mes.web.ut.Utils;

@Controller
public class ManHourAdmController {
	private static final Logger logger = LoggerFactory.getLogger(ManHourAdmController.class);

	
	@Inject
	private ManHourAdmService manHourAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	// 불량유형관리 페이지
	@RequestMapping(value = "/bmsc0160", method = RequestMethod.GET)
	public String manHourAdmMain(Locale locale, Model model) throws Exception {
		try {
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("084");	//공수관리 구분자
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList2 = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("airliftCd", commonCodeList2);
			
			commonCodeVo.setBaseGroupCd("085");	//공수관리 구분자2
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList3 = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("airliftCd2", commonCodeList3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0160";
	}


	// 공수관리 전체 조회
	@RequestMapping(value = "bm/manHourAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFcList(ManHourAdmVo manHourAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("공수관리 목록조회: " + manHourAdmVo);
		try {
			List<ManHourAdmVo> manHourAdmList = manHourAdmService.manHourAdmList(manHourAdmVo);
			jsonData.put("data", manHourAdmList);
			jsonData.put("listSize", manHourAdmList.size());
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 공수관리 상세 조회
	@RequestMapping(value = "/bm/manHourAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> manHourAdmRead(ManHourAdmVo manHourAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("공수관리 상세 정보 : " +manHourAdmVo);
		try {
			manHourAdmVo = manHourAdmService.manHourAdmRead(manHourAdmVo);
			logger.info("검색 후 : " + manHourAdmVo);
			jsonData.put("data", manHourAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 공수관리 등록
	@RequestMapping(value = "/bm/manHourAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> manHourAdmCreate(ManHourAdmVo manHourAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공수관리 등록: " + manHourAdmVo);
		try {
//			String sequence = manHourAdmService.baseInfoSeq();
//			logger.info("검색 후 SEQ : "+ sequence);
//			manHourAdmVo.setBaseInfoSeq(sequence);
			
			
//			String faultyTypeSeq = manHourAdmService.faultyTypeSeq(manHourAdmVo);
//			manHourAdmVo.setEtc2(faultyTypeSeq);
			manHourAdmVo.setRegId(Utils.getUserId());
			manHourAdmService.manHourAdmCreate(manHourAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 공수관리 수정
	@RequestMapping(value = "/bm/manHourAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> manHourAdmUpdate(ManHourAdmVo manHourAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			manHourAdmVo.setUpdId(Utils.getUserId());
			logger.info("공수관리 수정: " + manHourAdmVo);
			manHourAdmService.manHourAdmUpdate(manHourAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//코드 시퀀스
	@RequestMapping(value = "/bm/manHourAdmSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoCdSeq(ManHourAdmVo manHourAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("검색 후 Vo : " + manHourAdmVo);
			String sequence = manHourAdmService.manHourAdmSeq(manHourAdmVo);
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
	
	
}

