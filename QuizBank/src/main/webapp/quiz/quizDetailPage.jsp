<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/head.jsp" />
    <!-- Font Awesome CSS 추가 (아이콘 사용을 위해) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHq6vZWzNjq+0HdJ6GZqTq+8QKQOGLqMwQsfEBFv0p6Xlm0w5dG78b3w8oc2/1H7T8BwB2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .cute-button {
    background-color: #ff6f91;
    color: white;
    border: none;
    padding: 12px 24px;
    font-size: 16px;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}
.cute-button:hover:not(.saved):not(:disabled) {
    background-color: #ff85a1;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}
.cute-button:active:not(:disabled) {
    background-color: #ff4b72;
    transform: translateY(0);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.cute-button .btn-icon {
    margin-right: 8px;
    transition: transform 0.3s ease;
}
.cute-button:hover:not(:disabled) .btn-icon {
    transform: rotate(20deg);
}
.cute-button.saved {
    background-color: #ccc;
}
.cute-button.saved:hover {
    background-color: #FFD700;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}
.cute-button.saved:hover .btn-icon {
    transform: rotate(0deg);
}

.quiz-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}
.quiz-header-result {
    text-align: center;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 8px 12px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    min-width: 150px;
}
.quiz-result {
    font-size: 14px;
    font-weight: bold;
    margin: 0;
}
.quiz-try-count {
    font-size: 14px;
    color: #fff;
    margin: 0;
    font-weight: bold;
}
.quiz-try-count .highlight {
    color: #FFD700;
    font-weight: bold;
}
.correct {
    color: #28a745;
    font-weight: bold;
}
.incorrect {
    color: #dc3545;
    font-weight: bold;
}

/* 기본 상태에서 "default-text"를 표시하고, hover 시 "hover-text"를 표시 */
.cute-button .default-text {
    display: inline-block; /* 기본 상태에서 표시 */
}
.cute-button .hover-text {
    display: none; /* 기본 상태에서 숨김 */
}
.cute-button:hover .default-text {
    display: none; /* hover 시 숨김 */
}
.cute-button:hover .hover-text {
    display: inline-block; /* hover 시 표시 */
}


/* 댓글 영역 */
.comment-section {
    margin-top: 50px;
}
.comment-section h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
}

/* 댓글 작성 영역 */
.add-comment {
    background: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
.add-comment textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    resize: vertical;
    transition: border-color 0.3s ease;
}
.add-comment textarea:focus {
    border-color: #007bff;
    outline: none;
}

/* 댓글 아이템 */
.comment-item {
    background: #f8f9fa; /* 약간의 회색 배경으로 시각적 구분 */
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.06);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.comment-item:hover {
    transform: translateY(-3px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.comment-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start; /* 텍스트 정렬 개선 */
}
.comment-header span {
    font-size: 14px;
    color: #555;
}
.comment-header b {
    font-weight: bold;
    color: #333;
}
.comment-header small {
    color: #999;
    margin-left: 8px;
}
.comment-content {
    margin-top: 10px;
    font-size: 14px;
    line-height: 1.6;
    color: #444;
    white-space: pre-wrap;
    word-wrap: break-word; /* 긴 텍스트가 넘치지 않도록 처리 */
}
.comment-actions {
    margin-top: 10px;
    display: flex; /* 버튼 정렬 */
    gap: 5px; /* 버튼 간격 추가 */
}
.comment-actions .btn {
    font-size: 12px;
    padding: 6px 12px;
    border-radius: 4px;
}

/* 답글 리스트 */
.reply-list {
    margin-top: 15px;
    border-left: 3px solid #ccc; /* 두꺼운 경계선으로 답글 강조 */
    padding-left: 15px;
}
.reply-item {
    background: #ffffff; /* 답글은 흰색 배경으로 설정 */
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 10px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.reply-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.08);
}
.reply-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}
.reply-header .reply-meta {
    font-size: 13px;
    color: #666;
    line-height: 1.4; /* 텍스트 간격 조정 */
}
.reply-header .reply-meta b {
    color: #333;
    font-weight: bold;
}
.reply-header .reply-meta small {
    color: #999;
    margin-left: 5px;
}
.reply-content {
    margin-top: 10px;
    font-size: 14px;
    line-height: 1.6;
    color: #444;
    white-space: pre-wrap;
    word-wrap: break-word;
}
.reply-actions {
    margin-top: 10px;
    display: flex;
    gap: 5px;
}
.reply-actions .btn {
    font-size: 11px;
    padding: 5px 10px;
    border-radius: 4px;
}

