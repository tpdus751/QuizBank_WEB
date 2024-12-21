<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
   <jsp:include page="/common/head.jsp" />
</head>
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

    <section>
        <div class="container">
            <form action="/QuizBank/quiz/addQuizProcess.do" method="post">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th colspan="2" class="text-center">문제 작성</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 작성자 입력 (수정 불가) -->
                        <tr>
                            <td class="align-middle"><label for="author" class="form-label">작성자</label></td>
                            <td>
                                <input type="text" class="form-control" id="author" name="author" value="${loginMemberVO.nick_nm}" readonly style="background-color: #f1f1f1; color: #6c757d;">
                                <small class="form-text text-muted">작성자는 수정할 수 없습니다.</small>
                            </td>
                        </tr>
                        
                        <!-- 과목 선택 부분 -->
						<tr>
						    <td class="align-middle"><label for="subject" class="form-label">종류</label></td>
						    <td>
						        <select class="form-control" name="subject_nm" required>
						            <option value="" disabled selected>종류를 선택하세요</option>
						            <option value="1">자바</option>
						            <option value="2">운영체제</option>
						            <option value="3">파이썬</option>
						            <option value="4">빅데이터</option>
						            <option value="5">정보통신개론</option>
						            <option value="6">프로그래밍언어실습</option>
						            <option value="7">스크립트언어실습</option>
						            <option value="8">IT용어</option>
						        </select>
						        <small class="form-text text-muted">어떤 종류에 대한 문제인지 선택하세요.</small>
						    </td>
						</tr>

                        <!-- 문제 제목 입력 -->
						<tr>
						    <td class="align-middle"><label for="quizTitle" class="form-label">문제 제목</label></td>
						    <td>
						        <div class="input-group">
						            <!-- :RE 반복 추가 -->
						            <c:if test="${not empty beforeReplyQuiz}">
						                <!-- 히든 인풋 전송 -->
    									<input type="hidden" name="beforeQuiz_no" value="${beforeReplyQuiz.quiz_no}">
    									<input type="hidden" name="beforeGroup_no" value="${beforeReplyQuiz.group_no}">
    									<input type="hidden" name="beforeGroup_layer" value="${beforeReplyQuiz.group_layer}">
    									<input type="hidden" id="reCount" name="reCount" value="${beforeReplyQuiz.group_layer + 1}">
						                <div class="input-group-prepend">
						                    <span class="input-group-text" style="background-color: #f1f1f1; color: #6c757d;">
						                        <c:forEach var="i" begin="1" end="${beforeReplyQuiz.group_layer + 1}">
						                            RE: 
						                        </c:forEach>
						                    </span>
						                </div>
						            </c:if>
						            <!-- 제목 입력 -->
						            <input type="text" class="form-control" id="quizTitle" name="quizTitle" placeholder="문제 제목을 입력하세요" oninput="updateTitleWithRe()" required>
						        </div>
						        <small class="form-text text-muted">:RE는 수정할 수 없습니다. 제목을 작성해주세요.</small>
						        <input type="hidden" id="finalTitle" name="finalTitle" />
						    </td>
						</tr>



                        <!-- 문제 타입 (단답식, 객관식) -->
                        <tr>
                            <td class="align-middle"><label for="type" class="form-label">문제 타입</label></td>
                            <td><input type="text" class="form-control" id="type" name="type" value="${type}" readonly></td>
                        </tr>

                        <!-- 문제 내용 입력 -->
                        <tr>
                            <td class="align-middle"><label for="quizContent" class="form-label">문제 내용</label></td>
                            <td><textarea class="form-control" id="quizContent" name="quizContent" rows="4" placeholder="문제 내용을 입력하세요" required></textarea></td>
                        </tr>

                        <!-- 객관식일 경우 보기 항목들 -->
                        <c:if test="${type == '객관식'}">
                            <tr>
                                <td class="align-middle"><label class="form-label">보기 (1번부터 5번까지 작성)</label></td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control mb-2" id="choice_1" name="choice_1" placeholder="1번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice_2" name="choice_2" placeholder="2번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice_3" name="choice_3" placeholder="3번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice_4" name="choice_4" placeholder="4번 보기" required>
                                        <input type="text" class="form-control mb-2" id="choice_5" name="choice_5" placeholder="5번 보기" required>
                                    </div>
                                </td>
                            </tr>
                        </c:if>

                        <!-- 정답 입력 -->
                        <tr>
                            <td class="align-middle"><label for="answer" class="form-label">정답</label></td>
                            <td>
                            <c:choose>
                        	<c:when test="${type == '단답식'}">
                                <input type="text" class="form-control" id="answer" name="answer" placeholder="정답을 입력하세요" required>
                            </c:when>
                            <c:otherwise>  	  
                            	<select class="form-control" name="answer" required>
						            <option value="" disabled selected>정답을 선택하세요</option>
						            <option value="1">1번</option>
						            <option value="2">2번</option>
						            <option value="3">3번</option>
						            <option value="4">4번</option>
						            <option value="5">5번</option>
						        </select>
						        <small class="form-text text-muted">
                                    <c:if test="${type == '객관식'}">번호를 선택하세요 (예: 1번)</c:if>
                                </small>
						   </c:otherwise>
						</c:choose>
							</td>
                            </td>
                        </tr>

                        <!-- 해설 입력 -->
                        <tr>
                            <td class="align-middle"><label for="explanation" class="form-label">해설</label></td>
                            <td><textarea class="form-control" id="explanation" name="explanation" rows="4" placeholder="문제에 대한 해설을 작성하세요"></textarea></td>
                        </tr>
                        
                        <c:if test="${type == '단답식'}">
                        <!-- 정답 힌트 -->
                        <tr>
						    <td class="align-middle"><label for="hint" class="form-label">정답 힌트</label></td>
						    <td>
						        <table class="table table-bordered">
						            <thead class="table-light">
						                <tr>
						                    <th>구분자</th>
						                    <th>언어 (ctrl키를 누른 상태로 다중선택)</th>
						                    <th>영어 구분</th>
						                </tr>
						            </thead>
						            <tbody>
						                <tr>
						                    <td>
						                        <select class="form-control" id="separator" name="separator" required>
						                            <option value="" disabled selected>구분자를 선택하세요</option>
						                            <option value="공백">공백</option>
						                            <option value=",">,</option>
						                            <option value="-">-</option>
						                            <option value="_">_</option>
						                            <option value="없음">구분자 없음</option>
						                        </select>
						                    </td>
						                    <td>
						                        <div class="multi-select-container">
						                            <select class="form-control" id="language" name="language" multiple onchange="updateLanguageValue()">
						                                <option value="korean">한국어</option>
						                                <option value="english">영어</option>
						                                <option value="code">코드</option>
						                                <option value="number">숫자</option>
						                            </select>
						                            <div id="selectedLanguages" class="selected-items mt-2">
						                                선택된 언어: <span id="selectedLanguagesText">없음</span>
						                            </div>
						                        </div>
						                        <input type="hidden" id="languageValues" name="languageValues" />
						                    </td>
						                    <td>
						                        <select class="form-control" id="englishType" name="englishType" disabled>
						                            <option value="" disabled selected>영어 구분을 선택하세요</option>
						                            <option value="대문자">대문자</option>
						                            <option value="소문자">소문자</option>
						                            <option value="대소문자">대소문자</option>
						                        </select>
						                    </td>
						                </tr>
						            </tbody>
						        </table>
						        <div class="hint-text">
						            <small class="form-text text-muted">
						                정답 힌트를 설정하세요. <strong>언어에 영어</strong>가 <strong>포함</strong>될 경우만 <strong>영어 구분</strong> 옵션이 활성화됩니다.
						            </small>
						        </div>
						    </td>
						</tr>
						</c:if>
                    </tbody>
                </table>
                
    			<!-- 히든 인풋으로 멤버 이메일 전송 -->
    			<input type="hidden" name="member_email" value="${loginMemberVO.member_email}">

                <!-- 제출 버튼 -->
				<div class="d-flex justify-content-center mt-4 mb-5">
				    <button type="submit" class="btn btn-success btn-lg">문제 등록</button>
				</div>
            </form>
        </div>
    </section>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
