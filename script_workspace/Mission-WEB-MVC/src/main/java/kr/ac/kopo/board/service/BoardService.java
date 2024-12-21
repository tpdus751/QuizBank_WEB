package kr.ac.kopo.board.service;

import java.util.List;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {
	private BoardDAO boardDao;

	public BoardService() {
		boardDao = new BoardDAOImpl();
	}
	
	public List<BoardVO> searchAllBoard() throws Exception {
		List<BoardVO> boardList = boardDao.selectAllBoard();
		return boardList;
	}
	
}