/* 댓글 및 답글 작성 영역 공통 */
textarea.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    resize: vertical;
    font-size: 14px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}
textarea.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    outline: none;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .comment-header,
    .reply-header {
        flex-direction: column;
        align-items: flex-start;
    }
    .comment-header span,
    .reply-header .reply-meta {
        margin-bottom: 10px;
    }
    .comment-actions,
    .reply-actions {
        flex-wrap: wrap;
    }
}

/* 댓글 수정 상태 */
.comment-item.edit-mode {
    border: 1px solid #007bff; /* 수정 중인 댓글 강조 */
    background: #eef6ff; /* 연한 파란색 배경 */
    box-shadow: 0 2px 6px rgba(0, 123, 255, 0.1);
    transition: all 0.3s ease;
}
.comment-item.edit-mode:hover {
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
}

/* 수정 텍스트박스 */
textarea.edit-comment-textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 14px;
    line-height: 1.6;
    resize: vertical;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    margin-bottom: 10px;
}
textarea.edit-comment-textarea:focus {
    border-color: #007bff;
    box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
    outline: none;
}

/* 수정 버튼 */
.comment-actions .btn-save,
.comment-actions .btn-cancel {
    font-size: 14px;
    padding: 8px 16px;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.comment-actions .btn-save {
    background-color: #28a745; /* 녹색 */
    color: white;
    border: none;
}
.comment-actions .btn-save:hover {
    background-color: #218838;
}
.comment-actions .btn-cancel {
    background-color: #6c757d; /* 회색 */
    color: white;
    border: none;
    margin-left: 10px;
}
.comment-actions .btn-cancel:hover {
    background-color: #5a6268;
}

/* 답글 수정 상태 */
.reply-item.edit-mode {
    border: 1px solid #007bff;
    background: #eef6ff;
    box-shadow: 0 2px 6px rgba(0, 123, 255, 0.1);
}
textarea.edit-reply-textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 13px;
    resize: vertical;
    margin-bottom: 8px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}
textarea.edit-reply-textarea:focus {
    border-color: #007bff;
    box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
}



    </style>
