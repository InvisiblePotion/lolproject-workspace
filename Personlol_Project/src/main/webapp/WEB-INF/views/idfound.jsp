<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idfound</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/idfound.css">
</head>
<body>

<div id="root" class="container mt-5">
    <div class="idfind-layout">
      <a href="/personlol/main"><h1><img src="./resources/img/loginLogo.png" alt="logo" class="logo-image"></h1></a>
      <form>
        <div class="form-group">
        	<h3>아이디찾기 성공!</h3>
        		<div class="id-msg"> 
        		<span class="id_span">당신의 아이디는 ${findid}</span>
        		</div>
        </div>
        
        <button id="idfind_button" class="btn btn-primary btn-lg btn-block" type="button">로그인 하러가기</button>
        <a href="/personlol/pwfind"><span class="pwmsg">비밀번호를 잊으셨나요?</span></a>
        <div class="msg2-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/agree"><span>회원가입하기</span></a>
        </div>
      </form>
    </div>
  </div>
  
<script>
$('#idfind_button').click(function() {
	location.href = '/personlol/logine';
})
</script>

</body>
</html>