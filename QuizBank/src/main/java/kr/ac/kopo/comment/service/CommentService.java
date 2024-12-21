package kr.ac.kopo.comment.service;

import java.util.List;

import kr.ac.kopo.comment.vo.CommentLayer1VO;
import kr.ac.kopo.comment.vo.QuizCommentVO;

public interface CommentService {
	
	int addComment(QuizCommentVO commentVO);

	List<QuizCommentVO> getCommentsByQuizNo(int quiz_no);

	List<CommentLayer1VO> getRepliesByQuizNo(int quiz_no);

	int addReply(CommentLayer1VO reply);

	int changeComment(QuizCommentVO comment);

	int changeReply(CommentLayer1VO reply);

	int removeComment(int comment_no);

	int removeReply(int comment_lay1_no);
	
}
