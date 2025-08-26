package mes.interceptor;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//import sung2ne.security.JwtManager;

public class AppInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AppInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HashMap<String, Object> tokenMap;

		String jwtToken = request.getHeader("Authorization");

//		if (jwtToken != null) {
//			tokenMap = JwtManager.verifyToken(request.getHeader("Authorization"));
//
//	        if( "1".equals(tokenMap.get("tokenCode")) ){
//	        	request.setAttribute("idx", tokenMap.get("idx"));
//		        request.setAttribute("employeeNumber", tokenMap.get("employeeNumber"));
//		        request.setAttribute("name", tokenMap.get("name"));
//		        request.setAttribute("rank", tokenMap.get("rank"));
//	        	return true;
//	        }
//		}

		response.sendError(401);
		return false;
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
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}
