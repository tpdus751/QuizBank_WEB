package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegistMemberPageController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getParameter("unMember") != null) {
			request.getSession().removeAttribute("unMemberVO");
		}
		return "/member/registMemberPage.jsp";
	}

}
