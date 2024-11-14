package mes.web.tm;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.web.cm.Constants;
//import mes.service.tm.PreGoodsInventoryAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PdaController {
	
	//private PreGoodsInventoryAdmService preGoodsInventoryAdmService;
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(PdaController.class);
	
	//PDA 로그인 페이지
	@RequestMapping(value = "/auth/tmsc0110", method = RequestMethod.GET)
	public String pda011GET(Model model) throws Exception {
		logger.info("PDA 로그인 페이지");
		return "auth/tmsc0110";
		//return "auth/login";
	}
	
	//PDA 메뉴 페이지
	@RequestMapping(value = "/tmsc0100", method = RequestMethod.GET)
	public String pdsc0070GET(Model model, HttpSession session) throws Exception {
		logger.info("PDA 메뉴 페이지");
		logger.info("세션 값 : " + session.getAttribute(Constants.PRCSS_GUBUN));
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0100";
	}
	
	//PDA 메뉴 페이지
	@RequestMapping(value = "/tmsc0100_1", method = RequestMethod.GET)
	public String tmsc0100_1(Model model, HttpSession session) throws Exception {
		logger.info("PDA 메뉴 페이지");
		session.setAttribute(Constants.PRCSS_GUBUN, "001");
		logger.info("세션 값 : " + session.getAttribute(Constants.PRCSS_GUBUN));
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0100";
	}
	
	//PDA 메뉴 페이지
	@RequestMapping(value = "/tmsc0100_2", method = RequestMethod.GET)
	public String tmsc0100_2(Model model, HttpSession session) throws Exception {
		logger.info("PDA 메뉴 페이지");
		session.setAttribute(Constants.PRCSS_GUBUN, "002");
		logger.info("세션 값 : " + session.getAttribute(Constants.PRCSS_GUBUN));
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0100";
	}
	
	//PDA 구분 선택 페이지
	@RequestMapping(value = "/tmsc0260", method = RequestMethod.GET)
	public String tmsc0260(Model model, HttpSession session) throws Exception {
		session.setAttribute(Constants.PRCSS_GUBUN, "");
		return "tm/tmsc0260";
	}
	
	//PDA 로그아웃
	@RequestMapping(value = "/tm/logout", method = {RequestMethod.GET,RequestMethod.POST})
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		session.invalidate();
		Cookie cookieUserId = new Cookie("userId", null);
		cookieUserId.setMaxAge(0);
		cookieUserId.setPath("/");
		response.addCookie(cookieUserId);
		//Cookie cookieUserPw = new Cookie("userPw", null);
		//cookieUserPw.setMaxAge(0);
		//cookieUserPw.setPath("/");
		//response.addCookie(cookieUserPw);
		response.sendRedirect("/auth/tmsc0110");
	}
	
	//기초재고관리 메인
	@RequestMapping(value = "/tmsc0060", method = RequestMethod.GET)
	public String tmsc0060GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재입고");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		inOutWhsAdmVo.setMainGubun(session.getAttribute(Constants.PRCSS_GUBUN).toString());
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		List<InOutWhsAdmVo> locationCdList = inOutWhsAdmService.getLocationCd(inOutWhsAdmVo);
		model.addAttribute("locationCd", locationCdList);
		return "tm/tmsc0060";
	}
	
	//현품표 조회 사출 메인
	@RequestMapping(value = "/tmsc0070", method = RequestMethod.GET)
	public String tmsc0070GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재출고");
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0070";
	}
	
	//현품표 조회 봉제 메인
	@RequestMapping(value = "/tmsc0300", method = RequestMethod.GET)
	public String tmsc0300GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재출고");
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0300";
	}
	
	//현품표 조회 정밀가공 메인
	@RequestMapping(value = "/tmsc0410", method = RequestMethod.GET)
	public String tmsc0410GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재출고");
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0410";
	}
	
	//기초재고관리 메인
	@RequestMapping(value = "/tmsc0110", method = RequestMethod.GET)
	public String tmsc0110GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재출고");
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0110";
	}
	
	//기초재고관리 메인
	@RequestMapping(value = "/tmsc0080", method = RequestMethod.GET)
	public String tmsc0080GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("제품출하");
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		return "tm/tmsc0080";
	}
	
	//재고이동 사출 메인
	@RequestMapping(value = "/tmsc0090", method = RequestMethod.GET)
	public String tmsc0090GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재 재고이동");
		
		logger.info("자재 재고이동");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("073"); // 창고코드 
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("locationCd", commonCodeList);
		
		commonCodeVo.setBaseGroupCd("067"); // 구역코드
		commonCodeVo.setUseYn("001");
		commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("areaCd", commonCodeList);
		
		return "tm/tmsc0090";
	}
	
	//재고이동 봉제 메인
	@RequestMapping(value = "/tmsc0330", method = RequestMethod.GET)
	public String tmsc0330GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재 재고이동");
			
		logger.info("자재 재고이동");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("073"); // 창고코드 
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("locationCd", commonCodeList);
			
		commonCodeVo.setBaseGroupCd("067"); // 구역코드
		commonCodeVo.setUseYn("001");
		commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("areaCd", commonCodeList);
		
		return "tm/tmsc0330";
	}
	
	//재고이동 정밀가공 메인
	@RequestMapping(value = "/tmsc0440", method = RequestMethod.GET)
	public String tmsc0440GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("자재 재고이동");
			
		logger.info("자재 재고이동");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("073"); // 창고코드 
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("locationCd", commonCodeList);
			
		commonCodeVo.setBaseGroupCd("067"); // 구역코드
		commonCodeVo.setUseYn("001");
		commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("areaCd", commonCodeList);
		
		return "tm/tmsc0440";
	}
	
	//출하요청 메인
	@RequestMapping(value = "/tmsc0250", method = RequestMethod.GET)
	public String tmsc0250GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("출하요청");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		inOutWhsAdmVo.setMainGubun(session.getAttribute(Constants.PRCSS_GUBUN).toString());
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		List<InOutWhsAdmVo> locationCdList = inOutWhsAdmService.getLocationCd(inOutWhsAdmVo);
		model.addAttribute("locationCd", locationCdList);
		
		return "tm/tmsc0250";
	}
	
	//출하요청 봉제 메인
	@RequestMapping(value = "/tmsc0310", method = RequestMethod.GET)
	public String tmsc0310GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("출하요청");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		inOutWhsAdmVo.setMainGubun(session.getAttribute(Constants.PRCSS_GUBUN).toString());
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		List<InOutWhsAdmVo> locationCdList = inOutWhsAdmService.getLocationCd(inOutWhsAdmVo);
		model.addAttribute("locationCd", locationCdList);
			
		return "tm/tmsc0310";
	}
	
	//출하요청 정밀가공 메인
	@RequestMapping(value = "/tmsc0420", method = RequestMethod.GET)
	public String tmsc0420GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("출하요청");
		if(session.getAttribute(Constants.PRCSS_GUBUN).equals("")) {
			return "tm/tmsc0260";
		}
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		inOutWhsAdmVo.setMainGubun(session.getAttribute(Constants.PRCSS_GUBUN).toString());
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		List<InOutWhsAdmVo> locationCdList = inOutWhsAdmService.getLocationCd(inOutWhsAdmVo);
		model.addAttribute("locationCd", locationCdList);
			
		return "tm/tmsc0420";
	}
}