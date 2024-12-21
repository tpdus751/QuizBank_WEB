<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="ko">
<head>
    <jsp:include page="/common/head.jsp" />
    <!-- 추가적인 스타일이나 스크립트가 필요하다면 여기에 추가하세요 -->
    <style>
         .form-control[readonly] {
            background-color: #f1f1f1;
            color: #6c757d;
        }
        .registration-form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            max-width: 500px; /* 폼의 최대 너비 설정 */
            margin: 0 auto; /* 폼을 가운데 정렬 */
        }
        .registration-form h2 {
            margin-bottom: 30px;
        }
        .input-group-text {
            background-color: #e9ecef;
        }
        /* 휴대폰 번호 입력란 가운데 정렬 */
        .phone-input {
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <section class="py-5">
        <div class="container">
            <div class="registration-form">
                <form action="/QuizBank/member/registMemberProcess.do" method="post">
                    <c:choose>
                        <c:when test="${not empty sessionScope.unMemberVO}">
                            <%-- 카카오 로그인은 했지만 회원가입을 하지 않은 경우 --%>
                            <h2 class="text-center">회원가입</h2>
                            <!-- member_email (readonly) -->
                            <div class="mb-3">
                                <label for="member_email" class="form-label">이메일</label>
                                <input type="email" class="form-control" id="member_email" name="member_email" value="${sessionScope.unMemberVO.member_email}" readonly>
                            </div>
                            <!-- member_pwd -->
                            <div class="mb-3">
                                <label for="member_pwd" class="form-label">비밀번호</label>
                                <input type="password" class="form-control" id="member_pwd" name="member_pwd" placeholder="비밀번호를 입력하세요" required>
                            </div>
                            <!-- member_nm -->
                            <div class="mb-3">
                                <label for="member_nm" class="form-label">성명</label>
                                <input type="text" class="form-control" id="member_nm" name="member_nm" placeholder="성명을 입력하세요" required>
                            </div>
                            <!-- nick_nm (readonly) -->
                            <div class="mb-3">
                                <label for="nick_nm" class="form-label">닉네임</label>
                                <input type="text" class="form-control" id="nick_nm" name="nick_nm" value="${sessionScope.unMemberVO.nick_nm}">
                            </div>
                            <!-- 휴대폰 번호 -->
                            <div class="mb-3">
                                <label class="form-label">휴대폰 번호</label>
                                <div class="input-group">
                                    <input type="text" class="form-control phone-input" name="phone1" maxlength="3" placeholder="010" required>
                                    <span class="input-group-text">-</span>
                                    <input type="text" class="form-control phone-input" name="phone2" maxlength="4" placeholder="0000" required>
                                    <span class="input-group-text">-</span>
                                    <input type="text" class="form-control phone-input" name="phone3" maxlength="4" placeholder="0000" required>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- 카카오 로그인도 안하고 회원가입이 안되어 있는 경우 --%>
                            <h2 class="text-center">회원가입</h2>
                            <!-- member_email -->
                            <div class="mb-3">
                                <label for="member_email" class="form-label">이메일</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="email_id" name="email_id" placeholder="이메일 아이디" required>
                                    <span class="input-group-text">@</span>
                                    <select class="form-select" id="email_domain" name="email_domain" required>
                                        <option value="" disabled selected>선택하세요</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <!-- 필요하다면 추가적인 도메인 옵션을 넣으세요 -->
                                    </select>
                                </div>
                            </div>
                            <!-- member_pwd -->
                            <div class="mb-3">
                                <label for="member_pwd" class="form-label">비밀번호</label>
                                <input type="password" class="form-control" id="member_pwd" name="member_pwd" placeholder="비밀번호를 입력하세요" required>
                            </div>
                            <!-- member_nm -->
                            <div class="mb-3">
                                <label for="member_nm" class="form-label">성명</label>
                                <input type="text" class="form-control" id="member_nm" name="member_nm" placeholder="성명을 입력하세요" required>
                            </div>
                            <!-- nick_nm -->
                            <div class="mb-3">
                                <label for="nick_nm" class="form-label">닉네임</label>
                                <input type="text" class="form-control" id="nick_nm" name="nick_nm" placeholder="닉네임을 입력하세요" required>
                            </div>
                            <!-- 휴대폰 번호 -->
                            <div class="mb-3">
                                <label class="form-label">휴대폰 번호</label>
                                <div class="input-group">
                                    <input type="text" class="form-control phone-input" name="phone1" maxlength="3" placeholder="010" required>
                                    <span class="input-group-text">-</span>
                                    <input type="text" class="form-control phone-input" name="phone2" maxlength="4" placeholder="0000" required>
                                    <span class="input-group-text">-</span>
                                    <input type="text" class="form-control phone-input" name="phone3" maxlength="4" placeholder="0000" required>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- 제출 버튼 -->
                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary btn-lg">회원가입</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <jsp:include page="/common/footer.jsp" />

    <!-- 필요하다면 추가적인 스크립트를 여기에 추가하세요 -->
</body>
</html>
