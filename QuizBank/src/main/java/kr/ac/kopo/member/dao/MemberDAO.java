package kr.ac.kopo.member.dao;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.member_credit.vo.MemberCreditFlowVO;

public interface MemberDAO {
	
	MemberVO selectMember(MemberVO memberVO);

	MemberVO selectMemberById(MemberVO memberVO);

	int insertUnMemberByVO(MemberVO memberVO);

	int updateMemberByVO(MemberVO member);

	int insertMemberByVO(MemberVO member);

	int insertCreditFlow(MemberCreditFlowVO creditFlow);

	Integer selectTotalMemberCnt();

	int selectTodayNewMemberCnt();

	int selectMonthNewMemberCnt();

	int selectYearNewMemberCnt();

	int selectCheckOverrapEmail(String member_email);

	List<MemberVO> selectAllMembers();

	List<MemberVO> selectpageMembers(int page);

	int updateMemberProhibit(String member_email);

	int updateProhibitToNull(String member_email);

	int deleteMemberByAdmin(String member_email);
	
}
