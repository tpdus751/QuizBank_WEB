package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class BanMemberController implements Controller {
	
	MemberService memberService;
	
	public BanMemberController() {
		memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String member_email = request.getParameter("member_email");
		
		int checkBan = memberService.adjustMemberProhibit(member_email);
		
		if (checkBan == 0) {
			request.setAttribute("banError", "아이디 : " + member_email + " 제재에 실패하였습니다.");
		} else {
			request.setAttribute("banSuccess", "아이디 : " + member_email + " 제재에 성공하였습니다.");
		}
		
		String page = request.getParameter("page");
		
		return "/admin/memberManagementPage.do?page=" + page;
	}

}
