package kr.ac.kopo.comment.service;

import java.util.List;

import kr.ac.kopo.comment.dao.CommentDAO;
import kr.ac.kopo.comment.dao.CommentDAOImpl;
import kr.ac.kopo.comment.vo.CommentLayer1VO;
import kr.ac.kopo.comment.vo.QuizCommentVO;

public class CommentServiceImpl implements CommentService {
	
	CommentDAO commentDao;
	
	public CommentServiceImpl() {
		commentDao = new CommentDAOImpl();
	}

	@Override
	public int addComment(QuizCommentVO commentVO) {
		int addResult = commentDao.insertComment(commentVO);
		return addResult;
	}

	@Override
	public List<QuizCommentVO> getCommentsByQuizNo(int quiz_no) {
		List<QuizCommentVO> commentList = commentDao.selectCommentsByQuizNo(quiz_no);
		return commentList;
	}

	@Override
	public List<CommentLayer1VO> getRepliesByQuizNo(int quiz_no) {
		List<CommentLayer1VO> replyList = commentDao.selectRepliesByQuizNo(quiz_no);
		return replyList;
	}

	@Override
	public int addReply(CommentLayer1VO reply) {
		int result = commentDao.insertReply(reply);
		return result;
	}

	@Override
	public int changeComment(QuizCommentVO comment) {
		int result = commentDao.updateCommentByVO(comment);
		return result;
	}

	@Override
	public int changeReply(CommentLayer1VO reply) {
		int result = commentDao.updateReplyByVO(reply);
		return result;
	}

	@Override
	public int removeComment(int comment_no) {
		int result = commentDao.deleteCommentByNo(comment_no);
		return result;
	}

	@Override
	public int removeReply(int comment_lay1_no) {
		int result = commentDao.deleteReplyByNo(comment_lay1_no);
		return result;
	}

}
