<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/common/head.jsp" />
    <title>My Page</title>
    <style>
        .mypage-container {
            max-width: 1200px;
            margin: 50px auto;
            font-family: 'Gowun Dodum', sans-serif;
        }
        .mypage-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .section-title {
            margin-top: 40px;
            margin-bottom: 20px;
            border-bottom: 2px solid #aaa;
            padding-bottom: 10px;
        }
        .form-control[readonly] {
            background-color: #eee;
        }
        .info-text {
            font-weight: bold;
            color: #555;
        }
        .test-list-container .card {
            margin-bottom: 20px;
        }
        .load-more-btn {
            display: block;
            margin: 20px auto;
            padding: 8px 16px;
            font-size: 14px;
            border: none;
            background-color: #ffc107;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            max-width: 250px;
            width: auto;
        }
        .load-more-btn:hover {
            background-color: #e0a800;
        }
        .hidden {
            display: none;
        }
        
        /* 탭 버튼 스타일 */
        .tabs {
            margin-top: 40px;
            margin-bottom: 20px;
            display: flex;
            gap: 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .tabs button {
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px 0;
            color: #333;
            position: relative;
        }

        .tabs button.active {
            color: #007bff;
        }

        .tabs button.active::after {
            content: "";
            display: block;
            width: 100%;
            height: 2px;
            background: #007bff;
            position: absolute;
            bottom: -5px;
            left: 0;
        }

        /* 초기 숨김 처리 */
        #myQuizListContainer {
            display: none;
        }

    </style>
</head>
<script>
    window.onload = function() {
        var updateFailed = '${updateFailed}';
        if (updateFailed && updateFailed.trim() !== '') {
            alert(updateFailed);
        }
        
        var updateSuccess = '${updateSuccess}';
        if (updateSuccess && updateSuccess.trim() !== '') {
            alert(updateSuccess);
        }
        
     	// examListTab 자동 클릭
        const examListTab = document.getElementById('examListTab');
        if (examListTab) {
            examListTab.click();
        }
        
    }
