<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
<!--css 파일명 수정해야함-->
<link rel="stylesheet" type="text/css"
	href="../resources/css/champlist.css">	
	
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
						<a href="/personlol/champion/" class="m-col">챔피언분석</a>
						<a href="/personlol/summoner/rank" class="m-col">랭킹</a> 
						<a href=" " class="m-col">듀오찾기</a>
						<a href=" " class="m-col">사용자분석</a>
						<a href="/personlol/logine" class="m-col login">로그인</a>
					</div>
				</div>
			</nav>
		</div>
	</div>

  <div class="container">
    <div class="row">
      <div class="col" id="champ_img">챔피언 사진</div>
      <div class="col">
        <div class = "row" id="champ_name">c-r-1</div>
        <div class = "row">
          <div class = "col" id="skill_img">스킬사진</div>
          <div class = "col" id="skill_info">스킬내용</div>
        </div>
      </div>     
    </div>

    <div class="row">
      <div class="col">승률</div>
      <div class="col">픽률</div>
      <div class="col">밴율</div>
    </div>

    <div class="row">
      <div class="col" id="win">내용(승률)</div>
      <div class="col" id="pick">내용(픽률)</div>
      <div class="col" id="ban">내용(밴율)</div>
    </div>

    <div class="row">추천 룬 세팅</div>
      <div class = "row">
        <div class="col" id="main_rune">메인</div>
        <div class="col" id="sub_run">영감</div>
        <div class="col" id="shard">능력치파편</div>
      </div>

    <div class="row">추천스킬빌드</div>
    <div class="row">
      <div class="col">
        <div class="row">스킬사진</div>
        <div class="row" id="skill_tree">스킬순서</div>
      </div>
      <div class="col" > 
      	<div class="row" id="sk_count">1</div>
      	<div class="row" id="sk_win">2</div>
      </div>
     
      
    </div>

    <div class="row">추천빌드</div>
    <div class="row">
      <div class="col">아이템 사진</div>
      <div class="col">아이템 통계</div>
    </div>
    
 <script>
 
 $(document).ready(function() {
	 
	 //쿼리스트링 가져오는 함수
	 function getQueryString(key) {
	     //url 가져오는거
	     const urlParams = new URLSearchParams(window.location.search);
	     return urlParams.get(key);
	 }
	 const champ_id = getQueryString('champ_id')
	 //console.log(champ_id)	 
	 
	//초기정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id},
		url:'/personlol/champion/info',
	}).done(res => {
		$.each(res, function (i, info) {
			$('#champ_name').html(info.champ_name)
			$('#win').html(info.win_rate)
			$('#pick').html(info.pick_rate)
			$('#ban').html(info.ban_rate)
			icon_img = '<img class="icon_img" width="70" height="70" src="../resources/'+info.champ_icon +'" alt="이미지">'
		})
		$('#champ_img').html(icon_img)
	}).fail(err => {
		console.log(err)
	})
	
	//스킬 초기정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id},
		url:'/personlol/champion/skill'
	}).done(res => {
		console.log(res)
		
		let skill_img=''
		$.each(res, function (i,skill) {
			skill_img +=
				'<img class="skill_img" width="40" height="40" src="../resources/'+skill.skill_icon+
				'" alt="이미지">'
		})
		$('#skill_img').html(skill_img)
	}).fail(err => {
		
	})//
	
	//룬 정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id},
		url:'/personlol/champion/rune'
	}).done(res => {
		console.log(res)
		
		game_count=''
		$.each(res, function (i,rune) {
			game_count +='<span>'+rune.game_count+'</span>'
		})
		$('#main_rune').html(game_count)
	}).fail(err => {
		
	})//
	
	
	//스킬 트리
	$.ajax({
		method:'get',
		data:{champ_id:champ_id},
		url:'/personlol/champion/skill-tree'
	}).done(res => {
		console.log(res)
		
		
		$.each(res, function (i,skill) {
			$('#skill_tree').html(skill.skill_build)
			$('#sk_count').html("픽률: "+skill.pick_rate +' , 게임수: ' +skill.game_count )
			$('#sk_win').html("승률: " + skill.win_rate)
		})
		
	}).fail(err => {
		
	})//
	

 });
 </script>
 </body>
 </html>
 
    
