<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test-pwfind</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/pwfind.css">
</head>
<body>

<div id="root" class="container mt-5">
    <div class="idfind-layout">
      <a href="/personlol/main"><h1><img src="./resources/img/logo.png" alt="logo" class="logo-image"></h1></a>
      <form>
        <div class="form-group">
          <h2>비밀번호를 잊어버리셨나요?</h2>
          <label for="code">인증코드</label>
          <!-- ?img추가 클릭시 모달창 인증코드 재발급 추가해야함 -->
          <input type="text" class="form-control" id="usercode" placeholder="인증코드 입력하세요">
        </div>
        <div class="form-group">
          <label for="userid">아이디</label>
          <input type="text" class="form-control" id="userid" placeholder="아이디를 입력하세요">
        </div>
        <button type = "button" id="pwfind_button" class="btn btn-primary btn-lg btn-block">비밀번호 찾기</button>
        <a href="/personlol/idfind"><span class="pwmsg">아이디를 잊으셨나요?</span></a>
        <div class="msg2-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/agree"><span>회원가입하기</span></a>
        </div>
      </form>
    </div>
  </div>
  

</body>
<script>
  $('#pwfind_button').click(function(){
	  
    $.ajax({
      method:'get',
      url: '/personlol/user/pwfind',
      data:{
        'user_code': $('#usercode').val(),
        'user_id': $('#userid').val()
      }
    }).done(res => {
      console.log(res);
      if(res == 1){
    	  alert("비번찾기 성공")
    	  location.href = '/personlol/changepw';
      }else{
    	  alert("비번찾기 실패")
      }

    }).fail(err=>{
      console.log(err);
    })
  })
</script>
</html>