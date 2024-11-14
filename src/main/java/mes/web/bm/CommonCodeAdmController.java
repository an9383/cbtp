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
import mes.service.bm.CommonCodeAdmService;
import mes.web.ut.Utils;

@Controller
public class CommonCodeAdmController {

	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	private static final Logger logger = LoggerFactory.getLogger(CommonCodeAdmController.class);

	// 공통코드 페이지
	@RequestMapping(value = "/bmsc0120", method = RequestMethod.GET)
	public String commonCodeMain(Locale locale, Model model) throws Exception {
		logger.info("공통코드 페이지");
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			logger.info(commonCodeVo.toString());
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0120";
	}
	
	// 시스템코드 페이지
	@RequestMapping(value = "/smsc0110", method = RequestMethod.GET)
	public String commonCodeMain2(Locale locale, Model model) throws Exception {
		logger.info("시스템코드 페이지");
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			logger.info(commonCodeVo.toString());
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sm/smsc0110";
	}

	// 시스템공통그룹 목록조회
	@RequestMapping(value = "bm/commonGroupList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> commonGroupList(CommonCodeAdmVo commonCodeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("시스템공통그룹 목록조회");
		try {
			List<CommonCodeAdmVo> commonGroupList = commonCodeAdmService.CommonGroupList(commonCodeVo);
			jsonData.put("data", commonGroupList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 시스템공통코드 목록조회
	@RequestMapping(value = "bm/commonCodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> commonCodeList(CommonCodeAdmVo commonCodeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("시스템공통코드 전제조회");
		try {
//			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);

			jsonData.put("data", commonCodeList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

//	//시스템공통그룹 클릭 Read
//	@RequestMapping(value = "/commonGroupRead", method = RequestMethod.GET)
//	public @ResponseBody
//	Map<String, Object> commonGroupRead(CommonCodeAdmVo commonGroupVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<>();
//		try {
//			commonGroupVo = commonCodeAdmService.CommonGroupRead(commonGroupVo);
//			jsonData.put("data", commonGroupVo);
//			jsonData.put("result", "ok");
//		}catch(Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		
//		return jsonData;
//	}

	// 시스템공통그룹 Create
	@RequestMapping(value = "bm/commonGroupCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonGroupCreate(CommonCodeAdmVo commonGroupVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			commonGroupVo.setRegId(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
			CommonCodeAdmVo commonGroupInfo = commonCodeAdmService.CommonGroupRead(commonGroupVo);

			if (commonCodeAdmService.CommonGroupNmCheck(commonGroupVo) != 1) {
				if (commonGroupInfo == null || commonGroupInfo.getBaseGroupCd() == null) {
					commonCodeAdmService.CommonGroupCreate(commonGroupVo);
					commonGroupVo = commonCodeAdmService.CommonGroupRead(commonGroupVo);
					logger.info("systemCommonGroup 생성 완료 : " + commonGroupVo);
					jsonData.put("data", commonGroupVo);
					jsonData.put("result", "ok");
				} else {
					jsonData.put("data", commonGroupVo);
					jsonData.put("result", "exist");
				}
			} else {
				jsonData.put("data", commonGroupVo);
				jsonData.put("result", "exist");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 시스템공통그룹 Update
	@RequestMapping(value = "bm/commonGroupUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonGroupUpdate(CommonCodeAdmVo commonGroupVo) throws Exception {

		Map<String, Object> jsonData = new HashMap<>();
		try {
			CommonCodeAdmVo commonCodeVoRead = new CommonCodeAdmVo();
			commonCodeVoRead = commonCodeAdmService.CommonGroupRead(commonGroupVo);
			commonGroupVo.setUpdId(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
			logger.info("수정 전 : " + commonGroupVo);

			// 수정할 공통코드명과 읽어온 공통코드명이 같으면 중복검사 X(공통코드상세, 사용여부만 Update)
			if (commonGroupVo.getBaseGroupNm().equals(commonCodeVoRead.getBaseGroupNm())) {
				commonCodeAdmService.CommonGroupUpdate(commonGroupVo);
				commonGroupVo = commonCodeAdmService.CommonGroupRead(commonGroupVo);
				logger.info("수정 완료(시스템공통그룹)-1 : " + commonGroupVo);
				jsonData.put("data", commonGroupVo);
				jsonData.put("result", "ok");
			} else {
				if (commonCodeAdmService.CommonGroupNmCheck(commonGroupVo) != 1) {
					commonCodeAdmService.CommonGroupUpdate(commonGroupVo);
					commonGroupVo = commonCodeAdmService.CommonGroupRead(commonGroupVo);
					logger.info("수정 완료(시스템공통그룹)-2 : " + commonGroupVo);
					jsonData.put("data", commonGroupVo);
					jsonData.put("result", "ok");
				} else {
					jsonData.put("data", commonGroupVo);
					jsonData.put("result", "exist");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

//	//시스템공통코드 클릭 Read
//	@RequestMapping(value = "bm/commonCodeRead", method = RequestMethod.GET)
//	public @ResponseBody
//	Map<String, Object> commonCodeRead(CommonCodeAdmVo commonCodeVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<>();
//		logger.info("검색 전 : "+commonCodeVo);
//		try {
//			commonCodeVo = commonCodeAdmService.CommonCodeRead(commonCodeVo);
//			logger.info(commonCodeVo.getBaseCd());
//			logger.info("검색 후 : "+commonCodeVo);
//			jsonData.put("data", commonCodeVo);
//			jsonData.put("result", "ok");
//		}catch(Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		
//		return jsonData;
//	}

	// 시스템공통코드 Create
	@RequestMapping(value = "bm/commonCodeCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonCodeCreate(CommonCodeAdmVo commonCodeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("코드 등록 전 받은값 : " + commonCodeVo);
		try {
			commonCodeVo.setRegId(Utils.getUserId());
			CommonCodeAdmVo commonCodeInfo = commonCodeAdmService.CommonCodeRead(commonCodeVo);
			logger.info("commonCodeInfo" + commonCodeInfo);

			if (commonCodeAdmService.CommonCodeCdCheck(commonCodeVo) != 1) {
				//코드명 중복됐는지 확인하는 코드인데 필요하나?
				//if (commonCodeAdmService.CommonCodeNmCheck(commonCodeVo) != 1) {
					if (commonCodeInfo == null || commonCodeInfo.getBaseCd() == null) {

						commonCodeAdmService.CommonCodeCreate(commonCodeVo);
						commonCodeVo = commonCodeAdmService.CommonCodeRead(commonCodeVo);
						jsonData.put("data", commonCodeVo);
						jsonData.put("result", "ok");
					}
					/*
					 * } else { jsonData.put("data", commonCodeVo); jsonData.put("result",
					 * "existNm"); }
					 */

			} else {
				jsonData.put("data", commonCodeVo);
				jsonData.put("result", "existCd");
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 시스템공통코드 Update
	@RequestMapping(value = "bm/commonCodeUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonCodeUpdate(CommonCodeAdmVo commonCodeVo) throws Exception {

		Map<String, Object> jsonData = new HashMap<>();
		try {

			logger.info("받은값 : " + commonCodeVo);
			CommonCodeAdmVo commonCodeAdmVoRead = new CommonCodeAdmVo();
			commonCodeAdmVoRead = commonCodeAdmService.CommonCodeRead(commonCodeVo);
			logger.info("읽은 값 : " + commonCodeAdmVoRead);
			commonCodeVo.setUpdId(Utils.getUserId()); // 로그인한 사용자 ID 가져오기

			if (commonCodeVo.getBaseNm().equals(commonCodeAdmVoRead.getBaseNm())) {
				commonCodeAdmService.CommonCodeUpdate(commonCodeVo);
				commonCodeVo = commonCodeAdmService.CommonCodeRead(commonCodeVo);
				jsonData.put("data", commonCodeVo);
				jsonData.put("result", "ok");
			} else {
				//코드명 중복됐는지 확인하는 코드인데 필요하나?
//				if (commonCodeAdmService.CommonCodeNmCheck(commonCodeVo) == 0) {
					commonCodeAdmService.CommonCodeUpdate(commonCodeVo);
					commonCodeVo = commonCodeAdmService.CommonCodeRead(commonCodeVo);
					jsonData.put("data", commonCodeVo);
					jsonData.put("result", "ok");
//				} else {
//					jsonData.put("data", commonCodeVo);
//					jsonData.put("result", "exist");
//					jsonData.put("message", Utils.getErrorMessage());
//				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 시스템공통그룹 SEQ(baseGroupCd) Read
	@RequestMapping(value = "bm/commonGroupSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> commonGroupSeq(CommonCodeAdmVo commonCodeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			commonCodeVo = commonCodeAdmService.CommonGroupSeq();
			jsonData.put("data", commonCodeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	// 시스템코드인지 일반코드인지 분류하기 관련 메소드 ->만약 시퀀스이면 CommonCodeSeq로 보내고 아니면

	// 시스템공통그룹 SEQ(baseCd) Read
	@RequestMapping(value = "bm/commonCodeSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> commonCodeSeq(CommonCodeAdmVo commonCodeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("시스템공통그룹(baseCd) SEQ: " + commonCodeVo);
		logger.info("코드유형: " + commonCodeVo.getBaseGroupType());
		try {
			commonCodeVo = commonCodeAdmService.CommonCodeSeq(commonCodeVo); // 시퀀스값
			jsonData.put("data", commonCodeVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 시스템공통그룹 Delete
	@RequestMapping(value = "bm/commonGroupDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonGroupDelete(CommonCodeAdmVo commonGroupVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("삭제 : " + commonGroupVo);
		try {
			commonCodeAdmService.commonGroupDelete(commonGroupVo);
			String groupCheck = commonGroupVo.getGroupCheck();
			if(groupCheck.equals("group")) {
				commonGroupVo.setGroupCheck("codeAll");
				commonCodeAdmService.commonGroupDelete(commonGroupVo);
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