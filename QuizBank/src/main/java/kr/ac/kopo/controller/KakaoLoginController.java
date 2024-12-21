package kr.ac.kopo.controller;

import java.net.URLDecoder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class KakaoLoginController implements Controller {

	private MemberService memberService;
	
	public KakaoLoginController() {
		this.memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("KakaoLoginController 요청 도착"); // 로그 추가
		// POST 요청 데이터 처리
        StringBuilder jb = new StringBuilder();
        String line;
        try (var reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jb.append(line);
            }
        }

        if (jb.length() > 0) {
            try {
                // 디코딩 및 파싱
                String decodedData = URLDecoder.decode(jb.toString(), "UTF-8");
                String[] pairs = decodedData.split("&");
                long id = 0;
                String nick_nm = null;
                String member_email = null;

                for (String pair : pairs) {
                    String[] keyValue = pair.split("=");
                    if (keyValue.length == 2) {
                        String key = keyValue[0];
                        String value = keyValue[1];
                        if ("id".equals(key)) {
                            id = Long.parseLong(value);
                        } else if ("nickname".equals(key)) {
                            nick_nm = value;
                        } else if ("email".equals(key)) {
                            member_email = value;
                        }
                    }
                }

                // User 객체 생성 및 서비스 호출
                MemberVO memberVO = new MemberVO(member_email, nick_nm, "X");
                memberVO = memberService.searchMemberById(memberVO);
                
                if (memberVO == null) {
                	memberVO = new MemberVO(member_email, nick_nm, "X");
                	memberVO.setType("X");
                	int addUnMemResult = memberService.addUnMember(memberVO);
                	if (addUnMemResult <= 0) {
                		System.out.println("멤버 테이블에 비회원을 추가하지 못했습니다.");
                		return "/member/loginPage.jsp";
                	}
                	request.getSession().setAttribute("unMemberVO", memberVO);
                	request.setAttribute("goRegister", "등록되어있지 않은 회원입니다. 회원가입 페이지로 이동하시겠습니까?");
                	return "/home.jsp";
                } else if (memberVO.getType().equals("X")) {
                	memberVO = new MemberVO(member_email, nick_nm, "X");
                	request.getSession().setAttribute("unMemberVO", memberVO);
                	request.setAttribute("goRegister", "등록되어있지 않은 회원입니다. 회원가입 페이지로 이동하시겠습니까?");
                	return "/home.jsp";
                } 
                	
                // 결과 페이지로 포워드
                request.getSession().setAttribute("loginMemberVO", memberVO);
                return "/home.jsp";

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorKakaoLogin", "데이터 처리 중 오류 발생: " + e.getMessage());
                return "/member/loginPage.jsp";
            }
        } else {
            request.setAttribute("errorKakaoLogin", "요청 데이터가 없습니다.");
            return "/member/loginPage.jsp";
        }
    
	}

}	
