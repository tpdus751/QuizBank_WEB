package kr.ac.kopo.member.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;
import kr.ac.kopo.mybatis.MyConfig;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession sqlSession;
	
	public MemberDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		sqlSession.clearCache();
		MemberVO member = sqlSession.selectOne("dao.MemberDAO.selectMemberLogin", memberVO);
		
		return member;
	}

	@Override
	public MemberVO selectMemberById(MemberVO memberVO) {
		sqlSession.clearCache();
		MemberVO member = sqlSession.selectOne("dao.MemberDAO.selectMemberById", memberVO);
		return member;
	}

	@Override
	public int insertUnMemberByVO(MemberVO memberVO) {
		int result = sqlSession.insert("dao.MemberDAO.insertUnMember", memberVO);
		sqlSession.commit();
		return result;
	}

	@Override
	public int updateMemberByVO(MemberVO member) {
		int result = sqlSession.update("dao.MemberDAO.updateMemberByVO", member);
		sqlSession.commit();
		return result;
	}

	@Override
	public int insertMemberByVO(MemberVO member) {
		int result = sqlSession.insert("dao.MemberDAO.insertMemberByVO", member);
		sqlSession.commit();
		return result;
	}

	@Override
	public int insertCreditFlow(MemberCreditFlowVO creditFlow) {
		int insertResult = sqlSession.insert("dao.MemberDAO.insertCreditFlow", creditFlow);
		sqlSession.commit();
		return insertResult;
	}

}
