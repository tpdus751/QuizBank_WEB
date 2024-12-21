package kr.ac.kopo.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.comment.vo.CommentLayer1VO;
import kr.ac.kopo.comment.vo.QuizCommentVO;
import kr.ac.kopo.mybatis.MyConfig;

public class CommentDAOImpl implements CommentDAO {
	
	private SqlSession sqlSession;
	
	public CommentDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public int insertComment(QuizCommentVO commentVO) {
		int addResult = sqlSession.insert("dao.CommentDAO.insertCommentByVO", commentVO);
		sqlSession.commit();
		return addResult;
	}

	@Override
	public List<QuizCommentVO> selectCommentsByQuizNo(int quiz_no) {
		sqlSession.clearCache();
		List<QuizCommentVO> commentList = sqlSession.selectList("dao.CommentDAO.selectCommentsByQuizNo", quiz_no);
		return commentList;
	}

	@Override
	public List<CommentLayer1VO> selectRepliesByQuizNo(int quiz_no) {
		sqlSession.clearCache();
		List<CommentLayer1VO> replyList = sqlSession.selectList("dao.CommentDAO.selectRepliesByQuizNo", quiz_no);
		return replyList;
	}

	@Override
	public int insertReply(CommentLayer1VO reply) {
		int result = sqlSession.insert("dao.CommentDAO.insertReplyByVO", reply);
		sqlSession.commit();
		return result;
	}

	@Override
	public int updateCommentByVO(QuizCommentVO comment) {
		int result = sqlSession.update("dao.CommentDAO.updateCommentByVO", comment);
		sqlSession.commit();
		return result;
	}

	@Override
	public int updateReplyByVO(CommentLayer1VO reply) {
		int result = sqlSession.update("dao.CommentDAO.updateReplyByVO", reply);
		sqlSession.commit();
		return result;
	}

	@Override
	public int deleteCommentByNo(int comment_no) {
		int result = sqlSession.delete("dao.CommentDAO.deleteCommentByNo", comment_no);
		sqlSession.commit();
		return comment_no;
	}

	@Override
	public int deleteReplyByNo(int comment_lay1_no) {
		int result = sqlSession.delete("dao.CommentDAO.deleteReplyByNo", comment_lay1_no);
		sqlSession.commit();
		return result;
	}

}
