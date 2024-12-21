package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;

public class QuizAddPageController implements Controller {

	QuizService quizService;
	
	public QuizAddPageController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String type = request.getParameter("type");
		
		String quiz_no_str = request.getParameter("quiz_no");
		if (quiz_no_str != null) {
			int quiz_no = Integer.parseInt(quiz_no_str);
			QuizVO beforeReplyQuiz = quizService.searchQuizByNo(quiz_no);
			
			request.setAttribute("beforeReplyQuiz", beforeReplyQuiz);
		}
		
		if (type.equals("short")) {
			request.setAttribute("type", "단답식");
		} else if (type.equals("multiple")) {
			request.setAttribute("type", "객관식");
		}
		
		return "/quiz/quizAddPage.jsp";
	}

}
