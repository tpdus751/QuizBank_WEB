package kr.ac.kopo.controller;

import java.util.StringTokenizer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;

public class WorkQuizToMyExamListController implements Controller {

	private QuizService quizService;
	private MemberService memberService;
	private SubjectService subjectService;
	
	public WorkQuizToMyExamListController() {
		quizService = new QuizServiceImpl();
		memberService = new MemberServiceImpl();
		subjectService = new SubjectServiceImpl(); 
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String subject = null;
		int page = 0;
		
		String beforePageInfo = request.getParameter("beforePage");
		if (beforePageInfo != null) {
			StringTokenizer st = new StringTokenizer(beforePageInfo, ":");
			subject = st.nextToken();
			page = Integer.parseInt(st.nextToken());
		}
		
		int quiz_no = Integer.parseInt(request.getParameter("quiz_no"));
		
		QuizVO quizVO = quizService.searchQuizByNo(quiz_no);
		MemberVO memberVO = new MemberVO(quizVO.getMember_email());
		memberVO = memberService.searchMemberById(memberVO);
		if (quizVO.getQuiz_type().equals("객관식")) {
			MultipleQuizChoiceVO multipleChoiceVO = quizService.searchChoicesByQuizNo(quiz_no);
			request.setAttribute("multipleChoiceVO", multipleChoiceVO);
		}
		
		MemberVO loginedMemberVO = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		// quizVO로 넣는게 아닌 saveQuizToListVO 객체를 만들어야 할듯(클래스)
		SaveQuizToListVO saveQuizToListVO = new SaveQuizToListVO(loginedMemberVO.getMember_email(), quiz_no);
		saveQuizToListVO = quizService.searchSaveQuizVO(saveQuizToListVO);
		if (saveQuizToListVO != null) {
			int deleteSaveQuizResult = quizService.removeMemberSaveQuiz(saveQuizToListVO);
			if (deleteSaveQuizResult <= 0) {
				request.setAttribute("deleteFailed", "시험 리스트에서 삭제를 실패하였습니다.");
			} else {
				request.setAttribute("deleteSuccess", "시험 리스트에서 삭제 성공");
			}
		} else {
			int saveQuizResult = quizService.addMemberSaveQuiz(new SaveQuizToListVO(loginedMemberVO.getMember_email(), quiz_no));
			if (saveQuizResult <= 0) {
				request.setAttribute("saveFailed", "시험 리스트에 담기에 실패하였습니다.");
			} else {
				request.setAttribute("saveSuccess", "시험 리스트에 담기 성공");
				request.setAttribute("saveQuizToListVO", new SaveQuizToListVO(loginedMemberVO.getMember_email(), quiz_no));
			}
		}
		
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("quizVO", quizVO);
		request.setAttribute("subject", subject);
		request.setAttribute("page", page);
		
		System.out.println(quizVO.getMember_email());
		System.out.println(((MemberVO) request.getAttribute("memberVO")).getMember_email());
		
		return "/quiz/quizDetailPage.jsp";
	}

}
