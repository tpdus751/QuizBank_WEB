package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.CommentService;
import kr.ac.kopo.comment.service.CommentServiceImpl;
import kr.ac.kopo.comment.vo.QuizCommentVO;

public class DeleteCommentController implements Controller {

    CommentService commentService;

    public DeleteCommentController() {
        commentService = new CommentServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        Map<String, Object> result = new HashMap<>();

        try {
            // 요청 데이터 읽기
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = request.getReader().readLine()) != null) {
                sb.append(line);
            }
            String body = sb.toString();

            // JSON 데이터 파싱
            JsonParser parser = new JsonParser();
            JsonElement jsonElement = parser.parse(body);

            int comment_no = jsonElement.getAsJsonObject().get("comment_no").getAsInt();
            JsonArray repliesArray = jsonElement.getAsJsonObject().getAsJsonArray("replies");

            // replies 크기 확인
            int repliesCount = repliesArray != null ? repliesArray.size() : 0;

            if (repliesCount > 0) {
                // 답글이 있을 경우 "삭제된 댓글입니다"로 수정
                QuizCommentVO updatedComment = new QuizCommentVO();
                updatedComment.setComment_no(comment_no);
                updatedComment.setWritten("삭제된 댓글입니다");

                int updateResult = commentService.changeComment(updatedComment);
                if (updateResult > 0) {
                    result.put("success", true);
                    result.put("message", "댓글 내용이 '삭제된 댓글입니다'로 변경되었습니다.");
                } else {
                    result.put("success", false);
                    result.put("message", "댓글 내용 수정 실패");
                }
            } else {
                // 답글이 없을 경우 댓글 삭제
                int deletionResult = commentService.removeComment(comment_no);
                if (deletionResult > 0) {
                    result.put("success", true);
                    result.put("message", "댓글 삭제 성공");
                } else {
                    result.put("success", false);
                    result.put("message", "댓글 삭제 실패");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "서버 오류 발생");
        }

        out.print(gson.toJson(result));
        return null;
    }
}
