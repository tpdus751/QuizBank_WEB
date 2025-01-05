package kr.ac.kopo.controller;

import java.time.LocalDate;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;

public class AdminHomePageController implements Controller {
	
	MemberService memberService;
	QuizService quizService;
	SubjectService subjectService;
	
	public AdminHomePageController() {
		memberService = new MemberServiceImpl();
		quizService = new QuizServiceImpl();
		subjectService = new SubjectServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginedMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		if (loginedMember != null && loginedMember.getType().equals("S")) {
			// 총 회원 수(관리자 포함)
			int totalMemberCnt = memberService.searchTotalMemberCnt();
			
			request.setAttribute("totalMemberCnt", totalMemberCnt);
			
			// 총 문제 수
			int totalQuizCnt = quizService.searchToTalQuizCnt();
			
			request.setAttribute("totalQuizCnt", totalQuizCnt);
			
			// 총 문제 종류 수
			int totalSubjectCnt = subjectService.searchTotalSubjectCnt();
			
			request.setAttribute("totalSubjectCnt", totalSubjectCnt);
			
			// 오늘 신규 회원 수
			int todayNewMemberCnt = memberService.searchTodayRegistMemberCnt();
			
			request.setAttribute("todayNewMemberCnt", todayNewMemberCnt);
			
			// 이번 달 신규 회원 수
			int monthNewMemberCnt = memberService.searchMonthRegistMemberCnt();
			
			request.setAttribute("monthNewMemberCnt", monthNewMemberCnt);
			
			// 이번 해 신규 회원 수
			int yearNewMemberCnt = memberService.searchYearRegistMemberCnt();
			
			request.setAttribute("yearNewMemberCnt", yearNewMemberCnt);
			
			return "/admin/home.jsp";
		} else {
			return "/home.do";
		}
		
	}

}
