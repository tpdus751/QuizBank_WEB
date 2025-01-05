package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class UnBanMemberController implements Controller {
	
	MemberService memberService;
	
	public UnBanMemberController() {
		memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String member_email = request.getParameter("member_email");
		
		int changeCnt = memberService.changeProhibitToNull(member_email);
		
		if (changeCnt >= 1) {
			request.setAttribute("unBanSuccess", member_email + "의 제재가 취소되었습니다.");
		}
		
		String page = request.getParameter("page");
		
		return "/admin/memberManagementPage.do?page=" + page;
	}

}
