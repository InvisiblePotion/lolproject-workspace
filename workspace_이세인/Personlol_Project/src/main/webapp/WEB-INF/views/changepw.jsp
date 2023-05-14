<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changepw</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/changepw.css">

</head>
<body>
<div id="root">
    <div class="changepw-layout">
      <h1><img src="../resources/img/logo.png" alt="logo" class="logo-image"></h1>
      <form>
        <div class="form-group">
          <h2>새로운 비밀번호 입력하세요</h2>
          <label for="code">인증코드</label>
          <!-- ?img추가 클릭시 모달창 인증코드 재발급 추가해야함 -->
          <input type="text" class="form-control" id="code" placeholder="인증코드 입력하세요">
        </div>

        <div class="form-group">
          <label for="newpw">새 비밀번호</label>
          <input type="password" class="form-control" id="newpw" placeholder="새 비밀번호를 입력하세요">
        </div>

        <div class="form-group">
          <label for="newpw-chk">새 비밀번호 확인</label>
          <input type="password" class="form-control" id="newpw-chk" placeholder="새 비밀번호를 입력하세요">
        </div>
        <button id="newpw_button" class="btn btn-primary btn-lg btn-block">비밀번호 재설정</button>

        <div class="msg-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/example/test-agree"><span>회원가입하기</span></a>
        </div>

      </form>
    </div>
  </div>

</body>
</html>