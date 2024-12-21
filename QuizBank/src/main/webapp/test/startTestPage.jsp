<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/common/head.jsp" />
    <style>
        /* 불투명 배경을 section에만 적용 */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7); /* 어두운 불투명 */
            z-index: 999;
            opacity: 0.8;
        }

        /* 시험 설명 박스 */
        .exam-description {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: 100px auto;
            text-align: center;
            z-index: 1000;
            position: relative;
        }

        .exam-description h2 {
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #333333; /* 오렌지색 */
        }

        .exam-description p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #444;
        }

        /* 시험 유형 선택 라벨 스타일 */
        label {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        /* 버튼 스타일 - 노랑-주황 그라디언트 */
        .game-button {
            background: linear-gradient(45deg, #FFD700, #FF8C00);
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            margin-top: 20px;
            box-shadow: 0 5px 15px rgba(255, 140, 0, 0.1);
            width: 100%;
            max-width: 350px; /* 버튼 너비 조정 */
            margin: 20px auto; /* 버튼 가운데 정렬 */
        }

        .game-button:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(255, 140, 0, 0.15);
            background: linear-gradient(45deg, #FF8C00, #FFD700);
        }

        .game-button:active {
            transform: scale(1);
            background: #FF8C00;
            box-shadow: none;
        }

        /* 시험 옵션 및 버튼 간격 조정 */
        .exam-options {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* 버튼들을 수직 중앙 정렬 */
        }

        .exam-options select {
            padding: 15px;
            font-size: 16px;
            margin: 10px 0;
            border-radius: 30px;
            border: none;
            width: 100%;
            max-width: 350px;
            background-color: #FF7F50; /* 오렌지색 */
            color: white;
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        /* 나가기 버튼 스타일 수정 (연두색으로 변경) */
		.exit-button {
		    background-color: #808080; /* 연두색 */
		    color: white;
		    padding: 12px 30px; /* 세로 길이는 그대로, 가로 길이만 줄임 */
		    font-size: 16px; /* 글씨 크기 조정 */
		    border-radius: 30px;
		    width: 100%;
		    max-width: 175px; /* 가로 길이만 반으로 줄임 */
		    cursor: pointer;
		    transition: all 0.3s ease;
		    margin-top: 15px; /* 위쪽 간격 추가 */
		    margin-left: auto; /* 오른쪽 정렬 */
		    margin-right: auto; /* 왼쪽 정렬 */
		}

        .exit-button:hover {
		    background-color: #666666; /* 더 어두운 연두색 */
		}

        /* 반응형 디자인 조정 */
        @media (max-width: 576px) {
            .exam-description {
                padding: 20px;
            }

            .game-button {
                font-size: 16px;
                padding: 12px 25px;
            }

            .exit-button {
                font-size: 14px;
                padding: 8px 15px; /* 크기 줄임 */
                width: 100%;
                max-width: 250px; /* 너비 조정 */
            }
        }
        
        /* 배경 이미지 및 불투명 처리 */
		body {
		    position: relative;
		    margin: 0;
		    padding: 0;
		    background-image: url('../assets/quizbank_back.jpg');
		    background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;
		}
		
		body::before {
		    content: ""; /* 가상 요소를 생성 */
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: rgba(0, 0, 0, 0); /* 불투명 어두운 배경 */
		    z-index: -1; /* 배경을 모든 요소의 뒤로 보냄 */
		}
    </style>
</head>
<body>
    <jsp:include page="/common/header.jsp" />
    
    <!-- 불투명 배경 -->
    <div class="overlay"></div>

    <!-- 시험 설명 및 선택 화면 -->
    <div class="exam-description">
        <h2>시험 시작 안내</h2>
        <p>시험은 <b>총 20문제 랜덤</b> 형식이며, 시험 시간은 <b>최대 10분</b>으로 문제를 다 풀거나 시간이 종료되면 시험은 자동 종료됩니다. 종료 후 <u>점수</u>가 출제되고 <u>틀린 문제</u>를 확인할 수 있습니다. <br><br><i><b>그럼 여러분의 좋은 성적을 받으시길 기원하겠습니다!</b></i></p><hr>
        <form action="/QuizBank/test/startExamPage.do" method="POST">
            <div class="exam-options">
                <!-- 시험 유형 선택 -->
                <label for="exam-type">시험 유형 선택 (랜덤 20문제)</label>
                <select name="exam_type" id="exam-type">
                    <option value="all">모든 과목</option>
                    <option value="subject">과목 선택</option>
                    <option value="examList">시험 리스트에 담긴 문제</option>
                </select>

                <!-- 과목 선택 (과목 선택 시 사용) -->
                <div id="subject-selection" style="display: none; margin-top: 10px; width: 100%; max-width: 350px;">
                    <label for="subject"><b>과목 선택</b></label>
                    <select name="subject" id="subject" class="form-select">
                        <option value="1">자바</option>
                        <option value="2">운영체제</option>
                        <option value="3">파이썬</option>
                        <option value="4">빅데이터</option>
                        <option value="5">정보통신개론</option>
                        <option value="6">프로그래밍언어실습</option>
                        <option value="7">스크립트언어실습</option>
                        <option value="8">IT용어</option>
                    </select>
                </div>

                <!-- 시험 시작 버튼 -->
                <button type="submit" class="game-button">시험 시작</button>
            </div>
        </form>

        <!-- 나가기 버튼 -->
        <button class="exit-button" onclick="window.location.href='/QuizBank/home.do'"><b>나가기</b></button>
    </div>

    <jsp:include page="/common/footer.jsp" />
    
    <!-- JavaScript -->
    <script>
        document.getElementById("exam-type").addEventListener("change", function() {
            var subjectSelection = document.getElementById("subject-selection");
            if (this.value === "subject") {
                subjectSelection.style.display = "block"; // 과목 선택 드롭다운 표시
            } else {
                subjectSelection.style.display = "none"; // 과목 선택 드롭다운 숨기기
            }
        });
    </script>
</body>
</html>
