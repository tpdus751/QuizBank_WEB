package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.subject.service.SubjectService;
import kr.ac.kopo.subject.service.SubjectServiceImpl;
import kr.ac.kopo.subject.vo.SubjectVO;

public class SubjectManagementPageController implements Controller {
	
	SubjectService subjectService;
	
	public SubjectManagementPageController() {
		subjectService = new SubjectServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<SubjectVO> totalSubjectList = subjectService.searchTotalSubjects();
		
		request.setAttribute("totalSubjectList", totalSubjectList);
		
		return "/admin/subjectManagementPage.jsp";
	}

}
