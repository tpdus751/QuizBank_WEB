<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/common/head.jsp" />
    <title>시험 결과</title>
    <style>
        

        /* 결과 화면 박스 (기존 exam-description 스타일 재사용) */
        .exam-description {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            margin: 100px auto;
            text-align: center;
            z-index: 1000;
            position: relative;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .exam-description h1 {
            font-size: 32px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #333333;
        }

        .exam-description p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #444;
        }

        .score-box {
            margin-bottom: 30px;
        }

        .score-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .score-value {
            font-size: 40px;
            font-weight: bold;
            color: #28a745;
        }

        .subject-score-table {
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
            text-align: center;
        }

        .subject-score-table th, .subject-score-table td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        .subject-score-table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .subject-score-table td {
            font-size: 16px;
        }

        /* 틀린 문제 테이블 */
        .incorrect-section {
            margin-bottom: 40px;
            text-align: center; 
        }

        .incorrect-section h3 {
            margin-bottom: 20px;
            font-size: 22px;
            font-weight: bold;
            color: #333;
        }

        .incorrect-table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
            text-align: center;
        }

        .incorrect-table th, .incorrect-table td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        .incorrect-table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .incorrect-table td a {
            color: #007bff;
            text-decoration: none;
        }

        .incorrect-table td a:hover {
            text-decoration: underline;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }

        .btn-finish, .btn-retry {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            color: #fff;
            font-weight: bold;
        }

        .btn-finish {
            background-color: #6c757d;
        }

        .btn-finish:hover {
            background-color: #5a6268;
        }

        .btn-retry {
            background: linear-gradient(45deg, #FFD700, #FF8C00);
            box-shadow: 0 5px 15px rgba(255, 140, 0, 0.1);
        }

        .btn-retry:hover {
            background: linear-gradient(45deg, #FF8C00, #FFD700);
        }
        
        /* 배경 이미지 설정 */
		body {
		    margin: 0;
		    padding: 0;
		    font-family: 'Gowun Dodum', sans-serif;
		    position: relative;
		}
		
		/* 전체 페이지 스타일 */
		body {
		    margin: 0;
		    padding: 0;
		    font-family: 'Gowun Dodum', sans-serif;
		    position: relative;
		}
		
		/* 고정 배경 설정 */
		body::before {
		    content: "";
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-image: url('../assets/quizbank_back.jpg'); /* 배경 이미지 */
		    background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    z-index: -1; /* 배경을 가장 뒤로 */
		}
		
		/* 헤더 아래 여백 추가 */
		.exam-description {
		    background-color: white;
		    padding: 40px;
		    border-radius: 15px;
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
		    max-width: 800px;
		    margin: 120px auto 50px auto; /* 헤더 높이만큼 여백 추가 */
		    text-align: center;
		    z-index: 1; /* 내용이 배경 위에 표시되도록 */
		    position: relative;
		}
		
		/* 헤더 고정 설정 */
		nav.navbar {
		    position: sticky;
		    top: 0;
		    z-index: 1000; /* 헤더를 맨 위로 설정 */
		    background-color: #f8f9fa; /* 헤더 배경색 지정 */
		}

    </style>
</head>
<body>
<jsp:include page="/common/header.jsp" />

<!-- 불투명 배경 -->
<div class="overlay"></div>

<div class="exam-description">
    <h1>시험 결과</h1>
    <p>고생하셨습니다! 결과를 확인하세요.</p>

    <!-- 총점수 표시 -->
    <div class="score-box">
        <div class="score-title">총점</div>
        <div class="score-value">${totalScore}점</div>
    </div>

    <!-- 과목별 점수 테이블 -->
    <table class="subject-score-table">
        <thead>
            <tr>
                <th>과목명</th>
                <th>맞은 문제 수 / 총 문제 수</th>
                <th>과목 점수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="subjectInfo" items="${subjectList}" varStatus="status">
                <c:set var="totalCnt" value="${subjectInfo[0]}" />
                <c:set var="correctCnt" value="${subjectInfo[1]}" />
                <c:set var="subjectScore" value="${correctCnt * 5}" />

                <!-- 과목명 매핑 -->
                <c:choose>
                    <c:when test="${status.index == 0}"><c:set var="subjectName" value="자바" /></c:when>
                    <c:when test="${status.index == 1}"><c:set var="subjectName" value="운영체제" /></c:when>
                    <c:when test="${status.index == 2}"><c:set var="subjectName" value="파이썬" /></c:when>
                    <c:when test="${status.index == 3}"><c:set var="subjectName" value="빅데이터" /></c:when>
                    <c:when test="${status.index == 4}"><c:set var="subjectName" value="정보통신개론" /></c:when>
                    <c:when test="${status.index == 5}"><c:set var="subjectName" value="프로그래밍언어실습" /></c:when>
                    <c:when test="${status.index == 6}"><c:set var="subjectName" value="스크립트언어실습" /></c:when>
                    <c:otherwise><c:set var="subjectName" value="알 수 없는 과목" /></c:otherwise>
                </c:choose>

                <tr>
                    <td>${subjectName}</td>
                    <td>${correctCnt} / ${totalCnt}</td>
                    <td>${subjectScore}점</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 틀린 문제 테이블 -->
    <c:if test="${not empty incorrectQuizList}">
        <div class="incorrect-section">
            <h3>틀린 문제 확인하기</h3>
            <p>아래 테이블에서 틀린 문제를 확인해보세요.</p>
            <table class="incorrect-table">
                <thead>
                    <tr>
                        <th>과목명</th>
                        <th>문제명</th>
                        <th>상세페이지</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="quizVO" items="${incorrectQuizList}">
                        <!-- 과목명 매핑을 위해 subject_no 사용 -->
                        <c:choose>
                            <c:when test="${quizVO.subject_no == 1}"><c:set var="incSubjectName" value="자바" /></c:when>
                            <c:when test="${quizVO.subject_no == 2}"><c:set var="incSubjectName" value="운영체제" /></c:when>
                            <c:when test="${quizVO.subject_no == 3}"><c:set var="incSubjectName" value="파이썬" /></c:when>
                            <c:when test="${quizVO.subject_no == 4}"><c:set var="incSubjectName" value="빅데이터" /></c:when>
                            <c:when test="${quizVO.subject_no == 5}"><c:set var="incSubjectName" value="정보통신개론" /></c:when>
                            <c:when test="${quizVO.subject_no == 6}"><c:set var="incSubjectName" value="프로그래밍언어실습" /></c:when>
                            <c:when test="${quizVO.subject_no == 7}"><c:set var="incSubjectName" value="스크립트언어실습" /></c:when>
                            <c:otherwise><c:set var="incSubjectName" value="알 수 없는 과목" /></c:otherwise>
                        </c:choose>
                        <tr>
                            <td>${incSubjectName}</td>
                            <td>${quizVO.quiz_nm}</td>
                            <td><a href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}" target="_blank">바로가기</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <!-- 버튼 영역 -->
    <div class="buttons">
        <button class="btn-finish" onclick="window.location.href='/QuizBank/home.do'">마치기</button>
        <button class="btn-retry" onclick="window.location.href='/QuizBank/test/startTest.do'">다시하기</button>
    </div>
</div>

<jsp:include page="/common/footer.jsp" />
</body>
</html>