</script>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="mypage-container">
        <div class="mypage-header">
            <h1>마이페이지</h1>
            <p>내 정보 관리와 시험 리스트를 한곳에서 확인하세요.</p>
        </div>

        <!-- 내 정보 섹션 -->
        <h2 class="section-title">내 정보</h2>
        <div class="card p-4 mb-4">
            <form action="/QuizBank/member/updateMemberInfo.do" method="post">    
                <!-- 이메일 (수정불가) -->
                <div class="mb-3 row">
                    <label for="member_email" class="col-sm-2 col-form-label">이메일</label>
                    <div class="col-sm-10">
                        <input type="email" readonly class="form-control" id="member_email" name="member_email" value="${loginMemberVO.member_email}">
                    </div>
                </div>

                <!-- 이름 (수정불가) -->
                <div class="mb-3 row">
                    <label for="member_nm" class="col-sm-2 col-form-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control" id="member_nm" name="member_nm" value="${loginMemberVO.member_nm}">
                    </div>
                </div>

                <!-- 비밀번호 항목 -->
                <div class="mb-3 row align-items-center">
                    <label for="member_pwd" class="col-sm-2 col-form-label">비밀번호</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="password" class="form-control" id="member_pwd" name="member_pwd" value="********" readonly>
                            <button type="button" class="btn btn-outline-secondary" onclick="checkPassword()">비밀번호 수정</button>
                        </div>
                    </div>
                </div>

                <!-- 닉네임 (수정 가능) -->
                <div class="mb-3 row">
                    <label for="nick_nm" class="col-sm-2 col-form-label">닉네임</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nick_nm" name="nick_nm" value="${loginMemberVO.nick_nm}">
                    </div>
                </div>

                <!-- 휴대폰 번호 (수정 가능) -->
                <div class="mb-3 row">
                    <label for="phone_num" class="col-sm-2 col-form-label">휴대폰 번호</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone_num" name="phone_num" value="${loginMemberVO.phone1}-${loginMemberVO.phone2}-${loginMemberVO.phone3}">
                    </div>
                </div>

                <!-- 크레딧 (수정 불가) -->
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">크레딧</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <span class="info-text">${loginMemberVO.credit}</span>
                    </div>
                </div>

                <!-- 가입일 (수정 불가) -->
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">가입일</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <span class="info-text">${loginMemberVO.reg_dt}</span>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">정보 수정하기</button>
                </div>
            </form>
        </div>
        
        <!-- 탭 버튼 -->
        <div class="tabs">
            <button id="examListTab" class="active">시험 리스트에 담긴 문제</button>
            <button id="myQuizTab">내가 작성한 문제</button>
            <button id="myIncorrectQuizTab">내가 틀린 문제</button>
        </div>

        <!-- 시험 리스트에 담긴 문제 컨테이너 -->
        <div id="examListContainer" class="row test-list-container">
            <c:if test="${not empty saveQuizVOList}">
                <c:forEach var="quizVO" items="${saveQuizVOList}" varStatus="status">
                   <div class="col-md-4 col-sm-6 col-12 quiz-item ${status.index >= 6 ? 'hidden' : ''}">
                        <div class="card">
                            <img src="/QuizBank${quizVO.quiz_img}" class="card-img-top" alt="${quizVO.quiz_nm}">
                            <div class="card-body">
                                <h5 class="card-title">${quizVO.quiz_nm}</h5>
                                <p class="card-text">문제 타입: ${quizVO.quiz_type}</p>
                                <a href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}" class="btn btn-outline-primary">바로가기</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${fn:length(saveQuizVOList) > 6}">
                    <button id="loadMoreBtn1" class="load-more-btn" onclick="loadMoreQuizzes('examListContainer','loadMoreBtn1')">더보기</button>
                </c:if>
            </c:if>
            <c:if test="${empty saveQuizVOList}">
                <p class="text-center">저장된 시험이 없습니다.</p>
            </c:if>
        </div>

        <!-- 내가 작성한 문제 컨테이너 -->
        <div id="myQuizListContainer" class="row test-list-container">
            <c:if test="${not empty myQuizList}">
                <c:forEach var="quizVO" items="${myQuizList}" varStatus="status">
                    <div class="col-md-4 col-sm-6 col-12 quiz-item ${status.index >= 6 ? 'hidden' : ''}">
                        <div class="card">
                            <img src="/QuizBank${quizVO.quiz_img}" class="card-img-top" alt="${quizVO.quiz_nm}">
                            <div class="card-body">
                                <h5 class="card-title">${quizVO.quiz_nm}</h5>
                                <p class="card-text">문제 타입: ${quizVO.quiz_type}</p>
                                <a href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}" class="btn btn-outline-primary">바로가기</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${fn:length(myQuizList) > 6}">
                    <button id="loadMoreBtn2" class="load-more-btn" onclick="loadMoreQuizzes('myQuizListContainer','loadMoreBtn2')">더보기</button>
                </c:if>
            </c:if>
            <c:if test="${empty myQuizList}">
                <p class="text-center">작성한 문제가 없습니다.</p>
            </c:if>
        </div>
        
        <!-- 내가 틀린 문제 컨테이너 -->
        <div id="myIncorrectQuizListContainer" class="row test-list-container">
            <c:if test="${not empty myIncorrectQuizList}">
                <c:forEach var="quizVO" items="${myIncorrectQuizList}" varStatus="status">
                    <div class="col-md-4 col-sm-6 col-12 quiz-item ${status.index >= 6 ? 'hidden' : ''}">
                        <div class="card">
                            <img src="/QuizBank${quizVO.quiz_img}" class="card-img-top" alt="${quizVO.quiz_nm}">
                            <div class="card-body">
                                <h5 class="card-title">${quizVO.quiz_nm}</h5>
                                <p class="card-text">문제 타입: ${quizVO.quiz_type}</p>
                                <a href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}" class="btn btn-outline-primary">바로가기</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${fn:length(myQuizList) > 6}">
                    <button id="loadMoreBtn3" class="load-more-btn" onclick="loadMoreQuizzes('myIncorrectQuizListContainer','loadMoreBtn3')">더보기</button>
                </c:if>
            </c:if>
            <c:if test="${empty myQuizList}">
                <p class="text-center">작성한 문제가 없습니다.</p>
            </c:if>
        </div>

    </div>

    <jsp:include page="/common/footer.jsp" />

    <script>
        function checkPassword() {
            var input = prompt("기존 비밀번호를 입력하세요:");
            if (input === '${loginMemberVO.member_pwd}') {
                var pwdField = document.getElementById('member_pwd');
                pwdField.readOnly = false;
                pwdField.value = '';
                pwdField.focus();
            } else {
                alert('비밀번호가 일치하지 않습니다.');
            }
        }

        // 탭 전환 로직
        const examListTab = document.getElementById('examListTab');
        const myQuizTab = document.getElementById('myQuizTab');
        const myIncorrectQuizTab = document.getElementById('myIncorrectQuizTab');
        const examListContainer = document.getElementById('examListContainer');
        const myQuizListContainer = document.getElementById('myQuizListContainer');
        const myIncorrectQuizListContainer = document.getElementById('myIncorrectQuizListContainer');

        examListTab.addEventListener('click', () => {
            examListTab.classList.add('active');
            myQuizTab.classList.remove('active');
            myIncorrectQuizTab.classList.remove('active');
            examListContainer.style.display = 'flex';
            examListContainer.style.flexWrap = 'wrap';
            myQuizListContainer.style.display = 'none';
            myIncorrectQuizListContainer.style.display = 'none';
        });

        myQuizTab.addEventListener('click', () => {
            myQuizTab.classList.add('active');
            examListTab.classList.remove('active');
            myIncorrectQuizTab.classList.remove('active');
            myQuizListContainer.style.display = 'flex';
            myQuizListContainer.style.flexWrap = 'wrap';
            examListContainer.style.display = 'none';
            myIncorrectQuizListContainer.style.display = 'none';
        });
        
        myIncorrectQuizTab.addEventListener('click', () => {
        	myIncorrectQuizTab.classList.add('active');
            examListTab.classList.remove('active');
            myQuizTab.classList.remove('active');
            myIncorrectQuizListContainer.style.display = 'flex';
            myIncorrectQuizListContainer.style.flexWrap = 'wrap';
            examListContainer.style.display = 'none';
            myQuizListContainer.style.display = 'none';
        });

        // 더보기 기능 개선
        function loadMoreQuizzes(containerId, btnId) {
            const container = document.getElementById(containerId);
            const quizItems = container.querySelectorAll('.quiz-item.hidden');
            for (let i = 0; i < 6 && i < quizItems.length; i++) {
                quizItems[i].classList.remove('hidden');
            }
            if (container.querySelectorAll('.quiz-item.hidden').length === 0) {
                document.getElementById(btnId).style.display = 'none';
            }
        }

        // 초기 더보기 버튼 표시/숨김
        document.addEventListener('DOMContentLoaded', function() {
            toggleLoadMoreButton('examListContainer','loadMoreBtn1');
            toggleLoadMoreButton('myQuizListContainer','loadMoreBtn2');
            toggleLoadMoreButton('myIncorrectQuizListContainer','loadMoreBtn3');
        });

        function toggleLoadMoreButton(containerId, btnId) {
            const container = document.getElementById(containerId);
            if(!container) return;
            const totalQuizzes = container.querySelectorAll('.quiz-item').length;
            const loadMoreBtn = document.getElementById(btnId);
            if(loadMoreBtn) {
                if(totalQuizzes > 6) {
                    loadMoreBtn.style.display = 'block';
                } else {
                    loadMoreBtn.style.display = 'none';
                }
            }
        }
    </script>
</body>
</html>
