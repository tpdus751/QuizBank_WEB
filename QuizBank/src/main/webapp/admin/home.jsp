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
            width: 80%;
            text-align: center;
        }
        .admin-section h2 {
            margin-bottom: 15px;
        }
        .admin-buttons {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        .admin-buttons a {
            display: inline-block;
            padding: 15px 25px;
            font-size: 16px;
            color: white;
            background: linear-gradient(135deg, #4CAF50, #81C784);
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        .admin-buttons a:hover {
            background: linear-gradient(135deg, #388E3C, #66BB6A);
            transform: translateY(-3px);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
        }
        .stats-section {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .stats-box {
            flex: 1;
            min-width: 300px;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .stats-box h3 {
            margin-bottom: 10px;
            font-size: 18px;
            color: #4CAF50;
        }
        .stats-box p {
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container mt-5">
        <div class="admin-section">
            <h2>������ ��ú���</h2>
            <p>�����ڷμ� �ý����� �����ϱ� ���� �ֿ� ����� �����ϼ���.</p>
            <div class="admin-buttons">
                <a href="/QuizBank/admin/memberManagementPage.do?page=1">ȸ�� ����</a>
                <a href="/QuizBank/admin/subjectManagementPage.do">���� ���� ����</a>
                <a href="/QuizBank/admin/quizManagementPage.do?page=1">���� ����</a>
            </div>
        </div>

        <div class="admin-section">
            <h2>�ý��� ����</h2>
            <p>���� �ý����� �ֿ� ���� ������ Ȯ���ϼ���.</p>
            <ul>
                <li>��ϵ� ȸ�� �� : <b>${totalMemberCnt}</b> ��</li>
                <li>��ϵ� ���� �� : <b>${totalQuizCnt}</b> ��</li>
                <li>��ϵ� ���� ���� �� : <b>${totalSubjectCnt}</b> ��</li>
            </ul>
        </div>

        <div class="admin-section">
            <h2>ȸ�� ���</h2>
            <div class="stats-section">
                <div class="stats-box">
                    <h3>�Ϻ� �ű� ȸ�� ��</h3>
                    <p>${todayNewMemberCnt} ��</p>
                </div>
                <div class="stats-box">
                    <h3>���� �ű� ȸ�� ��</h3>
                    <p>${monthNewMemberCnt} ��</p>
                </div>
                <div class="stats-box">
                    <h3>���� �ű� ȸ�� ��</h3>
                    <p>${yearNewMemberCnt} ��</p>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
