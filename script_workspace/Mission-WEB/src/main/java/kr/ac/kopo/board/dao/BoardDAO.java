package kr.ac.kopo.board.dao;

import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;

/**
 * 게시판 CRUD 표준화
 */

public interface BoardDAO {

	/**
	 * 전체게시글 조회기능
	 * @return 조회된 게시글목록
	 */
	List<BoardVO> selectAll() throws Exception;
	
	/**
	 * DB t_board 테이블에 게시글 삽입기능
	 * @param board 추가할 게시글
	 */
	void insert(BoardVO board) throws Exception;
	
	/**
	 * 파라미터에 해당 번호의 게시글을 조회하는 기능
	 * @param boardNo 조회할 글번호
	 * @return 조회된 게시글(BoardVO) 단, 없다면 null 반환
	 */
	BoardVO selectByNo(int boardNo) throws Exception;
	
	 /**
	  * 파라미터로 전달된 번호에 해당 게시물을 삭제하는 기능
	  * @param boardNo 삭제할 글 번호
	  */
	void deleteByNo(int boardNo) throws Exception;
	
	/**
	 * 파라미터로 전달된 BoardVO객체 데이터로 게시물을 수정하는 기능
	 * @param boardVO 수정할 게시물
	 */
	void update(BoardVO board) throws Exception;
}
