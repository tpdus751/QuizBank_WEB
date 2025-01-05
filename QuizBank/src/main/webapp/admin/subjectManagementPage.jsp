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
        .action-buttons .delete {
            background-color: #FF8A65;
        }
        .action-buttons .delete:hover {
            background-color: #FF7043;
        }
        .register-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        .register-button:hover {
            background-color: #45A049;
        }
    </style>
<script>
	window.onload = function() {
		var removeSubjectSuccess = '${removeSubjectSuccess}'
			if (removeSubjectSuccess && removeSubjectSuccess.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(removeSubjectSuccess);
		    }
		
		var removeSubjectFailed = '${removeSubjectFailed}'
			if (removeSubjectFailed && removeSubjectFailed.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(removeSubjectFailed);
		    }
		
		var registerSubjectSuccess = '${registerSubjectSuccess}'
			if (registerSubjectSuccess && registerSubjectSuccess.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(registerSubjectSuccess);
		    }
		
		var registerSubjectFailed = '${registerSubjectFailed}'
			if (registerSubjectFailed && registerSubjectFailed.trim() !== '') {  // error�� null, �� ���ڿ��� �ƴ� ��쿡�� alert
		        alert(registerSubjectFailed);
		    }
	}
</script>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
        <div class="admin-section">
            <h2>���� ���� ����</h2>
            <p>��ü ���� ���� ����Ʈ�� Ȯ���ϰ� ���� �۾��� �����ϼ���.</p>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>���� ��ȣ</th>
                            <th>������</th>
                            <th>�����</th>
                            <th>����</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="subject" items="${totalSubjectList}">
                            <tr>
                                <td>${subject.subject_no}</td>
                                <td>${subject.subject_nm}</td>
                                <td>${subject.reg_dt}</td>
                                <td>
                                    <div class="action-buttons">
                                        <form action="/QuizBank/admin/deleteSubject.do" method="post" style="display:inline;">
                                            <input type="hidden" name="subject_no" value="${subject.subject_no}" />
                                            <button type="submit" class="delete">����</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- ���� ��� ��ư -->
            <button class="register-button" onclick="location.href='/QuizBank/admin/registerSubjectPage.do'">���� ���</button>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
