package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;
import kr.ac.kopo.subject.vo.SubjectVO;

public class RegisterSubjectProcessController implements Controller {
	
	SubjectService subjectService;
	
	public RegisterSubjectProcessController() {
		subjectService = new SubjectServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginedMember = (MemberVO)(request.getSession().getAttribute("loginMemberVO"));
		
		if (loginedMember != null && loginedMember.getType().equals("S")) {
			
			String subject_nm = request.getParameter("subject_nm");
			
			String page_nm = request.getParameter("page_nm");
		
			if (subject_nm == null || page_nm == null) {
				
				return "/home.do";
			} 
			
			SubjectVO subject = new SubjectVO(subject_nm, page_nm);
			
			int changeCnt = subjectService.addSubject(subject);
			
			System.out.println("등록 되는겨 뭐야");
			
			if (changeCnt > 0) {
				request.setAttribute("registerSubjectSuccess", subject_nm + " 종류 등록에 성공하였습니다.");
			} else {
				request.setAttribute("registerSubjectFailed", subject_nm + " 종류 등록에 실패하였습니다.");
			}
		
		} else {
			return "/home.do";
		}
		
		return "/admin/subjectManagementPage.do";
	}

}
