package kr.ac.kopo.controller;

import java.util.StringTokenizer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_quiz.vo.MemberQuizVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;

public class QuizDatailPageController implements Controller {

	private QuizService quizService;
	private MemberService memberService;
	private SubjectService subjectService;
	
	public QuizDatailPageController() {
		quizService = new QuizServiceImpl();
		memberService = new MemberServiceImpl();
		subjectService = new SubjectServiceImpl(); 
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String adminPageStr = request.getParameter("adminPage");
		
		String beforePageInfo = request.getParameter("beforePage");
		String subject = null;
		int page = 0;
		if (beforePageInfo != null) {
			StringTokenizer st = new StringTokenizer(beforePageInfo, ":");
			subject = st.nextToken();
			page = Integer.parseInt(st.nextToken());
		}
		
		int quiz_no = Integer.parseInt(request.getParameter("no"));
		QuizVO quizVO = quizService.searchQuizByNo(quiz_no);
		MemberVO memberVO = new MemberVO(quizVO.getMember_email());
		memberVO = memberService.searchMemberById(memberVO);
		if (quizVO.getQuiz_type().equals("객관식")) {
			MultipleQuizChoiceVO multipleChoiceVO = quizService.searchChoicesByQuizNo(quiz_no);
			request.setAttribute("multipleChoiceVO", multipleChoiceVO);
		} 
		
		// 조회수 + 1 로직
		int viewCntPlusResult = quizService.changeQuizViewPlusByQuizNo(quiz_no);
		if (viewCntPlusResult > 0) {
			System.out.println("조회수 + 1 성공");
		}
		
		// 로그인이 되어 있을 떄 시험리스트에 담은 퀴즈인지 확인
		MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		if (loginMember != null) {
			SaveQuizToListVO saveQuizToListVO = new SaveQuizToListVO(loginMember.getMember_email(), quiz_no);
			saveQuizToListVO = quizService.searchSaveQuizVO(saveQuizToListVO);
		
			if (saveQuizToListVO != null) {
				request.setAttribute("saveQuizToListVO", saveQuizToListVO);
			}
		}
		
		if (loginMember != null) {
			MemberQuizVO memberQuizVO = new MemberQuizVO(loginMember.getMember_email(), quiz_no);
			memberQuizVO = quizService.searchMemberQuizVO(memberQuizVO);
			if (memberQuizVO != null) {
				request.setAttribute("memberQuizVO", memberQuizVO);
			}
		}
		
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("quizVO", quizVO);
		if (beforePageInfo != null && adminPageStr == null) {
			request.setAttribute("subject", subject);
			request.setAttribute("page", page);
		} else if (beforePageInfo == null && adminPageStr != null) {
			request.setAttribute("adminPage", "관리자");
			request.setAttribute("page", adminPageStr);
		}
		
		System.out.println(quizVO.getMember_email());
		System.out.println(((MemberVO) request.getAttribute("memberVO")).getMember_email());
		
		return "/quiz/quizDetailPage.jsp";
	}

}
