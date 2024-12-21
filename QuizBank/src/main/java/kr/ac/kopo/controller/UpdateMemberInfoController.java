package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;

public class UpdateMemberInfoController implements Controller {
	private MemberService memberService;
	private QuizService quizService;
	
	public UpdateMemberInfoController() {
		memberService = new MemberServiceImpl();
		quizService = new QuizServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_email = request.getParameter("member_email");
		MemberVO memberVO = new MemberVO(member_email);
		memberVO = memberService.searchMemberById(memberVO);

		String nonVisiblePwd = "********";
		
		String member_pwd = request.getParameter("member_pwd");
		
		if (!member_pwd.equals(nonVisiblePwd)) {
			memberVO.setMember_pwd(member_pwd);
		}
		
		String nick_nm = request.getParameter("nick_nm");
		memberVO.setNick_nm(nick_nm);
		
		String phone_num = request.getParameter("phone_num");
		StringTokenizer st = new StringTokenizer(phone_num, "-");
		String phone1 = st.nextToken();
		memberVO.setPhone1(phone1);
		String phone2 = st.nextToken();
		memberVO.setPhone2(phone2);
		String phone3 = st.nextToken();
		memberVO.setPhone3(phone3);
		
		int isUpdate = memberService.changeMemberInfoByVO(memberVO);
		if (isUpdate <= 0) {
			request.setAttribute("updateFailed", "회원정보 수정에 실패하였습니다.");
		} else {
			request.setAttribute("updateSuccess", "회원정보를 수정하였습니다.");
		}
		
		MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
		
		String loginMember_email = loginMember.getMember_email();
		
		SaveQuizToListVO saveQuizToListVO = new SaveQuizToListVO(loginMember_email);
		
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
		
		return "/member/myPage.jsp";
	}

}
