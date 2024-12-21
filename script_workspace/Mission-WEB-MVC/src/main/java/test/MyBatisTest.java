package test;

import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;

import kr.ac.kopo.board.dao.BoardDAOImpl;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.mybatis.MyConfig;

class MyBatisTest {

	@Test
	void test() throws Exception {
		SqlSession session = new MyConfig().getInstance();
//		assertNotNull(session);
		
		// 전체게시글 조회 테스트
//		List<BoardVO> list = session.selectList("dao.BoardDAO.selectBoard");
		List<BoardVO> list = new BoardDAOImpl().selectAllBoard();
		assertNotEquals(list.size(), 0);
	}
	
		

}
