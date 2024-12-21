package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;
import kr.ac.kopo.subject.vo.SubjectVO;

public class QuizAddProcessController implements Controller {
	
	SubjectService subjectService;
	QuizService quizService;
	
	public QuizAddProcessController() {
		subjectService = new SubjectServiceImpl();
		quizService = new QuizServiceImpl();
	}



	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuizVO quizVO = null;
		
		String member_email = request.getParameter("member_email");
		System.out.println("멤버 이메일 : " + member_email);
		String subject_nm = request.getParameter("subject_nm");
		if (Integer.parseInt(subject_nm) == 1) {
			subject_nm = "자바";
		} else if (Integer.parseInt(subject_nm) == 2) {
			subject_nm = "운영체제";
		} else if (Integer.parseInt(subject_nm) == 3) {
			subject_nm = "파이썬";
		} else if (Integer.parseInt(subject_nm) == 4) {
			subject_nm = "빅데이터";
		} else if (Integer.parseInt(subject_nm) == 5) {
			subject_nm = "정보통신개론";
		} else if (Integer.parseInt(subject_nm) == 6) {
			subject_nm = "프로그래밍언어실습";
		} else if (Integer.parseInt(subject_nm) == 7) {
			subject_nm = "스크립트언어실습";
		} else if (Integer.parseInt(subject_nm) == 8) {
			subject_nm = "IT용어";
		}
		
		System.out.println("nm : " + subject_nm);
		SubjectVO subjectVO = new SubjectVO(subject_nm);
		subjectVO = subjectService.searchSubjectBySubjectNm(subjectVO);
		int subject_no = subjectVO.getSubject_no();
		String quiz_nm = request.getParameter("finalTitle");
		System.out.println("최종 제목: " + quiz_nm);
		String type = request.getParameter("type");
		String content = request.getParameter("quizContent");
		String explanation = request.getParameter("explanation");
		String answer = request.getParameter("answer");
		if (answer.equals("1")) {
			answer = request.getParameter("choice_1");
		} else if (answer.equals("2")) {
			answer = request.getParameter("choice_2");
		} else if (answer.equals("3")) {
			answer = request.getParameter("choice_3");
		} else if (answer.equals("4")) {
			answer = request.getParameter("choice_4");
		} else if (answer.equals("5")) {
			answer = request.getParameter("choice_5");
		}
		
		String quiz_img = "";
		if (subject_nm.equals("자바")) {
			quiz_img = "/assets/자바.png";
		} else if (subject_nm.equals("운영체제")) {
			quiz_img = "/assets/운영체제.jpg";
		} else if (subject_nm.equals("파이썬")) {
			quiz_img = "/assets/파이썬.png";
		} else if (subject_nm.equals("빅데이터")) {
			quiz_img = "/assets/빅데이터.jpg";
		} else if (subject_nm.equals("정보통신개론")) {
			quiz_img = "/assets/정보통신개론.jpg";
		} else if (subject_nm.equals("프로그래밍언어실습")) {
			quiz_img = "/assets/프로그래밍언어실습.png";
		} else if (subject_nm.equals("스크립트언어실습")) {
			quiz_img = "/assets/스크립트언어실습.png";
		} else if (subject_nm.equals("IT용어")) {
			quiz_img = "/assets/IT용어도감.jpg";
		}
		
