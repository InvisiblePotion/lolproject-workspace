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
      <div>
        <button id="logout">로그아웃</button>
        <button id="newcode">인증코드 변경</button>
        <button id="deletemember">회원탈퇴</button>
      </div>

    </div>
  </div>
  <script>
    $('#logine_button').click(function () {
      location.href = '/personlol/user/test-logine'
    })
  </script>

  <script>
    $('#logout').click(function () {
      location.href = '/personlol/user/logout';
      console.log("로그아웃");
      alert("로그아웃");
    })
  </script>
  <script>
    $('#newcode').click(function () {
      console.log('<%= session.getAttribute("id") %>');
      id = {
        'userid': '<%= session.getAttribute("id") %>',
        'usercode': '0'
      };

      $.ajax({
        method: 'put',
        url: '/personlol/example/newcode',

        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(id)

      }).done(res => {
        console.log("성공!");
        console.log(res);
      }).fail(err => {
        console.log(err);
      })
    })
  </script>
  <script>
    $('#deletemember').click(function(){
      console.log("삭제눌렀어용");
      id = {
        'userid': '<%= session.getAttribute("id") %>'
      };
      $.ajax({
        method: 'delete',
        url: '/personlol/user/deletemember',
        contentType: 'application/json',
        data: JSON.stringify(id)
      }).done(res=>{
        console.log(res);
        alert("회원 탈퇴가 완료되었습니다.");
//        location.href = "/personlol/example/logout";
      }).fail(err=>{
        console.log(err);
        alert("회원 탈퇴 중 오류가 발생하였습니다.");
      })
    })
  </script>
</body>

</html>