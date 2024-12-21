package kr.ac.kopo.controller;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;

public class QuizDeleteController implements Controller {
	
	QuizService quizService;
	SubjectService subjectService;
	

	public QuizDeleteController() {
		quizService = new QuizServiceImpl();
		subjectService = new SubjectServiceImpl();
	}



	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int quiz_no = Integer.parseInt(request.getParameter("quiz_no"));
		
		String quiz_type = request.getParameter("quiz_type");
		
		// 헤당 문제가 내가 시험 리스트에 넣은 문제라면 삭제 먼저 진행
		MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		SaveQuizToListVO saveQuizToListVO = new SaveQuizToListVO(loginMember.getMember_email(), quiz_no);
		saveQuizToListVO = quizService.searchSaveQuizVO(saveQuizToListVO);
		if (saveQuizToListVO != null) {
			int isDeleteSaveQuizVO = quizService.removeMemberSaveQuiz(saveQuizToListVO);
			if (isDeleteSaveQuizVO <= 0) {
				System.out.println("시험리스트에 담긴 해당 문제 삭제 실패");
			}
		}
		
		if (quiz_type.equals("객관식")) {
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
		
		QuizVO quiz = quizService.searchQuizByNo(quiz_no);
		
		int result = quizService.removeQuizByQuizNo(quiz_no);
		if (result <= 0) {
			request.setAttribute("errorRemove", "삭제에 실패하였습니다.");
		} else {
			request.setAttribute("successRemove", "게시글이 성공적으로 삭제되었습니다.");
		}
		
		request.setAttribute("pageGo", "0:1");
		
		
		return "/quiz/quizListPage.jsp";
	}

}
