<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.rune_img{
	text-align: center;
}


</style>

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
        <div class="col" id="main_rune">
        	<div class="row" id="type_rune" ></div>
        	<div class="row" id="core_rune1"></div>
        	<div class="row" id="core_rune2"></div>
        	<div class="row" id="core_rune3"></div>
        	<div class="row" id="core_rune4"></div>
        </div>
        <div class="col" id="sub_rune">
        	<div class="row" id="type_sub"></div>
        	<div class="row" id="sub_rune1"></div>
        	<div class="row" id="sub_rune2"></div>
        	<div class="row" id="sub_rune3"></div>
        
        </div>
        <div class="col" id="shard">
       		<div class="row">
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5008.png"> </div>
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5005.png"></div>
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5007.png"></div>
       		</div>
       		<div class="row">
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5008.png"> </div>
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5002.png"></div>
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5003.png"></div>
       		</div>
       		<div class="row">
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5001.png"> </div>
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5002.png"></div>
       			<div class="col"> <img alt="#" src="../resources/dd/img/rune/shard/5003.png"></div>
       		</div>
        </div>
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
	
	//rune main 타입들 배열에 저장
	let domination =[8100,9923,8126,8139,8143,8136,8120,8138,8135,8134,8105,8106,8112,8124,8128]
	 
	let inspiration =[8300,8306,8304,8313,8321,8316,8345,8347,8410,8352,8351,8360,8369]
	 
	let precision =[8000,9101,9111,8009,9104,9105,9103,8014,8017,8299,8008,8021,8010]
	
	let resolve = [8400,8446,8463,8401,8429,8444,8473,8451,8453,8242,8437,8439,8465]
	
	let sorcery =[8200,8224,8226,8275,8210,8234,8233,8237,8232,8236,8214,8229,8230]
	
	
	//룬 정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id},
		url:'/personlol/champion/rune'
	}).done(res => {
		console.log(res)
		
		
		$.each(res, function (i,rune) {
			
			var runetype = rune.runetype_core
			console.log(runetype)
			
			var runesub = rune.runetype_sub
			console.log(runesub)
				
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/main-rune',
				data:{main_rune:runetype}
			}).done(res => {
				main_img=''
				for (var i = 0; i < res.length; i++) {
	    		var rune = res[i];
	    		main_img += '<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
	    		'" data-rune-key="'+rune.runetype_id+'"></div>';
				}
				$('#type_rune').html(main_img)
				
				
			}).fail(err=>{
				
			})
			
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/type-core',
				data:{core_rune:runetype}
			}).done(res =>{
				console.log(res)
				
				rune_img_part1=''
				for (var i = 0; i < 3; i++) {
    			var rune = res[i];
    			rune_img_part1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
				}
				$('#core_rune1').html(rune_img_part1)
				
				
				rune_img_part2=''
				for (var i = 3; i < 6; i++) {
	    		var rune = res[i];
	    		rune_img_part2 += '<div class="col rune_img"><img class="rune_img" width="40"  height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
				}
				$('#core_rune2').html(rune_img_part2)
				
				rune_img_part3=''
				for (var i = 6; i < 9; i++) {
	    		var rune = res[i];
	    		rune_img_part3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
				}
				$('#core_rune3').html(rune_img_part3)
				
				rune_img_part4=''
				for (var i = 9; i < 12; i++) {
	    		var rune = res[i];
	    		rune_img_part4 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
				}
				$('#core_rune4').html(rune_img_part4)
				
				
				//서브 룬
				
				$.ajax({
				method:'get',
				url:'/personlol/champion/rune/sub-rune',
				data:{sub_rune:runesub}
				
				}).done(res => {
					
					sub_img=''
					for (var i = 0; i < res.length; i++) {
			    	var rune = res[i];
			    	sub_img += '<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + '"></div>';
					}
					$('#type_sub').html(sub_img)
					
				
				}).fail(err=>{
				
				})
				
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/type-core',
					data:{core_rune:runesub}
				}).done(res=>{
					
						rune_img_sub1=''
						for (var i = 0; i < 3; i++) {
			    		var rune = res[i];
			    		rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
						
						rune_img_sub2=''
						for (var i = 3; i < 6; i++) {
			    		var rune = res[i];
			    		rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
						
						rune_img_sub3=''
						for (var i = 6; i < 9; i++) {
			    		var rune = res[i];
			    		rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/dd/img/rune/perk/' + rune.rune_key + '.png "></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
					
					
				}).fail(err=>{
					
				})
				
			}).fail(err =>{
			
			})//2
			
				
		})//1
		
		
		
		
		
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
 
    
