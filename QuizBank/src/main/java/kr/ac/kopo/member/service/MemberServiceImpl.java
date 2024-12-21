package kr.ac.kopo.member.service;

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


}
