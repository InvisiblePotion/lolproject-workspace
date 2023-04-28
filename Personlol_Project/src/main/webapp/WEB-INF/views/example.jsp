<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
        <!-- jQuery 3.6.4 min CDN -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
            crossorigin="anonymous"></script>
		<style>
			html{background-color: #444; color: #fff;}
		</style>
	</head>
	<body>
		<h1>example.jsp</h1>
		<h3>이 페이지가 보인다면 일단 서버는 도는겁니다!</h3>

        <div>DB 세팅이 되었다면 example.jsp에서 data 변수를 수정 한 후 아래 버튼으로 실험해보세요!</div>
        <br>
        <input id="n1" type="text" placeholder="숫자 1"><br>
        <input id="n2" type="text" placeholder="숫자 2"><br>
        <button id="ajax_test">AJAX-DB 테스트</button>
        <div id="result">위에 적은 두 숫자를 더한 결과가 여기에 표시 되면 정상입니다!</div>
        
	</body>
    <script>
        $('#ajax_test').click(()=>{
            $.ajax({
                method: 'get',
                url: '/personlol/example/test-ajax',
                data: {'num1': $('#n1').val(), 'num2': $('#n2').val()},
                dataType: 'json'
            }).done((res)=>{
                console.log(res);
                $('#result').html(res.ex1)
            }).fail((err)=>{
                console.log(err);
                $('#result').html('무언가 잘못되었습니다 히잉... (F12로 개발자 도구 로그를 확인해주세요.)')
            })
        })
    </script>
</html>