		if (type.equals("단답식")) {
			quizVO = new QuizVO(member_email, subject_no, quiz_nm, type, content, explanation, answer, quiz_img);
			int result1 = quizService.addQuizByQuizVO(quizVO);
			if (result1 <= 0) {
				request.setAttribute("errorAdd", "Quizs 테이블에 삽입 실패");
			} else {
				quizVO = quizService.searchQuizByQuizVO(quizVO);
				
				// 문제 힌트 삽입
				QuizHintVO hint = new QuizHintVO();
				
				hint.setQuiz_no(quizVO.getQuiz_no());
				
				String separate = request.getParameter("separator");
				hint.setSeparate(separate);
				
				String languageValues = request.getParameter("languageValues");
				if (languageValues.contains("korean")) {
					hint.setKorean("O");
				} else {
					hint.setKorean("X");
				}
				if (languageValues.contains("english")) {
					String englishType = request.getParameter("englishType");
					hint.setEnglish(englishType);
				} else {
					hint.setEnglish("X");
				}
				if (languageValues.contains("code")) {
					hint.setCode("O");
				} else {
					hint.setCode("X");
				}
				if (languageValues.contains("number")) {
					hint.setNum("O");
				} else {
					hint.setNum("X");
				}
				
				int addHintResult = quizService.addQuizHintVO(hint);
				if (addHintResult <= 0) {
					request.setAttribute("errorAddHint", "힌트 테이블 삽입 실패");
				}
			}
			
		}
		else if (type.equals("객관식")) {
			quizVO = new QuizVO(member_email, subject_no, quiz_nm, type, content, explanation, answer, quiz_img);
			int result1 = quizService.addQuizByQuizVO(quizVO);
			quizVO = quizService.searchQuizByQuizVO(quizVO);
			System.out.println("객관식일 때 퀴즈 삽입 여부 : " + result1);
			if (result1 <= 0) {
				request.setAttribute("errorAdd", "Quizs 테이블에 삽입 실패");
			}  
			String choice1 = request.getParameter("choice_1");
			String choice2 = request.getParameter("choice_2");
			String choice3 = request.getParameter("choice_3");
			String choice4 = request.getParameter("choice_4");
			String choice5 = request.getParameter("choice_5");
			MultipleQuizChoiceVO choiceVO = new MultipleQuizChoiceVO(quizVO.getQuiz_no(), choice1, choice2, choice3, choice4, choice5);
			int result2 = quizService.addChoiceByChoiceVO(choiceVO);
			if (result2 <= 0) {
				request.setAttribute("errorAdd2", "Quiz_type_choice 테이블에 삽입 실패");
				System.out.println("Quiz_type_choice 테이블에 삽입 실패");
			}
			
		}
		
		if (request.getParameter("beforeQuiz_no") == null) {
			System.out.println("답글 준비 X");
			int changeResult = quizService.changeQuizAtCreate(quizVO.getQuiz_no());
			if (changeResult <= 0) {
				System.out.println("답글 초기 세팅 실패");
			} else {
				System.out.println("답글 초기 세팅 성공");
			}
			
		} else {
			System.out.println("답글 준비 O");
			int beforeQuiz_no = Integer.parseInt(request.getParameter("beforeQuiz_no"));
			QuizVO beforeQuiz = quizService.searchQuizByNo(beforeQuiz_no);
			int beforeGroup_no = Integer.parseInt(request.getParameter("beforeGroup_no"));
			
			int lastGroupNo = quizService.searchLastGroupNoByVO(beforeQuiz);
			
			quizVO.setGroup_no(lastGroupNo + 1);
			quizVO.setOri_code_no(beforeQuiz.getOri_code_no());
			
			int beforeGroup_layer = Integer.parseInt(request.getParameter("beforeGroup_layer"));
			quizVO.setGroup_layer(beforeGroup_layer + 1);
			
			int changeResult = quizService.changeGroupNo(quizVO);
			if (changeResult <= 0) {
				System.out.println("lastGroupNo보다 큰 것 +1 실패");
			} else {
				System.out.println("lastGroupNo보다 큰 것 +1 성공");
			}
			int changeResult2 = quizService.changeQuizInfoForReply(quizVO);
			if (changeResult2 <= 0) {
				System.out.println("현재 문제 lastGroupNo + 1 실패");
			} else {
				System.out.println("현재 문제 lastGroupNo + 1 성공");
			}
			
		}

		request.setAttribute("successAddQuiz", "문제를 추가하였습니다.");
		
		return "/quiz/quizListPage.jsp";
	}

}
