package mes.web.cm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.cm.LoginVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.sm.MenuAuthVo;
import mes.domain.sm.MenuInfoAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.cm.LoginService;
import mes.service.sm.IpAccessControlAdmService;
import mes.service.sm.MatrlUserService;
import mes.service.sm.MenuAuthService;
import mes.service.sm.MenuInfoAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Inject
	private MatrlUserService matrlUserService;
	@Inject
	private MenuAuthService menuAuthService;
	@Inject
	private MenuInfoAdmService menuInfoAdmService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private LoginService loginService;
	@Inject
	private IpAccessControlAdmService ipAccessControlAdmService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// 세션 검사
	public static boolean isValidSession(HttpServletRequest request) {
		if (request.getSession().getAttribute("userNumber") != null
				&& request.getSession().getAttribute("userId") != null	
				&& request.getSession().getAttribute("department") != null
		)
		{
			return true;
		} else {
		
			return false;
		}
	}
	
	// 로그인
	@RequestMapping(value = "/auth/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) throws Exception {

		MatrlUserVo matrlUserVo = new MatrlUserVo();
		HttpSession session = request.getSession(true);
		
		try {
			String menuPath = session.getAttribute(Constants.MENU_PATH).toString();
			logger.info(menuPath);
			logger.info("세션O 로그인페이지->Main으로 이동");
			
			
			//mav.setViewName("redirect:/main");
			
			
			//setViewName("cm/main");
		}
		catch (NullPointerException e) {
			logger.info("menuPath존재X 세션X 로그인페이지 진행");
			//e.printStackTrace();
			
			boolean checkCookieId = false;
			//String menuAuth =  request.getParameter("menuAuth");
			//String requestURI = request.getRequestURI();
			//boolean check=false;
			//boolean checkCookiePw = false;
			
			//웹인지 모바일인지 체크
			boolean checkMobile = false;
			request.getSession().setAttribute("isMobile", "web");
			String userAgent = request.getHeader("user-agent");
			logger.info("userAgent = "+userAgent);
			String[] browser = {"iPhone", "iPod","Android"};
			for (int i = 0; i < browser.length; i++) {
			    if(userAgent.matches(".*"+browser[i]+".*")){
			    	request.getSession().setAttribute("isMobile", "mobile");
			    	checkMobile = true;
			    	break;
			    }
			}
			
			//Cookie[] cookies = request.getCookies() ;
			//if(cookies != null){
			//    for(int i=0; i < cookies.length; i++){
			//        Cookie c = cookies[i] ;
			//        if( c.getName().equals("userId")) {
			//        	matrlUserVo.setUserId(c.getValue());
			//        	checkCookieId = true;
			//        }
			//        //if( c.getName().equals("userPw")) {
			//        //	matrlUserVo.setUserPw(c.getValue());
			//        //	checkCookiePw = true;
			//        //}
		    //	}
			//    //쿠키 O
			//    if(checkCookieId == true) {
			//    	MatrlUserVo userVo = matrlUserService.read(matrlUserVo);
			//    	logger.info("사용자 정보 : " + userVo);
			//    	
			//    	if (	matrlUserVo.getUserId().equals(userVo.getUserId())	) {
			//    		logger.info("세션 X 쿠키 O");
			//    		session.setAttribute("userNumber", userVo.getUserNumber());
			//			session.setAttribute("userNm", userVo.getUserNm());
			//			session.setAttribute("userId", userVo.getUserId());
			//			session.setAttribute("department", userVo.getDepartmentCd());
			//			//session.setAttribute("userAuth", authList);
			//			//session.setAttribute("menuAuth", menuPath);
			//			
			//			Utils.setUserId(userVo.getUserId());
			//			Utils.setUserNm(userVo.getUserNm());
			//			Utils.setUserNumber(userVo.getUserNumber());
			//			
			//			//logger.info("Cookie 로그인 ID : " + Utils.getUserId());
			//			//logger.info("Cookie 로그인 이름 : " + Utils.getUserNm());
			//			//logger.info("Cookie 로그인 번호 : " + Utils.getUserNumber());
			//			
			//			MenuAuthVo menuAuthVo = new MenuAuthVo();
			//			//HttpSession session = request.getSession(true);
			//			menuAuthVo.setDepartmentCd(userVo.getDepartmentCd());
			//			
			//			List<MenuInfoAdmVo> authList = menuInfoAdmService.menuInfo(menuAuthVo);
			//			String menuPath="";
			//			
			//			for(MenuInfoAdmVo m : authList) {
			//				menuPath += m.getMenuPath() + ",";
			//				
			//			}
			//			
			//			System.out.println(menuPath);
			//			// 사용자 정보
			//			session.setAttribute("userNumber", userVo.getUserNumber());
			//			session.setAttribute("userNm", userVo.getUserNm());
			//			session.setAttribute("userId", userVo.getUserId());
			//			session.setAttribute("department", userVo.getDepartmentCd());
			//			session.setAttribute("userAuth", authList);
			//			session.setAttribute("menuAuth", menuPath);
			//			Utils.setUserId(userVo.getUserId());
	        //
			//			//jsonData.put("result", "ok");
			//			
			//			
			//			if (checkMobile == true) {
			//				response.sendRedirect("/pdsc0070");
			//			} else {
			//				response.sendRedirect("/bmsc0010");
			//			}
			//    		
			//    	//세션O 쿠기O이나 값 불일치
			//		} else { 
			//			logger.info("세션 O 쿠키 O 쿠키 but DB 불일치");
			//			//response.sendRedirect(request.getContextPath() + "/auth/login");
			//			//return false;
			//		}
			//    //쿠키 X
			//    } else {
			//    	logger.info("세션 X 쿠키 X");
			//    	//response.sendRedirect(request.getContextPath() + "/auth/login");
			//    	//return false;
			//    }
			//}
	
			if (checkMobile==true) {
				mav.setViewName("/auth/tmsc0110");
			} else {
				mav.setViewName("/auth/login");
			}
			
		}
		
		return mav;
	}
		
	
	// 로그인 처리 - ajax
	@RequestMapping(value = "/auth/login_ajax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loginAjaxPOST(MatrlUserVo matrlUserVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();	
		MenuAuthVo menuAuthVo = new MenuAuthVo();
		
		// DB에서 로그인 정보 조회
		MatrlUserVo userVo = matrlUserService.read(matrlUserVo);
		logger.info("userVo  ====> "+userVo);
		 

	    //IP주소 있음
		if(ipAccessControlAdmService.existIpAddr("0.0.0.0") > 0 || ipAccessControlAdmService.existIpAddr(getClientIP(request)) > 0) {
			// 사용자 있음
			if (userVo != null) {			
				if (!BCrypt.checkpw(matrlUserVo.getUserPw(), userVo.getUserPw()) ) {				 
					jsonData.put("result", "error");
					jsonData.put("message", "아이디 또는 비밀번호를 확인해주세요.");
				}
				// 로그인 불가
				else if ("N".equals(userVo.getEmpYnCd())) {
					jsonData.put("result", "error");
					jsonData.put("message", "로그인이 불가능한 상태입니다. 관리자에게 문의바랍니다.");							
				}
				// 로그인 성공
				else {
					HttpSession session = request.getSession(true);
					menuAuthVo.setDepartmentCd(userVo.getDepartmentCd());
					menuAuthVo.setUserNumber(userVo.getUserNumber());
					menuAuthVo.setMainGubun(matrlUserVo.getMainGubun());
					menuAuthVo.setUseYnCd("Y");
					List<MenuInfoAdmVo> authList ;
					String menuPath ;
					logger.info("=============================계정체크=============================");
					//if( userVo.getAdminCheck().equals("Y")) {  //NULL인 경우 문제가 됨
					if( "Y".equals(userVo.getAdminCheck())) {	
						authList = menuInfoAdmService.menuInfoAdmin(menuAuthVo);
						menuPath = menuAuthService.menuAuthPathAdmin(menuAuthVo);
						logger.info("=============================관리자 체크가 된 계정=============================");
					} else {
						authList = menuInfoAdmService.menuInfo(menuAuthVo);
						menuPath = menuAuthService.menuAuthPath(menuAuthVo);
						userVo.setAdminCheck("");
					}
					
//					for(MenuInfoAdmVo m : authList) {
//						menuPath += m.getMenuPath() + ",";
//					}
					logger.info("authList = "+authList);
					
					//SystemCommonCodeVo systemCommonCodeVo = new SystemCommonCodeVo();
					//systemCommonCodeVo.setBaseGroupCd("039"); // 메뉴팝업여부
					//List<SystemCommonCodeVo>systemCommonCodeList = systemCommonCodeService.listAll(systemCommonCodeVo);
					//session.setAttribute("menuPopupYnCdModal", systemCommonCodeList );
					
					// 사용자 정보
					session.setAttribute(Constants.USER_NUMBER, userVo.getUserNumber());
					session.setAttribute(Constants.USER_NAME, userVo.getUserNm());
					session.setAttribute(Constants.USER_ID, userVo.getUserId());
					session.setAttribute(Constants.USER_DEPARTMENT_CD, userVo.getDepartmentCd());
					session.setAttribute(Constants.USER_DEPARTMENT_NM, userVo.getDepartmentNm());
					session.setAttribute(Constants.USER_AUTH, authList);
					session.setAttribute(Constants.MENU_PATH, menuPath);
					session.setAttribute(Constants.AUTO_LOGIN, (String)matrlUserVo.getRememberMe());	//자동로그인 체크여부
					session.setAttribute(Constants.PRCSS_GUBUN, "");
					session.setAttribute(Constants.ADMIN_CHECK, userVo.getAdminCheck());
					//session.setAttribute(Constants.MENU_POPUP_YN, userVo.getMenuPopupYn());
					
					
					Utils.setUserId(userVo.getUserId());
					Utils.setUserNm(userVo.getUserNm());
					Utils.setUserNumber(userVo.getUserNumber());
					Utils.setUserDepartmentCd(userVo.getDepartmentCd());
					Utils.setUserDepartmentNm(userVo.getDepartmentNm());
					session.setAttribute(Constants.USER_SESSION_VO, userVo);
					
					// IP수집
					String ip = request.getHeader("X-FORWARDED-FOR");
					if (ip == null) ip = request.getRemoteAddr();

					// 로그인 기록
					LoginVo loginVo = new LoginVo();
					String date = DateUtil.getToday("yyyymmdd");
					loginVo.setDate(date);
					loginVo.setLoginNo(date+"-"+loginService.loginNoSeq(loginVo));
					
					loginVo.setUserId(Utils.getUserId());
					loginVo.setUserId(Utils.getUserId());
					loginVo.setLogDate(DateUtil.getToday("yyyymmddhhmmssms"));
					loginVo.setUserNm(Utils.getUserNm());
					loginVo.setIpAddress(ip); 
					loginVo.setLogGubun("login");
					loginService.loginCreate(loginVo);

					
					
					logger.info(Utils.getUserId());
					logger.info(Utils.getUserNm());
					logger.info(Utils.getUserNumber());
					logger.info(Utils.getUserDepartmentCd());
					logger.info(Utils.getUserDepartmentNm());
					jsonData.put("result", "ok");
					
				}
			}
			
			//String rememberMe = (String)matrlUserVo.getRememberMe();
			//if (rememberMe.equals("true")) {
			//	Cookie cookieUserId  = new Cookie(Constants.USER_ID, userVo.getUserId());
			//	cookieUserId.setMaxAge(60 * 60 * 24);
			//	cookieUserId.setPath("/");
			//	response.addCookie(cookieUserId);
			//	//Cookie cookieUserPw  = new Cookie("userPw", userVo.getUserPw());
			//	//cookieUserPw.setMaxAge(60 * 60 * 24);
			//	//cookieUserPw.setPath("/");
			//	//response.addCookie(cookieUserPw);
			//}
			
			// 사용자 없음
			else {
				jsonData.put("result", "error");
				jsonData.put("message", "아이디 또는 비밀번호를 확인해주세요.");
			}
			
			
					
	    }else {
	    	jsonData.put("result", "error");
			jsonData.put("message", "등록된 IP주소가 아닙니다. 확인해주세요.");
	    }
			    

		return jsonData;
	}
	
	//로그아웃
	@RequestMapping(value = "/auth/logout", method = {RequestMethod.GET,RequestMethod.POST})
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		// IP수집
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) ip = request.getRemoteAddr();

		// 로그인 기록
		LoginVo loginVo = new LoginVo();
		String date = DateUtil.getToday("yyyymmdd");
		loginVo.setDate(date);
		loginVo.setLoginNo(date+"-"+loginService.loginNoSeq(loginVo));
		loginVo.setUserId(Utils.getUserId());
		loginVo.setLogDate(DateUtil.getToday("yyyymmddhhmmssms"));
		loginVo.setUserNm(Utils.getUserNm());
		loginVo.setIpAddress(ip); 
		loginVo.setLogGubun("logout");
		loginService.loginCreate(loginVo);
		
		session.invalidate();
		Cookie cookieUserId = new Cookie("userId", null);
		cookieUserId.setMaxAge(0);
		cookieUserId.setPath("/");
		response.addCookie(cookieUserId);
		//Cookie cookieUserPw = new Cookie("userPw", null);
		//cookieUserPw.setMaxAge(0);
		//cookieUserPw.setPath("/");
		//response.addCookie(cookieUserPw);
		response.sendRedirect("/auth/login");
	}
	
	
	//IP주소
	public String getClientIP(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    logger.info("> X-FORWARDED-FOR : " + ip);

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	        logger.info("> Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        logger.info(">  WL-Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        logger.info("> HTTP_CLIENT_IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        logger.info("> HTTP_X_FORWARDED_FOR : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	        logger.info("> getRemoteAddr : "+ip);
	    }
	    logger.info("> Result : IP Address : "+ip);

	    return ip;
	}
	
	/*
	 * 메뉴 권한 불러오기 로직 20-07-01
	 */
	/*
	 * MenuInfoAdmVo menuInfoAdmVo = new MenuInfoAdmVo();
	 * 
	 * List<MenuInfoAdmVo> menuList = menuInfoAdmService.listAll(menuInfoAdmVo);
	 * session.setAttribute("menuList", menuList);
	 * 
	 * ArrayList<UserMenuAuthVo> topMenuArray = new ArrayList();
	 * ArrayList<UserMenuAuthVo> subMenuArray = new ArrayList(); ArrayList<String>
	 * arrayUpperMenuId = new ArrayList();
	 * 
	 * for(MenuAuthVo m : authList) { //서브메뉴 채우기
	 * menuInfoAdmVo.setMenuId(m.getMenuId()); menuInfoAdmVo =
	 * menuInfoAdmService.read(menuInfoAdmVo); UserMenuAuthVo userMenuAuthVo = new
	 * UserMenuAuthVo(); userMenuAuthVo.setMenuId(menuInfoAdmVo.getMenuId());
	 * userMenuAuthVo.setMenuNm(menuInfoAdmVo.getMenuNm());
	 * userMenuAuthVo.setMenuPath(menuInfoAdmVo.getMenuPath());
	 * 
	 * if(menuInfoAdmVo.getUpperMenuId() != null) {
	 * userMenuAuthVo.setMenuCheck("sub");
	 * userMenuAuthVo.setMenuUpperId(menuInfoAdmVo.getUpperMenuId());
	 * arrayUpperMenuId.add(menuInfoAdmVo.getUpperMenuId());
	 * subMenuArray.add(userMenuAuthVo); } }
	 * 
	 * TreeSet<String> distinctData =new TreeSet<String>(arrayUpperMenuId);
	 * arrayUpperMenuId = new ArrayList<String>(distinctData);
	 * 
	 * for(String m : arrayUpperMenuId) { menuInfoAdmVo.setMenuId(m); menuInfoAdmVo
	 * = menuInfoAdmService.read(menuInfoAdmVo); UserMenuAuthVo userMenuAuthVo = new
	 * UserMenuAuthVo(); userMenuAuthVo.setMenuId(menuInfoAdmVo.getMenuId());
	 * userMenuAuthVo.setMenuNm(menuInfoAdmVo.getMenuNm());
	 * userMenuAuthVo.setMenuPath(menuInfoAdmVo.getMenuPath());
	 * userMenuAuthVo.setMenuCheck("upper"); topMenuArray.add(userMenuAuthVo);
	 * 
	 * }
	 * 
	 * session.setAttribute("topMenuData",topMenuArray);
	 * session.setAttribute("subMenuData",subMenuArray);
	 * System.out.println(topMenuArray); System.out.println(subMenuArray);
	 */
}
