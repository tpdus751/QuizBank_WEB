package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;

public class HomeController implements Controller {
	
	QuizService quizService;
	
	public HomeController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if (request.getAttribute("lackOfQuiz") != null) {
			request.setAttribute("lackOfQuiz", "현재 최소 20문제가 존재하지 않습니다.");
		}
		
		List<QuizVO> fourLatestQuizs = quizService.searchFourLatestQuizs();
		if (fourLatestQuizs != null) {
			request.setAttribute("fourLatestQuizs", fourLatestQuizs);
		}
		
		List<QuizVO> fourHotQuizs = quizService.searchFourHotQuizs();
		if (fourHotQuizs != null) {
			request.setAttribute("fourHotQuizs", fourHotQuizs);
		}
		
		List<QuizVO> fourHardQuizs = quizService.searchFourHardQuizs();
		if (fourHardQuizs != null) {
			request.setAttribute("fourHardQuizs", fourHardQuizs);
		}
		
		
		return "/home.jsp";
	}

}
