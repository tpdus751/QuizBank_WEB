package kr.ac.kopo.member.dao;

import java.util.List;

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

	@Override
	public Integer selectTotalMemberCnt() {
		sqlSession.clearCache();
		Integer totalMemberCnt = sqlSession.selectOne("dao.MemberDAO.selectTotalMemberCnt");
		if (totalMemberCnt == null) {
			totalMemberCnt = 0;
		}
		return totalMemberCnt;
		
	}

	@Override
	public int selectTodayNewMemberCnt() {
		sqlSession.clearCache();
		Integer todayNewMemberCnt = sqlSession.selectOne("dao.MemberDAO.selectTodayNewMemberCnt");
		if (todayNewMemberCnt == null) {
			todayNewMemberCnt = 0;
		}
		return todayNewMemberCnt;
	}

	@Override
	public int selectMonthNewMemberCnt() {
		sqlSession.clearCache();
		Integer monthNewMemberCnt = sqlSession.selectOne("dao.MemberDAO.selectMonthNewMemberCnt");
		if (monthNewMemberCnt == null) {
			monthNewMemberCnt = 0;
		}
		return monthNewMemberCnt;
	}

	@Override
	public int selectYearNewMemberCnt() {
		sqlSession.clearCache();
		Integer yearNewMemberCnt = sqlSession.selectOne("dao.MemberDAO.selectYearNewMemberCnt");
		if (yearNewMemberCnt == null) {
			yearNewMemberCnt = 0;
		}
		return yearNewMemberCnt;
	}

	@Override
	public int selectCheckOverrapEmail(String member_email) {
		sqlSession.clearCache();
		Integer checkOverrap = sqlSession.selectOne("dao.MemberDAO.selectCheckOverrapEmail", member_email);
		if (checkOverrap == null) {
			checkOverrap = 0;
		}
		return checkOverrap;
	}

	@Override
	public List<MemberVO> selectAllMembers() {
		sqlSession.clearCache();
		List<MemberVO> totalMemberList = sqlSession.selectList("dao.MemberDAO.selectAllMembers");
		return totalMemberList;
	}

	@Override
	public List<MemberVO> selectpageMembers(int page) {
		sqlSession.clearCache();
		List<MemberVO> pageMemberList = sqlSession.selectList("dao.MemberDAO.selectpageMembers", page);
		return pageMemberList;
	}

	@Override
	public int updateMemberProhibit(String member_email) {
		int checkBan = sqlSession.update("dao.MemberDAO.updateMemberProhibit", member_email);
		sqlSession.commit();
		return checkBan;
	}

	@Override
	public int updateProhibitToNull(String member_email) {
		int changeCnt = sqlSession.update("dao.MemberDAO.updateProhibitToNull", member_email);
		sqlSession.commit();
		return changeCnt;
	}

	@Override
	public int deleteMemberByAdmin(String member_email) {
		int changeCnt = sqlSession.delete("dao.MemberDAO.deleteMemberByAdmin", member_email);
		sqlSession.commit();
		return changeCnt;
	}

}
