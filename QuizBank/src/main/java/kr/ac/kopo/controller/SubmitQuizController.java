package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_quiz.vo.MemberQuizVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;

public class SubmitQuizController implements Controller {
	
	QuizService quizService;
	
	public SubmitQuizController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		List<QuizVO> testQuizList = (List<QuizVO>)request.getSession().getAttribute("testQuizList");
		
		int totalScore = 0;
		
		List<QuizVO> incorrectQuizList = new ArrayList<>();
		
		int normalWorkCnt = 0;
		
//		int javaCnt = 0;
//		int linuxCnt = 0;
//		int pythonCnt = 0;
//		int bigDataCnt = 0;
//		int ictCnt = 0;
//		int programmingCnt = 0;
//		int scriptCnt = 0;
		
		int[][] subjectList = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
		
		for (QuizVO testQuiz : testQuizList) {
			normalWorkCnt += 1;
			
			int errorCnt = 0;
			
			int quiz_no = testQuiz.getQuiz_no();
			
			String originalQuizAnswer = testQuiz.getAnswer(); // 원래 문제 답
			String submittedQuizAnswer = request.getParameter("answer_" + quiz_no); // 제출된 문제 답
		
			QuizVO quiz = quizService.searchQuizByNo(quiz_no);
			quiz.setTry_cnt(quiz.getTry_cnt() + 1);
			
			int subject_no = quiz.getSubject_no() - 1;
			
			subjectList[subject_no][0] += 1;
			
			MemberQuizVO memberQuizInfoB = new MemberQuizVO(loginMember.getMember_email(), quiz_no);
			MemberQuizVO memberQuizInfoA = quizService.searchMemberQuizVO(memberQuizInfoB);
			
			if (originalQuizAnswer.equals(submittedQuizAnswer)) { // 정답이라면
				totalScore += 5;
				
				subjectList[subject_no][1] += 1;
				
				quiz.setCorrect_cnt(quiz.getCorrect_cnt() + 1);
				
				if (memberQuizInfoA != null) {
					// member_quiz 테이블에 is_correct 업데이트, quiz_try_cnt + 1하기
					memberQuizInfoA.setIs_correct("O");
					int updateMemberQuizResult = quizService.changeMemberQuizInfo(memberQuizInfoA);
					if (updateMemberQuizResult <= 0) {
						errorCnt += 1;
						System.out.println(quiz_no + "번 문제에 대해 member_quiz 테이블에 is_correct O 업데이트 실패");
					}
					
				} else {
					// member_quiz 테이블에 is_correct 삽입, quiz_try_cnt 에 1 삽입 
					memberQuizInfoB.setIs_correct("O");
					memberQuizInfoB.setQuiz_try_cnt(1);
					
					int addMemberQuizResult = quizService.addMemberQuizByVO(memberQuizInfoB);
					if (addMemberQuizResult <= 0) {
						errorCnt += 1;
						System.out.println(quiz_no + "번 문제에 대해 member_quiz 테이블에 추가 오류");
					}
				}
			} else { // 오답이라면
				incorrectQuizList.add(quiz);
				
				if (memberQuizInfoA != null) {
					// member_quiz 테이블에 is_correct 업데이트, quiz_try_cnt + 1하기
					memberQuizInfoA.setIs_correct("X");
					int updateMemberQuizResult = quizService.changeMemberQuizInfo(memberQuizInfoA);
					if (updateMemberQuizResult <= 0) {			
						errorCnt += 1;
						System.out.println(quiz_no + "번 문제에 대해 member_quiz 테이블에 is_correct X 업데이트 실패");
					}
					
				} else {
					// member_quiz 테이블에 is_correct 삽입, quiz_try_cnt 에 1 삽입 
					memberQuizInfoB.setIs_correct("X");
					memberQuizInfoB.setQuiz_try_cnt(1);
					
					int addMemberQuizResult = quizService.addMemberQuizByVO(memberQuizInfoB);
					if (addMemberQuizResult <= 0) {
						errorCnt += 1;
						System.out.println(quiz_no + "번 문제에 대해 member_quiz 테이블에 추가 오류");
					}
				}
			}
			
			quiz.setCorrect_ratio(Math.round((float) quiz.getCorrect_cnt() / quiz.getTry_cnt() * 100));
			int changeQuizResult = quizService.changeQuizInfoWhenTestEnded(quiz);
			if (changeQuizResult <= 0) {
				errorCnt += 1;
				System.out.println(quiz_no + "번에 quizs 테이블 업데이트 실패");
			}
			
			if (errorCnt > 0) {
				normalWorkCnt -= 1;
			}
		}
		
		if (normalWorkCnt < 20) {
			return "/home.jsp";
		} else {
			request.setAttribute("totalScore", totalScore);
			request.setAttribute("incorrectQuizList", incorrectQuizList);
			request.setAttribute("subjectList", subjectList);
			
			return "/test/submitTestPage.jsp";
		}
	}

}
