package kr.ac.kopo.member.service;

import java.util.List;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.dao.MemberDAOImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;

public class MemberServiceImpl implements MemberService {
	private MemberDAO memberDao;

	
	public MemberServiceImpl() {
		memberDao = new MemberDAOImpl();
	}

	@Override
	public MemberVO seachMember(MemberVO memberVO) {
		MemberVO member = memberDao.selectMember(memberVO);
		return member;
	}

	@Override
	public MemberVO searchMemberById(MemberVO memberVO) {
		MemberVO member = memberDao.selectMemberById(memberVO);
		return member;
	}

	@Override
	public int addUnMember(MemberVO memberVO) {
		int addUnMemResult = memberDao.insertUnMemberByVO(memberVO);
		return addUnMemResult;
	}

	@Override
	public int changeMemberInfoByVO(MemberVO member) {
		int result = memberDao.updateMemberByVO(member);
		return result;
	}

	@Override
	public int registMemberByVO(MemberVO member) {
		int result = memberDao.insertMemberByVO(member);
		return result;
	}

	@Override
	public int addCreditFlow(MemberCreditFlowVO creditFlow) {
		int insertResult = memberDao.insertCreditFlow(creditFlow);
		return insertResult;
	}

	@Override
	public int searchTotalMemberCnt() {
		int totalMemberCnt = memberDao.selectTotalMemberCnt();
		return totalMemberCnt;
	}

	@Override
	public int searchTodayRegistMemberCnt() {
		int todayNewMemberCnt = memberDao.selectTodayNewMemberCnt();
		return todayNewMemberCnt;
	}

	@Override
	public int searchMonthRegistMemberCnt() {
		int monthNewMemberCnt = memberDao.selectMonthNewMemberCnt();
		return monthNewMemberCnt;
	}

	@Override
	public int searchYearRegistMemberCnt() {
		int yearNewMemberCnt = memberDao.selectYearNewMemberCnt();
		return yearNewMemberCnt;
	}

	@Override
	public int checkOverrapEmail(String member_email) {
		int checkOverrap = memberDao.selectCheckOverrapEmail(member_email);
		return checkOverrap;
	}

	@Override
	public List<MemberVO> searchAllMembers() {
		List<MemberVO> totalMemberList = memberDao.selectAllMembers();
		return totalMemberList;
	}

	@Override
	public List<MemberVO> searchPageMembers(int page) {
		List<MemberVO> pageMemberList = memberDao.selectpageMembers(page);
		return pageMemberList;
	}

	@Override
	public int adjustMemberProhibit(String member_email) {
		int checkBan = memberDao.updateMemberProhibit(member_email);
		return checkBan;
	}

	@Override
	public int changeProhibitToNull(String member_email) {
		int changeCnt = memberDao.updateProhibitToNull(member_email);
		return changeCnt;
	}

	@Override
	public int removeMemberByAdmin(String member_email) {
		int changeCnt = memberDao.deleteMemberByAdmin(member_email);
		return changeCnt;
	}


}
