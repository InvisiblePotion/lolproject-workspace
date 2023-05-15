<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ranking</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/rank.css">

</head>
<body>
	<!-- 여기까지가 헤더!!!!!!!!!! -->
	<div id="generic">
		<div class="area">
			<nav class="bener-container">
				<div class="bener">
					<a href="/personlol/main" class="imgfile"><img
						src="../resources/img/logotesting.png"></a>
					<div class="search-bar">
						<input type="text">
						<button type="button">go!</button>
					</div>
					<div class="menu">
						<a href="/personlol/champion/champlist" class="m-col">챔피언분석</a>
						<a href="/personlol/summoner/rank" class="m-col">랭킹</a> 
						<a href=" " class="m-col">듀오찾기</a> <a href=" " class="m-col">사용자분석</a>
						<a href="/personlol/logine" class="m-col login">로그인</a>
					</div>
				</div>
			</nav>
		</div>
	</div>

	<!-- 헤더 다음부분 -->
	<div class="container text-center">
		<div class="row">
			<div class="col">
				<div class="btn-toolbar justify-content-between" role="toolbar"
					aria-label="Toolbar with button groups">
					<div class="btn-group" role="group" aria-label="First group">
						<button type="button" class="btn btn-outline-secondary">챌린져</button>
						<button type="button" class="btn btn-outline-secondary">그랜드마스터</button>
						<button type="button" class="btn btn-outline-secondary">마스터</button>
						
					</div>
					<div class="input-group">
						<div class="input-group-text" id="btnGroupAddon2">@</div>
						<input type="text" class="form-control"
							placeholder="Input group example"
							aria-label="Input group example"
							aria-describedby="btnGroupAddon2">
					</div>
				</div>
			</div>


		</div>
		<div class="row">
			<div class="col">
				<div id="main">
					<div id="img"></div>
					<div id="table_list">
						<table class="table table-hover" id="head_table">
							<thead>
								<tr height="25" align="center">
									<td width="100">소환사</td>
									<td width="100">티어</td>
									<td width="100">LP</td>
									<td width="100">승리</td>
									<td width="100">패배</td>
								</tr>
							</thead>
						</table>
						<div id="info"></div>
					</div>
				</div>
			</div>

		</div>

	</div class="list-container">

	<script>
  
  	$.ajax({
  		method: 'get',
  		data:{
  			tier:'CHALLENGER'
  		},
  		url:'/personlol/example/chlist',
  	}).done(res => {
  		console.log(res)
  		let rList = ''
			$.each(res, function (i, reply) {
				rList += '<table class="table table-hover" id="info_table">' +
					'<tr height="25" >' +
					'<td width="100px" >' + reply.summonername + '</td>' +
					'<td width="100px" >' + reply.tier +'</td>'+
					'<td width="100px" >' + reply.leaguepoints +'</td>'+
					'<td width="100px" >' + reply.wins +'</td>'+
					'<td width="100px" >' + reply.losses +'</td></tr>'+
					'</table>'
			})
			$('#info').html(rList);
  		
  	}).fail(err => {
  		console.log(res)
  	})
  </script>
  
  

</body>
</html>