</head>
<script>
	window.onload = function() {
	    var updateQuizError = '${updateQuizError}'
	    if (updateQuizError && updateQuizError.trim() !== '') {
	        alert(updateQuizError);
	    }	
	
	    var updateChoicesError = '${updateChoicesError}'
	    if (updateChoicesError && updateChoicesError.trim() !== '') {
	        alert(updateChoicesError);
	    }
	
	    var successQuizUpdate = '${successQuizUpdate}'
	    if (successQuizUpdate && successQuizUpdate.trim() !== '') {
	        alert(successQuizUpdate);
	    }
	    
	    var saveSuccess = '${saveSuccess}'
	    if (saveSuccess && saveSuccess.trim() !== '') {
	        alert(saveSuccess);
	    }
	    
	    var saveFailed = '${saveFailed}'
	    if (saveFailed && saveFailed.trim() !== '') {
	        alert(saveFailed);
	    }
	    
	    var deleteFailed = '${deleteFailed}'
	    if (deleteFailed && deleteFailed.trim() !== '') {
	        alert(deleteFailed);
	    }
	    
	    var deleteSuccess = '${deleteSuccess}'
	    if (deleteSuccess && deleteSuccess.trim() !== '') {
	        alert(deleteSuccess);
	    }
	    
	 	// 페이지 로드 완료 후 댓글 목록 불러오기
	    loadComments();
	    
	}
	
	// 기존 form submit 이벤트 등록 대신 이 함수에서 AJAX 요청 실행
	function submitComment() {
	    const content = document.querySelector('#commentContent').value;
	    const quiz_no = document.querySelector('input[name="quiz_no"]').value;

	    if(!content.trim()) {
	        alert("댓글 내용을 입력하세요.");
	        return;
	    }

	    fetch('/QuizBank/comment/addComment.do', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify({ quiz_no: quiz_no, content: content })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if(data.success) {
	            alert(data.message);
	            loadComments(); // 댓글 목록 다시 불러오기
	            document.querySelector('#commentContent').value = '';
	        } else {
	            alert(data.message || '댓글 추가에 실패했습니다.');
	        }
	    });
	}

	function loadComments() {
	    const quiz_no = document.querySelector('input[name="quiz_no"]').value;
	    
	    fetch('/QuizBank/comment/loadCommentList.do?quiz_no=' + quiz_no)
	    .then(response => response.json())
	    .then(data => {
	        const commentListContainer = document.querySelector('.comment-list');
	        commentListContainer.innerHTML = '';

	        data.comments.forEach(comment => {
	            const commentItem = createCommentItem(comment);
	            commentListContainer.appendChild(commentItem);
	        });
	    });
	}

	function createCommentItem(comment) {
	    const div = document.createElement('div');
	    div.classList.add('comment-item');

	    // 현재 로그인된 사용자의 이메일
	    const currentUserEmail = '${loginMemberVO != null ? loginMemberVO.member_email : ""}';

	    // 댓글이 "댓글이 삭제되었습니다" 상태인지 확인
	    const isDeletedComment = comment.written === "삭제된 댓글입니다";

	    let actionsHtml = '';

	    // "답글 달기" 버튼은 댓글이 삭제된 상태가 아닌 경우에만 표시
	    if (!isDeletedComment) {
	        actionsHtml += '<button class="btn btn-sm btn-outline-secondary" onclick="showReplyForm(' + comment.comment_no + ')">답글 달기</button>';
	    }

	    // 댓글이 삭제되지 않았고 댓글 작성자와 로그인 사용자가 동일한 경우만 수정/삭제 버튼 표시
	    if (!isDeletedComment && currentUserEmail === comment.member_email) {
	        actionsHtml +=
	            '<button class="btn btn-sm btn-outline-warning" onclick="editComment(' + comment.comment_no + ')">수정</button>' +
	            '<button class="btn btn-sm btn-outline-danger" onclick="deleteComment(' + comment.comment_no + ', \'' + escapeHtml(JSON.stringify(comment.replies || [])) + '\')">삭제</button>';
	    }

	    // 댓글 HTML 작성
	    div.innerHTML =
	        '<div class="comment-header">' +
	            '<span><b>' + comment.nick_nm + '</b> <small>' + comment.reg_dt + '</small></span>' +
	        '</div>' +
	        '<div class="comment-content" id="comment-content-' + comment.comment_no + '">' + comment.written + '</div>' +
	        '<div class="comment-actions">' + actionsHtml + '</div>' +
	        '<div class="reply-form-' + comment.comment_no + '" style="display:none; margin-top:10px;">' +
	            '<textarea class="form-control" rows="2" placeholder="답글을 입력하세요..." ' + (isDeletedComment ? 'disabled' : '') + '></textarea>' +
	            '<button class="btn btn-primary btn-sm" onclick="addReply(' + comment.comment_no + ')" ' + (isDeletedComment ? 'disabled' : '') + '>등록</button>' +
	        '</div>' +
	        createReplyList(comment.replies);

	    // 디버깅용 로그
	    console.log('commentNo:', comment.comment_no);
	    console.log('replies:', JSON.stringify(comment.replies || []));

	    return div;
	}

	// HTML escape 함수 (JSON 안전성 확보용)
	function escapeHtml(str) {
	    return str
	        .replace(/&/g, '&amp;')
	        .replace(/</g, '&lt;')
	        .replace(/>/g, '&gt;')
	        .replace(/"/g, '&quot;')
	        .replace(/'/g, '&#39;')
	        .replace(/\\/g, '\\\\');
	}


	function createReplyList(replies) {
	    if (!replies || replies.length === 0) return '';
	    const currentUserEmail = '${loginMemberVO != null ? loginMemberVO.member_email : ""}';
	    let html = '<div class="reply-list">';
	    replies.forEach(function(reply) {
	        html += '<div class="reply-item">';
	        html += '<div class="reply-header d-flex justify-content-between align-items-center mb-1">';
	        html += '<div class="reply-meta">';
	        html += '<b>' + reply.nick_nm + '</b> <small>' + reply.reg_dt + '</small>';
	        html += '</div>';
	        html += '<div class="reply-actions">';
	        
	        // 답글 작성자와 로그인 사용자 동일 여부 확인
	        if (currentUserEmail === reply.member_email) {
	            html +=
	                '<button class="btn btn-sm btn-outline-warning" onclick="editReply(' + reply.comment_lay1_no + ')">수정</button>' +
	                '<button class="btn btn-sm btn-outline-danger" onclick="deleteReply(' + reply.comment_lay1_no + ')">삭제</button>';
	        }
	        
	        html += '</div></div>';
	        html += '<div class="reply-content" id="reply-content-' + reply.comment_lay1_no + '">' + reply.written + '</div>';
	        html += '</div>';
	    });
	    html += '</div>';
	    return html;
	}




	function showReplyForm(commentNo) {
	    var form = document.querySelector('.reply-form-' + commentNo);
	    if (form.style.display === "none" || form.style.display === "") {
	        form.style.display = "block";
	    } else {
	        form.style.display = "none";
	    }
	}

	function addReply(commentNo) {
	    const quiz_no = document.querySelector('input[name="quiz_no"]').value;
	    const replyForm = document.querySelector('.reply-form-' + commentNo);
	    const textarea = replyForm.querySelector('textarea');
	    const content = textarea.value.trim();

	    console.log('addReply called with:', {commentNo, quiz_no, content});
	    
	    if(content === '') {
	        alert('답글 내용을 입력하세요.');
	        return;
	    }

	    fetch('/QuizBank/comment/addReply.do', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify({ quiz_no: quiz_no, ori_comment_no: commentNo.toString(), content: content })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if(data.success) {
	            alert(data.message);
	            loadComments();
	            textarea.value = '';
	            replyForm.style.display = 'none';
	        } else {
	            alert(data.message || '답글 추가에 실패했습니다.');
	        }
	    });
	}
	
	function editComment(commentNo) {
	    const contentElement = document.getElementById('comment-content-' + commentNo);
	    const originalContent = contentElement.textContent.trim();

	    let editForm = '<textarea class="form-control edit-comment-textarea" id="edit-comment-textarea-' + commentNo + '">' + originalContent + '</textarea>';
	    editForm += '<div class="comment-actions">';
	    editForm += '<button class="btn btn-save" onclick="saveCommentEdit(' + commentNo + ')">저장</button>';
	    editForm += '<button class="btn btn-cancel" onclick="cancelCommentEdit(' + commentNo + ', \'' + escapeSingleQuotes(originalContent) + '\')">취소</button>';
	    editForm += '</div>';

	    const parent = contentElement.closest('.comment-item');
	    parent.classList.add('edit-mode'); // 수정 중임을 표시
	    contentElement.innerHTML = editForm;
	}

	function cancelCommentEdit(commentNo, originalContent) {
	    const contentElement = document.getElementById('comment-content-' + commentNo);
	    const parent = contentElement.closest('.comment-item');
	    parent.classList.remove('edit-mode'); // 수정 상태 해제
	    contentElement.textContent = originalContent; // 원래 텍스트로 복원
	}
	
	function escapeSingleQuotes(str) {
	    return str.replace(/'/g, "\\'"); // 작은 따옴표를 이스케이프 처리
	}


	function saveCommentEdit(commentNo) {
	    const textarea = document.getElementById('edit-comment-textarea-' + commentNo);
	    const updatedContent = textarea.value.trim();

	    if (!updatedContent) {
	        alert('내용을 입력하세요.');
	        return;
	    }

	    fetch('/QuizBank/comment/editComment.do', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify({ comment_no: commentNo.toString(), content: updatedContent })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            alert(data.message);
	            const contentElement = document.getElementById('comment-content-' + commentNo);
	            const parent = contentElement.closest('.comment-item');
	            parent.classList.remove('edit-mode'); // 수정 상태 해제
	            contentElement.textContent = updatedContent;
	        } else {
	            alert(data.message || '댓글 수정에 실패했습니다.');
	        }
	    });
	}


	function deleteComment(commentNo, replies) {
	    if (!confirm('정말 이 댓글을 삭제하시겠습니까?')) return;
	    

	    try {
	        // replies 문자열을 JSON으로 복원
	        const parsedReplies = JSON.parse(replies);

	        const payload = {
	            comment_no: commentNo.toString(),
	            replies: parsedReplies
	        };
	        
	        console.log('deleteComment payload:', { commentNo, replies });

	        fetch('/QuizBank/comment/deleteComment.do', {
	            method: 'POST',
	            headers: { 'Content-Type': 'application/json' },
	            body: JSON.stringify(payload)
	        })
	        .then(response => response.json())
	        .then(data => {
	        	
	            if (data.success) {
	                alert(data.message);
	                loadComments();
	            } else {
	                alert(data.message || '댓글 삭제에 실패했습니다.');
	            }
	        })
	        .catch(error => {
	            console.error('Error during deleteComment:', error);
	        });
	    } catch (e) {
	        console.error('Error parsing replies:', e);
	        alert('삭제 요청 중 오류가 발생했습니다.');
	    }
	}





	function editReply(replyNo) {
		console.log(replyNo)
	    const replyContentElement = document.getElementById('reply-content-' + replyNo);
	    const originalContent = replyContentElement.textContent.trim();
	    let editForm = '<textarea class="form-control mb-2" id="edit-reply-textarea-' + replyNo + '">' + originalContent + '</textarea>';
	    editForm += '<div class="reply-actions">';
	    editForm += '<button class="btn btn-sm btn-success" onclick="saveReplyEdit(' + replyNo + ')">저장</button>';
	    editForm += '<button class="btn btn-sm btn-secondary" onclick="cancelReplyEdit(' + replyNo + ', \'' + escapeSingleQuotes(originalContent) + '\')">취소</button>';
	    editForm += '</div>';
	    replyContentElement.innerHTML = editForm;
	    const parent = replyContentElement.closest('.reply-item');
	    parent.classList.add('edit-mode'); // 수정 중 상태 표시
	}

	function saveReplyEdit(replyNo) {
	    const textarea = document.getElementById('edit-reply-textarea-' + replyNo);
	    const updatedContent = textarea.value.trim();

	    if (!updatedContent) {
	        alert('내용을 입력하세요.');
	        return;
	    }

	    fetch('/QuizBank/comment/editReply.do', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify({ comment_lay1_no: replyNo.toString(), content: updatedContent })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            alert(data.message);
	            const replyContentElement = document.getElementById('reply-content-' + replyNo);
	            const parent = replyContentElement.closest('.reply-item');
	            parent.classList.remove('edit-mode'); // 수정 상태 해제
	            replyContentElement.textContent = updatedContent; // 수정된 내용 반영
	        } else {
	            alert(data.message || '답글 수정에 실패했습니다.');
	        }
	    });
	}

	function cancelReplyEdit(replyNo, originalContent) {
	    const replyContentElement = document.getElementById('reply-content-' + replyNo);
	    const parent = replyContentElement.closest('.reply-item');
	    parent.classList.remove('edit-mode'); // 수정 상태 해제
	    replyContentElement.textContent = originalContent; // 원래 내용 복원
	}

	function deleteReply(replyNo) {
	    if (!confirm('정말 해당 답글을 삭제하시겠습니까?')) return;

	    fetch('/QuizBank/comment/deleteReply.do', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify({ comment_lay1_no: replyNo.toString() })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            alert(data.message);
	            loadComments(); // 댓글과 답글 목록 다시 로드
	        } else {
	            alert(data.message || '답글 삭제에 실패했습니다.');
	        }
	    });
	}


