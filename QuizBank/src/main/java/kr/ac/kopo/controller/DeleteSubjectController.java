package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;

public class DeleteSubjectController implements Controller {
	
	SubjectService subjectService;
	
	public DeleteSubjectController() {
		subjectService = new SubjectServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginedMember = (MemberVO)(request.getSession().getAttribute("loginMemberVO"));
		
		if (loginedMember != null && loginedMember.getType().equals("S")) {
			String subject_no = request.getParameter("subject_no");
			
			int subjectNo = 0;
			
			if (subject_no != null) {
				subjectNo = Integer.parseInt(subject_no);
			}
			
			if (subjectNo != 0) {
				int changeCnt = subjectService.removeSubjectByNo(subjectNo);
				
				request.setAttribute("removeSubjectSuccess", "성공적으로 해당 과목을 삭제하였습니다.");
			} else {
				request.setAttribute("removeSubjectFailed", "해당 과목 삭제에 실패하였습니다.");
			}
			
			return "/admin/subjectManagementPage.do";
			
		} else {
			return "/home.do";
		}
	}

}
