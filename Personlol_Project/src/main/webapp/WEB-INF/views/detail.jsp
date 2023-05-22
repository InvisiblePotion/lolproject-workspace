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
						<a href="/personlol/rank" class="m-col">랭킹</a> 
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
        <div class="col" id="sub_rune">영감</div>
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
      <div class="col" id="test123">아이템 사진</div>
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
		const promises = [];
		$.each(res, function (i,rune) {
			let typecore = rune.runetype_core;
			let core_main = rune.core_mainrune;
			let core_rune1 = rune.core_rune1;
			let core_rune2 = rune.core_rune2;
			let core_rune3 = rune.core_rune3;
			
			let typesub = rune.runetype_sub;
			let sub_rune1 = rune.sub_rune1;
			let sub_rune2 = rune.sub_rune2;
			
			let shard_offense = rune.shard_offense;
			let shard_flex = rune.shard_flex;
			let shard_defence = rune.shard_defence;
			
			
			
			//룬 타입 이미지
			$.ajax({
				method:'get',
				data:{typecore:typecore},
				url:'/personlol/champion/rune/type-img'
			}).done(res => {
				type_img=''
				$.each(res, function (i,type) {
					type_img += '<img class="skill_img" width="40" height="40" src="../resources/'+type.runetype_icon+
					'" alt="이미지">'
				})
				$('#main_rune').append(type_img);
				
			}).fail(err => {
				
			}) 
			
			//룬 코어 이미지
			$.ajax({
				method:'get',
				data:{core_main:core_main},
				url:'/personlol/champion/rune/core-main'
			}).done(res => {
				core_main_img=''
					$.each(res, function (i,type) {
						core_main_img += '<img class="skill_img" width="40" height="40" src="../resources/dd/img/rune/perk/'+type.rune_key+
						'.png" alt="이미지">'
					})
					$('#main_rune').append(core_main_img);
				
			}).fail(err => {
				
			})
			//룬 코어 이미지1
			$.ajax({
				method:'get',
				data:{core_rune1:core_rune1},
				url:'/personlol/champion/rune/core-rune1'
			}).done(res => {
				core_main_img=''
					$.each(res, function (i,type) {
						core_main_img += '<img class="skill_img" width="40" height="40" src="../resources/dd/img/rune/perk/'+type.rune_key+
						'.png" alt="이미지">'
					})
					$('#main_rune').append(core_main_img); 
				
			}).fail(err => {
				
			})//
			
			//룬 코어 이미지2
			$.ajax({
				method:'get',
				data:{core_rune2:core_rune2},
				url:'/personlol/champion/rune/core-rune2'
			}).done(res => {
				core_main_img=''
					$.each(res, function (i,type) {
						core_main_img += '<img class="skill_img" width="40" height="40" src="../resources/dd/img/rune/perk/'+type.rune_key+
						'.png" alt="이미지">'
					})
					$('#main_rune').append(core_main_img); 
				
			}).fail(err => {
				
			})//
			
			//룬 코어 이미지3
			$.ajax({
				method:'get',
				data:{core_rune3:core_rune3},
				url:'/personlol/champion/rune/core-rune3'
			}).done(res => {
				core_main_img=''
				$.each(res, function (i,type) {
					core_main_img += '<img class="skill_img" width="40" height="40" src="../resources/dd/img/rune/perk/'+type.rune_key+
					'.png" alt="이미지">'
				})
				$('#main_rune').append(core_main_img); 
				
			}).fail(err => {
				
			})//
			
			//룬 타입 서브
			$.ajax({
				method:'get',
				data:{core_main:typesub},
				url:'/personlol/champion/rune/type-sub'
			}).done(res => {
				type_sub=''
				$.each(res, function (i,type) {
					type_sub += '<img class="skill_img" width="40" height="40" src="../resources/'+type.runetype_icon+
					'" alt="이미지">'
				})
				$('#main_rune').append(type_sub); 
			}).fail(err => {
				
			})//
			
			//룬 서브 룬1
			$.ajax({
				method:'get',
				data:{sub_rune1:sub_rune1},
				url:'/personlol/champion/rune/sub-rune1'
			}).done(res => {

				sub_img=''
				$.each(res, function (i,type) {
					sub_img += '<img class="skill_img" width="40" height="40" src="../resources/dd/img/rune/perk/'+type.rune_key+
					'.png" alt="이미지">'
				})
				$('#main_rune').append(sub_img); 

			}).fail(err => {
				
			})//
			
			
			//룬 서브 룬2
			$.ajax({
				method:'get',
				data:{sub_rune2:sub_rune2},
				url:'/personlol/champion/rune/sub-rune2'
			}).done(res => {
				
				sub_img=''
				$.each(res, function (i,type) {
					sub_img += '<img class="skill_img" width="40" height="40" src="../resources/dd/img/rune/perk/'+type.rune_key+
					'.png" alt="이미지">'
				})
				$('#main_rune').append(sub_img); 
				
			}).fail(err => {
				
			})//
			
			
			//룬 파편1
			$.ajax({
				method:'get',
				data:{shard1:shard_offense},
				url:'/personlol/champion/rune/shard1'
			}).done(res => {
				shard_img=''
				$.each(res, function (i,type) {
					shard_img += '<img class="skill_img" width="40" height="40" src="../resources/'+type.runeshard_icon+
					'" alt="이미지">'
				})
				$('#main_rune').append(shard_img);
				
			}).fail(err => {
				
			})//
			
			//룬 파편2
			$.ajax({
				method:'get',
				data:{shard2:shard_flex},
				url:'/personlol/champion/rune/shard2'
			}).done(res => {
				shard_img=''
					$.each(res, function (i,type) {
						shard_img += '<img class="skill_img" width="40" height="40" src="../resources/'+type.runeshard_icon+
						'" alt="이미지">'
					})
					$('#main_rune').append(shard_img);
				
			}).fail(err => {
				
			})//
			
			//룬 파편3
			$.ajax({
				method:'get',
				data:{shard3:shard_flex},
				url:'/personlol/champion/rune/shard3'
			}).done(res => {
				shard_img=''
				$.each(res, function (i,type) {
					shard_img += '<img class="skill_img" width="40" height="40" src="../resources/'+type.runeshard_icon+
					'" alt="이미지">'
				})
				$('#main_rune').append(shard_img);
		
			}).fail(err => {
				
			})
		})//
			
			
			
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
 
    
