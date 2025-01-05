package kr.ac.kopo.subject.dao;

import java.util.List;

import kr.ac.kopo.subject.vo.SubjectVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public interface SubjectDAO {
	
	public List<SubjectVO> selectSubjectList();

	public SubjectVO selectSubject(SubjectPageVO subjectPageVO);

	public SubjectVO selectSubjectBySubjectNo(int subject_no);

	public int updateSubjectTotCnt(int subject_no);

	public SubjectVO selectSubjectBySubjectNm(SubjectVO subjectVO);

	public int updateSubjectTotCntPlus(int subject_no);

	public int selectTotalSubjectCnt();

	public List<SubjectVO> selectTotalSubjects();

	public int deleteSubject(int subjectNo);

	public int insertSubject(SubjectVO subject);

}
