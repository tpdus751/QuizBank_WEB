package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizVO;

public class QuizUpdateProcessController implements Controller {
	
	QuizService quizService;
	
	

	public QuizUpdateProcessController() {
		quizService = new QuizServiceImpl();
	}



	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int beforeSubject = 0;
		int beforePage = 0;
		if (request.getParameter("before:subject_no") != null && request.getParameter("before:page_no") != null) {
			System.out.println("왜 널이 아니지??");
			beforeSubject = Integer.parseInt(request.getParameter("before:subject_no"));
			beforePage = Integer.parseInt(request.getParameter("before:page_no"));
		}
		
		int quiz_no = Integer.parseInt(request.getParameter("quiz_no"));
		String quiz_nm = request.getParameter("quizTitle");
		String content = request.getParameter("quizContent");
		String answer = request.getParameter("answer");
		String explanation = request.getParameter("explanation");
		
		QuizVO quizVO = new QuizVO(quiz_no, quiz_nm, content, explanation, answer);
		int result = quizService.changeQuizByQuizVO(quizVO);
		if (result <= 0) {
			request.setAttribute("updateQuizError", "문제 수정에 실패 하였습니다.");
		} else {
			request.setAttribute("successQuizUpdate", "문제가 수정 되었습니다.");
		}
		quizVO = quizService.searchQuizByNo(quiz_no);
		request.setAttribute("quizVO", quizVO);
		
		String quiz_type = request.getParameter("type");
		if (quiz_type.equals("객관식")) {
			String choice_1 = request.getParameter("choice1");
			String choice_2 = request.getParameter("choice2");
			String choice_3 = request.getParameter("choice3");
			String choice_4 = request.getParameter("choice4");
			String choice_5 = request.getParameter("choice5");
			
			MultipleQuizChoiceVO multiChoiceVO = new MultipleQuizChoiceVO(quiz_no, choice_1, choice_2, choice_3, choice_4, choice_5);
			
			int choiceResult = quizService.changeChoicesByChoiceVO(multiChoiceVO);
			if (choiceResult <= 0) {
				request.setAttribute("updateChoicesError", "보기 수정에 실패 하였습니다.");
			} else {
				request.setAttribute("successQuizUpdate", "문제가 수정 되었습니다.");
			}
			multiChoiceVO = quizService.searchChoicesByQuizNo(quiz_no);
			request.setAttribute("quizVO", quizVO);
			request.setAttribute("multipleChoiceVO", multiChoiceVO);
		}
		if (request.getParameter("before:subject_no") != null && request.getParameter("before:page_no") != null) {
			request.setAttribute("subject", beforeSubject);
			request.setAttribute("page", beforePage);
		}
		
		return "/quiz/quizDetailPage.jsp";
	}

}
