<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/success.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
 
</head>
<body>
	<div id="root" class="container">
    <div class="success-layout">
      <h1><img src="../resources/img/logo.png" alt="logo" class="logo-image"></h1>
      <form>
        <div class="form-group">
          <div class="cong-div">

          </div>
        </div>
        <div class="form-group">
          <div class="code-div">
          </div>
        </div>
        <button id="logine_button" class="btn btn-primary btn-lg btn-block" type="button">로그인하러 가기</button>
        <div class="msg-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/example/test-agree"><span>회원가입하기</span></a>
        </div>
      </form>
    </div>
  </div>  
  <script>
   $('#logine_button').click(function() {
	   location.href = '/personlol/example/test-logine'
})
  </script>
</body>
</html>