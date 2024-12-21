package kr.ac.kopo.controller;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.CommentService;
import kr.ac.kopo.comment.service.CommentServiceImpl;
import kr.ac.kopo.comment.vo.QuizCommentVO;
import kr.ac.kopo.member.vo.MemberVO;

public class EditCommentController implements Controller {

	CommentService commentService;
	
	public EditCommentController() {
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
			
			// JSON 파싱 (간단 가정, 실제로는 GSON/Jackson 추천)
			String body = sb.toString();
			String commentNoStr = parseJsonValue(body, "comment_no");
			String contentToUpdate = parseJsonValue(body, "content");
			
			if (commentNoStr == null || commentNoStr.trim().isEmpty()) {
			    out.print("{\"success\":false,\"message\":\"commentNoStr 파라미터가 없습니다.\"}");
			    return null;
			}
			if (contentToUpdate == null || contentToUpdate.trim().isEmpty()) {
			    out.print("{\"success\":false,\"message\":\"contentToUpdate 파라미터가 없습니다.\"}");
			    return null;
			}
			
			MemberVO loginMember = (MemberVO)request.getSession().getAttribute("loginMemberVO");
			if (loginMember == null) {
			    out.print("{\"success\":false,\"message\":\"로그인이 필요합니다.\"}");
			    return null;
			}
			
			int comment_no = Integer.parseInt(commentNoStr);
			
			QuizCommentVO comment = new QuizCommentVO();
			comment.setComment_no(comment_no);
			comment.setWritten(contentToUpdate);
			
			int result = commentService.changeComment(comment);
			if (result > 0) {
				out.print("{\"success\":true, \"message\":\"댓글 수정 성공\"}");
			} else {
				out.print("{\"success\":false, \"message\":\"댓글 수정 실패\"}");
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
