package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;

public class StartExamPageController implements Controller {

	QuizService quizService;
	
	public StartExamPageController() {
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.getSession().removeAttribute("testQuizList");
		
		String exam_type = request.getParameter("exam_type");
		
		List<QuizVO> testQuizList = new ArrayList<>();
		
		Map<Integer, MultipleQuizChoiceVO> choiceMap = new HashMap<>();
		
		Map<Integer, QuizHintVO> hintMap = new HashMap<>();
		
		switch(exam_type) {
			case "all":
				testQuizList = quizService.searchRandomFromAllQuiz();
				for (QuizVO testQuiz : testQuizList) {
				    if ("객관식".equals(testQuiz.getQuiz_type())) {
				        MultipleQuizChoiceVO choiceVO = quizService.searchChoicesByQuizNo(testQuiz.getQuiz_no());
				        if (choiceVO != null) {
				            choiceMap.put(testQuiz.getQuiz_no(), choiceVO);
				        } else {
				            System.out.println("quiz_no: " + testQuiz.getQuiz_no() + "에 대한 choiceVO가 없습니다.");
				        }
				    } else {
				    	// 힌트 불러오기
						QuizHintVO hint = quizService.searchQuizHintByNo(testQuiz.getQuiz_no());
						if (hint != null) {
						    hintMap.put(testQuiz.getQuiz_no(), hint);
						} else {
						    System.out.println("Hint가 없는 문제 번호: " + testQuiz.getQuiz_no());
						}
				    }
				}
				if (testQuizList.size() < 20) {
					request.setAttribute("lackOfQuiz", "현재 최소 20문제가 존재하지 않습니다.");
					return "/home.jsp";
				} else {
					if (!choiceMap.isEmpty()) {
						request.setAttribute("choiceMap", choiceMap);
						System.out.println("choiceMap: " + choiceMap);
					} else {
					    System.out.println("choiceMap가 비어 있습니다.");
					}
					
					if (!hintMap.isEmpty()) {
						request.setAttribute("hintMap", hintMap);
						System.out.println("hintMap : " + hintMap);
					} else {
						System.out.println("hintMap이 비어 있습니다.");
					}
					
				}
				
				break;
			case "subject":
				int subject = Integer.parseInt(request.getParameter("subject"));
				
				testQuizList = quizService.searchRandomFromSubjectQuiz(subject);
				for (QuizVO testQuiz : testQuizList) {
					System.out.println(testQuiz.toString());
					if ("객관식".equals(testQuiz.getQuiz_type())) {
				        MultipleQuizChoiceVO choiceVO = quizService.searchChoicesByQuizNo(testQuiz.getQuiz_no());
				        if (choiceVO != null) {
				            choiceMap.put(testQuiz.getQuiz_no(), choiceVO);
				        } else {
				            System.out.println("quiz_no: " + testQuiz.getQuiz_no() + "에 대한 choiceVO가 없습니다.");
				        }
				    } else {
				    	// 힌트 불러오기
						QuizHintVO hint = quizService.searchQuizHintByNo(testQuiz.getQuiz_no());
						if (hint != null) {
							hintMap.put(testQuiz.getQuiz_no(), hint);
						}
				    }
				}
				if (testQuizList.size() < 20) {
					request.setAttribute("lackOfQuiz", "현재 최소 20문제가 존재하지 않습니다.");
					return "redirect:/home.do";
				} else {
					if (!choiceMap.isEmpty()) {
						request.setAttribute("choiceMap", choiceMap);
						System.out.println("choiceMap: " + choiceMap);
					} else {
					    System.out.println("choiceMap가 비어 있습니다.");
					}
					
					if (!hintMap.isEmpty()) {
						request.setAttribute("hintMap", hintMap);
						System.out.println("hintMap : " + hintMap);
					} else {
						System.out.println("hintMap이 비어 있습니다.");
					}
					
				}
				
				break;
			case "examList":
				MemberVO loginMember = ((MemberVO)request.getSession().getAttribute("loginMemberVO"));
				testQuizList = quizService.searchRandomFromMySaveQuiz(loginMember.getMember_email());
				for (QuizVO testQuiz : testQuizList) {
					System.out.println(testQuiz.toString());
					if ("객관식".equals(testQuiz.getQuiz_type())) {
				        MultipleQuizChoiceVO choiceVO = quizService.searchChoicesByQuizNo(testQuiz.getQuiz_no());
				        if (choiceVO != null) {
				            choiceMap.put(testQuiz.getQuiz_no(), choiceVO);
				        } else {
				            System.out.println("quiz_no: " + testQuiz.getQuiz_no() + "에 대한 choiceVO가 없습니다.");
				        }
				    } else {
				    	// 힌트 불러오기
						QuizHintVO hint = quizService.searchQuizHintByNo(testQuiz.getQuiz_no());
						if (hint != null) {
							hintMap.put(testQuiz.getQuiz_no(), hint);
						}
				    }
				}
				if (testQuizList.size() < 20) {
					request.setAttribute("lackOfQuiz", "현재 최소 20문제가 존재하지 않습니다.");
					return "/home.jsp";
				} else {
					if (!choiceMap.isEmpty()) {
						request.setAttribute("choiceMap", choiceMap);
						System.out.println("choiceMap: " + choiceMap);
					} else {
					    System.out.println("choiceMap가 비어 있습니다.");
					}
					
					if (!hintMap.isEmpty()) {
						request.setAttribute("hintMap", hintMap);
						System.out.println("hintMap : " + hintMap);
					} else {
						System.out.println("hintMap이 비어 있습니다.");
					}
					
				}
				
				break;
		}
		request.getSession().setAttribute("testQuizList", testQuizList);
		request.setAttribute("testNow", "시험을 바로 시작합니다!");
		
		return "/test/examPage.jsp";
	}

}
