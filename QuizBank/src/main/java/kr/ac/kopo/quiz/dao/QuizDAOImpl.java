package kr.ac.kopo.quiz.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.member_quiz.vo.MemberQuizVO;
import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public class QuizDAOImpl implements QuizDAO {
	
	private SqlSession sqlSession;

	public QuizDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public List<QuizVO> selectQuizAll(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		List<QuizVO> quizList = sqlSession.selectList("dao.QuizDAO.selectAllQuizList", subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> selectSubjectQuiz(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		List<QuizVO> quizList = sqlSession.selectList("dao.QuizDAO.selectSubjectQuizList", subjectPageVO);
		return quizList;
	}

	@Override
	public QuizVO selectQuizByNo(int quiz_no) {
		sqlSession.clearCache();
		QuizVO quizVO = sqlSession.selectOne("dao.QuizDAO.selectQuizByNo", quiz_no);
		return quizVO;
	}

	@Override
	public MultipleQuizChoiceVO selectChoicesByQuizNo(int quiz_no) {
		sqlSession.clearCache();
		MultipleQuizChoiceVO multipleChoiceVO = sqlSession.selectOne("dao.QuizDAO.selectChoicesByQuizNo", quiz_no);
		return multipleChoiceVO;
	}

	@Override
	public int deleteQuizByQuizNo(int quiz_no) {
		int result = sqlSession.delete("dao.QuizDAO.deleteQuizByQuizNo", quiz_no);
		sqlSession.commit();
		return result;
	}

	@Override
	public int insertQuizByQuizVO(QuizVO quizVO) {
		int result = sqlSession.insert("dao.QuizDAO.insertQuizByQuizVO", quizVO);
		sqlSession.commit();
		return result;
	}

	@Override
	public int insertChoiceByChoiceVO(MultipleQuizChoiceVO choiceVO) {
		int result = sqlSession.insert("dao.QuizDAO.insertChoiceByChoiceVO", choiceVO);
		sqlSession.commit();
		return result;
	}

	@Override
	public int deleteChoiceByQuizNo(int quiz_no) {
		int result = sqlSession.delete("dao.QuizDAO.deleteChoiceByQuizNo", quiz_no);
		sqlSession.commit();
		return result;
	}

	@Override
	public QuizVO selectQuizByQuizVO(QuizVO quizVO) {
		sqlSession.clearCache();
		QuizVO quiz = sqlSession.selectOne("dao.QuizDAO.selectQuizByQuizVO", quizVO);
		return quiz;
	}

	@Override
	public int updateQuizByQuizVO(QuizVO quizVO) {
		int result = sqlSession.update("dao.QuizDAO.updateQuizByQuizVO", quizVO);
		sqlSession.commit();
		return result;
	}

	@Override
	public int updateQuiChoicesByChoiceVO(MultipleQuizChoiceVO multiChoiceVO) {
		int result = sqlSession.update("dao.QuizDAO.updateQuiChoicesByChoiceVO", multiChoiceVO);
		sqlSession.commit();
		return result;
	}

	@Override
	public int updateQuizViewPlusByQuizNo(int quiz_no) {
		int result = sqlSession.update("dao.QuizDAO.updateQuizViewPlusByQuizNo", quiz_no);
		sqlSession.commit();
		return result;
	}

	@Override
	public int insertSaveQuizVO(SaveQuizToListVO saveQuizToListVO) {
		int saveQuizResult = sqlSession.insert("dao.QuizDAO.insertQuizSaveByVO", saveQuizToListVO);
		sqlSession.commit();
		return saveQuizResult;
	}

	@Override
	public SaveQuizToListVO selectSaveQuizVO(SaveQuizToListVO saveQuizToListVO) {
		sqlSession.clearCache();
		SaveQuizToListVO saveQuizVO = sqlSession.selectOne("dao.QuizDAO.selectQuizSaveByVO", saveQuizToListVO);
		return saveQuizVO;
	}

	@Override
	public List<SaveQuizToListVO> selectSaveQuizList(SaveQuizToListVO saveQuizToListVO) {
		sqlSession.clearCache();
		List<SaveQuizToListVO> saveQuizList = sqlSession.selectList("dao.QuizDAO.selectSaveQuizList", saveQuizToListVO);
		return saveQuizList;
	}

	@Override
	public int deleteMemberSaveQuiz(SaveQuizToListVO saveQuizToListVO) {
		int isDeleteSaveQuizVO = sqlSession.delete("dao.QuizDAO.deleteMemberSaveQuiz", saveQuizToListVO);
		sqlSession.commit();
		return isDeleteSaveQuizVO;
	}

	@Override
	public int selectAllQuizCnt() {
		sqlSession.clearCache();
		int allQuizNum = sqlSession.selectOne("dao.QuizDAO.selectAllQuizCnt");
		return allQuizNum;
	}

	@Override
	public List<QuizVO> selectRandomQuizsFromAll() {
		sqlSession.clearCache();
		List<QuizVO> testQuizList = sqlSession.selectList("dao.QuizDAO.selectRandomQuizsFromAll");
		return testQuizList;
	}

	@Override
	public List<QuizVO> selectRandomQuizsFromSubject(int subject) {
		sqlSession.clearCache();
		List<QuizVO> testQuizList = sqlSession.selectList("dao.QuizDAO.selectRandomQuizsFromSubject", subject);
		return testQuizList;
	}

	@Override
	public List<QuizVO> selectRandomQuizsFromMySave(String member_email) {
		sqlSession.clearCache();
		List<QuizVO> testQuizList = sqlSession.selectList("dao.QuizDAO.selectRandomQuizsFromMySave", member_email);
		return testQuizList;
	}

	@Override
	public int insertQuizHintByVO(QuizHintVO hint) {
		int quizHintResult = sqlSession.insert("dao.QuizDAO.insertQuizHintByVO", hint);
		sqlSession.commit();
		return quizHintResult;
	}

	@Override
	public QuizHintVO selectQuizHintByNo(int quiz_no) {
		sqlSession.clearCache();
		QuizHintVO hint = sqlSession.selectOne("dao.QuizDAO.selectQuizHintByNo", quiz_no);
		return hint;
	}

	@Override
	public int deleteQuizHintByNo(int quiz_no) {
		int hintResult = sqlSession.delete("dao.QuizDAO.deleteQuizHintByNo", quiz_no);
		sqlSession.commit();
		return hintResult;
	}

	@Override
	public List<QuizVO> selectMyQuizListByEmail(String loginMember_email) {
		sqlSession.clearCache();
		List<QuizVO> myQuizList = sqlSession.selectList("dao.QuizDAO.selectMyQuizListByEmail", loginMember_email);
		return myQuizList;
	}

	@Override
	public MemberQuizVO selectMemberQuizVOByVO(MemberQuizVO memberQuizInfo) {
		sqlSession.clearCache();
		MemberQuizVO memberQuiz = sqlSession.selectOne("dao.QuizDAO.selectMemberQuizVOByVO", memberQuizInfo);
		return memberQuiz;
	}

	@Override
	public int insertMemberQuizByVO(MemberQuizVO memberQuizInfo) {
		int addMemberQuizResult = sqlSession.insert("dao.QuizDAO.insertMemberQuizByVO", memberQuizInfo);
		sqlSession.commit();
		return addMemberQuizResult;
	}

	@Override
	public int updateMemberQuizByVO(MemberQuizVO memberQuizInfo) {
		int updateMemberQuizResult = sqlSession.update("dao.QuizDAO.updateMemberQuizByVO", memberQuizInfo);
		sqlSession.commit();
		return updateMemberQuizResult;
	}

	@Override
	public int updateQuizInfoWhenTestEnded(QuizVO quiz) {
		int changeQuizResult = sqlSession.update("dao.QuizDAO.updateQuizInfoWhenTestEnded", quiz);
		sqlSession.commit();
		return changeQuizResult;
	}

	@Override
	public List<QuizVO> selectMyIncorrectQuizListMyEmail(String loginMember_email) {
		sqlSession.clearCache();
		List<QuizVO> myIncorrectQuizList = sqlSession.selectList("dao.QuizDAO.selectMyIncorrectQuizListMyEmail", loginMember_email);
		return myIncorrectQuizList;
	}

	@Override
	public int updateQuizAtCreate(int quiz_no) {
		int changeResult = sqlSession.update("dao.QuizDAO.updateQuizAtCreate", quiz_no);
		sqlSession.commit();
		return changeResult;
	}

	@Override
	public int selectLastGroupNoByVO(QuizVO beforeQuiz) {
		sqlSession.clearCache();
		Integer lastGroupNo = sqlSession.selectOne("dao.QuizDAO.selectLastGroupNoByVO", beforeQuiz);
		int lastGroupNoReal = 0;
		if (lastGroupNo != null) {
			lastGroupNoReal = (int)lastGroupNo;
		}
		return lastGroupNoReal;
	}

	@Override
	public int updateGroupNoPlusOne(QuizVO quizVO) {
		int changeResult = sqlSession.update("dao.QuizDAO.updateGroupNoPlusOne", quizVO);
		sqlSession.commit();
		return changeResult;
	}

	@Override
	public int updateQuizInfoForReply(QuizVO beforeQuiz) {
		int changeResult = sqlSession.update("dao.QuizDAO.updateQuizInfoForReply", beforeQuiz);
		sqlSession.commit();
		return changeResult;
	}

	@Override
	public List<QuizVO> selectReplyQuizsByNo(int quiz_no) {
		sqlSession.clearCache();
		List<QuizVO> replyQuizs = sqlSession.selectList("dao.QuizDAO.selectReplyQuizsByNo", quiz_no);
		return replyQuizs;
	}

	@Override
	public List<QuizVO> selectFourLatestQuizs() {
		sqlSession.clearCache();
		List<QuizVO> fourLatestQuizs = sqlSession.selectList("dao.QuizDAO.selectFourLatestQuizs");
		return fourLatestQuizs;
	}

	@Override
	public List<QuizVO> selectFourHotQuizs() {
		sqlSession.clearCache();
		List<QuizVO> fourHotQuizs = sqlSession.selectList("dao.QuizDAO.selectFourHotQuizs");
		return fourHotQuizs;
	}

	@Override
	public List<QuizVO> selectFourHardQuizs() {
		sqlSession.clearCache();
		List<QuizVO> fourHardQuizs = sqlSession.selectList("dao.QuizDAO.selectFourHardQuizs");
		return fourHardQuizs;
	}

	@Override
	public Integer selectTotalQuizCnt() {
		sqlSession.clearCache();
		Integer totalQuizCnt = sqlSession.selectOne("dao.QuizDAO.selectTotalQuizCnt");
		return totalQuizCnt;
	}

	@Override
	public Integer selectTotalSubjectQuizCnt(int subject_no) {
		sqlSession.clearCache();
		Integer totalSubjectQuizCnt = sqlSession.selectOne("dao.QuizDAO.selectTotalSubjectQuizCnt", subject_no);
		return totalSubjectQuizCnt;
	}

	@Override
	public List<QuizVO> selectAllQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		List<QuizVO> quizList = sqlSession.selectList("dao.QuizDAO.selectAllQuizOrderByViewCntDesc", subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> searchAllQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		List<QuizVO> quizList = sqlSession.selectList("dao.QuizDAO.searchAllQuizOrderByLowCorrectRatio", subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> selectSubjectQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		List<QuizVO> quizList = sqlSession.selectList("dao.QuizDAO.selectSubjectQuizOrderByViewCntDesc", subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> selectSubjectQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO) {
		sqlSession.clearCache();
		List<QuizVO> quizList = sqlSession.selectList("dao.QuizDAO.selectSubjectQuizOrderByLowCorrectRatio", subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> selectPageQuizs(int page) {
		sqlSession.clearCache();
		List<QuizVO> pageQuizList = sqlSession.selectList("dao.QuizDAO.selectPageQuizs", page);
		return pageQuizList;
	}

}
