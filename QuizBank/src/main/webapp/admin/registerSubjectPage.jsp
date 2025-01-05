<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            margin-top: 50px;
        }
        .form-section {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 50%;
            text-align: center;
        }
        .form-section h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .form-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .register-button {
            background-color: #4CAF50;
            color: white;
            transition: all 0.3s ease;
        }
        .register-button:hover {
            background-color: #45A049;
        }
        .back-button {
            background-color: #B0BEC5;
            color: black;
            transition: all 0.3s ease;
        }
        .back-button:hover {
            background-color: #90A4AE;
        }
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />

    <div class="container">
        <div class="form-section">
            <h2>문제 종류 등록</h2>
            <form action="/QuizBank/admin/registerSubject.do" method="post">
                <div class="form-group">
                    <label for="subjectName">종류 이름</label>
                    <input type="text" id="subjectName" name="subject_nm" placeholder="종류 이름을 입력하세요" required />
                </div>
                <div class="form-group">
                    <label for="pageName">페이지 이름</label>
                    <input type="text" id="pageName" name="page_nm" placeholder="페이지 이름을 입력하세요" required />
                </div>
                <div class="form-actions">
                    <button type="button" class="back-button" onclick="location.href='/QuizBank/admin/subjectManagementPage.do'">이전</button>
                    <button type="submit" class="register-button">등록</button>
                </div>
            </form>
        </div>
    </div>
    
    <br>
    <br>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
