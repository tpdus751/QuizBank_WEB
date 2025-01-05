package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class DeleteMemberController implements Controller {
	
	MemberService memberService;
	
	public DeleteMemberController() {
		memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String member_email = request.getParameter("member_email");
		
		int changeCnt = memberService.removeMemberByAdmin(member_email);
		
		if (changeCnt >= 1) {
			request.setAttribute("deleteMemberSuccess", member_email + "인 회원이 삭제되었습니다.");
		}
		
		String page = request.getParameter("page");
		
		return "/admin/memberManagementPage.do?page=" + page;
	}

}
