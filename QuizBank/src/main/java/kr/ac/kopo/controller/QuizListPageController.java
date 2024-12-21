package kr.ac.kopo.controller;

import java.util.List;
import java.util.StringTokenizer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;
import kr.ac.kopo.subject.vo.SubjectVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public class QuizListPageController implements Controller {

	private QuizService quizService;
	private SubjectService subjectService;
	
	public QuizListPageController() {
		quizService = new QuizServiceImpl();
		subjectService = new SubjectServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.removeAttribute("subject");
		request.removeAttribute("pageName");
		request.removeAttribute("subject_no");
		request.removeAttribute("currentPage");
		request.removeAttribute("totalPages");
		request.removeAttribute("startPage");
		request.removeAttribute("endPage");
		
		String pageInfo = request.getParameter("page");

		StringTokenizer st = new StringTokenizer(pageInfo, ":");
		int subject_no = Integer.parseInt(st.nextToken());
		int currentPage = Integer.parseInt(st.nextToken());
		
		int totalPages = 0;
		Integer totalQuizCnt = 0;
		
		int startPage = 1;
		int endPage;
		
		SubjectPageVO subjectPageVO = new SubjectPageVO(subject_no, currentPage);
		System.out.println(subjectPageVO.toString());
		if (subject_no == 0) {
			totalQuizCnt = quizService.searchToTalQuizCnt();
			if (totalQuizCnt == null) {
				System.out.println("문제가 없습니다.");
			}
			
			totalPages = totalQuizCnt / 16;
			if (totalQuizCnt % 16 > 0) {
				totalPages += 1;
			}
			endPage = totalPages;
			
			System.out.println("현재 페이지 : " + currentPage);

			List<QuizVO> allQuizList = quizService.searchAllQuiz(subjectPageVO);
			for (QuizVO quiz : allQuizList) {
				System.out.println(quiz);
			}
			request.setAttribute("subject", allQuizList);
			request.setAttribute("pageName", "모든 문제보기");
			request.setAttribute("subject_no", subject_no);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} else {
			SubjectVO subjectVO = subjectService.selectSubject(subjectPageVO);
			System.out.println(subjectVO.toString());
			totalQuizCnt = quizService.searchTotalSubjectQuizCnt(subject_no);
			
			totalPages = totalQuizCnt / 16;
			if (totalQuizCnt % 16 > 0) {
				totalPages += 1;
			}
			endPage = totalPages;
			
			List<QuizVO> quizList = quizService.searchSubjectQuiz(subjectPageVO);
			request.setAttribute("subject", quizList);
			request.setAttribute("pageName", subjectVO.getPage_nm());
			request.setAttribute("subject_no", subject_no);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		}
		
		return "/quiz/quizListPage.jsp";
	}

}
