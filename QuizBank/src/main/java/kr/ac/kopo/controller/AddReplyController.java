package kr.ac.kopo.controller;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.CommentService;
import kr.ac.kopo.comment.service.CommentServiceImpl;
import kr.ac.kopo.comment.vo.CommentLayer1VO;
import kr.ac.kopo.member.vo.MemberVO;

public class AddReplyController implements Controller {
	
	CommentService commentService;
	
	public AddReplyController() {
		commentService = new CommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line = request.getReader().readLine()) != null) {
				sb.append(line);
			}
			
			String body = sb.toString();
			String quizNoStr = parseJsonValue(body, "quiz_no");
			String oriCommentNoStr = parseJsonValue(body, "ori_comment_no");
			String content = parseJsonValue(body, "content");
			
			if (quizNoStr == null || quizNoStr.trim().isEmpty()) {
			    out.print("{\"success\":false,\"message\":\"quiz_no 파라미터가 없습니다.\"}");
			    return null;
			}
			if (oriCommentNoStr == null || oriCommentNoStr.trim().isEmpty()) {
			    out.print("{\"success\":false,\"message\":\"ori_comment_no 파라미터가 없습니다.\"}");
			    return null;
			}
			if (content == null || content.trim().isEmpty()) {
			    out.print("{\"success\":false,\"message\":\"content 파라미터가 없습니다.\"}");
			    return null;
			}

			int quiz_no = Integer.parseInt(quizNoStr);
			int ori_comment_no = Integer.parseInt(oriCommentNoStr);
			
			MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
			if (loginMember == null) {
			    out.print("{\"success\":false,\"message\":\"로그인이 필요합니다.\"}");
			    return null;
			}

			String member_email = loginMember.getMember_email();

			CommentLayer1VO reply = new CommentLayer1VO();
			reply.setQuiz_no(quiz_no);
			reply.setOri_comment_no(ori_comment_no);
			reply.setMember_email(member_email);
			reply.setWritten(content);

			int result = commentService.addReply(reply);
			if (result > 0) {
				out.print("{\"success\":true, \"message\":\"답글 등록 성공\"}");
			} else {
				out.print("{\"success\":false, \"message\":\"답글 등록 실패\"}");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			out.print("{\"success\":false, \"message\":\"서버 오류 발생\"}");
		}
		
		return null; // JSP 포워드 없음
	}
	
	private String parseJsonValue(String json, String key) {
	    String pattern = "\"" + key + "\"\\s*:\\s*\"([^\"]+)\"";
	    java.util.regex.Pattern p = java.util.regex.Pattern.compile(pattern);
	    java.util.regex.Matcher m = p.matcher(json);
	    if (m.find()) {
	        return m.group(1);
	    }
	    return null;
	}
}
