package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;

public interface MemberService {
	
	public MemberVO seachMember(MemberVO memberVO);

	public MemberVO searchMemberById(MemberVO memberVO);

	public int addUnMember(MemberVO memberVO);

	public int changeMemberInfoByVO(MemberVO member);

	public int registMemberByVO(MemberVO member);

	public int addCreditFlow(MemberCreditFlowVO creditFlow);

}
