package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.quiz.service.QuizService;
import kr.ac.kopo.quiz.service.QuizServiceImpl;
import kr.ac.kopo.quiz.vo.QuizVO;

public class GetReplyQuizsController implements Controller {

    private QuizService quizService;

    public GetReplyQuizsController() {
        quizService = new QuizServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // 요청에서 quiz_no를 가져옴
            int quiz_no = Integer.parseInt(request.getParameter("quiz_no"));
            System.out.println(quiz_no);

            // 해당 quiz_no의 답글 목록 조회
            List<QuizVO> replyQuizs = quizService.searchReplysByNo(quiz_no);
            
            System.out.println(replyQuizs.toString());

            if (replyQuizs == null || replyQuizs.isEmpty()) {
                // 답글이 없을 경우 빈 배열 반환
                out.print("[]");
            } else {
                // JSON 변환
                Gson gson = new Gson();
                String jsonResponse = gson.toJson(replyQuizs);

                // JSON 출력
                out.print(jsonResponse);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 오류 발생 시 클라이언트에 오류 메시지 전송
            out.print("{\"error\": \"Failed to fetch replies.\"}");
        } finally {
            out.flush();
            out.close();
        }

        return null; // JSP로 이동하지 않음
    }
}
