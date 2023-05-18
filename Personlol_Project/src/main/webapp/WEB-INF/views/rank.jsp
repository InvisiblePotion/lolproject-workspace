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

						<button type="button" id = "get_ch" class="btn btn-outline-secondary">챌린져</button>
						<button type="button" id = "get_gm"class="btn btn-outline-secondary">그랜드마스터</button>
						<button type="button" id = "get_m"class="btn btn-outline-secondary">마스터</button>
						<button type="button" onclick="getranking(this)" id = "get_ch" class="btn btn-outline-secondary" value="ch">챌린져</button>
						<button type="button" onclick="getranking(this)" id = "get_gm" class="btn btn-outline-secondary" value="gm">그랜드마스터</button>
						<button type="button" onclick="getranking(this)" id = "get_m" class="btn btn-outline-secondary" value="master">마스터</button>

						
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
	<div id = "pagenum">

	</div id = "pagenum">

	<script>
  	$.ajax({
  		method: 'get',
  		url:'/personlol/rank/challenger',
  	}).done(res => {
  		console.log(res)
  		let cList = ''
			$.each(res, function (i, ch) {
				cList += '<table class="table table-hover" id="info_table">' +
					'<tr height="25" >' +
					'<td width="100px" >' + ch.summonerName + '</td>' +
					'<td width="100px" >' + ch.tier +'</td>'+
					'<td width="100px" >' + ch.leaguePoints + '</td>'+
					'<td width="100px" >' + ch.wins +'</td>'+
					'<td width="100px" >' + ch.losses +'</td>'+
					'<td width="100px" >' + ch.veteran +'</td>'+
					'<td width="100px" >' + ch.inactive +'</td>'+
					'<td width="100px" >' + ch.freshBlood +'</td>'+		
					'<td width="100px" >' + ch.hotStreak +'</td></tr>'+
					'</table>'
			})
			$('#info').html(cList);
  		
  	}).fail(err => {
  		console.log(res)
  	})
  </script>
  <script>
  $('#get_ch').click(function(){
		$.ajax({
	  		method: 'get',
	  		url:'/personlol/rank/challenger',
	  	}).done(res => {
	  		console.log(res)
	  		let cList = ''
				$.each(res, function (i, ch) {
					cList += '<table class="table table-hover" id="info_table">' +
						'<tr height="25" >' +
						'<td width="100px" >' + ch.summonerName + '</td>' +
						'<td width="100px" >' + ch.tier +'</td>'+
						'<td width="100px" >' + ch.leaguePoints + '</td>'+
						'<td width="100px" >' + ch.wins +'</td>'+
						'<td width="100px" >' + ch.losses +'</td>'+
						'<td width="100px" >' + ch.veteran +'</td>'+
						'<td width="100px" >' + ch.inactive +'</td>'+
						'<td width="100px" >' + ch.freshBlood +'</td>'+		
						'<td width="100px" >' + ch.hotStreak +'</td></tr>'+
						'</table>'
				})
				$('#info').html(cList);
	  		
	  	}).fail(err => {
	  		console.log(res)
	  	})
	})
  </script>
  <script>
  $('#get_gm').click(function(){
		$.ajax({
	  		method: 'get',
	  		url:'/personlol/rank/grandmaster',
	  	}).done(res => {
	  		console.log(res)
	  		let gList = ''
				$.each(res, function (i, gm) {
					gList += '<table class="table table-hover" id="info_table">' +
						'<tr height="25" >' +
						'<td width="100px" >' + gm.summonerName + '</td>' +
						'<td width="100px" >' + gm.tier +'</td>'+
						'<td width="100px" >' + gm.leaguePoints + '</td>'+
						'<td width="100px" >' + gm.wins +'</td>'+
						'<td width="100px" >' + gm.losses +'</td>'+
						'<td width="100px" >' + gm.veteran +'</td>'+
						'<td width="100px" >' + gm.inactive +'</td>'+
						'<td width="100px" >' + gm.freshBlood +'</td>'+		
						'<td width="100px" >' + gm.hotStreak +'</td></tr>'+
						'</table>'
				})
				$('#info').html(gList);
	  		
	  	}).fail(err => {
	  		console.log(res)
	  	})
	})
  </script>
  
  <script>
  $('#get_m').click(function(){
		$.ajax({
	  		method: 'get',
	  		url:'/personlol/rank/master',
	  	}).done(res => {
	  		console.log(res)
	  		let mList = ''
				$.each(res, function (i, m) {
					mList += '<table class="table table-hover" id="info_table">' +
						'<tr height="25" >' +
						'<td width="100px" >' + m.summonerName + '</td>' +
						'<td width="100px" >' + m.tier +'</td>'+
						'<td width="100px" >' + m.leaguePoints + '</td>'+
						'<td width="100px" >' + m.wins +'</td>'+
						'<td width="100px" >' + m.losses +'</td>'+
						'<td width="100px" >' + m.veteran +'</td>'+
						'<td width="100px" >' + m.inactive +'</td>'+
						'<td width="100px" >' + m.freshBlood +'</td>'+		
						'<td width="100px" >' + m.hotStreak +'</td></tr>'+
						'</table>'
				})
				$('#info').html(mList);
	  		
	  	}).fail(err => {
	  		console.log(res)
	  	})
	})
  
  </script>

	<script>
		//페이지 불러옴과 동시에 실행되는 함수
		getajax('lol_ch',1)
		highpage('lol_ch')

		//디폴트
		let cur_rank = 'ch'

		//버튼 클릭시 실행되는 함수(챌,그마,마 정보 ,page정보)가지고 감
		function getranking(info){
			cur_rank = info.value
			highpage('lol_'+cur_rank)
			getajax('lol_'+info.value, 1)
		}

		//페이지 번호 눌렀을때 info = page
		function pageclick(info){
			//페이지 눌렀을때 정보가져오기
			getajax('lol_'+cur_rank, info)
		}
		
		
		//페이지 전체 가져오기(몇 페이지 나와야하는지 받아오는 함수)
		function highpage(rank){
			$.ajax({
				method:'get',
				url:'/personlol/rank/highpage',
				data:{'rank':rank}
			}).done(res=>{
				console.log(res)
				let pList = ''
				for (let i=0; i<res; i++){
					pList+='<a href ="#" onclick = "pageclick('+(i+1)+')">'+(i+1)+'</a>'
				}
				$('#pagenum').html(pList);

			}).fail(err=>{
				console.log(err)
			})
		}

		//비동기실행(랭킹정보 가져오는 함수)
		function getajax(rank, page){
			$.ajax({
				method: 'get',
				url:'/personlol/rank/ranking',
				data:{'rank':rank, 'page':page},
			}).done(res => {
				console.log(res)
				
				let cList = ''
				$.each(res, function (i, r) {
					cList += '<table class="table table-hover" id="info_table">' +
						'<tr height="25" >' +
						'<td width="200px" >' + r.ranking + '</td>' +
						'<td width="200px" >' + r.summonerName + '</td>' +
						'<td width="200px" >' + r.tier +'</td>'+
						'<td width="200px" >' + r.leaguePoints + '</td>'+
						'<td width="200px" >' + r.wins +'</td>'+
						'<td width="200px" >' + r.losses +'</td>'+
						'<td width="200px" >' + r.veteran +'</td>'+
						'<td width="200px" >' + r.inactive +'</td>'+
						'<td width="200px" >' + r.freshBlood +'</td>'+		
						'<td width="200px" >' + r.hotStreak +'</td></tr>'+
						'</table>'
				})
				$('#info').html(cList);
				
			}).fail(err => {
				console.log(res)
			})
		}
			
  </script>


</body>
</html>