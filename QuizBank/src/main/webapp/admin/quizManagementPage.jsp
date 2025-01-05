<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/head.jsp" />
    <style>
        body {
            background-image: url('/QuizBank/assets/quizbank_back.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
            text-align: center;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .admin-section {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            width: 90%;
            text-align: center;
        }
        .admin-section h2 {
            margin-bottom: 15px;
        }
        .table-container {
            overflow-x: auto;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        table th {
            background-color: #4CAF50;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .action-buttons button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            transition: all 0.3s ease;
        }
        .action-buttons .view {
            background-color: #4CAF50;
        }
        .action-buttons .view:hover {
            background-color: #45A049;
        }
        .action-buttons .delete {
            background-color: #FF8A65;
        }
        .action-buttons .delete:hover {
            background-color: #FF7043;
        }
        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }
        .pagination li {
            margin: 0 5px;
        }
        .pagination a {
            display: block;
            padding: 8px 12px;
            color: #4CAF50;
            text-decoration: none;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .pagination a:hover {
            background-color: #4CAF50;
            color: white;
        }
        .pagination .active a {
            background-color: #4CAF50;
            color: white;
            pointer-events: none;
        }
        .pagination .disabled a {
            color: #ccc;
            pointer-events: none;
        }
    </style>
    <script>
    	window.onload() {
    		var failedDelete = '${failedDelete}'
    		    if (failedDelete && failedDelete.trim() !== '') {
    		        alert(failedDelete);
    		    }	
    		
    		var successDelete = '${successDelete}'
    		    if (successDelete && successDelete.trim() !== '') {
    		        alert(successDelete);
    		    }	
    	}
    </script>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
        <div class="admin-section">
            <h2>문제 관리</h2>
            <p>전체 문제 리스트를 확인하고 관리 작업을 수행하세요.</p>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>작성자 아이디</th>
                            <th>작성자 닉네임</th>
                            <th>글 번호</th>
                            <th>부모글 번호</th>
                            <th>그룹 번호</th>
                            <th>계층</th>
                            <th>과목명</th>
                            <th>문제 제목</th>
                            <th>문제 유형</th>
                            <th>등록일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="quiz" items="${pageQuizList}">
                            <tr>
                                <td>${quiz.member_email}</td>
                                <td>${quiz.nick_nm}</td>
                                <td>${quiz.quiz_no}</td>
                                <td>${quiz.ori_code_no}</td>
                                <td>${quiz.group_no}</td>
                                <td>${quiz.group_layer}</td>
                                <td>${quiz.subject_nm}</td>
                                <td>${quiz.quiz_nm}</td>
                                <td>${quiz.quiz_type}</td>
                                <td>${quiz.reg_dt}</td>
                                <td>
                                    <div class="action-buttons">
                                        <form action="/QuizBank/quiz/quizDetailPage.do?adminPage=${page}" method="post" style="display:inline;">
                                            <input type="hidden" name="no" value="${quiz.quiz_no}" />
                                            <input type="hidden" name="page" value="${page}" />
                                            <button type="submit" class="view">조회</button>
                                        </form>
                                        <form action="/QuizBank/admin/deleteQuizByAdmin.do" method="post" style="display:inline;">
                                            <input type="hidden" name="no" value="${quiz.quiz_no}" />
                                            <input type="hidden" name="page" value="${page}" />
                                            <button type="submit" class="delete">삭제</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 페이징 버튼 -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${page == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/quizManagementPage.do?page=1">&laquo; 처음</a>
                    </li>
                    <li class="page-item ${page <= 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/quizManagementPage.do?page=${page - 1}">&lsaquo; 이전</a>
                    </li>
                    <c:forEach var="pg" begin="1" end="${endPage}">
                        <li class="page-item ${pg == page ? 'active' : ''}">
                            <a class="page-link" href="/QuizBank/admin/quizManagementPage.do?page=${pg}">${pg}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${page == endPage ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/quizManagementPage.do?page=${page + 1}">다음 &rsaquo;</a>
                    </li>
                    <li class="page-item ${page == endPage ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/quizManagementPage.do?page=${totalPages}">끝 &raquo;</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
