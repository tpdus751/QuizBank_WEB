<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <jsp:include page="/common/head.jsp" />
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">문제 수정</h1>
                <p class="lead fw-normal text-white-50 mb-0">문제를 수정해볼까요~?</p>
            </div>
        </div>
    </header>

    <section>
        <div class="container">
            <form action="/QuizBank/quiz/updateQuizProcess.do" method="post">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th colspan="2" class="text-center">문제 작성</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 작성자 입력 (수정 불가) -->
                        <tr>
                            <td class="align-middle"><label for="author" class="form-label">작성자</label></td>
                            <td>
                                <input type="text" class="form-control" id="author" name="author" value="${loginMemberVO.nick_nm}" readonly style="background-color: #f1f1f1; color: #6c757d;">
                                <small class="form-text text-muted">작성자는 수정할 수 없습니다.</small>
                            </td>
                        </tr>
                        
                        <!-- 과목 선택 부분 -->
						<tr>
						    <td class="align-middle"><label for="subject" class="form-label">과목</label></td>
						    <td>
						        <select class="form-control" name="subject_nm_disabled" disabled>
								    <option value="" disabled>과목을 선택하세요</option>
								    <option value="1" ${quizVO.subject_no == '1' ? 'selected' : ''}>자바</option>
								    <option value="2" ${quizVO.subject_no == '2' ? 'selected' : ''}>운영체제</option>
								    <option value="3" ${quizVO.subject_no == '3' ? 'selected' : ''}>파이썬</option>
								    <option value="4" ${quizVO.subject_no == '4' ? 'selected' : ''}>빅데이터</option>
								    <option value="5" ${quizVO.subject_no == '5' ? 'selected' : ''}>정보통신개론</option>
								    <option value="6" ${quizVO.subject_no == '6' ? 'selected' : ''}>프로그래밍언어실습</option>
								    <option value="7" ${quizVO.subject_no == '7' ? 'selected' : ''}>스크립트언어실습</option>
								</select>
						        <small class="form-text text-muted">과목은 수정할 수 없습니다.</small>
						    </td>
						</tr>

                        <!-- 문제 제목 입력 -->
                        <tr>
                            <td class="align-middle"><label for="quizTitle" class="form-label">문제 제목</label></td>
                            <td><input type="text" class="form-control" id="quizTitle" name="quizTitle" placeholder="문제 제목을 입력하세요" value="${quizVO.quiz_nm}" required></td>
                        </tr>

                        <!-- 문제 타입 (단답식, 객관식) -->
                        <tr>
                            <td class="align-middle"><label for="type" class="form-label">문제 타입</label></td>
                            <td><input type="text" class="form-control" id="type" name="type" value="${quizVO.quiz_type}" readonly></td>
                        </tr>

                        <!-- 문제 내용 입력 -->
                        <tr>
                            <td class="align-middle"><label for="quizContent" class="form-label">문제 내용</label></td>
                            <td><textarea class="form-control" id="quizContent" name="quizContent" rows="4" placeholder="문제 내용을 입력하세요" required>${quizVO.content}</textarea></td>
                        </tr>

                        <!-- 객관식일 경우 보기 항목들 -->
                        <c:if test="${quizVO.quiz_type == '객관식'}">
                            <tr>
                                <td class="align-middle"><label class="form-label">보기 (1번부터 5번까지 작성)</label></td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control mb-2" id="choice1" name="choice1" value="${choices.choice_1}" placeholder="1번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice2" name="choice2" value="${choices.choice_2}" placeholder="2번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice3" name="choice3" value="${choices.choice_3}" placeholder="3번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice4" name="choice4" value="${choices.choice_4}" placeholder="4번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice5" name="choice5" value="${choices.choice_5}" placeholder="5번 보기" required>
                                    </div>
                                </td>
                            </tr>
                        </c:if>

                        <!-- 정답 입력 -->
                        <tr>
                            <td class="align-middle"><label for="answer" class="form-label">정답</label></td>
                            <td>
                            <c:choose>
                        	<c:when test="${quizVO.quiz_type == '단답식'}">
                                <input type="text" class="form-control" id="answer" name="answer" placeholder="정답을 입력하세요" value="${quizVO.answer}" required>
                            </c:when>
                            <c:otherwise>  	  
                            	<select class="form-control" name="answer" value="${quizVO.answer}" required>
						            <option value="" disabled selected>정답을 선택하세요</option>
						            <option value="1" ${quizVO.answer == '1' ? 'selected' : ''}>1번</option>
								    <option value="2" ${quizVO.answer == '2' ? 'selected' : ''}>2번</option>
								    <option value="3" ${quizVO.answer == '3' ? 'selected' : ''}>3번</option>
								    <option value="4" ${quizVO.answer == '4' ? 'selected' : ''}>4번</option>
								    <option value="5" ${quizVO.answer == '5' ? 'selected' : ''}>5번</option>
						        </select>
						        <small class="form-text text-muted">
                                    <c:if test="${quizVO.quiz_type == '객관식'}">번호를 선택하세요 (예: 1번)</c:if>
                                </small>
						   </c:otherwise>
						</c:choose>
							</td>
                            </td>
                        </tr>

                        <!-- 해설 입력 -->
                        <tr>
                            <td class="align-middle"><label for="explanation" class="form-label">해설</label></td>
                            <td><textarea class="form-control" id="explanation" name="explanation" rows="4" placeholder="문제에 대한 해설을 작성하세요" required>${quizVO.explanation}</textarea></td>
                        </tr>
                    </tbody>
                </table>
                
    			<!-- 히든 인풋으로 멤버 이메일 전송 -->
    			<input type="hidden" name="member_email" value="${loginMemberVO.member_email}">
    			
    			<!-- 히든 인풋으로 퀴즈 번호 전송 -->
    			<input type="hidden" name="quiz_no" value="${quizVO.quiz_no}">
    			
    			<c:if test="${not empty subject and not empty page}">
    			<!-- 히든 인풋으로 리스트:과목 전송 -->
    			<input type="hidden" name="before:subject_no" value="${subject}">
    			
    			<!-- 히든 인풋으로 리스트:페이지 전송 -->
    			<input type="hidden" name="before:page_no" value="${page}">
				</c:if>

                <!-- 제출 버튼 -->
                <div class="d-flex justify-content-center gap-3 mt-4 mb-5">
                    <a href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}&beforePage=${subject}:${page}" class="btn btn-danger btn-lg">취소</a>
                    <button type="submit" class="btn btn-warning btn-lg">문제 수정</button>
                </div>

            </form>
        </div>
    </section>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
