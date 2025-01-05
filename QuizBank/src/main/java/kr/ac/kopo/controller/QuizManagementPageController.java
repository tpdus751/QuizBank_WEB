package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;

public class QuizManagementPageController implements Controller {
	
	QuizService quizService;
	
	public QuizManagementPageController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		MemberVO loginedMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		if (loginedMember != null && loginedMember.getType().equals("S")) {
			String pageStr = request.getParameter("page");
			
			int page = 0;
			
			if (pageStr != null) {
				page = Integer.parseInt(pageStr);
			}
			
			if (page == 0) {
				return "/admin/home.do";
			}
			
			List<QuizVO> pageQuizList = quizService.searchPageQuizs(page);
			
			request.setAttribute("page", page);
			request.setAttribute("pageQuizList", pageQuizList);
			
			int totalPages = 0;
			int endPage;
			
			Integer totalQuizCnt = 0;
			
			totalQuizCnt = quizService.searchToTalQuizCnt();
			if (totalQuizCnt == null) {
				System.out.println("문제가 없습니다.");
			}
			
			totalPages = totalQuizCnt / 20;
			if (totalQuizCnt % 20 > 0) {
				totalPages += 1;
			}
			endPage = totalPages;
			
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("endPage", endPage);
			
			return "/admin/quizManagementPage.jsp";
			
		} else {
			return "/home.do";
		}
		
	}

}
