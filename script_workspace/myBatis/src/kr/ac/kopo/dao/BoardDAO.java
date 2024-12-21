package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.BoardVO;

public class BoardDAO {
	
	private SqlSession session;
	
	public BoardDAO() {
		session = new MyConfig().getInstance();
	}

	public void selectAll() throws Exception {
		List<BoardVO> boardList = session.selectList("kr.ac.kopo.dao.BoardDAO.selectAll");
		for (BoardVO board : boardList) {
			System.out.println(board);
		}

	}
	
	private void insert() throws Exception {
		
		BoardVO board = new BoardVO();
		board.setTitle("mybatis 삽입2");
		board.setWriter("hong2");
		board.setContent("mybatis 내용2...");
		session.insert("kr.ac.kopo.dao.BoardDAO.insert", board);
		session.commit(); // 마이바티스는 오토 커밋이 아니므로 
		
		System.out.println("삽입완료...");
	}
	
	private void selectOne() throws Exception {
		// 9번 게시글 검색
		BoardVO b = new BoardVO();
		b.setNo(9);
		//BoardVO board = session.selectOne("kr.ac.kopo.dao.BoardDAO.selectByNo", 8);
		//BoardVO board = session.selectOne("kr.ac.kopo.dao.BoardDAO.selectByNo2", b);
		BoardVO board = session.selectOne("kr.ac.kopo.dao.BoardDAO.selectByNo3", b);
		System.out.println(board);
	}
	
	private void selectWhere() throws Exception {
		// 제목이 "제목입니다", 작성자가 "홍길동"인 게시물 조회
		BoardVO b = new BoardVO();
		//b.setTitle("제목입니다");
		//b.setWriter("홍길동");
		b.setWriter("hong");
		//List<BoardVO> list = session.selectList("kr.ac.kopo.dao.BoardDAO.selectWhere", b);
		List<BoardVO> list = session.selectList("kr.ac.kopo.dao.BoardDAO.selectWhere2", b);
		for (BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	private void selectWhere2() throws Exception {
		// title이 '제목'으로 시작하는 게시글 조회
		
		BoardVO b = new BoardVO();
		b.setTitle("제목");
		
		List<BoardVO> list = session.selectList("kr.ac.kopo.dao.BoardDAO.selectWhere3", b);
		
		for (BoardVO board : list) {
			System.out.println(board);
		}
		
	}
	
	public void work() throws Exception {
		// mybatis 실행
		// selectAll();
		// insert();
		// selectOne();
		// selectWhere();
		selectWhere2();
	}
	
}
