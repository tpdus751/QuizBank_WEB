package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.CommentService;
import kr.ac.kopo.comment.service.CommentServiceImpl;
import kr.ac.kopo.comment.vo.CommentLayer1VO;
import kr.ac.kopo.comment.vo.QuizCommentVO;

public class LoadCommentListController implements Controller {
	
	CommentService commentService;

	public LoadCommentListController() {
		commentService = new CommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String quiz_no_str = request.getParameter("quiz_no");
		
		if (quiz_no_str == null || quiz_no_str.trim().isEmpty()) {
			out.print("{\"comments\":[]}");
			out.flush();
			return null;
		}
		
		int quiz_no = Integer.parseInt(quiz_no_str);
		
		// 원댓글 목록 조회
		List<QuizCommentVO> commentList = commentService.getCommentsByQuizNo(quiz_no);
		// 답글 목록 조회
		List<CommentLayer1VO> replyList = commentService.getRepliesByQuizNo(quiz_no);
		
		// replyMap: key = ori_comment_no, value = 그 원댓글에 속한 답글(대댓글)
		HashMap<Integer, List<CommentLayer1VO>> replyMap = new HashMap<>();
		
		for (CommentLayer1VO layer1 : replyList) {
			int ori_comment_no = layer1.getOri_comment_no();
			replyMap.putIfAbsent(ori_comment_no, new ArrayList<>());
			replyMap.get(ori_comment_no).add(layer1);
		}
		
		// JSON 생성
		// commentList 각 원소에 대해 replies 배열을 동적으로 생성
		StringBuilder sb = new StringBuilder();
		sb.append("{\"comments\":[");
		for (int i = 0; i < commentList.size(); i++) {
			QuizCommentVO ori_comment = commentList.get(i);
			if (i > 0) sb.append(",");
			sb.append("{");
			sb.append("\"comment_no\":").append(ori_comment.getComment_no()).append(",");
			sb.append("\"quiz_no\":").append(ori_comment.getQuiz_no()).append(",");
			sb.append("\"member_email\":\"").append(jsonEscape(ori_comment.getMember_email())).append("\",");
			sb.append("\"nick_nm\":\"").append(jsonEscape(ori_comment.getNick_nm())).append("\",");
			sb.append("\"written\":\"").append(jsonEscape(ori_comment.getWritten())).append("\",");
			sb.append("\"reg_dt\":\"").append(jsonEscape(ori_comment.getReg_dt())).append("\",");
			
			// ori_comment_no = comment_no 인 답글들 가져오기
			List<CommentLayer1VO> replies = replyMap.get(ori_comment.getComment_no());
			
			sb.append("\"replies\":[");
			if (replies != null && !replies.isEmpty()) {
				for (int j = 0; j < replies.size(); j++) {
					CommentLayer1VO layer1 = replies.get(j);
					if (j > 0) sb.append(",");
					sb.append("{");
					sb.append("\"comment_lay1_no\":").append(layer1.getComment_lay1_no()).append(",");
					sb.append("\"quiz_no\":").append(layer1.getQuiz_no()).append(",");
					sb.append("\"ori_comment_no\":").append(layer1.getOri_comment_no()).append(",");
					sb.append("\"member_email\":\"").append(jsonEscape(layer1.getMember_email())).append("\",");
					sb.append("\"nick_nm\":\"").append(jsonEscape(layer1.getNick_nm())).append("\",");
					sb.append("\"written\":\"").append(jsonEscape(layer1.getWritten())).append("\",");
					sb.append("\"reg_dt\":\"").append(jsonEscape(layer1.getReg_dt())).append("\"");
					sb.append("}");
				}
			}
			sb.append("]");
			sb.append("}");
		}
		sb.append("]}");
		
		out.print(sb.toString());
		out.flush();
		out.close();
		
		return null;
	}

	private String jsonEscape(String str) {
		if (str == null) return "";
		return str.replace("\\", "\\\\").replace("\"", "\\\"");
	}

}
