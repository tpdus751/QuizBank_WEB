package kr.ac.kopo.framework;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;

public class DispatcherServlet extends HttpServlet {
	
	private HandlerMapping mappings;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String propName = config.getInitParameter("propName");
		System.out.println("propName : " + propName);
		mappings = new HandlerMapping(propName);
	}
	//
	@Override
	public void service(HttpServletRequest request, 
			HttpServletResponse response)
					throws ServletException, IOException {
		
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(contextPath.length());
		System.out.println("요청 uri : " + uri);
		System.out.println("contextPath : " + contextPath);
		
		try {
			Controller control = mappings.getController(uri);
			if (control == null) {
			    System.err.println("컨트롤러가 null입니다. 요청 URI: " + uri);
			    throw new ServletException("컨트롤러가 null입니다. 요청 URI: " + uri);
			} else {
				System.err.println("컨트롤러가 null이 아닙니다. 요청 URI: " + uri);
			}
			String callPage = control.handleRequest(request, response);
			if (callPage == null) {
			    // AJAX 응답처럼 forwarding이나 redirect가 필요 없는 경우
			    return; // 더 이상 아무 처리도 하지 않고 종료
			}
			
			 // 반환값이 redirect:로 시작하는지 확인
	        if (callPage.startsWith("redirect:")) {
	            String redirectPath = callPage.substring("redirect:".length());
	            response.sendRedirect(contextPath + redirectPath); // 리다이렉트 수행
	        } else {
	            RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
	            dispatcher.forward(request, response);
	        }
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}
	}
}








