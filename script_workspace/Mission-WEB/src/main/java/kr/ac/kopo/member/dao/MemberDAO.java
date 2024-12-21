package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	/**
	 * 파라미터로 날라온 데이터(id, password)로 DB에 회원존재 여부 판단
	 * @param member 사용자가 입력한 정보(id, password)
	 * @return memverVO 회원이 존재하면 회원객체, 없으면 null 반환
	 */
	MemberVO login(MemberVO loginVO);
}
