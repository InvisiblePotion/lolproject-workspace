<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>

<style>
#change_rune1{
 justify-content: center;
}

#change_rune2{
 justify-content: center;
}

/* 스킬이미지 호버시 툴팁 */
.skill-container {
  position: relative;
  display: inline-block;
}

.tooltip {
  visibility: hidden;
  width: 120px;
  background-color: #000;
  color: #fff;
  
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  
  /* 꾸미기용 */
  top: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
  width: 500px;
}
.skill-container:hover .tooltip {
  visibility: visible;
  opacity: 1;
}

/* 룬이미지 호버시 툴팁 */
.rune_img {
  position: relative;
  display: inline-block;
  padding: 0px;
}

.runetype_tooltip {
  visibility: hidden;
  width: 120px;
  background-color: #000;
  color: #fff;
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  
  top: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
}

.rune_tooltip {
  visibility: hidden;
  width: 120px;
  background-color: #000;
  color: #fff;
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  text-align:left;
  
  top: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
  width: 500px;
  
}

.rune_img:hover .rune_tooltip {
  visibility: visible;
  opacity: 1;
}

.rune_img:hover .runetype_tooltip {
  visibility: visible;
  opacity: 1;
}

/* 룬 긴설명 css부분 */
.rune_longdesc {
  font-size: 13px;
  font-weight: normal;
}



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
        <div class = "row skillimg">
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
        <div class="col col-sm-3 id="shard">
       		<div class="row" id="shard1"></div>
       		<div class="row" id="shard2"></div>
       		<div class="row" id="shard3"></div>
       		<div class="row" id="change_rune1">1</div>
       		<div class="row" id="change_rune2">2</div>
        </div>
        
        
      </div>

   <div class="row">추천스킬빌드</div>
    <div class="row">
      <div class="col">
        <div class="row">스킬사진</div>
        <div class="row" id="skill_tree1"></div>
        <div class="row" >&nbsp</div>
        <div class="row" id="skill_tree2"></div>
        <div class="row" >&nbsp</div>
        <div class="row" id="skill_tree3"></div>
      </div>
      <div class="col" > 
      	<div class="row" id="sk_count">1</div>
      	<div class="row" id="sk_win">2</div>
      </div>   
    </div>

    <div class="row">추천빌드</div>
    <div class="row">
        <div class="col">아이템 1</div>
        <div class="col">아이템 2</div>
        <div class="col">아이템 3</div>
        <div class="col">픽률</div>
        <div class="col">게임수</div>
        <div class="col">승률</div>
    </div>
    
    <div class="row">
      <div class="col" id="item1"></div>
      <div class="col" id="item2"></div>
      <div class="col" id="item3"></div>
      <div class="col" id="i_Pick"></div>
      <div class="col" id="i_Totgame"></div>
      <div class="col" id="i_Winrate"></div>
    </div>
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
	 const champ_lane = getQueryString('lane')
	 
	 console.log(champ_lane)	 
	 console.log(champ_id)	 
	 
	//초기정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id, champ_lane:champ_lane},
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
			// skill설명들이 null인 경우에 대한 조건문 추가
			let tooltip = skill.skill_tooltip ? skill.skill_tooltip : '';
			let cooldown = skill.skill_cooldown ? skill.skill_cooldown : '없음';
			let cost = skill.skill_cost ? skill.skill_cost : '없음';
			let range = skill.skill_range ? skill.skill_range : '없음';
			
			skill_img +=
				'<div class="skill-container">' +
				'<img class="skill_img" width="40" height="40" src="../resources/'+skill.skill_icon+
				'" alt="이미지" >'+'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
				skill.skill_name+'</span></div>'+
				'<div>'+'스킬 재사용 대기시간(초): '+cooldown+'</div><div>'+
				'스킬 마나소모량: '+cost+'</div><div>'+'스킬 범위: '+range+'</div>'+
				'<div>'+skill.skill_desc+'</div><div>'+tooltip+'</div></div></div>';
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
		data:{champ_id:champ_id,champ_lane:champ_lane},
		url:'/personlol/champion/rune'
	}).done(res => {
		console.log(res)
		
		$.each(res, function (i,rune) {
			
			var runetype = rune.runetype_core
			var core_main = rune.core_mainrune
			var core_rune1 = rune.core_rune1
			var core_rune2 = rune.core_rune2
			var core_rune3 = rune.core_rune3
			
			var runesub = rune.runetype_sub
			var sub_rune1 = rune.sub_rune1
			var sub_rune2 = rune.sub_rune2
			
			var shard_defence = rune.shard_defence
			var shard_flex = rune.shard_flex
			var shard_offense = rune.shard_offense
			
			
			
			//메인룬타입
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/main-rune',
				data:{main_rune:runetype}
			}).done(res => {
				main_img=''
				for (var i = 0; i < res.length; i++) {
	    		var rune = res[i];
	    		main_img += 
	    		'<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
	    		'" data-rune-key="'+rune.runetype_id+'"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
	    		rune.runetype_name+'</span></div></div>';
				}
				$('#type_rune').html(main_img)
				
				
			}).fail(err=>{
				
			})//r1
			
			//메인 룬타입에 해당하는 코어룬들
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/type-core',
				data:{core_rune:runetype}
			}).done(res =>{
				console.log(res)
				
				if (res.length == 12){
					
					rune_img_part1=''
					for (var i = 0; i < 3; i++) {
		    		var rune = res[i];
		    		rune_img_part1 += 
		    		'<div class="col rune_img"><img class="rune_img" width="30" height="30" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"> <div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';

					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 3; i < 6; i++) {
			    	var rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 6; i < 9; i++) {
			    	var rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 9; i < 12; i++) {
			    	var rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					var runetypeCoremain = $('img[data-rune-key="' + core_main + '"]');
					var runetypeCorerune1 = $('img[data-rune-key="' + core_rune1 + '"]');
					var runetypeCorerune2 = $('img[data-rune-key="' + core_rune2 + '"]');
					var runetypeCorerune3 = $('img[data-rune-key="' + core_rune3 + '"]');
						
					runetypeCoremain[0].style.filter ="none"
					runetypeCorerune1[0].style.filter ="none"
					runetypeCorerune2[0].style.filter ="none"
					runetypeCorerune3[0].style.filter ="none"
				}else{
					rune_img_part1=''
					for (var i = 0; i < 4; i++) {
		    		var rune = res[i];
		    		rune_img_part1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
		    		
					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 4; i < 7; i++) {
			    	var rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 7; i < 10; i++) {
			    	var rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 10; i < res.length; i++) {
			    	var rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					var runetypeCoremain = $('img[data-rune-key="' + core_main + '"]');
					var runetypeCorerune1 = $('img[data-rune-key="' + core_rune1 + '"]');
					var runetypeCorerune2 = $('img[data-rune-key="' + core_rune2 + '"]');
					var runetypeCorerune3 = $('img[data-rune-key="' + core_rune3 + '"]');
						
					runetypeCoremain[0].style.filter ="none"
					runetypeCorerune1[0].style.filter ="none"
					runetypeCorerune2[0].style.filter ="none"
					runetypeCorerune3[0].style.filter ="none"
				}
				
					
				}).fail(err =>{
				
				})//r2
				
				
				//서브 룬
				$.ajax({
				method:'get',
				url:'/personlol/champion/rune/sub-rune',
				data:{sub_rune:runesub}
				
				}).done(res => {
					
					sub_img=''
					for (var i = 0; i < res.length; i++) {
			    	var rune = res[i];
			    	sub_img += '<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
		    		'" data-rune-key="'+rune.runetype_id+'" ><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.runetype_name+'</span></div></div>';
					}
					$('#type_sub').html(sub_img)
					
				
				}).fail(err=>{
				
				})
				
				//서브 룬 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/type-core',
					data:{core_rune:runesub}
				}).done(res=>{
						
					if (res.length == 12){
						
						rune_img_sub1=''
						for (var i = 3; i < 6; i++) {
				    	var rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 6; i < 9; i++) {
				    	var rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 9; i < 12; i++) {
				    	var rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'
			    		+ rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
								
						var runetypeSubune1 = $('img[data-rune-key="' + sub_rune1 + '"]');
						var runetypeSubune2 = $('img[data-rune-key="' + sub_rune2 + '"]');

						runetypeSubune1[0].style.filter ="none";
						runetypeSubune2[0].style.filter ="none";
					}else{
						rune_img_sub1=''
						for (var i = 4; i < 7; i++) {
				    	var rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 7; i < 10; i++) {
				    	var rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name + '</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 10; i < res.length; i++) {
				    	var rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
							
							
							
						var runetypeSubune1 = $('img[data-rune-key="' + sub_rune1 + '"]');
						var runetypeSubune2 = $('img[data-rune-key="' + sub_rune2 + '"]');

						runetypeSubune1[0].style.filter ="none";
						runetypeSubune2[0].style.filter ="none";
					}
					
						
					
				}).fail(err=>{
					
				})
				
				//파편 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/shard',
					
				}).done(res => {
					console.log(res)
					rune_img_shard1=''
		
					rune_img_shard1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[5].runeshard_icon + 
		    		'" data-rune-key1="'+ res[5].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[5].runeshard_stat+'</span><div class="rune_longdesc">'+res[5].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[3].runeshard_icon + 
		    		'" data-rune-key1="'+ res[3].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[3].runeshard_stat+'</span><div class="rune_longdesc">'+res[3].runeshard_desc+'</div></div></div>'+
		    		
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[4].runeshard_icon + 
		    		'" data-rune-key1="'+ res[4].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[4].runeshard_stat+'</span><div class="rune_longdesc">'+res[4].runeshard_desc+'</div></div></div>';
					
					$('#shard1').html(rune_img_shard1);
					
					rune_img_shard2=''
					rune_img_shard2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[5].runeshard_icon + 
		    		'" data-rune-key2="'+ res[5].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[5].runeshard_stat+'</span><div class="rune_longdesc">'+res[5].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[2].runeshard_icon + 
		    		'" data-rune-ke2y="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[2].runeshard_stat+'</span><div class="rune_longdesc">'+res[2].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[0].runeshard_icon + 
		    		'" data-rune-key2="'+ res[0].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[0].runeshard_stat+'</span><div class="rune_longdesc">'+res[0].runeshard_desc+'</div></div></div>';
		    		
					$('#shard2').html(rune_img_shard2);
					
					rune_img_shard3=''
					rune_img_shard3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[1].runeshard_icon + 
		    		'" data-rune-key3="'+ res[1].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[1].runeshard_stat+'</span><div class="rune_longdesc">'+res[1].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[2].runeshard_icon + 
		    		'" data-rune-key3="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[2].runeshard_stat+'</span><div class="rune_longdesc">'+res[2].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[0].runeshard_icon + 
		    		'" data-rune-key3="'+ res[0].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[0].runeshard_stat+'</span><div class="rune_longdesc">'+res[0].runeshard_desc+'</div></div></div>'
					
					$('#shard3').html(rune_img_shard3);
					//shard_defence shard_flex
					var runetypeShard1 = $('img[data-rune-key1="' + shard_offense + '"]');
					var runetypeShard2 = $('img[data-rune-key2="' + shard_flex + '"]');
					var runetypeShard3 = $('img[data-rune-key3="' + shard_defence + '"]');

					runetypeShard1[0].style.filter ="none";
					runetypeShard2[0].style.filter ="none";
					runetypeShard3[0].style.filter ="none";
					
				}).fail(err =>{
					
				})
				
			
				
		})//1
		
		
		let change_rune1 = '';
		if (res[0].runetype_core !== undefined && res[0].runetype_core !== null && res[0].runetype_core !== '') {
		  change_rune1 = '<div class="first_rune"><img width="25" height="25" src="../resources/dd/img/rune/style/' + res[0].runetype_core + '.png">'+
		  '<img width="60" height="60" src="../resources/dd/img/rune/perk/'+res[0].core_mainrune+'.png">'+
		  '<img width="25" height="25" src="../resources/dd/img/rune/style/'+res[0].runetype_sub+'.png"></div>'
		  
		}
		$('#change_rune1').html(change_rune1)
		
		
		let change_rune2 = '';
		if (res[1] && res[1].runetype_core != undefined && res[1].runetype_core != null && res[1].runetype_core != '') {
			change_rune2 = '<div class="second_rune"><img width="25" height="25" src="../resources/dd/img/rune/style/' + res[1].runetype_core + '.png">'+
			'<img width="60" height="60" src="../resources/dd/img/rune/perk/'+res[1].core_mainrune+'.png">'+
			'<img width="25" height="25" src="../resources/dd/img/rune/style/'+res[1].runetype_sub+'.png"></div>'
			
		}
		$('#change_rune2').html(change_rune2)
		
		$('#change_rune1').click(function() {
			var f_runetype = res[0].runetype_core
			var f_core_main = res[0].core_mainrune
			var f_core_rune1 = res[0].core_rune1
			var f_core_rune2 = res[0].core_rune2
			var f_core_rune3 = res[0].core_rune3
			
			var f_runesub = res[0].runetype_sub
			var f_sub_rune1 = res[0].sub_rune1
			var f_sub_rune2 = res[0].sub_rune2
			
			var f_shard_defence = res[0].shard_defence
			var f_shard_flex = res[0].shard_flex
			var f_shard_offense = res[0].shard_offense
			
			//메인룬타입
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/main-rune',
				data:{main_rune:f_runetype}
			}).done(res => {
				main_img=''
				for (var i = 0; i < res.length; i++) {
	    		var rune = res[i];
	    		main_img += 
	    		'<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
	    		'" data-rune-key="'+rune.runetype_id+'"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
	    		rune.runetype_name+'</span></div></div>';
				}
				$('#type_rune').html(main_img)
				
				
			}).fail(err=>{
				
			})//r1
			
			//메인 룬타입에 해당하는 코어룬들
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/type-core',
				data:{core_rune:f_runetype}
			}).done(res =>{
				
				if (res.length == 12){
					
					rune_img_part1=''
					for (var i = 0; i < 3; i++) {
		    		var rune = res[i];
		    		rune_img_part1 += 
		    		'<div class="col rune_img"><img class="rune_img" width="30" height="30" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"> <div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';

					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 3; i < 6; i++) {
			    	var rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 6; i < 9; i++) {
			    	var rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 9; i < 12; i++) {
			    	var rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					var f_runetypeCoremain = $('img[data-rune-key="' + f_core_main + '"]');
					var f_runetypeCorerune1 = $('img[data-rune-key="' + f_core_rune1 + '"]');
					var f_runetypeCorerune2 = $('img[data-rune-key="' + f_core_rune2 + '"]');
					var f_runetypeCorerune3 = $('img[data-rune-key="' + f_core_rune3 + '"]');
						
					f_runetypeCoremain[0].style.filter ="none"
					f_runetypeCorerune1[0].style.filter ="none"
					f_runetypeCorerune2[0].style.filter ="none"
					f_runetypeCorerune3[0].style.filter ="none"
				}else{
					rune_img_part1=''
					for (var i = 0; i < 4; i++) {
		    		var rune = res[i];
		    		rune_img_part1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
		    		
					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 4; i < 7; i++) {
			    	var rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 7; i < 10; i++) {
			    	var rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 10; i < res.length; i++) {
			    	var rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					var f_runetypeCoremain = $('img[data-rune-key="' + f_core_main + '"]');
					var f_runetypeCorerune1 = $('img[data-rune-key="' + f_core_rune1 + '"]');
					var f_runetypeCorerune2 = $('img[data-rune-key="' + f_core_rune2 + '"]');
					var f_runetypeCorerune3 = $('img[data-rune-key="' + f_core_rune3 + '"]');
						
					f_runetypeCoremain[0].style.filter ="none"
					f_runetypeCorerune1[0].style.filter ="none"
					f_runetypeCorerune2[0].style.filter ="none"
					f_runetypeCorerune3[0].style.filter ="none"
				}
				
					
				}).fail(err =>{
				
				})//r2
				
				
				//서브 룬
				$.ajax({
				method:'get',
				url:'/personlol/champion/rune/sub-rune',
				data:{sub_rune:f_runesub}
				
				}).done(res => {
					
					sub_img=''
					for (var i = 0; i < res.length; i++) {
			    	var rune = res[i];
			    	sub_img += '<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
		    		'" data-rune-key="'+rune.runetype_id+'" ><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.runetype_name+'</span></div></div>';
					}
					$('#type_sub').html(sub_img)
					
				
				}).fail(err=>{
				
				})
				
				//서브 룬 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/type-core',
					data:{core_rune:f_runesub}
				}).done(res=>{
						
					if (res.length == 12){
						
						rune_img_sub1=''
						for (var i = 3; i < 6; i++) {
				    	var rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 6; i < 9; i++) {
				    	var rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 9; i < 12; i++) {
				    	var rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'
			    		+ rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
								
						var f_runetypeSubune1 = $('img[data-rune-key="' + f_sub_rune1 + '"]');
						var f_runetypeSubune2 = $('img[data-rune-key="' + f_sub_rune2 + '"]');

						f_runetypeSubune1[0].style.filter ="none";
						f_runetypeSubune2[0].style.filter ="none";
					}else{
						rune_img_sub1=''
						for (var i = 4; i < 7; i++) {
				    	var rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 7; i < 10; i++) {
				    	var rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name + '</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 10; i < res.length; i++) {
				    	var rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
							
							
							
						var f_runetypeSubune1 = $('img[data-rune-key="' + f_sub_rune1 + '"]');
						var f_runetypeSubune2 = $('img[data-rune-key="' + f_sub_rune2 + '"]');

						runetypeSubune1[0].style.filter ="none";
						runetypeSubune2[0].style.filter ="none";
					}
					
						
					
				}).fail(err=>{
					
				})
				
				//파편 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/shard',
					
				}).done(res => {
					rune_img_shard1=''
		
					rune_img_shard1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[5].runeshard_icon + 
		    		'" data-rune-key1="'+ res[5].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[5].runeshard_stat+'</span><div class="rune_longdesc">'+res[5].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[3].runeshard_icon + 
		    		'" data-rune-key1="'+ res[3].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[3].runeshard_stat+'</span><div class="rune_longdesc">'+res[3].runeshard_desc+'</div></div></div>'+
		    		
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[4].runeshard_icon + 
		    		'" data-rune-key1="'+ res[4].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[4].runeshard_stat+'</span><div class="rune_longdesc">'+res[4].runeshard_desc+'</div></div></div>';
					
					$('#shard1').html(rune_img_shard1);
					
					rune_img_shard2=''
					rune_img_shard2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[5].runeshard_icon + 
		    		'" data-rune-key2="'+ res[5].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[5].runeshard_stat+'</span><div class="rune_longdesc">'+res[5].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[2].runeshard_icon + 
		    		'" data-rune-ke2y="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[2].runeshard_stat+'</span><div class="rune_longdesc">'+res[2].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[0].runeshard_icon + 
		    		'" data-rune-key2="'+ res[0].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[0].runeshard_stat+'</span><div class="rune_longdesc">'+res[0].runeshard_desc+'</div></div></div>';
		    		
					$('#shard2').html(rune_img_shard2);
					
					rune_img_shard3=''
					rune_img_shard3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[1].runeshard_icon + 
		    		'" data-rune-key3="'+ res[1].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[1].runeshard_stat+'</span><div class="rune_longdesc">'+res[1].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[2].runeshard_icon + 
		    		'" data-rune-key3="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[2].runeshard_stat+'</span><div class="rune_longdesc">'+res[2].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[0].runeshard_icon + 
		    		'" data-rune-key3="'+ res[0].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[0].runeshard_stat+'</span><div class="rune_longdesc">'+res[0].runeshard_desc+'</div></div></div>'
					
					$('#shard3').html(rune_img_shard3);
					//shard_defence shard_flex
					var f_runetypeShard1 = $('img[data-rune-key1="' + f_shard_offense + '"]');
					var f_runetypeShard2 = $('img[data-rune-key2="' + f_shard_flex + '"]');
					var f_runetypeShard3 = $('img[data-rune-key3="' + f_shard_defence + '"]');

					f_runetypeShard1[0].style.filter ="none";
					f_runetypeShard2[0].style.filter ="none";
					f_runetypeShard3[0].style.filter ="none";
					
				}).fail(err =>{
					
				})
			
			
		})//클릭 이벤트
		
		$('#change_rune2').click(function() {
			var s_runetype = res[1].runetype_core
			var s_core_main = res[1].core_mainrune
			var s_core_rune1 = res[1].core_rune1
			var s_core_rune2 = res[1].core_rune2
			var s_core_rune3 = res[1].core_rune3
			
			var s_runesub = res[1].runetype_sub
			var s_sub_rune1 = res[1].sub_rune1
			var s_sub_rune2 = res[1].sub_rune2
			
			var s_shard_defence = res[1].shard_defence
			var s_shard_flex = res[1].shard_flex
			var s_shard_offense = res[1].shard_offense
			
			//메인룬타입
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/main-rune',
				data:{main_rune:s_runetype}
			}).done(res => {
				main_img=''
				for (var i = 0; i < res.length; i++) {
	    		var rune = res[i];
	    		main_img += 
	    		'<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
	    		'" data-rune-key="'+rune.runetype_id+'"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
	    		rune.runetype_name+'</span></div></div>';
				}
				$('#type_rune').html(main_img)
				
				
			}).fail(err=>{
				
			})//r1
			
			//메인 룬타입에 해당하는 코어룬들
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/type-core',
				data:{core_rune:s_runetype}
			}).done(res =>{
				
				if (res.length == 12){
					
					rune_img_part1=''
					for (var i = 0; i < 3; i++) {
		    		var rune = res[i];
		    		rune_img_part1 += 
		    		'<div class="col rune_img"><img class="rune_img" width="30" height="30" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"> <div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';

					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 3; i < 6; i++) {
			    	var rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 6; i < 9; i++) {
			    	var rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 9; i < 12; i++) {
			    	var rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					var s_runetypeCoremain = $('img[data-rune-key="' + s_core_main + '"]');
					var s_runetypeCorerune1 = $('img[data-rune-key="' + s_core_rune1 + '"]');
					var s_runetypeCorerune2 = $('img[data-rune-key="' + s_core_rune2 + '"]');
					var s_runetypeCorerune3 = $('img[data-rune-key="' + s_core_rune3 + '"]');
						
					s_runetypeCoremain[0].style.filter ="none"
					s_runetypeCorerune1[0].style.filter ="none"
					s_runetypeCorerune2[0].style.filter ="none"
					s_runetypeCorerune3[0].style.filter ="none"
				}else{
					rune_img_part1=''
					for (var i = 0; i < 4; i++) {
		    		var rune = res[i];
		    		rune_img_part1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
		    		
					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 4; i < 7; i++) {
			    	var rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 7; i < 10; i++) {
			    	var rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 10; i < res.length; i++) {
			    	var rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					var s_runetypeCoremain = $('img[data-rune-key="' + s_core_main + '"]');
					var s_runetypeCorerune1 = $('img[data-rune-key="' + s_core_rune1 + '"]');
					var s_runetypeCorerune2 = $('img[data-rune-key="' + s_core_rune2 + '"]');
					var s_runetypeCorerune3 = $('img[data-rune-key="' + s_core_rune3 + '"]');
						
					s_runetypeCoremain[0].style.filter ="none"
					s_runetypeCorerune1[0].style.filter ="none"
					s_runetypeCorerune2[0].style.filter ="none"
					s_runetypeCorerune3[0].style.filter ="none"
				}
				
					
				}).fail(err =>{
				
				})//r2
				
				
				//서브 룬
				$.ajax({
				method:'get',
				url:'/personlol/champion/rune/sub-rune',
				data:{sub_rune:s_runesub}
				
				}).done(res => {
					
					sub_img=''
					for (var i = 0; i < res.length; i++) {
			    	var rune = res[i];
			    	sub_img += '<div class="col rune_img" ><img class="rune_img" width="40" height="40" src="../resources/' + rune.runetype_icon + 
		    		'" data-rune-key="'+rune.runetype_id+'" ><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.runetype_name+'</span></div></div>';
					}
					$('#type_sub').html(sub_img)
					
				
				}).fail(err=>{
				
				})
				
				//서브 룬 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/type-core',
					data:{core_rune:s_runesub}
				}).done(res=>{
						
					if (res.length == 12){
						
						rune_img_sub1=''
						for (var i = 3; i < 6; i++) {
				    	var rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 6; i < 9; i++) {
				    	var rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 9; i < 12; i++) {
				    	var rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'
			    		+ rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
								
						var s_runetypeSubune1 = $('img[data-rune-key="' + s_sub_rune1 + '"]');
						var s_runetypeSubune2 = $('img[data-rune-key="' + s_sub_rune2 + '"]');

						s_runetypeSubune1[0].style.filter ="none";
						s_runetypeSubune2[0].style.filter ="none";
					}else{
						rune_img_sub1=''
						for (var i = 4; i < 7; i++) {
				    	var rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 7; i < 10; i++) {
				    	var rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name + '</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 10; i < res.length; i++) {
				    	var rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
							
							
							
						var s_runetypeSubune1 = $('img[data-rune-key="' + s_sub_rune1 + '"]');
						var s_runetypeSubune2 = $('img[data-rune-key="' + s_sub_rune2 + '"]');

						runetypeSubune1[0].style.filter ="none";
						runetypeSubune2[0].style.filter ="none";
					}
					
						
					
				}).fail(err=>{
					
				})
				
				//파편 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/shard',
					
				}).done(res => {
					rune_img_shard1=''
		
					rune_img_shard1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[5].runeshard_icon + 
		    		'" data-rune-key1="'+ res[5].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[5].runeshard_stat+'</span><div class="rune_longdesc">'+res[5].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[3].runeshard_icon + 
		    		'" data-rune-key1="'+ res[3].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[3].runeshard_stat+'</span><div class="rune_longdesc">'+res[3].runeshard_desc+'</div></div></div>'+
		    		
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[4].runeshard_icon + 
		    		'" data-rune-key1="'+ res[4].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">' +
		    		res[4].runeshard_stat+'</span><div class="rune_longdesc">'+res[4].runeshard_desc+'</div></div></div>';
					
					$('#shard1').html(rune_img_shard1);
					
					rune_img_shard2=''
					rune_img_shard2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[5].runeshard_icon + 
		    		'" data-rune-key2="'+ res[5].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[5].runeshard_stat+'</span><div class="rune_longdesc">'+res[5].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[2].runeshard_icon + 
		    		'" data-rune-ke2y="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[2].runeshard_stat+'</span><div class="rune_longdesc">'+res[2].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[0].runeshard_icon + 
		    		'" data-rune-key2="'+ res[0].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[0].runeshard_stat+'</span><div class="rune_longdesc">'+res[0].runeshard_desc+'</div></div></div>';
		    		
					$('#shard2').html(rune_img_shard2);
					
					rune_img_shard3=''
					rune_img_shard3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[1].runeshard_icon + 
		    		'" data-rune-key3="'+ res[1].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[1].runeshard_stat+'</span><div class="rune_longdesc">'+res[1].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[2].runeshard_icon + 
		    		'" data-rune-key3="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[2].runeshard_stat+'</span><div class="rune_longdesc">'+res[2].runeshard_desc+'</div></div></div>'+
		    		
		    		'<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + res[0].runeshard_icon + 
		    		'" data-rune-key3="'+ res[0].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		res[0].runeshard_stat+'</span><div class="rune_longdesc">'+res[0].runeshard_desc+'</div></div></div>'
					
					$('#shard3').html(rune_img_shard3);
					//shard_defence shard_flex
					var s_runetypeShard1 = $('img[data-rune-key1="' + s_shard_offense + '"]');
					var s_runetypeShard2 = $('img[data-rune-key2="' + s_shard_flex + '"]');
					var s_runetypeShard3 = $('img[data-rune-key3="' + s_shard_defence + '"]');

					s_runetypeShard1[0].style.filter ="none";
					s_runetypeShard2[0].style.filter ="none";
					s_runetypeShard3[0].style.filter ="none";
					
				}).fail(err =>{
					
				})
				
		})//클릭 이벤트
		
		/* rate_info=''
		$.each(res, function (i,rune) {
			rate_info += '<div class="col rate_div">'+rune.game_count+','+rune.pick_rate+'%'+rune.win_rate+'%'+'</div>'
		})
		$('#all_rate').html(rate_info) */
		
		
		
	}).fail(err => {
		
	})//
	
	
	//스킬 트리
	$.ajax({
		method:'get',
		data:{champ_id:champ_id},
		url:'/personlol/champion/skill-tree'
	}).done(res => {
		console.log(res)
		console.log(res.length)
		/* $.each(res, function (i,skill) { */
			const sBuild = res[0].skill_build
			const result = sBuild.substring(1,44)
			const arr = result.split(", ")
						
			console.log("================")
			console.log(arr.length)
			
			
			for (i=0; i<6;i++) {				
				if (arr[i] == 1) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[2].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 2) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[4].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 3) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[0].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 4) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[3].skill_icon+'" alt="이미지"> &nbsp'
				}    
				$('#skill_tree1').append(s_img)
			}
			
			for (i=6; i<12;i++) {				
				if (arr[i] == 1) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[2].skill_icon+'" alt="이미지"> &nbsp'
					s_name = res[1].skill_name
				}else if (arr[i] == 2) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[4].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 3) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[0].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 4) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[3].skill_icon+'" alt="이미지"> &nbsp'
				}    
				$('#skill_tree2').append(s_img)
			}
			
			for (i=12; i<15;i++) {				
				if (arr[i] == 1) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[2].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 2) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[4].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 3) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[0].skill_icon+'" alt="이미지"> &nbsp'
				}else if (arr[i] == 4) {
					s_img = '<img class="st_img" width="40" height="40" src="../resources/'+res[3].skill_icon+'" alt="이미지"> &nbsp'
				}    
				$('#skill_tree3').append(s_img)
			}
			
			$('#sk_count').html("픽률: "+res[0].pick_rate +' , 게임수: ' +res[0].game_count )
			$('#sk_win').html("승률: " + res[0].win_rate)
		
		
	}).fail(err => {
		
	})//

		
	   
		//아이템 트리
	   $.ajax({
	      method:'get',
	      data:{champ_id:champ_id},
	      url:'/personlol/champion/item_build'
	   }).done(res => {
		   console.log(res)
	      
	      Pick_List =''
	      Tot_List =''
	      Win_List =''
	      
	      $.each(res, function (i,item) {
	         $('#i_Pick').append('<br>'+item.pick_rate);
	         $('#i_Totgame').append('<br>'+item.game_count);
	         $('#i_Winrate').append('<br>'+item.win_rate);
	         
	         var item_1 = item.item1
	         var item_2 = item.item2
	         var item_3 = item.item3
	         
	         //아이템 이미지 1
	         $.ajax({
	            method:'get',
	            data:{item:item_1},
	            url:'/personlol/champion/item1'
	         }).done(res => {
	            console.log(res)
	            let item1_img=''
	            $.each(res, function (i,i_img) {
	               item1_img +=
	                  '<br><img class="item_img" width="40" height="40" src="../resources/'+i_img.item_icon+
	                  '" alt="이미지">'
	            })
	            $('#item1').append(item1_img)
	         }).fail(err => {
	            
	         })//아이템 이미지 1
	         
	         //아이템 이미지 2
	         $.ajax({
	            method:'get',
	            data:{item:item_2},
	            url:'/personlol/champion/item2'
	         }).done(res => {
	            console.log(res)
	            let item2_img=''
	            $.each(res, function (i,i_img) {
	               item2_img +=
	                  '<br><img class="item_img" width="40" height="40" src="../resources/'+i_img.item_icon+
	                  '" alt="이미지">'
	            })
	            $('#item2').append(item2_img)
	         }).fail(err => {
	            
	         })//아이템 이미지 2
	         
	         //아이템 이미지 3
	         $.ajax({
	            method:'get',
	            data:{item:item_3},
	            url:'/personlol/champion/item3'
	         }).done(res => {
	            console.log(res)
	            let item3_img=''
	            $.each(res, function (i,i_img) {
	               item3_img +=
	                  '<br><img class="skill_img" width="40" height="40" src="../resources/'+i_img.item_icon+
	                  '" alt="이미지">'
	            })
	            $('#item3').append(item3_img)
	         }).fail(err => {
	            
	         })//아이템 이미지 3
	      })
	      
	      
	   }).fail(err => {
	      
	   })//아이템 트리 


 });
	 
 </script>
 
 </body>
 </html>
 
    
