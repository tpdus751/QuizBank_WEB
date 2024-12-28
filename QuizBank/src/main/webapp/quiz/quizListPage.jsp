<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
   <head>
        <jsp:include page="/common/head.jsp" />
    </head>
    <style>
        .filter-bar {
            text-align: center;
            margin: 20px 0; /* 상하 간격 동일하게 설정 */
        }

        .filter-bar select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #f9f9f9;
            cursor: pointer;
        }

        .filter-bar select:focus {
            outline: none;
            border-color: #ffcc00;
            box-shadow: 0 0 5px rgba(255, 204, 0, 0.5);
        }

        header {
            margin-bottom: 30px; /* 헤더와 필터 사이 간격을 균형 있게 유지 */
        }

        .section-title {
            margin-top: 30px;
        }
    </style>
    <script>
        function applyFilter() {
            const filterValue = document.getElementById('filterSelect').value;
            location.href = '/QuizBank/quiz/quizListPage.do?page=${subject_no}:${currentPage}&filter=' + filterValue;
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
        	<!-- 필터링 바 -->
	        <div class="filter-bar">
	            <label for="filterSelect">정렬 기준:</label>
	            <select id="filterSelect" onchange="applyFilter()">
	            	<c:choose>
		            	<c:when test="${empty filter}">
			                <option value="none" selected>최신순</option>
			                <option value="views">조회수순</option>
			                <option value="low_correct">정답률 낮은순</option>
			            </c:when>
			            <c:otherwise>
			            	<option value="none" ${filter == 'latest' ? 'selected' : ''}>최신순</option>
			                <option value="views" ${filter == 'views' ? 'selected' : ''}>조회수순</option>
			                <option value="low_correct" ${filter == 'low_correct' ? 'selected' : ''}>정답률 낮은순</option>
			            </c:otherwise>
			        </c:choose>
	            </select>
	        </div>
		    <div class="container px-4 px-lg-5 mt-5">
		        <!-- 새로 추가된 문제 확인 -->
		        <h2 class="section-title mb-4">${ pageName }</h2>
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
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:1&filter=${filter}"> &laquo; 처음</a>
				    </li>
				
				    <!-- 이전 페이지 -->
				    <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${currentPage - 1}&filter=${filter}">&lsaquo; 이전</a>
				    </li>
				
				    <!-- 페이지 숫자 버튼 -->
				    <c:forEach var="page" begin="${startPage}" end="${endPage}">
					  <li class="page-item ${page == currentPage ? 'active' : ''}">
					    <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${page}&filter=${filter}">${page}</a>
					  </li>
					</c:forEach>
				
				    <!-- 다음 페이지 -->
				    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${currentPage + 1}&filter=${filter}">다음 &rsaquo;</a>
				    </li>
				
				    <!-- 맨 끝으로 이동 -->
				    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				      <a class="page-link" href="/QuizBank/quiz/quizListPage.do?page=${ subject_no }:${totalPages}&filter=${filter}">끝 &raquo;</a>
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