</script>
<body>
    <jsp:include page="/common/header.jsp" />
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">문제은행</h1>
                <p class="lead fw-normal text-white-50 mb-0">IT개발 지식 공부해서 시험 봐요!!</p>
            </div>
        </div>
    </header>
    <section>
        <div class="quiz-container">
            <!-- 상단 헤더 -->
            <div class="quiz-header d-flex justify-content-between align-items-center">
    		<!-- 왼쪽 제목 및 메타 정보 -->
			    <div>
			        <h1>${quizVO.quiz_nm}</h1>
			        <div class="meta">
			            작성자: <b>${memberVO.nick_nm}</b> | 등록일: ${quizVO.reg_dt}
			        </div>
			    </div>
			
			    <!-- 오른쪽 시험 결과 정보 -->
			    <c:if test="${not empty memberQuizVO}">
			        <div class="quiz-header-result">
			            <p class="quiz-result">
			                <i>내 시험 결과 : </i>
			                <span class="<c:if test='${memberQuizVO.is_correct eq "O"}'>correct</c:if><c:if test='${memberQuizVO.is_correct eq "X"}'>incorrect</c:if>">
			                    <c:if test="${memberQuizVO.is_correct eq 'O'}"><i>맞힘</i></c:if>
			                    <c:if test="${memberQuizVO.is_correct eq 'X'}"><i>틀림</i></c:if>
			                </span>
			            </p><br>
			            <p class="quiz-try-count">
			                <i>내가 푼 횟수 : </i><span class="highlight"><i>${memberQuizVO.quiz_try_cnt}</i></span>
			            </p>
			        </div>
			    </c:if>
			    <c:if test="${empty memberQuizVO}">
			        <div class="quiz-header-result">
			            <p><i>아직 이 문제를 풀지 않았습니다.</i></p>
			        </div>
			    </c:if>
			</div>
            
            <!-- 과목 이미지 추가 -->
            <div class="subject-image mb-4">
                <img src="/QuizBank${quizVO.quiz_img}" class="img-fluid rounded" alt="${quizVO.quiz_nm}" />
            </div>
            
            <c:if test="${not empty loginMemberVO}">
            <!-- 시험 리스트에 담기 버튼 추가 -->
            <div class="mb-4">
                <form action="/QuizBank/quiz/workQuizToMyExamList.do" method="POST" class="d-flex justify-content-center">
                    <input type="hidden" name="quiz_no" value="${quizVO.quiz_no}" />
                    <c:if test="${not empty subject and not empty page}">
                    	<input type="hidden" name="beforePage" value="${subject}:${page}" />
                    </c:if>
                    <c:if test="${not empty beforePage}"><input type="hidden" name="beforePage" value="${subject}:${page}" /></c:if>
                    <button type="submit" class="cute-button <c:if test="${not empty saveQuizToListVO}">saved</c:if>" 
                        <c:if test="${not empty saveQuizToListVO}">
                            title="이미 시험 리스트에 담았습니다"
                        </c:if>>
                        <i class="fas fa-plus btn-icon"></i>
                        <c:choose>
                            <c:when test="${empty saveQuizToListVO}">
                                <b>시험 리스트에 담기</b>
                            </c:when>
                            <c:otherwise>
                                <span class="default-text"><b>이미 담겼습니다</b></span>
                                <span class="hover-text"><b>담기 취소</b></span>
                            </c:otherwise>
                        </c:choose>
                    </button>
                </form>
            </div>
            </c:if>

            <!-- 문제 내용 -->
            <div class="quiz-body">
                <div class="quiz-section">
                    <h5><pre>${quizVO.content}</pre></h5>
                    <c:choose>
                        <c:when test="${quizVO.quiz_type eq '단답식'}">
                            <!-- 단답식일 경우 별도의 처리 -->
                        </c:when>
                        <c:otherwise>
                            <div class="choice">1. ${multipleChoiceVO.choice_1}</div>
                            <div class="choice">2. ${multipleChoiceVO.choice_2}</div>
                            <div class="choice">3. ${multipleChoiceVO.choice_3}</div>
                            <div class="choice">4. ${multipleChoiceVO.choice_4}</div>
                            <div class="choice">5. ${multipleChoiceVO.choice_5}</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="quiz-section">
                    <h5>정답</h5>
                    <!-- "정답 보기" 버튼 클릭 시 보이도록 -->
                    <button class="accordion-button btn btn-secondary mb-2" onclick="toggleVisibility('answer')">정답 보기</button>
                    <div class="answer" style="display: none;">
                        <p>${quizVO.answer}</p>
                    </div>
                </div>
                <div class="quiz-section">
                    <h5>해설</h5>
                    <!-- "해설 보기" 버튼 클릭 시 보이도록 -->
                    <button class="accordion-button btn btn-secondary mb-2" onclick="toggleVisibility('explanation')">해설 보기</button>
                    <div class="explanation" style="display: none;">
                        <p>${quizVO.explanation}</p>
                    </div>
                </div>
                <div class="quiz-section">
                    <h5>정답 비율:</h5>
                    <p>${quizVO.correct_ratio}%</p>
                </div>
                <div class="quiz-section">
                    <h5>조회수:</h5>
                    <p>${quizVO.view_cnt}</p>
                </div>
                <!-- 하단 버튼들 -->
                <div class="d-flex justify-content-between mt-4">
                    <!-- 이전 페이지 버튼 -->
                    <c:choose>
                        <c:when test="${not empty subject and not empty page}">
                            <a href="/QuizBank/quiz/quizListPage.do?page=${subject}:${page}" class="btn btn-secondary">이전으로</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/QuizBank/member/myPage.do?" class="btn btn-secondary">이전으로</a>
                        </c:otherwise>
                    </c:choose>
                    <!-- 답글 달기 드롭다운 버튼 -->
				    <div class="dropdown">
				        <a class="btn btn-primary dropdown-toggle" id="navbarDropdownAddQuiz" href="#" role="button"
				           data-bs-toggle="dropdown" aria-expanded="false">
				            답글 달기
				        </a>
				        <ul class="dropdown-menu" aria-labelledby="navbarDropdownAddQuiz">
				            <li>
				                <form action="/QuizBank/quiz/QuizAddPage.do" method="POST">
				                    <input type="hidden" name="quiz_no" value="${quizVO.quiz_no}" />
				                    <input type="hidden" name="type" value="short" />
				                    <button type="submit" class="dropdown-item">단답식</button>
				                </form>
				            </li>
				            <li>
				                <form action="/QuizBank/quiz/QuizAddPage.do" method="POST">
				                    <input type="hidden" name="quiz_no" value="${quizVO.quiz_no}" />
				                    <input type="hidden" name="type" value="multiple" />
				                    <button type="submit" class="dropdown-item">객관식</button>
				                </form>
				            </li>
				        </ul>
				    </div>
                    <c:choose>
                        <c:when test="${loginMemberVO.member_email eq quizVO.member_email}">
                            <div>
                                <!-- 수정 버튼 (권한 체크 추가 가능) -->
                                <c:url var="updateUrl" value="/quiz/quizUpdatePage.do">
                                    <c:param name="quiz_no" value="${quizVO.quiz_no}" />
                                    <c:if test="${not empty subject and not empty page}">
                                        <c:param name="beforePage" value="${subject}:${page}" />
                                    </c:if>
                                </c:url>
                                
                                <a href="${updateUrl}" class="btn btn-warning me-2">수정</a>
                
                                <!-- 삭제 버튼 (권한 체크 추가 가능) -->
                                <form action="/QuizBank/quiz/quizDelete.do" method="POST" style="display:inline;">
                                    <input type="hidden" name="quiz_no" value="${quizVO.quiz_no}" />
                                    <input type="hidden" name="quiz_type" value="${quizVO.quiz_type}" />
                                    <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?')" class="btn btn-danger">삭제</button>
                                </form>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <br>
            <br>
            <hr>
            <!-- 댓글 작성 섹션 -->
			<div class="comment-section mt-5">
			    <h2 style="font-size: 24px; font-weight: bold; margin-bottom: 20px;">댓글</h2>
			    
			    <!-- 문제 번호 히든 필드 -->
			    <input type="hidden" name="quiz_no" value="${quizVO.quiz_no}" />
			
			    <!-- 댓글 작성 영역 (form 대신 div 사용) -->
			    <div class="add-comment mb-4" style="background: #f9f9f9; padding: 20px; border-radius: 8px;">
			        <div class="mb-3">
			            <label for="commentContent" class="form-label" style="font-weight: bold;">댓글 작성</label>
			            <textarea class="form-control" id="commentContent" name="content" rows="3" placeholder="댓글을 입력하세요..." required></textarea>
			        </div>
			        <!-- type="button"으로 변경하고, click 시 JS 함수 호출 -->
			        <button type="button" class="btn btn-primary" onclick="submitComment()">등록</button>
			    </div>
			
			    <!-- 댓글 목록이 표시될 영역 -->
			    <div class="comment-list"></div>
			</div>
        </div>
    </section>
    <jsp:include page="/common/footer.jsp" />
</body>
</html>
<script>
	function toggleVisibility(section) {
	    var element = document.querySelector('.' + section);
	    if (element.style.display === "none" || element.style.display === "") {
	        element.style.display = "block";
	    } else {
	        element.style.display = "none";
	    }
	}
</script>
