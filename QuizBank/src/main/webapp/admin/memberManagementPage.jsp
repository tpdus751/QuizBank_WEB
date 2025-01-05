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
        .action-buttons .ban {
            background-color: #FF5252;
        }
        .action-buttons .ban:hover {
            background-color: #FF1744;
        }
        .action-buttons .delete {
            background-color: #FF8A65;
        }
        .action-buttons .delete:hover {
            background-color: #FF7043;
        }
        .action-buttons .unban {
            background-color: #B0BEC5;
            color: black;
        }
        .action-buttons .unban:hover {
            background-color: #90A4AE;
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
	window.onload = function() {
		var banError = '${banError}'
			if (banError && banError.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(banError);
		    }
		
		var banSuccess = '${banSuccess}'
			if (banSuccess && banSuccess.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(banSuccess);
		    }
		
		var unBanList = '${unBanList}'
			if (unBanList && unBanList.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(unBanList);
		    }
		
		var unBanSuccess = '${unBanSuccess}'
			if (unBanSuccess && unBanSuccess.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(unBanSuccess);
		    }
		
		var deleteMemberSuccess = '${deleteMemberSuccess}'
			if (deleteMemberSuccess && deleteMemberSuccess.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(deleteMemberSuccess);
		    }
	}
</script>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
        <div class="admin-section">
            <h2>ȸ�� ����</h2>
            <p>��ü ȸ�� ����Ʈ�� Ȯ���ϰ� ���� �۾��� �����ϼ���.</p>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>�̸���</th>
                            <th>�̸�</th>
                            <th>�г���</th>
                            <th>�޴��� ��ȣ</th>
                            <th>���� ũ����</th>
                            <th>�����</th>
                            <th>���� �Ⱓ</th>
                            <th>����</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="member" items="${pageMemberList}">
                            <tr>
                                <td>${member.member_email}</td>
                                <td>${member.member_nm}</td>
                                <td>${member.nick_nm}</td>
                                <td>${member.phone1}-${member.phone2}-${member.phone3}</td>
                                <td>${member.credit}</td>
                                <td>${member.reg_dt}</td>
                                <td>${member.prohibit}</td>
                                <td>
                                    <div class="action-buttons">
                                        <c:choose>
                                            <c:when test="${not empty member.prohibit}">
                                                <form action="/QuizBank/admin/unbanMember.do" method="post" style="display:inline;">
                                                    <input type="hidden" name="member_email" value="${member.member_email}" />
                                                    <input type="hidden" name="page" value="${page}" />
                                                    <button type="submit" class="unban">���</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <form action="/QuizBank/admin/banMember.do" method="post" style="display:inline;">
                                                    <input type="hidden" name="member_email" value="${member.member_email}" />
                                                    <input type="hidden" name="page" value="${page}" />
                                                    <button type="submit" class="ban">����</button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                        <form action="/QuizBank/admin/deleteMember.do" method="post" style="display:inline;">
                                            <input type="hidden" name="member_email" value="${member.member_email}" />
                                            <input type="hidden" name="page" value="${page}" />
                                            <button type="submit" class="delete">����</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- ����¡ ��ư -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${page == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/memberManagementPage.do?page=1">&laquo; ó��</a>
                    </li>
                    <li class="page-item ${page <= 1 ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/memberManagementPage.do?page=${page - 1}">&lsaquo; ����</a>
                    </li>
                    <c:forEach var="pg" begin="1" end="${endPage}">
                        <li class="page-item ${pg == page ? 'active' : ''}">
                            <a class="page-link" href="/QuizBank/admin/memberManagementPage.do?page=${pg}">${pg}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${page == endPage ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/memberManagementPage.do?page=${page + 1}">���� &rsaquo;</a>
                    </li>
                    <li class="page-item ${page == endPage ? 'disabled' : ''}">
                        <a class="page-link" href="/QuizBank/admin/memberManagementPage.do?page=${totalPages}">�� &raquo;</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
