package kr.ac.kopo.controller;

import java.util.StringTokenizer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizVO;

public class QuizUpdatePageController implements Controller {
	
	QuizService quizService;
	
	

	public QuizUpdatePageController() {
		quizService = new QuizServiceImpl();
	}



	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int quiz_no = Integer.parseInt(request.getParameter("quiz_no"));
		int subject = 0;
		int page = 0;
		
		String beforePage = request.getParameter("beforePage");
		if (beforePage != null) {
			StringTokenizer st = new StringTokenizer(beforePage, ":");
			subject = Integer.parseInt(st.nextToken());
			page = Integer.parseInt(st.nextToken());
		}
		
		if (beforePage != null) {
			request.setAttribute("subject", subject);
			request.setAttribute("page", page);
		}
		
		QuizVO quizVO = quizService.searchQuizByNo(quiz_no);
		request.setAttribute("quizVO", quizVO);
		if (quizVO.getQuiz_type().equals("객관식")) {
			MultipleQuizChoiceVO choices = quizService.searchChoicesByQuizNo(quiz_no);
			request.setAttribute("choices", choices);
		} 
		
		
		
		return "/quiz/quizUpdatePage.jsp";
	}

}
