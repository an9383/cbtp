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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bs.AchieveAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.AchieveAdmService;
//import mes.service.sm.MatrlUserService;
import mes.web.bm.CommonCodeAdmController;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping
public class AchieveAdmController {
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private AchieveAdmService achieveAdmService;
	
//	@Inject
//	private MatrlUserService matrlUserService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeAdmController.class);
	
	//성취도관리 메인
	@RequestMapping(value = "/bssc0110", method = RequestMethod.GET)
	public String bssc0110(Locale locale, Model model) throws Exception {
		logger.info("성취도관리 메인");
		//model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		//model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("064"); // 성취도
		List<CommonCodeAdmVo> achieveGrade = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("achieveGrade", achieveGrade );
		
		commonCodeVo.setBaseGroupCd("065"); // 성취도라인
		List<CommonCodeAdmVo> achieveLine = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("achieveLine", achieveLine );		

		return "bs/bssc0110";
	}
	
	//성취도관리 목록조회
	@RequestMapping(value = "bs/AchieveAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> AchieveAdmList(AchieveAdmVo achieveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("영업주문관리 목록조회: " + achieveAdmVo);
		try {
			
			List<AchieveAdmVo> list = achieveAdmService.AchieveAdmList(achieveAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
			);
		}
		return jsonData;
	}
	
	//성취도관리 상세목록조회
	@RequestMapping(value = "bs/AchieveAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> AchieveAdmRead(AchieveAdmVo achieveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("성취도관리 목록조회: " + achieveAdmVo);
		try {
			
			List<AchieveAdmVo> list = achieveAdmService.AchieveAdmRead(achieveAdmVo);
			
			if(list.size() == 0 ) {
				//achieveAdmVo.setLineGubun("001");
				//achieveAdmVo.setSmallEachWelding("001");
				//achieveAdmVo.setSmallEachWelding("001");
				//achieveAdmVo.setSmallAllWelding("001");
				//achieveAdmVo.setSmallWinding("001");
				//achieveAdmVo.setSmallFittingPress("001");
				//achieveAdmVo.setSmallLeadConn("001");
				//achieveAdmVo.setSmallMagnetAttach("001");
				//achieveAdmVo.setSmailChakua("001");
				//achieveAdmVo.setSmallBearingPressin("001");
				//achieveAdmVo.setSmallAssembly("001");
				//achieveAdmVo.setSmallTest("001");
				//achieveAdmVo.setMidWinding("001");
				//achieveAdmVo.setMidAllWelding("001");
				//achieveAdmVo.setMidStConn("001");
				//achieveAdmVo.setMidInsertFrame("001");
				//achieveAdmVo.setMidFittingPress("001");
				//achieveAdmVo.setMidConectrConn("001");
				//achieveAdmVo.setMidRtPressin("001");
				//achieveAdmVo.setMidMagnetAttach("001");
				//achieveAdmVo.setMidBalansung("001");
				//achieveAdmVo.setMidAssembly("001");
				//achieveAdmVo.setMidTest("001");
				list.add(achieveAdmVo);
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
			);
		}
		return jsonData;
	}
	
	// 게시판 등록
	@RequestMapping(value = "bs/AchieveAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> AchieveAdmCreate(AchieveAdmVo achieveAdmVo) throws Exception {
		logger.debug(achieveAdmVo.getLineGubun());
		Map<String, Object> jsonData = new HashMap<>();
		try {
			//Utils.getUserNumber()
			
				logger.debug(achieveAdmVo.getUserNumber());
				achieveAdmVo.setRegId(Utils.getUserId());
				//achieveAdmVo.setAchieveMonth(DateUtil.getToday("MM"));
				logger.info("넘버값:"+achieveAdmVo.getUserNumber());
				
				if(achieveAdmService.AchieveAdmRead(achieveAdmVo).size() == 0) {
					achieveAdmService.AchieveAdmCreate(achieveAdmVo);
					jsonData.put("result", "ok");
				} else {
					jsonData.put("result", "fail");
					jsonData.put("message", "중복된 유저가 있습니다.");
				}
				
				
				//List<MatrlUserVo> list = matrlUserService.listAll(matrlUserVo);
				//achieveAdmVo.setUserNumber(list.get(0).getUserNumber());
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	
	// 성취도 목록 수정
	@RequestMapping(value = "bs/AchieveAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> AchieveAdmUpdate(AchieveAdmVo achieveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();

		try {
			achieveAdmVo.setUpdId(Utils.getUserId());
			//achieveAdmVo.setAchieveMonth(DateUtil.getToday("yyyymm"));
			logger.info("성취도 수정: " + achieveAdmVo);
			achieveAdmService.AchieveAdmUpdate(achieveAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//삭제 
	@RequestMapping(value = "bs/AchieveAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> AchieveAdmDelete(AchieveAdmVo achieveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("성취도 삭제: " + achieveAdmVo);
		try {
			achieveAdmVo.setUpdId(Utils.getUserId());
			achieveAdmService.AchieveAdmDelete(achieveAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}