<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>champ list</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
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
					<a href="/personlol/main" class="imgfile"><img src="../resources/img/logotesting.png"></a>
					<div class="search-bar">
						<input type="text">
						<button type="button">go!</button>
					</div>
					<div class="menu">
						<a href="/personlol/champion/champlist" class="m-col">챔피언분석</a>
						<a href="/personlol/summoner/rank" class="m-col">랭킹</a> 
						<a href=" " class="m-col">듀오찾기</a>
						<a href=" " class="m-col">사용자분석</a>
						<a href="/personlol/logine" class="m-col login">로그인</a>
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
					<input type="button" class="btn btn-outline-primary" value="TOP">
					<input type="button" class="btn btn-outline-primary" value="JUNGLE">
					<input type="button" class="btn btn-outline-primary" value="MIDDLE">
					<input type="button" class="btn btn-outline-primary" value="BOTTOM">
					<input type="button" class="btn btn-outline-primary" value="UTILITY">
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
					<button type="button" class="btn btn-light" id="all_img">
						<img src="" alt="all" />
					</button>
					<button type="button" class="btn btn-light" id="top_img">
						<img src="" alt="Top" />
					</button>
					<button type="button" class="btn btn-light" id="jug_img">
						<img src="" alt="Jug" />
					</button>
					<button type="button" class="btn btn-light" id="mid_img">
						<img src="" alt="Mid" />
					</button>
					<button type="button" class="btn btn-light" id="bot_img">
						<img src="" alt="Bot" />
					</button>
					<button type="button" class="btn btn-light" id="util_img">
						<img src="" alt="Sup" />
					</button>
					<button type="button" class="btn btn-light" id="lote_img">
						<img src="" alt="lote" />
					</button>
				</div>
				<nav class="img-container">
					<ul class="ul-group">

					</ul>
				</nav>
			</div>

			<div class="col">
				<div id="table_list">
				<table class="table " id="head_table">
					<thead>
						<tr align="center">
							<th width="100px" style="font-size: 12px">번호</th>
							<th width="100px" style="font-size: 12px">챔피언</th>
							<th width="100px" style="font-size: 12px" id="table_tier">티어</th>
							<th width="100px" style="font-size: 12px" id="table_win_rate">승률</th>
							<th width="100px" style="font-size: 12px" id="table_pick_rate">픽률</th>
							<th width="100px" style="font-size: 12px" id="table_ban_rate">밴률</th>
							<th width="100px" style="font-size: 12px" id="table_counter">카운터</th>
						</tr>
					</thead>
					
				</table>
				<table id="list_table1" class="table "></table>
			
				</div>
			
			</div>
		</div class="row">


		
	</div class="container text-center">

	<script>
	/*아이콘 부분*/
	$.ajax({
		method:'get',
		data:{champ_icon:'champ_icon'},
		url:'/personlol/champimg',
	}).done(res => {

		/*아이콘 띄우기  */
		let icon_img = ''
		$.each(res, function (i, img) {
			icon_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
		})
		$('.ul-group').html(icon_img);
	}).fail(err => {
		console.log(err)
	})//
	
	
	
	$('#all_img').click(function () {
		$.ajax({
			method:'get',
			data:{champ_icon:'champ_icon'},
			url:'/personlol/champimg',
		}).done(res => {

			/*아이콘 띄우기  */
			let icon_img = ''
			$.each(res, function (i, img) {
				icon_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
			})
			$('.ul-group').html(icon_img);
		}).fail(err => {
			console.log(err)
		})
	})//
	
	$('#top_img').click(function () {
		$.ajax({
			method:'get',
			data:{lane:'TOP'},
			url:'/personlol/champimg-top',
		}).done(res => {

			let top_img=''
			$.each(res, function (i, img) {
				top_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
			})
			$('.ul-group').html(top_img);
			
		}).fail(err => {
			console.log(err)
		})
	})//
	
	$('#jug_img').click(function () {
		$.ajax({
			method:'get',
			data:{lane:'JUNGLE'},
			url:'/personlol/champimg-jug',
		}).done(res => {

			let jug_img=''
			$.each(res, function (i, img) {
				jug_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
			})
			$('.ul-group').html(jug_img);
			
		}).fail(err => {
			console.log(err)
		})
	})//
	
	$('#mid_img').click(function () {
		$.ajax({
			method:'get',
			data:{lane:'MIDDLE'},
			url:'/personlol/champimg-mid',
		}).done(res => {

			let mid_img=''
			$.each(res, function (i, img) {
				mid_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
			})
			$('.ul-group').html(mid_img);
			
		}).fail(err => {
			console.log(err)
		})
	})//
	
	$('#bot_img').click(function () {
		$.ajax({
			method:'get',
			data:{lane:'BOTTOM'},
			url:'/personlol/champimg-bot',
		}).done(res => {
			let bot_img=''
			$.each(res, function (i, img) {
				bot_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
			})
			$('.ul-group').html(bot_img);
			
		}).fail(err => {
			console.log(err)
		})
	})//
	
	$('#util_img').click(function () {
		$.ajax({
			method:'get',
			data:{lane:'UTILITY'},
			url:'/personlol/champimg-bot',
		}).done(res => {
			let util_img=''
			$.each(res, function (i, img) {
				util_img += '<img class="icon_img" width="70" height="70" src="../resources/'+img.champ_icon +'" alt="이미지">'
			})
			$('.ul-group').html(util_img);
			
		}).fail(err => {
			console.log(err)
		})
	})//
	
	
</script>

<script>
/*챔프 리스트 부분*/
$.ajax({
	method:'get',
	url:'/personlol/list',
	data:{lane:'TOP'},
	
}).done(res => {
	let flist=''
	$.each(res,function (i,list){
		flist +=
		'<tr><td>'+(i+1)+'</td>'+
		'<td align="left" width="120px"> <img width="30" height="30" src="../resources/'+list.champ_icon+'" alt ="이미지">'+
		'<span style="font-size: 12px; font-weight: bold;">'+list.champ_name+'</span> </td>'+
		'<td align="center">'+0+'</td>'+
		'<td align="center">'+list.win_rate+'</td>'+
		'<td align="center">'+list.pick_rate+'</td>'+
		'<td align="center">'+list.ban_rate+'</td>'+
		'<td align="center">'+ 0 +'</td> </tr>'
	})
	$('#list_table1').html(flist)
	
}).fail(err =>{
	
})//

$('input').click(function () {
	where = $(this).val();
	//console.log(where);
	
	$.ajax({
		method:'get',
		url:'/personlol/list/'+where,
		data:{lane:where}
		
	}).done(res => {
		let lane_list=''
		
		$.each(res,function (i,list){
			lane_list +=
				'<tr><td>'+(i+1)+'</td>'+
				'<td align="left" width="120px"> <img width="30" height="30" src="../resources/'+list.champ_icon+'" alt ="이미지">'+
				'<span style="font-size: 12px; font-weight: bold;">'+list.champ_name+'</span> </td>'+
				'<td align="left">'+0+'</td>'+
				'<td align="left">'+list.win_rate+'</td>'+
				'<td align="left">'+list.pick_rate+'</td>'+
				'<td align="left">'+list.ban_rate+'</td>'+
				'<td align="left">'+ 0 +'</td> </tr>'
		})
		$('#list_table1').html(lane_list)
		
		
	}).fail(err => {
		console.log(err)
	})
	
	
})//



</script>


</body>
</html>