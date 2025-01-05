package kr.ac.kopo.member.service;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;

public interface MemberService {
	
	public MemberVO seachMember(MemberVO memberVO);

	public MemberVO searchMemberById(MemberVO memberVO);

	public int addUnMember(MemberVO memberVO);

	public int changeMemberInfoByVO(MemberVO member);

	public int registMemberByVO(MemberVO member);

	public int addCreditFlow(MemberCreditFlowVO creditFlow);

	public int searchTotalMemberCnt();

	public int searchTodayRegistMemberCnt();

	public int searchMonthRegistMemberCnt();

	public int searchYearRegistMemberCnt();

	public int checkOverrapEmail(String member_email);

	public List<MemberVO> searchAllMembers();

	public List<MemberVO> searchPageMembers(int page);

	public int adjustMemberProhibit(String member_email);

	public int changeProhibitToNull(String member_email);

	public int removeMemberByAdmin(String member_email);

}
