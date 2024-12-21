package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;

public class SuccessMapEventController implements Controller {
	
	MemberService memberService;
	
	public SuccessMapEventController() {
		memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		if (loginMember == null) {
			request.setAttribute("incorrectAccess", "잘못된 접근 입니다. 크레딧은 주어지지 않습니다.");
			return "redirect:/home.jsp";
		}
		
		MemberVO member = memberService.searchMemberById(loginMember);
		member.setCredit(member.getCredit() + 100);
		int memberCreditUpdateCnt = memberService.changeMemberInfoByVO(member);
		if (memberCreditUpdateCnt <= 0) {
			request.setAttribute("memberCreditUpdateError", "크레딧 지급에 실패하였습니다.");
			return "redirect:/home.jsp";
		}
		
		MemberCreditFlowVO creditFlow = new MemberCreditFlowVO();
		creditFlow.setMember_email(member.getMember_email());
		creditFlow.setWork_credit(100);
		creditFlow.setMember_credit(member.getCredit() + 100);
		creditFlow.setWork_nm("지도 이벤트");
		
		int insertResult = memberService.addCreditFlow(creditFlow);
		if (insertResult <= 0) {
			System.out.println("크레딧 이력 테이블에 삽입에 실패하였습니다.");
		}
		
		
		return "redirect:/home.do";
	}

}
