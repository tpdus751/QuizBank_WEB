package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardListController implements Controller {

	private BoardService boardService;
	
	public BoardListController() {
		boardService = new BoardService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<BoardVO> boardList = boardService.searchAllBoard();
		request.setAttribute("boardList", boardList);
		
		return "/jsp/board/list.jsp";
	}
	
}
