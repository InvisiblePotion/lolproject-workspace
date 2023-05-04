<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>test-idfind</title>

  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/idfind.css">
</head>

<body>
  <div id="root" class="container mt-5">
    <div class="idfind-layout">
      <h1><img src="../resources/img/logo.png" alt="logo" class="logo-image"></h1>
      <form method="get" action="/personlol/example/idfind">
        <div class="form-group">
          <h2>아이디를 잊어버리셨나요?</h2>
          <label for="account">LOL계정</label>
          <input type="text" class="form-control" name = "account" id="account" placeholder="LOL계정 입력하세요">
        </div>
        <div class="form-group">
          <label for="usercode">인증코드</label>
          <!-- ?img추가 클릭시 모달창 인증코드 재발급 추가해야함 -->
          <input type="text" class="form-control" name = "usercode" id="usercode" placeholder="인증코드 입력하세요">
        </div>
        <button type="submit" id="idfind_button" class="btn btn-primary btn-lg btn-block">아이디 찾기</button>
        <a href="/personlol/example/test-pwfind"><span class="pwmsg">비밀번호를 잊으셨나요?</span></a>
        <div class="msg2-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/example/test-agree"><span>회원가입하기</span></a>
        </div>
      </form>
    </div>
  </div>

</body>
</html>