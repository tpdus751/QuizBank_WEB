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
	public void init(ServletConfig config) throws ServletException { // ServletConfig가 web.xml불러올 수 있음
		String propName = config.getInitParameter("propName");
		System.out.println("propName : " + propName);
		mappings = new HandlerMapping(propName);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(contextPath.length()); // 컨텍스트 패스 뒤만 추출
		System.out.println("요청 uri : " + uri);
		System.out.println("contextPath : " + contextPath);
		
		try {
			Controller control = mappings.getController(uri);
			String callPage = control.handleRequest(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}
	}
	
}
