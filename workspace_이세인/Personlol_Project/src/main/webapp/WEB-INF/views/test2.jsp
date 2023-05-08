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
</head>

<body>
  <h1>과연 뜰까요~?</h1>
  <div>
    <h2>해위~? 모델값 찍을겡</h2>
    ${test_int}
  </div>
  <br>
  <br>
  <input id="num1" type="text" placeholder="1번">
  <input id="num2" type="text" placeholder="2번">
  <input id="num3" type="text" placeholder="3번">
  <button id="button_sum">클릭해라</button>
  <div id="result"></div>
</body>
<script>		  
		  $('#button_sum').click(()=>{
            $.ajax({
                method: 'get',
                url: '/personlol/example/sum_num',
                data: {'num1': $('#num1').val(), 'num2': $('#num2').val(), 'num3': $("#num3").val()},
                dataType: 'json'
            }).done((res)=>{
                console.log(1,res);
                console.log(2,res.sum)
                $('#result').html(res.sum)
            }).fail((err)=>{
                console.log(err);
                $('#result').html('무언가 잘못되었습니다... (F12로 개발자 도구 로그를 확인해주세요.)')
            })
        })
</script>

</html>