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

/* 아이템이미지 호버시 툴팁  */
.f_item {
  position: relative;
}

.item_img {
  width: 40px;
  height: 40px;
}

.item_tooltip {
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

.f_item:hover .item_tooltip {
  visibility: visible;
  opacity: 1;
}

/*호버 추가할 예정  */
.spell-container {
  position: relative;
  display: inline-block;
}

.spell_tooltip {
  visibility: hidden;
  width: 120px;
  background-color: #000;
  color: #fff;
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  text-align: left;
  top: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
  
  width: 200px;
}

.spell-container:hover .spell_tooltip {
  opacity: 1;
  visibility: visible;
}

/*룬이미지 센터로*/
.rune_img{
	text-align: center;
}

/* 아이템 설명 css  */
.item_longdesc ul {
  white-space: pre-line;
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
<!--헤더 부분 끝-->


  <div class="container">
    <div class="row">
      <div class="col" id="champ_img">챔피언 사진</div>
      <div class="col">
        <div class = "row" id="champ_name"></div>
        <div class = "row skillimg">
          <div class = "col" id="skill_img">스킬사진</div>
        </div>
      </div>     
    </div>


    <div class="row">
      <div class="col" id="win">내용(승률)</div>
      <div class="col" id="pick">내용(픽률)</div>
      <div class="col" id="ban">내용(밴율)</div>
      <div class="col" id="spell">
      	<div class="row" id="spell1"></div>
      	<div class="row" id="spell2"></div>
      </div>
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
      <div class="col" id="mat_list">
      
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
	$.ajax({
		method:'get',
		data:{champ_id:champ_id,champ_lane:champ_lane},
		url:'/personlol/matchup/list'
	}).done(res => {
		$.each(res, function (i,match) {
			console.log(res)
			console.log("참고하면서 작성하자~")
			
			let match_champ = match.champ_id_y;
			let match_win = match.matchup_win_rate;
			let match_count = match.matchup_count;
			$.ajax({
				method: 'get',
				data:{match_champ:match_champ},
				url:'/personlol/matchup/champ-img'
			}).done(res => {
				console.log(res)
				mat_img_lst=''
				$.each(res, function (i,mat_img) {
					mat_img_lst += 
						'<div class="col">'+
						'<div>'+
						'<a href="/personlol/champion/detail?champ_id=' + champ_id +'&lane='+champ_lane+'&match_champ='+match_champ+'">'+
						'<img class="icon_img" width="50" height="50" src="../resources/'+mat_img.champ_icon +'" alt="이미지">'+'</a>'+
						"승률: "+match_win+'%'+' 만난횟수: '+match_count+'</div>'+
						'</div>'
						
					
				})
				$('#mat_list').append(mat_img_lst);
			}).fail(err => {
				
			})
		})
		
	}).fail(err =>{
		console.log(err)
	})
	//초기정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id, champ_lane:champ_lane},
		url:'/personlol/champion/info',
	}).done(res => {
		$.each(res, function (i, info) {
			$('#champ_name').html(info.champ_name)
			$('#win').html("승률:"+'<br>'+info.win_rate+'%')
			$('#pick').html("픽률:"+'<br>'+info.pick_rate+'%')
			$('#ban').html("밴률:"+'<br>'+info.ban_rate+'%')
			icon_img = '<img class="icon_img" width="70" height="70" src="../resources/'+info.champ_icon +'" alt="이미지">'
		})
		$('#champ_img').html(icon_img)
	}).fail(err => {
		console.log(err)
	})
	
	//스펠정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id, champ_lane:champ_lane},
		url:'/personlol/champion/spell',
	}).done(res => {
		
		console.log('**스펠이미지 로직 생각 **')
		console.log(res)
		let f_spell1 = res[0].spell1 
		let f_spell2 = res[0].spell2
		let f_gamecount = res[0].game_count
		let f_pick_rate = res[0].pick_rate
		let f_win_rate = res[0].win_rate
		
		let s_spell1 = res[1].spell1
		let s_spell2 = res[1].spell2
		let s_gamecount = res[1].game_count
		let s_pick_rate = res[1].pick_rate
		let s_win_rate = res[1].win_rate
		
		rate_span1='';
		rate_span1 = '<div class="rate_div"><span>'+f_gamecount+'<br>'+f_pick_rate+'%'+'</span></div>'
		win_span1='';
		win_span1 = '<div class="rate_div"><span>'+f_win_rate+'%'+'</span></div>'
		
		rate_span2='';
		rate_span2 = '<div class="rate_div"><span>'+s_gamecount+'<br>'+s_pick_rate+'%'+'</span></div>'
		win_span2='';
		win_span2 = '<div class="rate_div"><span>'+s_gamecount+'%'+'</span></div>'
		
		
		
		//첫번째 스펠들 관한 비동기		
		$.ajax({
			  method: 'get',
			  data: { spell_img: f_spell1 },
			  url: '/personlol/champion/spell-img'
			}).done(res => {
			  console.log(res);
			  spell_img = '';
			  spell_img += '<div class="spell-container">' +
			    '<img class="spell_img" width="40" height="40" src="../resources/' + res[0].spell_icon + '" alt="이미지">' +
			    '<div class="spell_tooltip">' +
			    '<div><span style="font-size: 14px; font-weight: bold; color: yellow;">' + res[0].spell_name + '</span></div>' +
			    '<div>' + res[0].spell_desc + '</div>' +
			    '</div>';
			  $('#spell1').append(spell_img);

			  // 두 번째 AJAX 호출
			  $.ajax({
			    method: 'get',
			    data: { spell_img: f_spell2 },
			    url: '/personlol/champion/spell-img'
			  }).done(res => {
			    console.log(res);
			    spell_img = '';
			    spell_img += '<div class="spell-container">' +
			      '<img class="spell_img" width="40" height="40" src="../resources/' + res[0].spell_icon + '" alt="이미지">' +
			      '<div class="spell_tooltip">' +
			      '<div><span style="font-size: 14px; font-weight: bold; color: yellow;">' + res[0].spell_name + '</span></div>' +
			      '<div>' + res[0].spell_desc + '</div>' +
			      '</div>';
			    $('#spell1').append(spell_img);

			    // 세 번째 AJAX 호출
			    $.ajax({
			      method: 'get',
			      data: { spell_img: s_spell1 },
			      url: '/personlol/champion/spell-img'
			    }).done(res => {
			      console.log(res);
			      spell_img = '';
			      spell_img += '<div class="spell-container">' +
			        '<img class="spell_img" width="40" height="40" src="../resources/' + res[0].spell_icon + '" alt="이미지">' +
			        '<div class="spell_tooltip">' +
			        '<div><span style="font-size: 14px; font-weight: bold; color: yellow;">' + res[0].spell_name + '</span></div>' +
			        '<div>' + res[0].spell_desc + '</div>' +
			        '</div>' +
			        '</div>';
			      $('#spell2').append(spell_img);

			      // 네 번째 AJAX 호출
			      $.ajax({
			        method: 'get',
			        data: { spell_img: s_spell2 },
			        url: '/personlol/champion/spell-img'
			      }).done(res => {
			        console.log(res);
			        spell_img = '';
			        spell_img += '<div class="spell-container">' +
			          '<img class="spell_img" width="40" height="40" src="../resources/' + res[0].spell_icon + '" alt="이미지">' +
			          '<div class="spell_tooltip">' +
			          '<div><span style="font-size: 14px; font-weight: bold; color: yellow;">' + res[0].spell_name + '</span></div>' +
			          '<div>' + res[0].spell_desc + '</div>' +
			          '</div>' +
			          '</div>';
			        $('#spell2').append(spell_img);
			        
			        $('#spell1').append(rate_span1);
					$('#spell2').append(rate_span2);
					
					$('#spell1').append(win_span1);
					$('#spell2').append(win_span2);
					
			      }).fail(err => {
			        console.error(err);
			      });
			    }).fail(err => {
			      console.error(err);
			    });
			  }).fail(err => {
			    console.error(err);
			  });
			}).fail(err => {
			  console.error(err);
			});
		
		
		


		
		
	}).fail(err =>{
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
	
	
	
	//룬 정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id,champ_lane:champ_lane},
		url:'/personlol/champion/rune'
	}).done(res => {
		
		
		console.log("챔피언 가져온 룬")
		console.log(res)
		console.log("챔피언 가져온 룬")
		
		$.each(res, function (i,rune) {
			
			let runetype = rune.runetype_core
			let core_main = rune.core_mainrune
			let core_rune1 = rune.core_rune1
			let core_rune2 = rune.core_rune2
			let core_rune3 = rune.core_rune3
			
			let runesub = rune.runetype_sub
			let sub_rune1 = rune.sub_rune1
			let sub_rune2 = rune.sub_rune2
			
			let shard_defence = rune.shard_defence
			let shard_flex = rune.shard_flex
			let shard_offense = rune.shard_offense
			
			
			
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
				
				if (res.length == 12){
					
					rune_img_part1=''
					for (var i = 0; i < 3; i++) {
		    		let rune = res[i];
		    		rune_img_part1 += 
		    		'<div class="col rune_img"><img class="rune_img" width="30" height="30" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"> <div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';

					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 3; i < 6; i++) {
			    	let rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 6; i < 9; i++) {
			    	let rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 9; i < 12; i++) {
			    	let rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					let runetypeCoremain = $('img[data-rune-key="' + core_main + '"]');
					let runetypeCorerune1 = $('img[data-rune-key="' + core_rune1 + '"]');
					let runetypeCorerune2 = $('img[data-rune-key="' + core_rune2 + '"]');
					let runetypeCorerune3 = $('img[data-rune-key="' + core_rune3 + '"]');
						
					runetypeCoremain[0].style.filter ="none"
					runetypeCorerune1[0].style.filter ="none"
					runetypeCorerune2[0].style.filter ="none"
					runetypeCorerune3[0].style.filter ="none"
				}else{
					rune_img_part1=''
					for (var i = 0; i < 4; i++) {
		    		let rune = res[i];
		    		rune_img_part1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
		    		
					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 4; i < 7; i++) {
			    	let rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 7; i < 10; i++) {
			    	let rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 10; i < res.length; i++) {
			    	let rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					let runetypeCoremain = $('img[data-rune-key="' + core_main + '"]');
					let runetypeCorerune1 = $('img[data-rune-key="' + core_rune1 + '"]');
					let runetypeCorerune2 = $('img[data-rune-key="' + core_rune2 + '"]');
					let runetypeCorerune3 = $('img[data-rune-key="' + core_rune3 + '"]');
						
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
			    	let rune = res[i];
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
				    	let rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 6; i < 9; i++) {
				    	let rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 9; i < 12; i++) {
				    	let rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'
			    		+ rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
								
						let runetypeSubune1 = $('img[data-rune-key="' + sub_rune1 + '"]');
						let runetypeSubune2 = $('img[data-rune-key="' + sub_rune2 + '"]');

						runetypeSubune1[0].style.filter ="none";
						runetypeSubune2[0].style.filter ="none";
					}else{
						rune_img_sub1=''
						for (var i = 4; i < 7; i++) {
				    	let rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 7; i < 10; i++) {
				    	let rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name + '</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 10; i < res.length; i++) {
				    	let rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
							
							
							
						let runetypeSubune1 = $('img[data-rune-key="' + sub_rune1 + '"]');
						let runetypeSubune2 = $('img[data-rune-key="' + sub_rune2 + '"]');

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
		    		'" data-rune-key2="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
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
		    		
		    		let shard_defence = rune.shard_defence
					let shard_flex = rune.shard_flex
					let shard_offense = rune.shard_offense
					
		    		
					//shard_defence shard_flex
					let runetypeShard1 = $('img[data-rune-key1="' + shard_offense + '"]');
					let runetypeShard2 = $('img[data-rune-key2="' + shard_flex + '"]');
					let runetypeShard3 = $('img[data-rune-key3="' + shard_defence + '"]');
					
					
					
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
		  '<img width="25" height="25" src="../resources/dd/img/rune/style/'+res[0].runetype_sub+'.png"></div>'+
		  '<div class="rune_rate"><span>'+res[0].game_count+'<br>'+res[0].pick_rate+'<br>'+res[0].win_rate+'</span></div>'
		  
		}
		$('#change_rune1').html(change_rune1)
		
		
		let change_rune2 = '';
		if (res[1] && res[1].runetype_core != undefined && res[1].runetype_core != null && res[1].runetype_core != '') {
			change_rune2 = '<div class="second_rune"><img width="25" height="25" src="../resources/dd/img/rune/style/' + res[1].runetype_core + '.png">'+
			'<img width="60" height="60" src="../resources/dd/img/rune/perk/'+res[1].core_mainrune+'.png">'+
			'<img width="25" height="25" src="../resources/dd/img/rune/style/'+res[1].runetype_sub+'.png"></div>'+
			'<div class="rune_rate"><span>'+res[0].game_count+'<br>'+res[0].pick_rate+'<br>'+res[0].win_rate+'</span></div>'
			
		}
		$('#change_rune2').html(change_rune2)
		
		$('#change_rune1').click(function() {
			let f_runetype = res[0].runetype_core
			let f_core_main = res[0].core_mainrune
			let f_core_rune1 = res[0].core_rune1
			let f_core_rune2 = res[0].core_rune2
			let f_core_rune3 = res[0].core_rune3
			
			let f_runesub = res[0].runetype_sub
			let f_sub_rune1 = res[0].sub_rune1
			let f_sub_rune2 = res[0].sub_rune2
			
			let f_shard_defence = res[0].shard_defence
			let f_shard_flex = res[0].shard_flex
			let f_shard_offense = res[0].shard_offense
			
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

						f_runetypeSubune1[0].style.filter ="none";
						f_runetypeSubune2[0].style.filter ="none";
					}
					
						
					
				}).fail(err=>{
					
				})
				
				//파편 이미지 목록
				$.ajax({
					method:'get',
					url:'/personlol/champion/rune/shard',
					
				}).done(res => {
					console.log("파편이미지 여기 에러남 확인************")
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
					var f_runetypeShard1 = $('img[data-rune-key1="' + f_shard_offense + '"]');
					var f_runetypeShard2 = $('img[data-rune-key2="' + f_shard_flex + '"]');
					var f_runetypeShard3 = $('img[data-rune-key3="' + f_shard_defence + '"]');
					
					console.log("수정작업 에러남 여기")
				
					f_runetypeShard1[0].style.filter ="none";
					f_runetypeShard2[0].style.filter ="none";
					f_runetypeShard3[0].style.filter ="none";
					
				}).fail(err =>{
					
				})
			
			
		})//클릭 이벤트
		
		$('#change_rune2').click(function() {
			
	
			let s_runetype = res[1].runetype_core
			let s_core_main = res[1].core_mainrune
			let s_core_rune1 = res[1].core_rune1
			let s_core_rune2 = res[1].core_rune2
			let s_core_rune3 = res[1].core_rune3
			
			let s_runesub = res[1].runetype_sub
			let s_sub_rune1 = res[1].sub_rune1
			let s_sub_rune2 = res[1].sub_rune2
			
			let s_shard_defence = res[1].shard_defence
			let s_shard_flex = res[1].shard_flex
			let s_shard_offense = res[1].shard_offense
			
			
			//메인룬타입
			$.ajax({
				method:'get',
				url:'/personlol/champion/rune/main-rune',
				data:{main_rune:s_runetype}
			}).done(res => {
				main_img=''
				for (var i = 0; i < res.length; i++) {
	    		let rune = res[i];
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
		    		let rune = res[i];
		    		rune_img_part1 += 
		    		'<div class="col rune_img"><img class="rune_img" width="30" height="30" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"> <div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';

					}
					$('#core_rune1').html(rune_img_part1)
						
						
					rune_img_part2=''
					for (var i = 3; i < 6; i++) {
			    	let rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 6; i < 9; i++) {
			    	let rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 9; i < 12; i++) {
			    	let rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					let s_runetypeCoremain = $('img[data-rune-key="' + s_core_main + '"]');
					let s_runetypeCorerune1 = $('img[data-rune-key="' + s_core_rune1 + '"]');
					let s_runetypeCorerune2 = $('img[data-rune-key="' + s_core_rune2 + '"]');
					let s_runetypeCorerune3 = $('img[data-rune-key="' + s_core_rune3 + '"]');
						
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
			    	let rune = res[i];
			    	rune_img_part2  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune2').html(rune_img_part2)
						
					rune_img_part3=''
					for (var i = 7; i < 10; i++) {
			    	let rune = res[i];
			    	rune_img_part3  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune3').html(rune_img_part3)
						
					rune_img_part4=''
					for (var i = 10; i < res.length; i++) {
			    	let rune = res[i];
			    	rune_img_part4  += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
		    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
					}
					$('#core_rune4').html(rune_img_part4)
						
					let s_runetypeCoremain = $('img[data-rune-key="' + s_core_main + '"]');
					let s_runetypeCorerune1 = $('img[data-rune-key="' + s_core_rune1 + '"]');
					let s_runetypeCorerune2 = $('img[data-rune-key="' + s_core_rune2 + '"]');
					let s_runetypeCorerune3 = $('img[data-rune-key="' + s_core_rune3 + '"]');
						
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
			    	let rune = res[i];
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
				    	let rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 6; i < 9; i++) {
				    	let rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 9; i < 12; i++) {
				    	let rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'
			    		+ rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
								
						let s_runetypeSubune1 = $('img[data-rune-key="' + s_sub_rune1 + '"]');
						let s_runetypeSubune2 = $('img[data-rune-key="' + s_sub_rune2 + '"]');

						s_runetypeSubune1[0].style.filter ="none";
						s_runetypeSubune2[0].style.filter ="none";
					}else{
						rune_img_sub1=''
						for (var i = 4; i < 7; i++) {
				    	let rune = res[i];
				    	rune_img_sub1 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune1').html(rune_img_sub1)
							
						rune_img_sub2=''
						for (var i = 7; i < 10; i++) {
				    	let rune = res[i];
				    	rune_img_sub2 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name + '</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune2').html(rune_img_sub2)
							
						rune_img_sub3=''
						for (var i = 10; i < res.length; i++) {
				    	let rune = res[i];
				    	rune_img_sub3 += '<div class="col rune_img"><img class="rune_img" width="40" height="40" src="../resources/' + rune.rune_icon + 
			    		'" data-rune-key="'+ rune.rune_id +'" style="filter: grayscale(1)"><div class="rune_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+ 
			    		rune.rune_name +'</span><div class="rune_longdesc">'+rune.rune_longdesc+'</div></div></div>';
						}
						$('#sub_rune3').html(rune_img_sub3)
							
							
							
						let s_runetypeSubune1 = $('img[data-rune-key="' + s_sub_rune1 + '"]');
						let s_runetypeSubune2 = $('img[data-rune-key="' + s_sub_rune2 + '"]');

						s_runetypeSubune1[0].style.filter ="none";
						s_runetypeSubune2[0].style.filter ="none";
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
		    		'" data-rune-key2="'+ res[2].runeshard_id +'" style="filter: grayscale(1)"><div class="runetype_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
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
					

					
					let s_runetypeShard1 = $('img[data-rune-key1="' + s_shard_offense + '"]');
					let s_runetypeShard2 = $('img[data-rune-key2="' + s_shard_flex + '"]');
					let s_runetypeShard3 = $('img[data-rune-key3="' + s_shard_defence + '"]');
				
					
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
		data:{champ_id:champ_id,champ_lane:champ_lane},
		url:'/personlol/champion/skill-tree'
	}).done(res => {
		/* console.log(res)
		console.log(res.length) */
		
			const sBuild = res[0].skill_build
			const result = sBuild.substring(1,44)
			const arr = result.split(", ")
						

			
			
			for (i=0; i<6;i++) {				
				if (arr[i] == 1) {
					s_img =	'<div class="skill-container">'+ 
							'<img class="skill_img" width="40" height="40" src="../resources/'+res[2].skill_icon+'" alt="이미지"> &nbsp'+
							'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
							res[2].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[2].skill_cooldown+'</div><div>'+
							'스킬 마나소모량: '+res[2].skill_cost+'</div><div>'+'스킬 범위: '+res[2].skill_range+'</div>'+'<div>'+res[2].skill_desc+
							'</div><div>'+res[2].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 2) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[4].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[4].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[4].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[4].skill_cost+'</div><div>'+'스킬 범위: '+res[4].skill_range+'</div>'+'<div>'+res[4].skill_desc+
					'</div><div>'+res[4].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 3) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[0].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[0].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[0].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[0].skill_cost+'</div><div>'+'스킬 범위: '+res[0].skill_range+'</div>'+'<div>'+res[0].skill_desc+
					'</div><div>'+res[0].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 4) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[3].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[3].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[3].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[3].skill_cost+'</div><div>'+'스킬 범위: '+res[3].skill_range+'</div>'+'<div>'+res[3].skill_desc+
					'</div><div>'+res[3].skill_tooltip+'</div></div></div>';
				}    
				$('#skill_tree1').append(s_img)
			}
			
			for (i=6; i<12;i++) {				
				if (arr[i] == 1) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[2].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[2].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[2].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[2].skill_cost+'</div><div>'+'스킬 범위: '+res[2].skill_range+'</div>'+'<div>'+res[2].skill_desc+
					'</div><div>'+res[2].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 2) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[4].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[4].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[4].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[4].skill_cost+'</div><div>'+'스킬 범위: '+res[4].skill_range+'</div>'+'<div>'+res[4].skill_desc+
					'</div><div>'+res[4].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 3) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[0].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[0].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[0].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[0].skill_cost+'</div><div>'+'스킬 범위: '+res[0].skill_range+'</div>'+'<div>'+res[0].skill_desc+
					'</div><div>'+res[0].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 4) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[3].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[3].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[3].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[3].skill_cost+'</div><div>'+'스킬 범위: '+res[3].skill_range+'</div>'+'<div>'+res[3].skill_desc+
					'</div><div>'+res[3].skill_tooltip+'</div></div></div>';
				}    
				$('#skill_tree2').append(s_img)
			}
			
			for (i=12; i<15;i++) {				
				if (arr[i] == 1) {
					s_img =  '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[2].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[2].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[2].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[2].skill_cost+'</div><div>'+'스킬 범위: '+res[2].skill_range+'</div>'+'<div>'+res[2].skill_desc+
					'</div><div>'+res[2].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 2) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[4].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[4].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[4].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[4].skill_cost+'</div><div>'+'스킬 범위: '+res[4].skill_range+'</div>'+'<div>'+res[4].skill_desc+
					'</div><div>'+res[4].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 3) {
					s_img = s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[0].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[0].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[0].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[0].skill_cost+'</div><div>'+'스킬 범위: '+res[0].skill_range+'</div>'+'<div>'+res[0].skill_desc+
					'</div><div>'+res[0].skill_tooltip+'</div></div></div>';
				}else if (arr[i] == 4) {
					s_img = '<div class="skill-container">'+ 
					'<img class="skill_img" width="40" height="40" src="../resources/'+res[3].skill_icon+'" alt="이미지"> &nbsp'+
					'<div class="tooltip">'+'<div><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
					res[3].skill_name+'</span></div>'+'<div>'+'스킬 재사용 대기시간(초): '+res[3].skill_cooldown+'</div><div>'+
					'스킬 마나소모량: '+res[3].skill_cost+'</div><div>'+'스킬 범위: '+res[3].skill_range+'</div>'+'<div>'+res[3].skill_desc+
					'</div><div>'+res[3].skill_tooltip+'</div></div></div>';
				}    
				$('#skill_tree3').append(s_img)
			}
			
			$('#sk_count').html("픽률: "+res[0].pick_rate +' , 게임수: ' +res[0].game_count )
			$('#sk_win').html("승률: " + res[0].win_rate)
		
		
	}).fail(err => {
		
	})//스킬 트리

		
	   
		//아이템 트리
	   $.ajax({
	      method:'get',
	      data:{champ_id:champ_id,champ_lane:champ_lane},
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
	            	
	              	item1_img +='<div class="f_item">'+
	                  '<img class="item_img" width="40" height="40" src="../resources/'+i_img.item_icon+
	                  '" alt="이미지"> <div class="item_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
	                  i_img.item_name+'</span><div class="item_longdesc">'+i_img.item_desc+'</div><div>'+i_img.item_plaintext
	                  '</div></div></div>'
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
	            	   '<div class="f_item">'+
		                  '<img class="item_img" width="40" height="40" src="../resources/'+i_img.item_icon+
		                  '" alt="이미지"> <div class="item_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		                  i_img.item_name+'</span><div class="item_longdesc">'+i_img.item_desc+'</div><div>'+i_img.item_plaintext
		                  '</div></div></div>'
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
	            	   '<div class="f_item">'+
		                  '<img class="item_img" width="40" height="40" src="../resources/'+i_img.item_icon+
		                  '" alt="이미지"> <div class="item_tooltip"><span style="font-size: 14px; font-weight: bold; color: yellow;">'+
		                  i_img.item_name+'</span><div class="item_longdesc">'+i_img.item_desc+'</div><div>'+i_img.item_plaintext
		                  '</div></div></div>'
	            })
	            $('#item3').append(item3_img)
	         }).fail(err => {
	            
	         })//아이템 이미지 3
	      })
	      
	      
	   }).fail(err => {
	      
	   })//아이템 트리 
			

 });//ready 끝
	 
 </script>
 
 </body>
 </html>
 
    
