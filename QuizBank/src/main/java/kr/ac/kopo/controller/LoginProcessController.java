package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {
	
	private MemberService memberService;

	public LoginProcessController() {
		this.memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_email = request.getParameter("email");
		String member_pwd = request.getParameter("password");
		MemberVO member = new MemberVO(member_email, member_pwd);
		//System.out.println(member_email + " : " + member_pwd);
		
		member = memberService.seachMember(member);
		if (member == null) {
			request.setAttribute("error", "해당 아이디 / 비밀번호가 존재하지 않습니다.");
			return "/member/loginPage.jsp";
		}
		
		if (member.getMember_email().equals("admin@naver.com")) {
			request.getSession().setAttribute("loginMemberVO", member);
			return "redirect:/admin/home.do"; // 리다이렉트 경로 반환
		} else {
			request.getSession().setAttribute("loginMemberVO", member);
			return "redirect:/home.do"; // 리다이렉트 경로 반환
		}
	}

}
