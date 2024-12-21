<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>
    <script>
    	window.onload = function() {
    		
    		var error = '${error}'
    		if (error && error.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
    	        alert(error);
    	    }
    		
    		var error2 = '${error2}'
        		if (error2 && error2.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(error2);
        	    }
    		
    		var success = '${success}'
    		if (success && success.trim() !== '') {
    			alert(success)
    		}
    		
    		var errorAddHint = '${errorAddHint}'
        		if (errorAddHint && errorAddHint.trim() !== '') {
        			alert(errorAddHint)
        		}
    		
    		var errorAdd = '${errorAdd}'
        		if (errorAdd && error.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorAdd);
        	    }
    		
    		var errorAdd2 = '${errorAdd2}'
        		if (errorAdd2 && errorAdd2.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorAdd2);
        	    }
    		
    		var errorAdd3 = '${errorAdd3}'
        		if (errorAdd3 && errorAdd3.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorAdd3);
        	    }
    		
    		var errorRemove1 = '${errorRemove1}'
        		if (errorRemove1 && errorRemove1.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorRemove1);
        	    }
    		
    		var errorRemove2 = '${errorRemove2}'
        		if (errorRemove2 && errorRemove2.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorRemove2);
        	    }
    		
    		var errorRemove3 = '${errorRemove3}'
        		if (errorRemove3 && errorRemove3.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorRemove3);
        	    }
    		
    		var errorRemove4 = '${errorRemove4}'
        		if (errorRemove4 && errorRemove4.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
        	        alert(errorRemove4);
        	    }
    		
    		var successAddQuiz = '${successAddQuiz}'
        		if (successAddQuiz && successAddQuiz.trim() !== '') {
        			alert(successAddQuiz)
        			location.href = "/QuizBank/quiz/quizListPage.do?page=0:1";
        		}
    		
    		var pageGo = '${pageGo}'
        		if (pageGo && pageGo.trim() !== '') {
        			location.href = "/QuizBank/quiz/quizListPage.do?page=0:1";
        		}
    		
    		var successRemove = '${successRemove}'
        		if (successRemove && successRemove.trim() !== '') {
        			alert(successRemove)
        			location.href = "/QuizBank/quiz/quizListPage.do?page=0:1";
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

    </script>
<body>
	<jsp:include page="/common/header.jsp" />
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
        <!-- Section-->
        <section class="py-5">
		    <div class="container px-4 px-lg-5 mt-5">
		        <!-- 새로 추가된 문제 확인 -->
		        <h2 class="mb-4">${ pageName }</h2>
		        <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
				    <c:forEach items="${subject}" var="quizVO">    
				        <!-- 카드 -->
				        <div class="col mb-4">
				            <div class="card h-100">
				                <img class="card-img-top" src="/QuizBank${quizVO.quiz_img}" alt="...">
				                <div class="card-body p-4 text-center">
				                    <h5 class="fw-bolder">${quizVO.quiz_nm}</h5>
				                    <p class="text-muted">조회수: ${quizVO.view_cnt}</p>
                    				<p class="correct-rate text-success">정답률: ${quizVO.correct_ratio}%</p>
				                </div>
				                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
				                    <div class="text-center">
									    <a class="btn btn-outline-dark mt-auto" href="/QuizBank/quiz/quizDetailPage.do?no=${ quizVO.quiz_no }&beforePage=${ subject_no }:${currentPage}">자세히 보기</a>
									    <button class="btn btn-outline-dark mt-2" onclick="showComments('${quizVO.quiz_no}', '${ subject_no }', '${currentPage}')">답글 확인</button>
									</div>
									
									<!-- 모달 -->
									<div id="commentsModal" class="modal" style="display: none;">
									    <div class="modal-content">
									        <span class="close" onclick="closeModal()">&times;</span>
									        <div id="commentsContainer">
									            <!-- AJAX로 가져온 답글 내용이 여기 표시됨 -->
									        </div>
									    </div>
									</div>
				                </div>
				            </div>
				        </div>
				    </c:forEach>
		        </div>
		        <!-- 더 보기 버튼 -->
		        <nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				    <!-- 맨 처음으로 이동 -->
				    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:1">&laquo; 처음</a>
				    </li>
				
				    <!-- 이전 페이지 -->
				    <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${currentPage - 1}">&lsaquo; 이전</a>
				    </li>
				
				    <!-- 페이지 숫자 버튼 -->
				    <c:forEach var="page" begin="${startPage}" end="${endPage}">
					  <li class="page-item ${page == currentPage ? 'active' : ''}">
					    <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${page}">${page}</a>
					  </li>
					</c:forEach>

				
				    <!-- 다음 페이지 -->
				    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${currentPage + 1}">다음 &rsaquo;</a>
				    </li>
				
				    <!-- 맨 끝으로 이동 -->
				    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${totalPages}">끝 &raquo;</a>
				    </li>
				  </ul>
				</nav>


		         <!-- 구분선 -->
        		<hr class="my-5">
		    </div>
		</section>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>