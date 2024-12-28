package kr.ac.kopo.quiz.dao;

import java.util.List;
import java.util.Set;

import kr.ac.kopo.member_quiz.vo.MemberQuizVO;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public interface QuizDAO {
	List<QuizVO> selectQuizAll(SubjectPageVO subjectPageVO);

	List<QuizVO> selectSubjectQuiz(SubjectPageVO subjectPageVO);

	QuizVO selectQuizByNo(int quiz_no);

	MultipleQuizChoiceVO selectChoicesByQuizNo(int quiz_no);

	int deleteQuizByQuizNo(int quiz_no);

	int insertQuizByQuizVO(QuizVO quizVO);

	int insertChoiceByChoiceVO(MultipleQuizChoiceVO choiceVO);

	int deleteChoiceByQuizNo(int quiz_no);

	QuizVO selectQuizByQuizVO(QuizVO quizVO);

	int updateQuizByQuizVO(QuizVO quizVO);

	int updateQuiChoicesByChoiceVO(MultipleQuizChoiceVO multiChoiceVO);

	int updateQuizViewPlusByQuizNo(int quiz_no);

	int insertSaveQuizVO(SaveQuizToListVO saveQuizToListVO);

	SaveQuizToListVO selectSaveQuizVO(SaveQuizToListVO saveQuizToListVO);

	List<SaveQuizToListVO> selectSaveQuizList(SaveQuizToListVO saveQuizToListVO);

	int deleteMemberSaveQuiz(SaveQuizToListVO saveQuizToListVO);

	int selectAllQuizCnt();

	List<QuizVO> selectRandomQuizsFromAll();

	List<QuizVO> selectRandomQuizsFromSubject(int subject);

	List<QuizVO> selectRandomQuizsFromMySave(String member_email);

	int insertQuizHintByVO(QuizHintVO hint);

	QuizHintVO selectQuizHintByNo(int quiz_no);

	int deleteQuizHintByNo(int quiz_no);

	List<QuizVO> selectMyQuizListByEmail(String loginMember_email);

	MemberQuizVO selectMemberQuizVOByVO(MemberQuizVO memberQuizInfo);

	int insertMemberQuizByVO(MemberQuizVO memberQuizInfo);

	int updateMemberQuizByVO(MemberQuizVO memberQuizInfo);

	int updateQuizInfoWhenTestEnded(QuizVO quiz);

	List<QuizVO> selectMyIncorrectQuizListMyEmail(String loginMember_email);

	int updateQuizAtCreate(int quiz_no);

	int selectLastGroupNoByVO(QuizVO beforeQuiz);

	int updateGroupNoPlusOne(QuizVO quizVO);

	int updateQuizInfoForReply(QuizVO beforeQuiz);

	List<QuizVO> selectReplyQuizsByNo(int quiz_no);

	List<QuizVO> selectFourLatestQuizs();

	List<QuizVO> selectFourHotQuizs();

	List<QuizVO> selectFourHardQuizs();

	Integer selectTotalQuizCnt();

	Integer selectTotalSubjectQuizCnt(int subject_no);

	List<QuizVO> selectAllQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO);

	List<QuizVO> searchAllQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO);

	List<QuizVO> selectSubjectQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO);

	List<QuizVO> selectSubjectQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO);
}
