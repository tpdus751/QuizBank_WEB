package kr.ac.kopo.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.StringTokenizer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberManagementPageController implements Controller {
	
	MemberService memberService;

	public MemberManagementPageController() {
		memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pageStr = request.getParameter("page");
		
		int page = 0;
		
		if (pageStr != null) {
			page = Integer.parseInt(pageStr);
		}
		
		List<MemberVO> pageMemberList = memberService.searchPageMembers(page);
		
		LocalDate nowDate = LocalDate.now();
		
		int year = nowDate.getYear();
		int monthValue = nowDate.getMonthValue();
		
		String month = "";
		
		if (monthValue < 10) {
			month = "0" + monthValue;
		}
		
		int dayOfMonth = nowDate.getDayOfMonth();
		
		String day = "";
		
		if (dayOfMonth < 10) {
			day = "0" + dayOfMonth;
		}
		
		LocalTime nowTime = LocalTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
		
		String hms = nowTime.format(formatter);
		
		String now = year +  month + day + hms;
		
		Long nowLong = Long.parseLong(now);
		
		StringTokenizer stAll;
		StringTokenizer stDate;
		StringTokenizer stTime;
		
		String unBanList = "";
		
		for (MemberVO member : pageMemberList) {
			String memberDate = member.getProhibit();
			
			if (memberDate == null) {
				continue;
			} else {
				stAll = new StringTokenizer(memberDate, " ");
				
				String memDate = stAll.nextToken();
				
				stDate = new StringTokenizer(memDate, "-");
				
				String memYear = stDate.nextToken();
				String memMonth = stDate.nextToken();
				String memDay = stDate.nextToken();
				
				String memTime = stAll.nextToken();
				
				stTime = new StringTokenizer(memTime, ":");
				
				String memHH = stTime.nextToken();
				String memMM = stTime.nextToken();
				String memSS = stTime.nextToken();
				
				String memProhibitTime = memYear + memMonth + memDay + memHH + memMM + memSS;
				
				Long memProhibitLong = Long.parseLong(memProhibitTime);
				
				if (nowLong > memProhibitLong) {
					int changeCnt = memberService.changeProhibitToNull(member.getMember_email());
					
					if (changeCnt >= 1) {
						unBanList += member.getMember_email() + ", ";
					}
				}
			}
		}
		
		if (!(unBanList.equals(""))) {
			request.setAttribute("unBanList", unBanList + "의 제재가 풀렸습니다.");
		}
		
		request.setAttribute("pageMemberList", pageMemberList);
		
		request.setAttribute("page", page);
		
		int totalMemberCnt = memberService.searchTotalMemberCnt();
		
		int endPage = totalMemberCnt / 20;
		
		if (totalMemberCnt % 20 > 0) {
			endPage += 1;
		}
		
		request.setAttribute("endPage", endPage);
		
		return "/admin/memberManagementPage.jsp";
	}

}
