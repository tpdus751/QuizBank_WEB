package kr.ac.kopo.subject.service;

import java.util.List;

import kr.ac.kopo.subject.vo.SubjectVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public interface SubjectService {
	
	public List<SubjectVO> selectSubjectAll();

	public SubjectVO selectSubject(SubjectPageVO subjectPageVO);

	public SubjectVO searchSubjectBySubjectNo(int subject_no);

	public int changeSubjectTotCnt(int subject_no);

	public SubjectVO searchSubjectBySubjectNm(SubjectVO subjectVO);

	public int changeSubjectTotCntPlus(int subject_no);

}
