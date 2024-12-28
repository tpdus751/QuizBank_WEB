package kr.ac.kopo.quiz.service;

import java.util.List;
import java.util.Set;

import kr.ac.kopo.member_quiz.vo.MemberQuizVO;
import kr.ac.kopo.quiz.vo.MultipleQuizChoiceVO;
import kr.ac.kopo.quiz.vo.QuizHintVO;
import kr.ac.kopo.quiz.vo.QuizVO;
import kr.ac.kopo.quiz.vo.SaveQuizToListVO;
import kr.ac.kopo.subject_page.vo.SubjectPageVO;

public interface QuizService {
	
	public List<QuizVO> searchAllQuiz(SubjectPageVO subjectPageVO);

	public List<QuizVO> searchSubjectQuiz(SubjectPageVO subjectPageVO);

	public QuizVO searchQuizByNo(int quiz_no);

	public MultipleQuizChoiceVO searchChoicesByQuizNo(int quiz_no);

	public int removeQuizByQuizNo(int quiz_no);

	public int addQuizByQuizVO(QuizVO quizVO);

	public int addChoiceByChoiceVO(MultipleQuizChoiceVO choiceVO);

	public int removeQuizChoiceByQuizNo(int quiz_no);

	public QuizVO searchQuizByQuizVO(QuizVO quizVO);

	public int changeQuizByQuizVO(QuizVO quizVO);

	public int changeChoicesByChoiceVO(MultipleQuizChoiceVO multiChoiceVO);

	public int changeQuizViewPlusByQuizNo(int quiz_no);

	public int addMemberSaveQuiz(SaveQuizToListVO saveQuizToListVO);

	public SaveQuizToListVO searchSaveQuizVO(SaveQuizToListVO saveQuizToListVO);

	public List<SaveQuizToListVO> searchMemberSaveQuizs(SaveQuizToListVO saveQuizToListVO);

	public int removeMemberSaveQuiz(SaveQuizToListVO saveQuizToListVO);

	public int getAllQuizCnt();

	public List<QuizVO> searchRandomFromAllQuiz();

	public List<QuizVO> searchRandomFromSubjectQuiz(int subject);

	public List<QuizVO> searchRandomFromMySaveQuiz(String member_email);

	public int addQuizHintVO(QuizHintVO hint);

	public QuizHintVO searchQuizHintByNo(int quiz_no);

	public int removeQuizHintByNo(int quiz_no);

	public List<QuizVO> searchMyQuizByMyEmail(String loginMember_email);

	public MemberQuizVO searchMemberQuizVO(MemberQuizVO memberQuizInfo);

	public int addMemberQuizByVO(MemberQuizVO memberQuizInfo);

	public int changeMemberQuizInfo(MemberQuizVO memberQuizInfo);

	public int changeQuizInfoWhenTestEnded(QuizVO quiz);

	public List<QuizVO> searchMyIncorrectQuizListByEmail(String loginMember_email);

	public int changeQuizAtCreate(int quiz_no);

	public int searchLastGroupNoByVO(QuizVO beforeQuiz);

	public int changeGroupNo(QuizVO quizVO);

	public int changeQuizInfoForReply(QuizVO beforeQuiz);

	public List<QuizVO> searchReplysByNo(int quiz_no);

	public List<QuizVO> searchFourLatestQuizs();

	public List<QuizVO> searchFourHotQuizs();

	public List<QuizVO> searchFourHardQuizs();

	public Integer searchToTalQuizCnt();

	public Integer searchTotalSubjectQuizCnt(int subject_no);

	public List<QuizVO> searchAllQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO);

	public List<QuizVO> searchAllQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO);

	public List<QuizVO> searchSubjectQuizOrderByViewCntDesc(SubjectPageVO subjectPageVO);

	public List<QuizVO> searchSubjectQuizOrderByLowCorrectRatio(SubjectPageVO subjectPageVO);
	
}
