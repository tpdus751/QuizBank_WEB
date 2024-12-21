package kr.ac.kopo.subject.service;

import java.util.List;

import kr.ac.kopo.subject.dao.SubjectDAO;
import kr.ac.kopo.subject.dao.SubjectDAOImpl;
import kr.ac.kopo.subject.vo.SubjectVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public class SubjectServiceImpl implements SubjectService {

	private SubjectDAO subjectDao;
	
	public SubjectServiceImpl() {
		subjectDao = new SubjectDAOImpl();
	}


	@Override
	public List<SubjectVO> selectSubjectAll() {
		List<SubjectVO> subjectListAll = subjectDao.selectSubjectList(); 
		return subjectListAll;
	}


	@Override
	public SubjectVO selectSubject(SubjectPageVO subjectPageVO) {
		SubjectVO subjectVO = subjectDao.selectSubject(subjectPageVO);
		return subjectVO;
	}


	@Override
	public SubjectVO searchSubjectBySubjectNo(int subject_no) {
		SubjectVO subjectVO = subjectDao.selectSubjectBySubjectNo(subject_no);
		return subjectVO;
	}


	@Override
	public int changeSubjectTotCnt(int subject_no) {
		int cnt = subjectDao.updateSubjectTotCnt(subject_no);
		return cnt;
	}


	@Override
	public SubjectVO searchSubjectBySubjectNm(SubjectVO subjectVO) {
		SubjectVO subject = subjectDao.selectSubjectBySubjectNm(subjectVO);
		return subject;
	}


	@Override
	public int changeSubjectTotCntPlus(int subject_no) {
		int cnt = subjectDao.updateSubjectTotCntPlus(subject_no);
		return cnt;
	}

}
