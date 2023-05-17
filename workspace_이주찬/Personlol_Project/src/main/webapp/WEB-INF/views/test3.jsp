<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <!-- jQuery 3.6.4 min CDN -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <style>
    html {
      background-color: #444;
      color: #fff;
    }
  </style>
  <title>Insert title here</title>

<body>
  <h1>test3연결 테스트~</h1>
  <input id="u_id" type="text" placeholder="아이디 입력">
  <input id = "u_name" type="text" placeholder="이름 입력">
  <button id="send">전송</button>
  <div id = "errfail"></div>
  <h1>포워딩 되면 성공!</h1>
</body>
<script>
  $('#send').click(() => {
	    $.ajax({
	      method: 'post',
	      url: '/personlol/example/join',
	      data: {
	        "id": $("#u_id").val(),
	        "name": $("#u_name").val()
	      },
	      dataType : 'json'     
	    }).done((res)=>{ 	
	      console.log("res는~",res);
	      if(res == 1){
	    	  location.href = "/personlol/example/"  
	      }else{
	    	  $('#errfail').html("유효성검사 문제에용")
	      }
	      
	    }).fail((err)=>{
	      console.log("에러에요~")
	      $('#errfail').html("에러에용")
	    })
  })
</script>

</html>