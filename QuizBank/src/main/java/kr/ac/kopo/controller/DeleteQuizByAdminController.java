package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;

public class DeleteQuizByAdminController implements Controller {
	
	QuizService quizService;
	
	public DeleteQuizByAdminController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginedMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		if (loginedMember != null && loginedMember.getType().equals("S")) {
			
			String pageStr = request.getParameter("page");
			if (pageStr == null) {
				return "/home.do";
			}
			
			String quizNoStr = request.getParameter("no");
			if (quizNoStr == null) {
				return "/home.do";
			}
			
			int quiz_no = Integer.parseInt(quizNoStr);
			
			QuizVO quiz = quizService.searchQuizByNo(quiz_no);
			
			if (quiz.getQuiz_type().equals("객관식")) {
				int choiceResult = quizService.removeQuizChoiceByQuizNo(quiz_no);	
				if (choiceResult <= 0) {
					request.setAttribute("errorRemove3", "자식 테이블 : 보기 삭제에 실패하였습니다.");
				}
			} else { // 단답식 일 때
				int hintResult = quizService.removeQuizHintByNo(quiz_no);
				if (hintResult <= 0) {
					request.setAttribute("errorRemove4", "자식 테이블 : 힌트 삭제에 실패하였습니다.");
				}
			}
			
			int result = quizService.removeQuizByQuizNo(quiz_no);
			if (result <= 0) {
				request.setAttribute("errorRemove", "삭제에 실패하였습니다.");
			} else {
				request.setAttribute("successRemove", "게시글이 성공적으로 삭제되었습니다.");
			}
			
			return "/admin/quizManagementPage.do?page=" + pageStr;
		} else {
			return "/home.do";
		}
	}

}
