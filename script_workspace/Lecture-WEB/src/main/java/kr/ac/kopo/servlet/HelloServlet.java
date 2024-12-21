package kr.ac.kopo.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hi.kopo")
public class HelloServlet extends HttpServlet {

	public void init() throws ServletException {
		System.out.println("init : 최초 한번만 실행되는 메소드입니다");
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
						throws IOException, ServletException {
		System.out.println("service : 실제 작업이 수행되는 메소드입니다. 사용자가 요청할때마다 실행됩니다.");
	}
	
	public void destroy() {
		
	}
}
