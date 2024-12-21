package kr.ac.kopo.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.mybatis.MyConfig;

public class BoardDAOImpl implements BoardDAO {

	private SqlSession sqlSession;
	
	public BoardDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public List<BoardVO> selectAllBoard() throws Exception {
		List<BoardVO> boardList = sqlSession.selectList("dao.BoardDAO.selectBoard");
		return boardList;
	}

}
