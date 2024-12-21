package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;

public interface MemberDAO {
	
	MemberVO selectMember(MemberVO memberVO);

	MemberVO selectMemberById(MemberVO memberVO);

	int insertUnMemberByVO(MemberVO memberVO);

	int updateMemberByVO(MemberVO member);

	int insertMemberByVO(MemberVO member);

	int insertCreditFlow(MemberCreditFlowVO creditFlow);
	
}
