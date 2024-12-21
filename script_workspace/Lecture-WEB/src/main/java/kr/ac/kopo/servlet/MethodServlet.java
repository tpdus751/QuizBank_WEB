package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String method 	 = request.getMethod();
		String uri    	 = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id   	 = request.getParameter("id");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println(" <head>");
		out.println("   <title>응답결과</title>");
		out.println(" </head>");
		out.println(" <body>");
		out.println(" </body>");
		out.println("요청 method : " + method + "<br>");
		out.println("요청 uri : " + uri + "<br>");
		out.println("요청 url : " + url + "<br>");
		out.println("id : " + id + "<br>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
		
		/*
		System.out.println("요청 method : " + method);
		System.out.println("요청 uri : " + uri);
		System.out.println("요청 url : " + url);
		System.out.println("id : " + id);
		*/
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * "홍길동" 데이터를 utf-8 분리
		 * id: %ED%99%8D%EA%B8%B8%EB%8F%99
		 */
		request.setCharacterEncoding("utf-8");
		
		String method 	 = request.getMethod();
		String uri    	 = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id   	 = request.getParameter("id");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println(" <head>");
		out.println("   <title>응답결과</title>");
		out.println(" </head>");
		out.println(" <body>");
		out.println(" </body>");
		out.println("요청 method : " + method + "<br>");
		out.println("요청 uri : " + uri + "<br>");
		out.println("요청 url : " + url + "<br>");
		out.println("id : " + id + "<br>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
		
		/*
		System.out.println("요청 method : " + method);
		System.out.println("요청 uri : " + uri);
		System.out.println("요청 url : " + url);
		System.out.println("id : " + id);
		 */
		
	}

}










