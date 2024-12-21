<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>QuizBank - HOMEPAGE</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/QuizBank/css/styles.css" rel="stylesheet" />

<script>
	//Bootstrap 스크립트 동적 로드
	var bootstrapScript = document.createElement('script');
	bootstrapScript.src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js";
	bootstrapScript.async = true;
	document.head.appendChild(bootstrapScript);
	
	bootstrapScript.onload = function() {
	    console.log('Bootstrap 로드 성공');
	};
	
	bootstrapScript.onerror = function() {
	    console.error('Bootstrap 로드 실패');
	};
</script>