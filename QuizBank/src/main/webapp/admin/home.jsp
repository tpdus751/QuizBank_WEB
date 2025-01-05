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
            <h2>관리자 대시보드</h2>
            <p>관리자로서 시스템을 관리하기 위한 주요 기능을 선택하세요.</p>
            <div class="admin-buttons">
                <a href="/QuizBank/admin/memberManagementPage.do?page=1">회원 관리</a>
                <a href="/QuizBank/admin/subjectManagementPage.do">문제 종류 관리</a>
                <a href="/QuizBank/admin/quizManagementPage.do?page=1">문제 관리</a>
            </div>
        </div>

        <div class="admin-section">
            <h2>시스템 상태</h2>
            <p>현재 시스템의 주요 상태 정보를 확인하세요.</p>
            <ul>
                <li>등록된 회원 수 : <b>${totalMemberCnt}</b> 명</li>
                <li>등록된 문제 수 : <b>${totalQuizCnt}</b> 개</li>
                <li>등록된 문제 종류 수 : <b>${totalSubjectCnt}</b> 개</li>
            </ul>
        </div>

        <div class="admin-section">
            <h2>회원 통계</h2>
            <div class="stats-section">
                <div class="stats-box">
                    <h3>일별 신규 회원 수</h3>
                    <p>${todayNewMemberCnt} 명</p>
                </div>
                <div class="stats-box">
                    <h3>월별 신규 회원 수</h3>
                    <p>${monthNewMemberCnt} 명</p>
                </div>
                <div class="stats-box">
                    <h3>연별 신규 회원 수</h3>
                    <p>${yearNewMemberCnt} 명</p>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
