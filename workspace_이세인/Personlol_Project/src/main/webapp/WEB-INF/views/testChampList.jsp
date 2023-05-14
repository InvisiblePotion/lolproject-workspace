<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>champ list</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/champlist.css">

<style type="text/css">
.ul-group {
	padding: 0px;
}
</style>
</head>
<body>
	<div id="generic">
		<div class="area">
			<nav class="bener-container">
				<div class="bener">
					<a href="/personlol/example/test-main" class="imgfile"><img
						src="../resources/img/logotesting.png"></a>
					<div class="search-bar">
						<input type="text">
						<button type="button">go!</button>
					</div>
					<div class="menu">
						<a href="/personlol/example/test-champlist" class="m-col">챔피언분석</a>
						<a href="/personlol/example/test-rank" class="m-col">랭킹</a> <a
							href=" " class="m-col">듀오찾기</a> <a href=" " class="m-col">사용자분석</a>
						<a href="/personlol/example/test-logine" class="m-col login">로그인</a>
					</div>
				</div>
			</nav>
		</div>
	</div>

	<!-- 헤더 다음부분 -->
	<div class="container text-center">
		<div class="row">
			<div class = 'col'>
				1
			</div>
		</div>
		<div class="row">
			<div class="col" id="col1">
				<div id="btn-group1" class="btn-group" role="group"
					aria-label="Basic outlined example">
					<button type="button" class="btn btn-outline-primary">탑</button>
					<button type="button" class="btn btn-outline-primary">정글</button>
					<button type="button" class="btn btn-outline-primary">미드</button>
					<button type="button" class="btn btn-outline-primary">바텀</button>
					<button type="button" class="btn btn-outline-primary">서폿</button>
				</div>
			</div>
		</div class="row">

		<div class="row">

			<div class="col">
				<div class="search-container">
					<input type="text" class="search-champ">
				</div>
				<div class="btn-group" role="group"
					aria-label="Basic outlined example">
					<button type="button" class="btn btn-light">
						<img src="" alt="all" />
					</button>
					<button type="button" class="btn btn-light">
						<img src="" alt="Top" />
					</button>
					<button type="button" class="btn btn-light">
						<img src="" alt="Jug" />
					</button>
					<button type="button" class="btn btn-light">
						<img src="" alt="Mid" />
					</button>
					<button type="button" class="btn btn-light">
						<img src="" alt="Bot" />
					</button>
					<button type="button" class="btn btn-light">
						<img src="" alt="Sup" />
					</button>
					<button type="button" class="btn btn-light">
						<img src="" alt="lote" />
					</button>
				</div>
				<nav class="img-container">
					<ul class="ul-group">

					</ul>
				</nav>
			</div>

			<div class="col">2</div>
		</div class="row">


		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	</div class="container text-center">

	<script>
	$.ajax({
		method:'get',
		data:{champ:'champion_name'},
		url:'/personlol/example/champName',
	}).done(res => {
		console.log(res)
		
		/*아이콘 띄우기  */
		let icon_img = ''
		$.each(res, function (i, img) {
			icon_img += '<img class="icon_img" width="70" height="70" src="../resources/dd/img/champion/'+img.champion_name +'.png" '
			+ 'alt="이미지">'
		})
		$('.ul-group').html(icon_img);
	}).fail(err => {
		console.log(err)
	})
</script>
</body>
</html>