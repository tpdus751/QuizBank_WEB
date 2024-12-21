package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;

public class MyPageController implements Controller {
	
	QuizService quizService;
	
	public MyPageController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		String loginMember_email = loginMember.getMember_email();
		
		SaveQuizToListVO saveQuizToListVO = new SaveQuizToListVO(loginMember_email);
		
		// 내가 시험 리스트에 저장한 문제들
		List<SaveQuizToListVO> saveQuizList = null;
		saveQuizList = quizService.searchMemberSaveQuizs(saveQuizToListVO);
		List<QuizVO> saveQuizVOList = new ArrayList<>();
		if (saveQuizList.size() != 0) {
			for (SaveQuizToListVO saveQuizToList : saveQuizList) {
				int quiz_no = saveQuizToList.getQuiz_no();
				QuizVO quiz = quizService.searchQuizByNo(quiz_no);
				saveQuizVOList.add(quiz);
			}
			
			request.setAttribute("saveQuizVOList", saveQuizVOList);
		}
		
		// 내가 작성한 문제들
		List<QuizVO> myQuizList = null;
		myQuizList = quizService.searchMyQuizByMyEmail(loginMember_email);
		if (myQuizList.size() != 0) {
			request.setAttribute("myQuizList", myQuizList);
		}
		
		// 내가 틀린 문제들
		List<QuizVO> myIncorrectQuizList = null;
		myIncorrectQuizList = quizService.searchMyIncorrectQuizListByEmail(loginMember_email);
		if (myIncorrectQuizList.size() != 0) {
			request.setAttribute("myIncorrectQuizList", myIncorrectQuizList);
		}
		
		return "/member/myPage.jsp";
	}

}
