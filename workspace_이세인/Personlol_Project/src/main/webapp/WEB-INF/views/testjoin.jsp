<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test-join</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">

</head>
<body>
	<div id="root" class="container">
    <div class="join-layout">
      <h1><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" class="logo-image"></h1>
      <form>
        <div class="form-group">
          <h2>기본 정보 입력</h2>
          <label for="usernid">아이디</label>
          <input type="text" class="form-control" id="userid" placeholder="아이디를 입력하세요">
          <span id="id_err" class="err"></span>
        </div>
        <div class="form-group">
          <label for="userpw">비밀번호</label>
          <input type="password" class="form-control" id="userpw" placeholder="비밀번호를 입력하세요">
          <span id="pw_err" class="err"></span>
        </div>
        <div class="form-group">
          <label for="userpw_chk">비밀번호 확인</label>
          <input type="password" class="form-control" id="userpw_chk" placeholder="비밀번호를 입력하세요">
          <span id="pwchk_err" class="err"></span>
        </div>

        <div class="form-group">
          <label for="lol-account">lol 계정</label>
          <input type="text" class="form-control" id="lol-account" placeholder="LoL계정을 입력하세요">
          <span id="lol_err" class="err"></span>
        </div>

        <div id="agree_div">
          <button id="btnNotAgree">취소</button>
          <button id="btnAgree" disabled="disabled" type="button">가입하기</button>
        </div>


      </form>
    </div>
  </div>
  
 
</body>
<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>

<script>
	$('#btnAgree').click(function() {
		id=$('#userid').val()
		pw=$('#userpw').val()
		pwchk=$('#userpw_chk').val()
		account = $('#lol-account').val()
		$.ajax({
			method: 'post',
			url:'/personlol/user/ajax-join',
			data:{'userid':id,'userpw':pw,'account':account}
			/* dataType:'json' */
		}).done(res => {
			console.log(res.code)
			if(res.code == 1){
				alert("join 성공")
				location.href = '/personlol/user/test-success'
			}else if(res.code ==0) {
				$('#id_err').html('중복된 아이디입니다.').css('color', 'red');
			}
			 
		}).fail(err => {
			console.log()
		})
	})
</script>

</html>