<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
        <jsp:include page="/common/head.jsp" />
    </head>

    <script>
	    window.onload = function() {
	        var error = '${error}';
	        if (error && error.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
	            alert(error);
	        }
	        
	        var registSuccess = '${registSuccess}';
	        if (registSuccess && registSuccess.trim() !== '') {  // error가 null, 빈 문자열이 아닌 경우에만 alert
	            alert(registSuccess);
	        }
	    }
	</script>
<script src="/QuizBank/js/kakaoKey.js"></script>
<script>
    var bootstrapScript = document.createElement('script');
    bootstrapScript.src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js";
    bootstrapScript.async = true;
    document.head.appendChild(bootstrapScript);

    bootstrapScript.onload = function() {
        console.log('Bootstrap 로드 성공');
        
        // 드롭다운 초기화 코드 추가
        const dropdownElements = document.querySelectorAll('.dropdown-toggle');
        dropdownElements.forEach((dropdown) => {
            new bootstrap.Dropdown(dropdown);  // 드롭다운을 수동으로 초기화
        });
    };

    bootstrapScript.onerror = function() {
        console.error('Bootstrap 로드 실패');
    };

    var script = document.createElement('script');
    script.src = "https://developers.kakao.com/sdk/js/kakao.min.js";
    script.async = true;
    document.head.appendChild(script);

    script.onload = function() {
        console.log('카카오 SDK 로드 성공');
        Kakao.init(kakaoKey);
    };

    script.onerror = function() {
        console.error('카카오 SDK 로드 실패');
    };
</script>

<body>
	<jsp:include page="/common/header.jsp" />
	<!-- Bootstrap Bundle JS (여기서 Bootstrap 기능들이 로드됩니다) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<!-- 로그인 컨테이너 -->
	            <div class="login-container">
				    <h5><b>문제은행 로그인</b></h5>
				    <form action="/QuizBank/member/login.do" method="post">
				        <div class="mb-3">
				            <label for="email" class="form-label">이메일</label>
				            <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required>
				        </div>
				        <div class="mb-3">
				            <label for="password" class="form-label">비밀번호</label>
				            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
				        </div>
				        <button type="submit" class="btn btn-primary">로그인</button>
				    </form>
				    <!-- 카카오톡 로그인 버튼 -->
				    <button class="kakao-button" onclick="kakaoLogin()">
				        카카오 로그인
				    </button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
<script type="text/javascript">
function kakaoLogin() {
    Kakao.Auth.login({
        success: function(response) {
            console.log('로그인 성공:', response); // 성공 로그 추가
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                    console.log('사용자 정보 요청 성공:', response); // 사용자 정보 로그 추가
                    var userInfo = {
                        id: response.id,
                        nickname: response.properties.nickname,
                        email: response.kakao_account.email
                    };

                    // AJAX 요청으로 데이터를 전송
                    fetch('/QuizBank/member/kakaoLogin.do', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: new URLSearchParams(userInfo)
                    })
                    .then(response => {
                        console.log('Fetch 성공:', response); // Fetch 성공 로그 추가
                        return response.text();
                    })
                    .then(data => {
                        console.log('서버 응답:', data); // 서버 응답 로그 추가
                        document.open();
                        document.write(data);
                        document.close();
                    })
                    .catch(error => {
                        console.error('Fetch 에러:', error); // Fetch 에러 로그 추가
                    });
                },
                fail: function(error) {
                    console.error('사용자 정보 요청 실패:', error); // 사용자 정보 요청 실패 로그 추가
                    alert(JSON.stringify(error));
                }
            });
        },
        fail: function(error) {
            console.error('로그인 실패:', error); // 로그인 실패 로그 추가
            alert(JSON.stringify(error));
        }
    });
}
</script>
