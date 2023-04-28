<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test logine</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/logine.css">


</head>
<body>
<div id="root" class="container mt-5">
    <div class="logine-layout">
    
      <h1><img src="../resources/img/logo.png" alt="logo" class="logo-image"></h1>
      <form >
        <div class="form-group">
          <label for="username">아이디</label>
          <input type="text" class="form-control" id="username" placeholder="아이디를 입력하세요">
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="msg1-div">
          <a href="/personlol/example/test-idfind"><span class="idmsg">아이디를 잊으셨나요?</span></a>
          <a href="/personlol/example/test-pwfind"><span class="pwmsg">비밀번호를 잊으셨나요?</span></a>
        </div>
        <button id="logine_button" class="btn btn-primary btn-lg btn-block">로그인</button>

        <div class="msg2-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/example/test-agree"><span>회원가입하기</span></a>
          
        </div>
      </form>
    </div>
  </div>

<script src="${pageContext.request.contextPath}/resources/js/logine.js"></script>
</body>
</html>