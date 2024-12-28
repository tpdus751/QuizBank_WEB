package kr.ac.kopo.quiz.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import kr.ac.kopo.member_quiz.vo.MemberQuizVO;
import kr.ac.kopo.quiz.dao.QuizDAO;
import kr.ac.kopo.quiz.dao.QuizDAOImpl;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public class QuizServiceImpl implements QuizService {

	private QuizDAO quizDao;
	
	public QuizServiceImpl() {
		quizDao = new QuizDAOImpl();
	}

	@Override
	public List<QuizVO> searchAllQuiz(SubjectPageVO subjectPageVO) {
		List<QuizVO> quizList = quizDao.selectQuizAll(subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> searchSubjectQuiz(SubjectPageVO subjectPageVO) {
		List<QuizVO> quizList = quizDao.selectSubjectQuiz(subjectPageVO);
		return quizList;
	}

	@Override
	public QuizVO searchQuizByNo(int quiz_no) {
		QuizVO quizVO = quizDao.selectQuizByNo(quiz_no);
		return quizVO;
	}

	@Override
	public MultipleQuizChoiceVO searchChoicesByQuizNo(int quiz_no) {
		MultipleQuizChoiceVO multipleChoiceVO = quizDao.selectChoicesByQuizNo(quiz_no);
		
		List<String> choices = new ArrayList<>();
		choices.add(multipleChoiceVO.getChoice_1());
		choices.add(multipleChoiceVO.getChoice_2());
		choices.add(multipleChoiceVO.getChoice_3());
		choices.add(multipleChoiceVO.getChoice_4());
		choices.add(multipleChoiceVO.getChoice_5());
		
		Collections.shuffle(choices);
		
		multipleChoiceVO.setChoice_1(choices.get(0));
		multipleChoiceVO.setChoice_2(choices.get(1));
		multipleChoiceVO.setChoice_3(choices.get(2));
		multipleChoiceVO.setChoice_4(choices.get(3));
		multipleChoiceVO.setChoice_5(choices.get(4));
		
		return multipleChoiceVO;
	}

	@Override
	public int removeQuizByQuizNo(int quiz_no) {
		return quizDao.deleteQuizByQuizNo(quiz_no);
		
	}

	@Override
	public int addQuizByQuizVO(QuizVO quizVO) {
		int result = quizDao.insertQuizByQuizVO(quizVO);
		return result;
	}

	@Override
	public int addChoiceByChoiceVO(MultipleQuizChoiceVO choiceVO) {
		int result = quizDao.insertChoiceByChoiceVO(choiceVO);
		return result;
	}

	@Override
	public int removeQuizChoiceByQuizNo(int quiz_no) {
		int result = quizDao.deleteChoiceByQuizNo(quiz_no);
		return result;
	}

	@Override
	public QuizVO searchQuizByQuizVO(QuizVO quizVO) {
		QuizVO quiz = quizDao.selectQuizByQuizVO(quizVO);
		return quiz;
	}

	@Override
	public int changeQuizByQuizVO(QuizVO quizVO) {
		int result = quizDao.updateQuizByQuizVO(quizVO);
		return result;
	}

	@Override
	public int changeChoicesByChoiceVO(MultipleQuizChoiceVO multiChoiceVO) {
		int result = quizDao.updateQuiChoicesByChoiceVO(multiChoiceVO);
		return result;
	}

	@Override
	public int changeQuizViewPlusByQuizNo(int quiz_no) {
		int result = quizDao.updateQuizViewPlusByQuizNo(quiz_no);
		return result;
	}

	@Override
	public int addMemberSaveQuiz(SaveQuizToListVO saveQuizToListVO) {
		int saveQuizResult = quizDao.insertSaveQuizVO(saveQuizToListVO);
		return saveQuizResult;
	}

	@Override
	public SaveQuizToListVO searchSaveQuizVO(SaveQuizToListVO saveQuizToListVO) {
		SaveQuizToListVO saveQuizVO = quizDao.selectSaveQuizVO(saveQuizToListVO);
		return saveQuizVO;
	}

	@Override
	public List<SaveQuizToListVO> searchMemberSaveQuizs(SaveQuizToListVO saveQuizToListVO) {
		List<SaveQuizToListVO> saveQuizList = quizDao.selectSaveQuizList(saveQuizToListVO);
		return saveQuizList;
	}

	@Override
	public int removeMemberSaveQuiz(SaveQuizToListVO saveQuizToListVO) {
		int isDeleteSaveQuizVO = quizDao.deleteMemberSaveQuiz(saveQuizToListVO);
		return isDeleteSaveQuizVO;
	}

	@Override
	public int getAllQuizCnt() {
		int allQuizNum = quizDao.selectAllQuizCnt();
		return allQuizNum;
	}

	@Override
	public List<QuizVO> searchRandomFromAllQuiz() {
		List<QuizVO> testQuizList = quizDao.selectRandomQuizsFromAll();
		return testQuizList;
	}

	@Override
	public List<QuizVO> searchRandomFromSubjectQuiz(int subject) {
		List<QuizVO> testQuizList = quizDao.selectRandomQuizsFromSubject(subject);
		return testQuizList;
	}

	@Override
	public List<QuizVO> searchRandomFromMySaveQuiz(String member_email) {
		List<QuizVO> testQuizList = quizDao.selectRandomQuizsFromMySave(member_email);
		return testQuizList;
	}

	@Override
	public int addQuizHintVO(QuizHintVO hint) {
		int addHintResult = quizDao.insertQuizHintByVO(hint);
		return addHintResult;
	}

	@Override
	public QuizHintVO searchQuizHintByNo(int quiz_no) {
		QuizHintVO hint = quizDao.selectQuizHintByNo(quiz_no);
		return hint;
	}

	@Override
	public int removeQuizHintByNo(int quiz_no) {
		int hintResult = quizDao.deleteQuizHintByNo(quiz_no);
		return hintResult;
	}

	@Override
	public List<QuizVO> searchMyQuizByMyEmail(String loginMember_email) {
		List<QuizVO> myQuizList = quizDao.selectMyQuizListByEmail(loginMember_email);
		return myQuizList;
	}

	@Override
	public MemberQuizVO searchMemberQuizVO(MemberQuizVO memberQuizInfo) {
		MemberQuizVO memberQuiz = quizDao.selectMemberQuizVOByVO(memberQuizInfo);
		return memberQuiz;
	}

	@Override
	public int addMemberQuizByVO(MemberQuizVO memberQuizInfo) {
		int addMemberQuizResult = quizDao.insertMemberQuizByVO(memberQuizInfo);
		return addMemberQuizResult;
	}

	@Override
	public int changeMemberQuizInfo(MemberQuizVO memberQuizInfo) {
		int updateMemberQuizResult = quizDao.updateMemberQuizByVO(memberQuizInfo);
		return updateMemberQuizResult;
	}

	@Override
	public int changeQuizInfoWhenTestEnded(QuizVO quiz) {
		int changeQuizResult = quizDao.updateQuizInfoWhenTestEnded(quiz);
		return changeQuizResult;
	}

	@Override
	public List<QuizVO> searchMyIncorrectQuizListByEmail(String loginMember_email) {
		List<QuizVO> myIncorrectQuizList = quizDao.selectMyIncorrectQuizListMyEmail(loginMember_email);
		return myIncorrectQuizList;
	}

	@Override
	public int changeQuizAtCreate(int quiz_no) {
		int changeResult = quizDao.updateQuizAtCreate(quiz_no);
		return changeResult;
	}

	@Override
	public int searchLastGroupNoByVO(QuizVO beforeQuiz) {
		int lastGroupNo = quizDao.selectLastGroupNoByVO(beforeQuiz);
		return lastGroupNo;
	}

	@Override
	public int changeGroupNo(QuizVO quizVO) {
		int changeResult = quizDao.updateGroupNoPlusOne(quizVO);
		return changeResult;
	}

	@Override
	public int changeQuizInfoForReply(QuizVO beforeQuiz) {
		int changeResult = quizDao.updateQuizInfoForReply(beforeQuiz);
		return changeResult;
	}

	@Override
	public List<QuizVO> searchReplysByNo(int quiz_no) {
		List<QuizVO> replyQuizs = quizDao.selectReplyQuizsByNo(quiz_no);
		return replyQuizs;
	}

	@Override
	public List<QuizVO> searchFourLatestQuizs() {
		List<QuizVO> fourLatestQuizs = quizDao.selectFourLatestQuizs();
		return fourLatestQuizs;
	}

	@Override
	public List<QuizVO> searchFourHotQuizs() {
		List<QuizVO> fourHotQuizs = quizDao.selectFourHotQuizs();
		return fourHotQuizs;
	}

	@Override
	public List<QuizVO> searchFourHardQuizs() {
		List<QuizVO> fourHardQuizs = quizDao.selectFourHardQuizs();
		return fourHardQuizs;
	}

	@Override
	public Integer searchToTalQuizCnt() {
		Integer totalQuizCnt = quizDao.selectTotalQuizCnt();
		return totalQuizCnt;
	}

	@Override
	public Integer searchTotalSubjectQuizCnt(int subject_no) {
		Integer totalSubjectQuizCnt = quizDao.selectTotalSubjectQuizCnt(subject_no);
		return totalSubjectQuizCnt;
	}

	@Override
	public List<QuizVO> searchAllQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO) {
		List<QuizVO> quizList = quizDao.selectAllQuizOrderByViewCntDesc(subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> searchAllQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO) {
		List<QuizVO> quizList = quizDao.searchAllQuizOrderByLowCorrectRatio(subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> searchSubjectQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO) {
		List<QuizVO> quizList = quizDao.selectSubjectQuizOrderByViewCntDesc(subjectPageVO);
		return quizList;
	}

	@Override
	public List<QuizVO> searchSubjectQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO) {
		List<QuizVO> quizList = quizDao.selectSubjectQuizOrderByLowCorrectRatio(subjectPageVO);
		return quizList;
	}

}
