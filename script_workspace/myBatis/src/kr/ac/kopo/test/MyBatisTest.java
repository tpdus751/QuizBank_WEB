package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import kr.ac.kopo.dao.BoardDAO;
import kr.ac.kopo.dao.MyConfig;
import kr.ac.kopo.vo.BoardVO;

class MyBatisTest {

	@Disabled
	@Test
	void myConfig테스트() throws Exception {
		MyConfig config = new MyConfig();
	}
	
	@Disabled
	@Test
	void sqlSession테스트() throws Exception {
		SqlSession session = new MyConfig().getInstance();
		assertNotNull(session);
	}
	
	@Test
	void mybatis테스트() throws Exception {
		BoardDAO dao = new BoardDAO();
		dao.work();
	}

}
