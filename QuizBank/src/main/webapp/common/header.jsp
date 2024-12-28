<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Header-->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: sticky; top: 0; z-index: 1000;">
    <div class="container">
        <!-- 전체를 flex 컨테이너로 설정 -->
        <div class="d-flex justify-content-between align-items-center w-100">
            <!-- 왼쪽 영역 -->
            <div class="d-flex align-items-center left-section">
                <!-- 로고 -->
                <a class="navbar-brand me-3" href="/QuizBank/home.do">QUIZBANK</a>
                <!-- 모바일 토글 버튼 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarLeftContent" aria-controls="navbarLeftContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>	
                <!-- 네비게이션 메뉴 -->
                <div class="collapse navbar-collapse" id="navbarLeftContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <!-- 홈 -->
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/QuizBank/home.do">홈</a>
                        </li>
                        <!-- 과목별 문제보기 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownSubjects" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">종류별 문제보기</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownSubjects">
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=0:1&filter=none">모든 문제보기</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <!-- 과목 리스트 -->
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=1:1&filter=none">자바</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=2:1&filter=none">운영체제</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=3:1&filter=none">파이썬</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=4:1&filter=none">빅데이터</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=5:1&filter=none">정보통신개론</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=6:1&filter=none">프로그래밍언어실습</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=7:1&filter=none">스크립트언어실습</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=8:1&filter=none">IT용어</a></li>
                            </ul>
                        </li>
                        <!-- 로그인된 경우에만 표시되는 메뉴 -->
                        <c:if test="${not empty loginMemberVO}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownAddQuiz" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">문제 추가</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownAddQuiz">
                                    <li><a class="dropdown-item" href="/QuizBank/quiz/QuizAddPage.do?type=short">단답식</a></li>
                                    <li><a class="dropdown-item" href="/QuizBank/quiz/QuizAddPage.do?type=multiple">객관식</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>

            <c:choose>
                <c:when test="${not empty loginMemberVO}">
            <!-- 중앙 영역 -->
            <div class="center-section">
                <a class="btn sun-button" href="/QuizBank/test/startTest.do"><b>시험 보기</b></a>
            </div>
                </c:when>
                <c:otherwise>
            <!-- 중앙 영역 -->
            <div class="center-section">
                <a class="btn sun-button" onclick="needLogin()"><b>시험 보기</b></a>
            </div>
                </c:otherwise>
            </c:choose>

            <!-- 오른쪽 영역 -->
            <div class="d-flex align-items-center right-section">
                <c:choose>
                    <c:when test="${empty loginMemberVO}">
                        <span class="welcome-message me-3">게스트님 환영합니다.</span>
                        <a class="btn btn-outline-dark me-3" href="/QuizBank/member/loginPage.do">로그인</a>
                        <a class="btn btn-outline-dark" href="/QuizBank/member/registMemberPage.do?unMember=0">회원가입</a>
                    </c:when>
                    <c:otherwise>
                        <span class="welcome-message me-3">${loginMemberVO.nick_nm}님 환영합니다!</span>
                        <a class="btn btn-outline-dark me-3" href="/QuizBank/member/myPage.do">마이페이지</a>
                        <a class="btn btn-outline-dark" href="/QuizBank/member/logout.do">로그아웃</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<script>
	needLogin = function() {
		alert("시험을 보시려면 로그인을 해야합니다.")
		location.href = "/QuizBank/member/loginPage.do";
	}
</script>