<style>
    .hint-text {
        text-align: right;
        margin-top: 10px;
    }

    .form-text {
        font-size: 12px;
        color: #6c757d;
    }

    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }

    .form-control {
        font-size: 14px;
    }

    .table-light {
        background-color: #f8f9fa;
    }

    .selected-items {
        font-size: 14px;
        color: #333;
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
</style>

<script>
    // 언어가 영어일 때만 영어 구분 드롭다운 활성화
    function toggleEnglishOptions(language) {
        const englishTypeDropdown = document.getElementById("englishType");
        if (language.includes("english")) {
            englishTypeDropdown.disabled = false;
        } else {
            englishTypeDropdown.disabled = true;
            englishTypeDropdown.value = ""; // 선택 초기화
        }
    }

    // 다중 선택된 언어 값을 업데이트
    function updateLanguageValue() {
        const languageSelect = document.getElementById("language");
        const selectedValues = Array.from(languageSelect.selectedOptions).map(option => option.value);
        const selectedText = Array.from(languageSelect.selectedOptions).map(option => option.text);
        
        document.getElementById("languageValues").value = selectedValues.join(',');
        document.getElementById("selectedLanguagesText").textContent = selectedText.length > 0 ? selectedText.join(', ') : '없음';

        toggleEnglishOptions(selectedValues); // 영어 구분 활성화 조건 확인
    }
    
    function updateTitleWithRe() {
        // "RE:" 개수 가져오기
        const reCount = parseInt(document.getElementById("reCount")?.value || 0);

        // 제목 입력 값 가져오기
        const titleInput = document.getElementById("quizTitle").value.trim();
        const finalTitleInput = document.getElementById("finalTitle");

        // "RE:" 문자열 생성
        let rePrefix = "";
        for (let i = 0; i < reCount; i++) {
            rePrefix += "RE: ";
        }

        // 최종 제목 업데이트
        const updatedTitle = rePrefix + titleInput;
        finalTitleInput.value = updatedTitle; // hidden 필드에 저장

        // 디버깅용
        console.log("Updated Title:", updatedTitle);
    }




</script>