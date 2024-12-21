package kr.ac.kopo.comment.dao;

import java.util.List;

import kr.ac.kopo.comment.vo.CommentLayer1VO;
import kr.ac.kopo.comment.vo.QuizCommentVO;

public interface CommentDAO {
	
	int insertComment(QuizCommentVO commentVO);

	List<QuizCommentVO> selectCommentsByQuizNo(int quiz_no);

	List<CommentLayer1VO> selectRepliesByQuizNo(int quiz_no);

	int insertReply(CommentLayer1VO reply);

	int updateCommentByVO(QuizCommentVO comment);

	int updateReplyByVO(CommentLayer1VO reply);

	int deleteCommentByNo(int comment_no);

	int deleteReplyByNo(int comment_lay1_no);
	
}
