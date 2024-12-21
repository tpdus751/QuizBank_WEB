<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script>
        window.onload = function() {
            var testNow = '${testNow}';
            if (testNow && testNow.trim() !== '') { 
                alert(testNow);
            }
        }
    </script>
    <jsp:include page="/common/head.jsp" />
    <title>문제 풀이</title>
    <style>
        .quiz-container {
            max-width: 900px;
            margin: 50px auto;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .quiz-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .quiz-section {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

        .quiz-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .quiz-content {
            margin-bottom: 20px;
            font-size: 16px;
        }

        .options-container {
            margin-top: 10px;
        }

        .answer-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .hint-container {
            margin-top: 10px;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px dashed #6c757d;
            border-radius: 5px;
            font-size: 14px;
            color: #495057;
        }

        .hint-title {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .hint-content {
            margin-left: 10px;
            line-height: 1.5;
        }

        .quiz-footer {
            text-align: center;
            margin-top: 20px;
        }

        .submit-button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #218838;
        }
        
	    .sidebar {
		    position: fixed;
		    top: 50%;
		    right: 68px; 
		    transform: translateY(-50%);
		    width: 150px;
		    padding: 20px;
		    background-color: #fff;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    font-family: 'Gowun Dodum', sans-serif;
		    z-index: 1000;
		    text-align: center;
	    }
	
	    .sidebar .timer-icon {
	        font-size: 40px;
	        color: #FF4500;
	        margin-bottom: 10px;
	    }
	
	    .sidebar .timer {
	        font-size: 20px;
	        font-weight: bold;
	        color: #333;
	        margin-bottom: 10px;
	    }
        
	    .options-container label {
	        display: block;
	        margin-bottom: 5px;
	    }
        
        .timer-button {
            padding: 5px 10px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .timer-button:hover {
            background-color: #0056b3;
        }
        
        body {
		    margin: 0;
		    padding: 0;
		    font-family: 'Gowun Dodum', sans-serif;
		    position: relative;
		    overflow-x: hidden; /* 가로 스크롤 방지 */
		}
		
		body::before {
		    content: "";
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: url('../assets/quizbank_back.jpg') center/cover no-repeat; /* 배경 이미지 설정 */
		    background-color: rgba(0, 0, 0, 0.7); /* 어두운 불투명 레이어 */
		    background-blend-mode: darken; /* 이미지와 색상을 섞음 */
		    z-index: -1; /* 모든 요소의 뒤에 배치 */
		}
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />
    
    <!-- 사이드바 -->
    <div class="sidebar">
        <div class="timer-icon">⏰</div>
        <div class="timer" id="timer">10:00</div>
        <button class="timer-button" id="toggleBtn">일시정지</button>
    </div>

    <div class="quiz-container">
        <div class="quiz-header">
            <h1>시험 시작!!</h1><br>
            <p>총 20문제를 순차적으로 풀어주세요.</p>
        </div>

        <form action="/QuizBank/test/submitQuiz.do" method="POST" onkeydown="return disableEnterKey(event)">
        	<!-- 히든 필드로 quiz_no 전송 -->
            <input type="hidden" name="testQuizList" value="${testQuizList}" />
            <c:forEach var="quizVO" items="${testQuizList}" varStatus="status">
                <div class="quiz-section">
                    <div class="quiz-title">문제 ${status.index + 1}.&nbsp<c:choose>
											                                <c:when test="${quizVO.subject_no == 1}">자바</c:when>
											                                <c:when test="${quizVO.subject_no == 2}">운영체제</c:when>
											                                <c:when test="${quizVO.subject_no == 3}">파이썬</c:when>
											                                <c:when test="${quizVO.subject_no == 4}">빅데이터</c:when>
											                                <c:when test="${quizVO.subject_no == 5}">정보통신개론</c:when>
											                                <c:when test="${quizVO.subject_no == 6}">프로그래밍언어실습</c:when>
											                                <c:when test="${quizVO.subject_no == 7}">스크립트언어실습</c:when>
											                                <c:otherwise>알 수 없는 과목</c:otherwise>
											                            </c:choose> | ${quizVO.quiz_type}
												                        </div><br>
                    <div class="quiz-content"><pre>${quizVO.content}</pre></div>
                    <br>
                    <div class="options-container">
                        <c:choose>
                            <c:when test="${choiceMap != null && choiceMap[quizVO.quiz_no] != null}">
                                <c:set var="choiceVO" value="${choiceMap[quizVO.quiz_no]}" />
                                <div>
                                    <label>
                                        <input type="radio" name="answer_${quizVO.quiz_no}" value="${choiceVO.choice_1}" />
                                        ${choiceVO.choice_1}
                                    </label>
                                    <label>
                                        <input type="radio" name="answer_${quizVO.quiz_no}" value="${choiceVO.choice_2}" />
                                        ${choiceVO.choice_2}
                                    </label>
                                    <label>
                                        <input type="radio" name="answer_${quizVO.quiz_no}" value="${choiceVO.choice_3}" />
                                        ${choiceVO.choice_3}
                                    </label>
                                    <label>
                                        <input type="radio" name="answer_${quizVO.quiz_no}" value="${choiceVO.choice_4}" />
                                        ${choiceVO.choice_4}
                                    </label>
                                    <label>
                                        <input type="radio" name="answer_${quizVO.quiz_no}" value="${choiceVO.choice_5}" />
                                        ${choiceVO.choice_5}
                                    </label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <label for="answer_${quizVO.quiz_no}">
                                    <b>정답을 입력하세요</b>
                                </label>
                                <input type="text" id="answer_${quizVO.quiz_no}" name="answer_${quizVO.quiz_no}" class="answer-input" placeholder="정답을 입력하세요" />
                            </c:otherwise>
                        </c:choose>
                    </div>
					<c:if test="${hintMap != null && hintMap[quizVO.quiz_no] != null}">
					    <c:set var="hint" value="${hintMap[quizVO.quiz_no]}" />
					    <div class="hint-container" style="display: inline-block; padding: 5px 10px; max-width: auto; text-align: left;">
					        <div class="hint-title" style="font-size: 14px; margin-bottom: 5px;"><u>힌트</u></div>
					        <div class="hint-content" style="font-size: 13px; line-height: 1.2; margin: 0;">
					            <b style="display: inline;">구분자 :</b><span style="margin-left: 5px;">${hint.separate}</span><br />
					            <b style="display: inline;">언&nbsp&nbsp&nbsp어 :</b><span style="margin-left: 5px;">
					                <c:if test="${hint.korean eq 'O'}">한국어</c:if>
					                <c:if test="${hint.english ne 'X'}">
					                    <c:if test="${hint.korean eq 'O'}">, </c:if>영어(${hint.english})
					                </c:if>
					                <c:if test="${hint.code eq 'O'}">
					                    <c:if test="${hint.korean eq 'O' || hint.english ne 'X'}">, </c:if>코드
					                </c:if>
					                <c:if test="${hint.num eq 'O'}">
					                    <c:if test="${hint.korean eq 'O' || hint.english ne 'X' || hint.code eq 'O'}">, </c:if>숫자
					                </c:if>
					            </span>
					        </div>
					    </div>
					</c:if>
                </div>
            </c:forEach>
            <div class="quiz-footer">
                <button type="submit" class="submit-button">제출하기</button>
            </div>
        </form>

<script>
    // 엔터 키로 폼 제출 방지 함수
    function disableEnterKey(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            return false;
        }
        return true;
    }
</script>

    </div>

    <jsp:include page="/common/footer.jsp" />

    <!-- 타이머 스크립트 -->
    <script>
	    let totalTime = 10 * 60; // 10분(초 단위)
	    let timerInterval; // 타이머 ID 저장
	    let isPaused = false; // 타이머 일시정지 상태 관리 변수

	    function updateTimer() {
	        const timerElement = document.getElementById("timer");
	
	        if (!timerElement) {
	            console.error("타이머 요소를 찾을 수 없습니다.");
	            clearInterval(timerInterval); // 타이머 중지
	            return;
	        }

	        // isPaused가 false일 때만 시간 감소
	        if (!isPaused) {
		        const minutes = Math.floor(totalTime / 60);
		        const seconds = totalTime % 60;
		        timerElement.textContent = String(minutes).padStart(2, '0') + ":" + String(seconds).padStart(2, '0');
		        totalTime--;
		
		        if (totalTime < 0) {
		            clearInterval(timerInterval); // 타이머 중지
		            alert("시간이 종료되었습니다. 시험이 제출됩니다.");
		            document.querySelector("form").submit(); // 자동 제출
		        }
	        }
	    }

	    // 버튼 클릭 시 타이머 일시정지/재시작
	    const toggleBtn = document.getElementById('toggleBtn');
	    toggleBtn.addEventListener('click', function() {
	        isPaused = !isPaused;
	        if (isPaused) {
	            toggleBtn.textContent = "재시작";
	        } else {
	            toggleBtn.textContent = "일시정지";
	        }
	    });
	
	    // 타이머 초기화 전에 이전 타이머 중지
	    if (timerInterval) {
	        clearInterval(timerInterval);
	    }
	
	    // 1초마다 타이머 업데이트
	    timerInterval = setInterval(updateTimer, 1000);
    </script>
</body>
</html>
