<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/head.jsp" />
</head>
<style>
    .modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;
    }
    .modal-content {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        width: 50%;
        max-height: 80%;
        overflow-y: auto;
    }
    .close {
        float: right;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }
    
    /* 사이드바 스타일 */
    /* 사이드바 스타일 */
    .sidebar {
        position: fixed;
        top: 75%;
        right: 50px; /* 위치 조정 */
        transform: translateY(-50%);
        width: 100px;
        background-color: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 10px 0;
    }
    .sidebar button {
        background: linear-gradient(135deg, #ff7eb3, #ff758c);
        border: none;
        border-radius: 50%;
        padding: 15px;
        font-size: 24px;
        color: white;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .sidebar button:hover {
        background: linear-gradient(135deg, #ff5252, #ff7b7b);
        transform: scale(1.1);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }
    .sidebar button:active {
        transform: scale(0.95);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    .sidebar span {
        font-size: 12px;
        color: #555;
        margin-top: 5px;
        text-align: center;
        font-weight: bold;
    }
    /* 사이드바 애니메이션 */
    @keyframes buttonBounce {
        0%, 100% {
            transform: scale(1);
        }
        50% {
            transform: scale(1.1);
        }
    }
    .sidebar button.bounce {
        animation: buttonBounce 0.6s ease-in-out;
    }
</style>
<script>
	window.onload = function() {
		
		var incorrectAccess = '${incorrectAccess}'
		if (incorrectAccess && incorrectAccess.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
	        alert(incorrectAccess);
	    }
		
		var memberCreditUpdateError = '${memberCreditUpdateError}'
			if (memberCreditUpdateError && memberCreditUpdateError.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
		        alert(memberCreditUpdateError);
		    }
		
		var lackOfQuiz = '${lackOfQuiz}'
			if (lackOfQuiz && lackOfQuiz.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
		        alert(lackOfQuiz);
		    }
	}
	
	
	function showComments(quizNo, subjectNo, currentPage) {
	    // 모달 표시
	    const modal = document.getElementById("commentsModal");
	    modal.style.display = "flex";
	
	    // AJAX 요청
	    fetch(`/QuizBank/quiz/getReplyQuizs.do?quiz_no=` + quizNo)
	        .then(response => response.json())
	        .then(data => {
	            const container = document.getElementById("commentsContainer");
	            container.innerHTML = ""; // 기존 내용 초기화
	
	            if (data.length === 0) {
	                container.innerHTML += "<p>답글이 없습니다.</p>"; // 답글이 없을 경우
	                return;
	            }
	
	            // 테이블 생성
	            let tableHTML = `
	                <table class="table table-striped">
	                    <thead>
	                        <tr>
	                            <th>작성자</th>
	                            <th>제목</th>
	                            <th>작성일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	            `;
	
	            // 데이터 추가
	            data.forEach(reply => {
	                tableHTML += 
	                    '<tr>' +
	                        '<td>' + reply.nick_nm + '</td>' +
	                        '<td><a href="/QuizBank/quiz/quizDetailPage.do?no=' + reply.quiz_no + '&beforePage=' + subjectNo + ':' + currentPage + '" target="_blank">' + reply.quiz_nm + '</a></td>' +
	                        '<td>' + reply.reg_dt + '</td>' +
	                    '</tr>'
	                ;
	            });
	
	            tableHTML += `
	                    </tbody>
	                </table>
	            `;
	
	            container.innerHTML += tableHTML; // 최종적으로 HTML 추가
	        })
	        .catch(error => console.error("Error fetching comments:", error));
	}
	
	
	
	function closeModal() {
	    const modal = document.getElementById("commentsModal");
	    modal.style.display = "none";
	}
	
	function redirectToMapEvent() {
	    window.location.href = "/QuizBank/event/mapEventPage.do";
	}
	
	// 버튼 클릭 시 애니메이션 효과
	function redirectToMapEvent() {
	    const button = document.querySelector(".sidebar button");
	    button.classList.add("bounce"); // 애니메이션 추가
	    setTimeout(() => {
	        button.classList.remove("bounce"); // 애니메이션 제거
	        window.location.href = "/QuizBank/event/mapEventPage.do";
	    }, 600); // 0.6초 후 페이지 이동
	}
</script>
<body>
    <jsp:include page="/common/header.jsp" />
    
    <c:if test="${not empty loginMemberVO}">
    <!-- 사이드바 -->
    <div class="sidebar">
        <!-- 지도 버튼 -->
        <button onclick="redirectToMapEvent()">
            🗺️
        </button>
        <span>지도 이벤트</span>
    </div>
    </c:if>
    
    <!-- Header-->
    <header class="bg-dark py-5" style="background-image: url('/QuizBank/assets/quizbank_back.jpg'); background-size: cover; background-position: 50% 30.1%; background-repeat: no-repeat; background-attachment: fixed;">
	    <div class="container px-4 px-lg-5 my-5">
	        <div class="text-center text-white">
	            <h1 class="display-4 fw-bolder">&emsp;</h1>
	            <p class="lead fw-normal text-white-50 mb-0">&emsp;</p>
	            <h1 class="display-4 fw-bolder">&emsp;</h1>
	        </div>
	    </div>
	</header>

    <!-- Section: 새로 추가된 문제 -->
    <section class="py-1">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="mb-4">새로 추가된 문제예요!</h2>
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                <c:forEach var="quizVO" items="${fourLatestQuizs}">
                    <div class="col mb-4">
                        <div class="card h-100">
                            <img class="card-img-top" src="/QuizBank${quizVO.quiz_img}" alt="퀴즈 이미지">
                            <div class="card-body p-4 text-center">
                                <h5 class="fw-bolder">${quizVO.quiz_nm}</h5>
                                <p class="text-muted">조회수: ${quizVO.view_cnt}</p>
                                <p class="correct-rate text-success">정답률: ${quizVO.correct_ratio}%</p>
                            </div>
                            <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}">자세히 보기</a>
                                    <button class="btn btn-outline-dark mt-2" onclick="showComments('${quizVO.quiz_no}', '0', '1')">답글 확인</button>
                                </div>
                                <!-- 모달 -->
								<div id="commentsModal" class="modal" style="display: none;">
								    <div class="modal-content">
								        <span class="close" onclick="closeModal()">&times;</span>
								        <div id="commentsContainer">
								            <!-- AJAX로 가져온 답글 내용이 여기 표시됩니다 -->
								        </div>
								    </div>
								</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="text-center mt-4">
                <a class="btn btn-secondary" href="/QuizBank/quiz/quizListPage.do?filter=new">더보기</a>
            </div>
            <hr class="my-5">
        </div>
    </section>

    <!-- Section: 인기 있는 문제 -->
    <section class="py-1">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="mb-4">인기 있는 문제를 모아봤어요~</h2>
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                <c:forEach var="quizVO" items="${fourHotQuizs}">
                    <div class="col mb-4">
                        <div class="card h-100">
                            <img class="card-img-top" src="/QuizBank${quizVO.quiz_img}" alt="퀴즈 이미지">
                            <div class="card-body p-4 text-center">
                                <h5 class="fw-bolder">${quizVO.quiz_nm}</h5>
                                <p class="text-muted">조회수: ${quizVO.view_cnt}</p>
                                <p class="correct-rate text-success">정답률: ${quizVO.correct_ratio}%</p>
                            </div>
                            <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}">자세히 보기</a>
                                    <button class="btn btn-outline-dark mt-2" onclick="showComments('${quizVO.quiz_no}', '0', '1')">답글 확인</button>
                                </div>
                                <!-- 모달 -->
								<div id="commentsModal" class="modal" style="display: none;">
								    <div class="modal-content">
								        <span class="close" onclick="closeModal()">&times;</span>
								        <div id="commentsContainer">
								            <!-- AJAX로 가져온 답글 내용이 여기 표시됩니다 -->
								        </div>
								    </div>
								</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="text-center mt-4">
                <a class="btn btn-secondary" href="/QuizBank/quiz/quizListPage.do?filter=hot">더보기</a>
            </div>
            <hr class="my-5">
        </div>
    </section>

    <!-- Section: 정답률 낮은 문제 -->
    <section class="py-1">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="mb-4">정답률 낮은 문제예요!</h2>
            <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                <c:forEach var="quizVO" items="${fourHardQuizs}">
                    <div class="col mb-4">
                        <div class="card h-100">
                            <img class="card-img-top" src="/QuizBank${quizVO.quiz_img}" alt="퀴즈 이미지">
                            <div class="card-body p-4 text-center">
                                <h5 class="fw-bolder">${quizVO.quiz_nm}</h5>
                                <p class="text-muted">조회수: ${quizVO.view_cnt}</p>
                                <p class="correct-rate text-danger">정답률: ${quizVO.correct_ratio}%</p>
                            </div>
                            <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="/QuizBank/quiz/quizDetailPage.do?no=${quizVO.quiz_no}">자세히 보기</a>
                                    <button class="btn btn-outline-dark mt-2" onclick="showComments('${quizVO.quiz_no}', '0', '1')">답글 확인</button>
                                </div>
                                <!-- 모달 -->
								<div id="commentsModal" class="modal" style="display: none;">
								    <div class="modal-content">
								        <span class="close" onclick="closeModal()">&times;</span>
								        <div id="commentsContainer">
								            <!-- AJAX로 가져온 답글 내용이 여기 표시됩니다 -->
								        </div>
								    </div>
								</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="text-center mt-4">
                <a class="btn btn-secondary" href="/QuizBank/quiz/quizListPage.do?filter=hard">더보기</a>
            </div>
            <hr class="my-5">
        </div>
    </section>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
