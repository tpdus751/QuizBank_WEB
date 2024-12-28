<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Header-->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: sticky; top: 0; z-index: 1000;">
    <div class="container">
        <!-- ��ü�� flex �����̳ʷ� ���� -->
        <div class="d-flex justify-content-between align-items-center w-100">
            <!-- ���� ���� -->
            <div class="d-flex align-items-center left-section">
                <!-- �ΰ� -->
                <a class="navbar-brand me-3" href="/QuizBank/home.do">QUIZBANK</a>
                <!-- ����� ��� ��ư -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarLeftContent" aria-controls="navbarLeftContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>	
                <!-- �׺���̼� �޴� -->
                <div class="collapse navbar-collapse" id="navbarLeftContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <!-- Ȩ -->
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/QuizBank/home.do">Ȩ</a>
                        </li>
                        <!-- ���� �������� -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownSubjects" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">������ ��������</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownSubjects">
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=0:1&filter=none">��� ��������</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <!-- ���� ����Ʈ -->
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=1:1&filter=none">�ڹ�</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=2:1&filter=none">�ü��</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=3:1&filter=none">���̽�</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=4:1&filter=none">������</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=5:1&filter=none">������Ű���</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=6:1&filter=none">���α׷��־��ǽ�</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=7:1&filter=none">��ũ��Ʈ���ǽ�</a></li>
                                <li><a class="dropdown-item" href="/QuizBank/quiz/quizListPage.do?page=8:1&filter=none">IT���</a></li>
                            </ul>
                        </li>
                        <!-- �α��ε� ��쿡�� ǥ�õǴ� �޴� -->
                        <c:if test="${not empty loginMemberVO}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownAddQuiz" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">���� �߰�</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownAddQuiz">
                                    <li><a class="dropdown-item" href="/QuizBank/quiz/QuizAddPage.do?type=short">�ܴ��</a></li>
                                    <li><a class="dropdown-item" href="/QuizBank/quiz/QuizAddPage.do?type=multiple">������</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>

            <c:choose>
                <c:when test="${not empty loginMemberVO}">
            <!-- �߾� ���� -->
            <div class="center-section">
                <a class="btn sun-button" href="/QuizBank/test/startTest.do"><b>���� ����</b></a>
            </div>
                </c:when>
                <c:otherwise>
            <!-- �߾� ���� -->
            <div class="center-section">
                <a class="btn sun-button" onclick="needLogin()"><b>���� ����</b></a>
            </div>
                </c:otherwise>
            </c:choose>

            <!-- ������ ���� -->
            <div class="d-flex align-items-center right-section">
                <c:choose>
                    <c:when test="${empty loginMemberVO}">
                        <span class="welcome-message me-3">�Խ�Ʈ�� ȯ���մϴ�.</span>
                        <a class="btn btn-outline-dark me-3" href="/QuizBank/member/loginPage.do">�α���</a>
                        <a class="btn btn-outline-dark" href="/QuizBank/member/registMemberPage.do?unMember=0">ȸ������</a>
                    </c:when>
                    <c:otherwise>
                        <span class="welcome-message me-3">${loginMemberVO.nick_nm}�� ȯ���մϴ�!</span>
                        <a class="btn btn-outline-dark me-3" href="/QuizBank/member/myPage.do">����������</a>
                        <a class="btn btn-outline-dark" href="/QuizBank/member/logout.do">�α׾ƿ�</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<script>
	needLogin = function() {
		alert("������ ���÷��� �α����� �ؾ��մϴ�.")
		location.href = "/QuizBank/member/loginPage.do";
	}
</script>