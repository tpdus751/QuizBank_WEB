package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class RegistMemberProcessController implements Controller {
	
	MemberService memberService;
	
	public RegistMemberProcessController() {
		memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if (request.getSession().getAttribute("unMemberVO") != null) {
			String member_email = request.getParameter("member_email");
			String member_pwd = request.getParameter("member_pwd");
			String member_nm = request.getParameter("member_nm");
			String nick_nm = request.getParameter("nick_nm");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			
			MemberVO member = new MemberVO(member_email, member_nm, member_pwd, nick_nm, "U", phone1, phone2, phone3, 100);
			
			int result = memberService.changeMemberInfoByVO(member);
			if (result <= 0) {
				request.setAttribute("registFailed", "회원가입에 실패하였습니다.");
				return "/home.jsp";
			} else {
				request.getSession().removeAttribute("unMemberVO");
				request.setAttribute("registSuccess", "회원가입이 성공적으로 이루어졌습니다.");
				return "/member/loginPage.jsp";
			}
		} else {
			String email_id = request.getParameter("email_id");
			String email_domain = request.getParameter("email_domain");
			
			String member_email = email_id + "@" + email_domain;
			String member_pwd = request.getParameter("member_pwd");
			String member_nm = request.getParameter("member_nm");
			String nick_nm = request.getParameter("nick_nm");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			
			MemberVO member = new MemberVO(member_email, member_nm, member_pwd, nick_nm, "U", phone1, phone2, phone3, 100);
			
			int result = memberService.registMemberByVO(member);
			if (result <= 0) {
				request.setAttribute("registFailed", "회원가입에 실패하였습니다.");
				return "/home.jsp";
			} else {
				request.setAttribute("registSuccess", "회원가입이 성공적으로 이루어졌습니다.");
				return "/member/loginPage.jsp";
			}
		}
		
	}

}
