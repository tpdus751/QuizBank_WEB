package kr.ac.kopo.subject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.subject.vo.SubjectVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public class SubjectDAOImpl implements SubjectDAO {
	
	private SqlSession sqlSession;
	
	public SubjectDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public List<SubjectVO> selectSubjectList() {
		sqlSession.clearCache();
		List<SubjectVO> subjectListAll = sqlSession.selectList("dao.SubjectDAO.selectAllSubjectList");
		return subjectListAll;
	}

	@Override
	public SubjectVO selectSubject(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		SubjectVO subjectVO = sqlSession.selectOne("dao.SubjectDAO.selectSubject", subjectPageVO);
		return subjectVO;
	}

	@Override
	public SubjectVO selectSubjectBySubjectNo(int subject_no) {
		sqlSession.clearCache();
		SubjectVO subjectVO = sqlSession.selectOne("dao.SubjectDAO.selectSubjectBySubjectNo", subject_no);
		return subjectVO;
	}

	@Override
	public int updateSubjectTotCnt(int subject_no) {
		int cnt = sqlSession.update("dao.SubjectDAO.updateSubjectTotCnt", subject_no);
		sqlSession.commit();
		return cnt;
	}

	@Override
	public SubjectVO selectSubjectBySubjectNm(SubjectVO subjectVO) {
		sqlSession.clearCache();
		SubjectVO subject = sqlSession.selectOne("dao.SubjectDAO.selectSubjectBySubjectNm", subjectVO);
		return subject;
	}

	@Override
	public int updateSubjectTotCntPlus(int subject_no) {
		int cnt = sqlSession.update("dao.SubjectDAO.updateSubjectTotCntPlus", subject_no);
		sqlSession.commit();
		return cnt;
	}

}
