<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>changepw</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="./resources/css/changepw.css">
  
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
  

</head>

<body>
  <div id="root">
    <div class="changepw-layout">
      <h1><img src="./resources/img/logo.png" alt="logo" class="logo-image"></h1>
      <form>
        <div class="form-group">
          <h2>새로운 비밀번호 입력하세요</h2>
          <label for="code">인증코드</label>
          <!-- ?img추가 클릭시 모달창 인증코드 재발급 추가해야함 -->
          <input type="text" class="form-control" id="usercode" placeholder="인증코드 입력하세요">
        </div>

        <div class="form-group">
          <label for="userpw">새 비밀번호</label>
          <input type="password" class="form-control" id="userpw" placeholder="새 비밀번호를 입력하세요">
        </div>

        <div class="form-group">
          <label for="checkpw">새 비밀번호 확인</label>
          <input type="password" class="form-control" id="checkpw" placeholder="새 비밀번호를 입력하세요">
        </div>
        <button type="button" id="newpw_button" class="btn btn-primary btn-lg btn-block">비밀번호 재설정</button>

        <div class="msg-div">
          <span>PersonLoL이 처음이세요?</span> &nbsp; &nbsp;
          <a href="/personlol/example/test-agree"><span>회원가입하기</span></a>
        </div>

      </form>
    </div>
  </div>
  <script>
    $('#newpw_button').click(function () {
    	console.log($('#usercode').val());
    	console.log($('#userpw').val());
  //  	
  		changepwdata={
  	          'user_code': $('#usercode').val(),
  	          'user_pw': $('#userpw').val()
  	        };
    	
      $.ajax({
    	method: 'put',
        url: '/personlol/user/changepw',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(changepwdata)

      }).done(res => {
    	
    	if(res = 1){
    		console.log("성공");
    		alert("변경 성공")
    		location.href = '/personlol/logine'
    	}else{
    		console.log("실패");
    		alert("다시 보세용")
    	}
        
      }).fail(err => {
        console.log(err);
      })
    })
  </script>
  
</body>

</html>