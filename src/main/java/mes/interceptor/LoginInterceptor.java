package mes.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import mes.domain.sm.MatrlUserVo;
import mes.domain.sm.SystemAccessLogVo;
import mes.service.sm.MatrlUserService;
import mes.service.sm.MenuInfoAdmService;
import mes.service.sm.SystemAccessLogService;
import mes.web.cm.Constants;
import mes.web.cm.LoginController;
import mes.web.ut.Utils;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	private MenuInfoAdmService menuInfoAdmService;
	@Inject
	private MatrlUserService matrlUserService;
	@Inject
	private SystemAccessLogService systemAccessLogService;
	@Inject
	private LoginController loginController;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			
			String requestURI = request.getRequestURI();
			String ajaxCall = request.getHeader("AJAX");
			HttpSession session = request.getSession(true);
			boolean check=false;

			MatrlUserVo userVo = (MatrlUserVo)session.getAttribute(Constants.USER_SESSION_VO);	
			
			//세션 X
			if(userVo == null || userVo.getUserId() == null || "".equals(userVo.getUserId())) {
				if(ajaxCall != null && "true".equals(ajaxCall)) {
					response.sendError(503);
					return false;
				} else {
					boolean checkMobile = false;
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
					if (requestURI.indexOf("tmsc0110") >= 0 || checkMobile == true) {
						response.sendRedirect(request.getContextPath() + "/auth/tmsc0110");
					} else {
						response.sendRedirect(request.getContextPath() + "/auth/login");
					}
					
					return false;
				}
				
			//세션 O
			} else {
				String menuPath = session.getAttribute(Constants.MENU_PATH).toString();
				//logger.info("menuPath = " + menuPath);
				
				String menuUrl = "";
				String menuUrl4 = "";
				
				if(requestURI.length() >= 8) {
					menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
					menuUrl4 = menuUrl.substring(menuUrl.length()-4, menuUrl.length());
					if(menuUrl4.matches("-?\\d+(\\.\\d+)?")) {
						logger.info("MES Get menuPath = " + menuUrl + " ," + menuUrl4);
						//메인메뉴 메뉴권한 체크
						if(menuPath.indexOf(menuUrl) < 0) { // 권한
							logger.info("MES 메뉴권한 없음 =========> " + menuUrl);
							
							//PC가 권한없으면 Main으로, 모바일이 권한없으면 mainPDA으로 이동
							boolean checkMobile = false;
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
							if (checkMobile == true) {
								response.sendRedirect(request.getContextPath() + "/mainPDA");
							} else {
								response.sendRedirect(request.getContextPath() + "/main");
							}
							return false;
							
						} else {
							SystemAccessLogVo systemAccessLogVo = new SystemAccessLogVo();
							systemAccessLogVo.setUserNumber(userVo.getUserNumber().toString());
							systemAccessLogVo.setUserId(userVo.getUserId().toString()); 
							systemAccessLogVo.setUserNm(userVo.getUserNm().toString()); 
							systemAccessLogVo.setDepartmentCd(userVo.getDepartmentCd().toString());
							systemAccessLogVo.setRegId(Utils.getUserId());			
							systemAccessLogVo.setMenuPath(menuUrl);
							systemAccessLogVo.setIpAddr(loginController.getClientIP(request));					
							
							logger.info("저는 시스템 브이오에오 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + systemAccessLogVo);
							
							systemAccessLogService.create(systemAccessLogVo);							
						}
					} else {
						String ajaxMenuAuth = request.getParameter("menuAuth");
						
						logger.info("MES Ajax ajaxHeader&menuAuth = " + ajaxCall + "," + ajaxMenuAuth);
						if(ajaxCall != null && "true".contentEquals(ajaxCall)) {
							if(ajaxMenuAuth != null && ajaxMenuAuth.length() > 0 && menuPath.indexOf(ajaxMenuAuth) < 0) { // 권한
								logger.info("MES Ajax 메뉴권한 없음 =========> " + ajaxMenuAuth);
								response.sendRedirect(request.getContextPath() + "/main");
								return false;
							} else {								
								logger.info("MES Ajax 메뉴권한 PASS =========> " + ajaxMenuAuth);
							}
							
						} else {
							logger.info("MES No Ajax 메뉴권한 PASS =========> " + ajaxMenuAuth);
						}
					}
				} else {
					logger.info("No menuPath8 = " + menuPath);
				}
				
				//logger.info("menuPath2 = " + menuPath); 
				//logger.info("login User info = " + userVo);
//				String menuAuth =  (String)session.getAttribute("menuAuth");
//				logger.info("menuAuth(메뉴권한) : " + menuAuth);
//				
//				if(menuAuth != null && !session.getAttribute("menuAuth").toString().contains(menuAuth)) {
//					System.out.println("login test====================================>");
//					System.out.println(menuAuth);
//					session.invalidate();
//					return false;
//				}
				
				
				
				/*
				 * 
				 * //MenuInfoAdmVo menuInfoAdmVo = new MenuInfoAdmVo(); List<MenuAuthVo>
				 * attribute = (List<MenuAuthVo>) session.getAttribute("userAuth");
				 * List<MenuInfoAdmVo> menuList = (List<MenuInfoAdmVo>)
				 * session.getAttribute("menuList"); System.out.println(requestURI);
				 * System.out.println(attribute); String url = "";
				 * 
				 * 
				 * 
				 */
				
				
				
				
				
				//url 검사
				//for(MenuAuthVo m : attribute){				
				//	menuInfoAdmVo.setMenuId(m.getMenuId());
				//	menuInfoAdmVo = menuInfoAdmService.read(menuInfoAdmVo);
				//	
				//	if(menuInfoAdmVo.getMenuPath() != null) {							
				//		url =  "/" + menuInfoAdmVo.getMenuPath();
				//		if(url.equals(requestURI)) {							
				//			check = true;
				//			break;
				//		}
				//	}					 
				//}
				
				
				
				
				
				
				
				/*
				 * 
				 * 
				 * //권한이 있으면 if(menuAuth.contains(requestURI.substring(1))){
				 * logger.info("권한 잇음"); check = true; } else { logger.info("권한 없어 꺼쪄");
				 * response.sendRedirect(request.getContextPath() + "/bmsc0050"); }
				 * 
				 * 
				 */
				
				
				
				
				
				
				
				//입력한 url이 menuPath에 있으면
				//for(MenuInfoAdmVo m : menuList) {
                //
				//	if(m.getMenuPath() != null ) {
				//		String menuPath = "/" +  m.getMenuPath();
				//		if(menuPath.equals(requestURI) ) {
				//			//권한이 있으면
				//			if(check==true) {								
				//				return true;
				//			}//권한이 없으면
				//			else {
				//				session.invalidate();
				//				response.sendRedirect(request.getContextPath() + "/auth/login");
				//				return false;
				//			}
				//		}						
				//	}
				//}

				
				
				//logger.info("세션 O");
				//response.sendRedirect(request.getContextPath() + "bmsc0010");
				//return false;
			}

			//// 세션검사 후 세션이 없으면 로그인 페이지로 이동
			//MatrlUserVo userVo = new MatrlUserVo();
			//if(request.getSession().getAttribute("userId") == null) {
			//	String ajaxCall = (String) request.getHeader("AJAX");
			//	if(ajaxCall != null) {
			//		response.sendError(503);
			//	} else {
			//		
			//		Cookie[] cookies = request.getCookies() ;
			//		logger.info("3333333333333333333");
			//        for(int i=0; i < cookies.length; i++){
			//        	
			//            Cookie c = cookies[i] ;
			//            if( c.getName().equals("JSESSIONID")) {
			//            	//session.invalidate();
			//            	//HttpSession session = session.setId(c.getValue());
			//            	//session = session.setId(c.getValue());
			//            	userVo.setUserId(c.getValue());							
			//				logger.info("쿠키 있음 세션 초기화 후 새로 생성, bmsc0010으로 이동하게 만들기");
			//				//mav.setViewName("redirect:"+request.getContextPath()+"/bmsc0010");
			//				//mav.setViewName("bm/bmsc0010");
			//				check=true;
			//            }
			//            /*
			//            if( c.getName().equals("userNumber")) {
			//            	//session.invalidate();
			//            	HttpSession session2 = request.getSession(true);
			//            	userVo.setUserNumber(c.getValue());							
			//				logger.info("쿠키 있음 세션 초기화 후 새로 생성, bmsc0010으로 이동하게 만들기");
			//				//mav.setViewName("redirect:"+request.getContextPath()+"/bmsc0010");
			//				//mav.setViewName("bm/bmsc0010");
			//            }
			//            */
			//            
		    //    	}
			//	}
			//	/*
			//	userVo = matrlUserService.read(userVo);
			//	session.setAttribute("userNumber", userVo.getUserNumber());
			//	session.setAttribute("userNm", userVo.getUserNm());
			//	session.setAttribute("userId", userVo.getUserId());
			//	session.setAttribute("department", userVo.getDepartmentCd());
			//	*/
			//	if(!check) {
			//		response.sendRedirect("/auth/login");
			//	}
			//	return false;
			//}
			//// 세션이 있으면
			/*else {
				if(menuAuth != null && !session.getAttribute("menuAuth").toString().contains(menuAuth)) {
					logger.info("login test====================================>");
					logger.info(menuAuth);
					session.invalidate();
					
					return false;
				}
				*/
				
//				MenuInfoAdmVo menuInfoAdmVo = new MenuInfoAdmVo();
//				List<MenuAuthVo> attribute = (List<MenuAuthVo>) session.getAttribute("userAuth");
//				List<MenuInfoAdmVo> menuList = (List<MenuInfoAdmVo>) session.getAttribute("menuList");
//				System.out.println(requestURI);
//				System.out.println(attribute);

//				String url = "";
				
//				//url 검사
//				for(MenuAuthVo m : attribute){				
//					menuInfoAdmVo.setMenuId(m.getMenuId());
//					menuInfoAdmVo = menuInfoAdmService.read(menuInfoAdmVo);
//					
//					if(menuInfoAdmVo.getMenuPath() != null) {							
//						url =  "/" + menuInfoAdmVo.getMenuPath();
//						if(url.equals(requestURI)) {							
//							check = true;
//							break;
//						}
//					}					 
//				}
//				//입력한 url이 menuPath에 있으면
//				for(MenuInfoAdmVo m : menuList) {
//					if(m.getMenuPath() != null ) {
//						String menuPath = "/" +  m.getMenuPath();
//						if(menuPath.equals(requestURI) ) {
//							//권한이 있으면
//							if(check==true) {								
//								return true;
//							}//권한이 없으면
//							else {
//								session.invalidate();
//								response.sendRedirect(request.getContextPath() + "/auth/login");
//								return false;
//							}
//						}						
//					}
//				}

			//}
						
		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
		}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}