<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>matchup</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!--css 파일명 수정해야함-->
<link rel="stylesheet" type="text/css"
	href="../resources/css/champlist.css">
<style>
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
/*스펠 호버시 툴팁*/
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

/*상대챔프 이미지 왼쪽정렬*/
.s_img {
    text-align: right;
}

.div_info{
	text-align: center;
}
</style>

</head>

<body>
	<!--헤더부분-->
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
	<!--헤더부분 끝-->
	
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
    
    <div class="row">
    	<div class="col">
    		<div class="row">
    			<div class="col">
    				<div class="row">
    					<div class="col" id="champ_img">
    						<div class="row">
    							<div class="col" id="champ_img1">1</div>
    							<div class="col" id="champ_img2">2</div>
    						</div>
    					</div>
    				</div>
    				
    				<div class="row">
    					<div class="col" id="progressbar"></div>
    				</div>
    				
    				<div class="row">
    					<div class="col" >
    					
    						<div class="row">
    							<div class="col div_info">kda</div>
    						</div>
    						<div class="row">
    							<div class="col div_info" id="kda_progress">kda그래스바</div>
    						</div>
    						
    						<div class="row">
    							<div class="col div_info">킬관여율</div>
    						</div>
    						<div class="row">
    							<div class="col div_info" id="killpart_progress">킬관여율 그래스바</div>
    						</div>
    						
    						<div class="row">
    							<div class="col div_info">가한 피해량</div>
    						</div>
    						<div class="row">
    							<div class="col" id="damage_progress">가한 피해량 그래스바</div>
    						</div>
    						
    						<div class="row">
    							<div class="col div_info">승률</div>
    						</div>
    						<div class="row">
    							<div class="col" id="win_progress">승률 그래스바</div>
    						</div>
    						
    						<div class="row">
    							<div class="col div_info">포지션 승률</div>
    						</div>
    						<div class="row">
    							<div class="col" id="pwin_progress">포지션 승률그래스바</div>
    						</div>
    						
    						<div class="row">
    							<div class="col div_info">포지션 픽률</div>
    						</div>
    						<div class="row">
    							<div class="col" id="ppick_progress">포지션 픽률 그래스바</div>
    						</div>
    						
    						<div class="row">
    							<div class="col div_info">포지션 벤률</div>
    						</div>
    						
    						<div class="row">
    							<div class="col" id="pban_progress">포지션 벤률그래스바</div>
    						</div>
    						
    						
    					</div>
    				</div>
    				
 
    			</div>
    			
    		</div>
    	</div>
    	<div class="col col-sm-4">2222</div>
    </div>
    
 </div class="container">
 
</body>

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
	 const match_champ = getQueryString('match_champ')
	 
	 console.log(champ_lane)	 
	 console.log(champ_id)
	 console.log(match_champ)
	 
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
	})//초기정보 끝
	
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
	})//스펠정보 끝
	
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
		
	})//스킬정보 끝
	
	//매치업 챔프들 이미지 이름 갖고오기
	$.ajax({
		method:'get',
		data:{champ_id:champ_id,match_champ:match_champ},
		url:'/personlol/matchup/detail-img'
	}).done(res => {
		console.log("매치업 디테일 이미지")
		console.log(res)
		console.log("매치업 디테일 이미지")
		
		
		champ_img1 =
			'<div class="f_img">'+
			'<img class="icon_img" width="100" height="100" src="../resources/'+res[0].champ_icon +'" alt="이미지">'+
			'<span>'+res[0].champ_name+'</span>'+
			'</div>';
			
		$('#champ_img1').html(champ_img1);
		
		champ_img2 =
			'<div class="s_img">'+
			'<span>'+res[1].champ_name+'</span>'+
			'<img class="icon_img" width="100" height="100" src="../resources/'+res[1].champ_icon +'" alt="이미지">'+
			'</div>';
			
		$('#champ_img2').html(champ_img2);
		
	}).fail(err => {
		console.log(err)
	})//매치업 챔프둘 이미지 끝
	
	
	//매치업 정보
	$.ajax({
		method:'get',
		data:{champ_id:champ_id,champ_lane:champ_lane,match_champ:match_champ},
		url:'/personlol/matchup/detail'
		
	}).done(res => {
		console.log('매치업 디테일')
		console.log(res)
		console.log('매치업 디테일')
		
		match_win='';
		match_kda='';
		match_killpart='';
		match_damage='';
		match_win2='';
		$.each(res, function (i,match) {
			let winRate = parseFloat(match.matchup_win_rate);
			
			//계산을 위한 선언
		    let f_kda = parseFloat(match.kda_x);
		    let s_kda = parseFloat(match.kda_y);
		    
		    let f_killpart = parseFloat(match.killparticipation_x);
		    let s_killpart = parseFloat(match.killparticipation_y);
		    
		    let f_damage = parseFloat(match.total_champ_damage_x);
		    let s_damage = parseFloat(match.total_champ_damage_y);
			
		    
		    let maxKDA = Math.max(f_kda, s_kda); // 더 큰 KDA 값을 maxKDA로 설정

		    let f_kdaWidth = (f_kda / maxKDA) * 100; // 첫 번째 KDA의 너비 계산
		    let s_kdaWidth = (s_kda / maxKDA) * 100; // 두 번째 KDA의 너비 계산
		    
		    //킬관여 계산
		    let maxKillpart = Math.max(f_killpart,s_killpart) 
		    
		    let f_killpartWidth = (f_killpart/maxKillpart)*100;
		    let s_killpartWidth = (s_killpart/maxKillpart)*100;
		    
		    //가한피해량 계산
		    let maxDamage = Math.max(f_damage,s_damage) 
		    
		    let f_damageWidth = (f_damage/maxDamage)*100;
		    let s_damageWidth = (s_damage/maxDamage)*100;
		    
		    
			match_win +=
				'<div class="progress" style="height: 50px;">'+
				'<div class="progress-bar bg-danger" role="progressbar" style="width:'+winRate+'%">'+
				winRate+'%'+'</div>'+
				'<div class="progress-bar bg-info" role="progressbar" style="width:'+(100-winRate)+'%">'+(100-winRate)+'%'+'</div>'+
				'</div>';
			
			match_kda +=
				'<div class="progress" style="height: 25px;">'+
				'<div class="progress-bar bg-danger" role="progressbar" style="width:'+f_kdaWidth+'%">'+
				f_kda+'%'+'</div>'+
				'<div class="progress-bar bg-info" role="progressbar" style="width:'+s_kdaWidth+'%">'+s_kda+'%'+'</div>'+
				'</div>';
			
			match_killpart +=
				'<div class="progress" style="height: 25px;">'+
				'<div class="progress-bar bg-danger" role="progressbar" style="width:'+f_killpartWidth+'%">'+
				f_killpart+'%'+'</div>'+
				'<div class="progress-bar bg-info" role="progressbar" style="width:'+s_killpartWidth+'%">'+
				s_killpart+'%'+'</div>'+
				'</div>';
				
			match_damage +=
				'<div class="progress" style="height: 25px;">'+
				'<div class="progress-bar bg-danger" role="progressbar" style="width:'+f_damageWidth+'%">'+
				f_damage+'</div>'+
				'<div class="progress-bar bg-info" role="progressbar" style="width:'+s_damageWidth+'%">'+
				s_damage+'</div>'+
				'</div>';
			
			match_win2 +=
				'<div class="progress" style="height: 25px;">'+
				'<div class="progress-bar bg-danger" role="progressbar" style="width:'+winRate+'%">'+
				winRate+'%'+'</div>'+
				'<div class="progress-bar bg-info" role="progressbar" style="width:'+(100-winRate)+'%">'+(100-winRate)+'%'+'</div>'+
				'</div>';
				
			
		})
		$('#progressbar').html(match_win)
		$('#kda_progress').html(match_kda)
		$('#killpart_progress').html(match_killpart)
		$('#damage_progress').html(match_damage)
		$('#win_progress').html(match_win2)
		
		
	}).fail(err => {
		
	})//매치업 정보 끝
	
	//매치업 챔피언의 승,픽,벤
	$.ajax({
		method:'get',
		data:{champ_id:champ_id,champ_lane:champ_lane,match_champ:match_champ},
		url:'/personlol/matchup/detail-info'
		
	}).done(res =>{
		
		console.log('챔프 승픽밴 보자~')
		console.log(res)
		console.log('챔프 승픽밴 보자~')
		
		
		
		
		let f_ban_rate = res[0].ban_rate
		let s_ban_rate = res[1].ban_rate
		
		let f_pick_rate = res[0].pick_rate
		let s_pick_rate = res[1].pick_rate
		
		let f_win_rate = res[0].win_rate
		let s_win_rate = res[1].win_rate
		
		//winrate 계산
		let winRate = Math.max(f_win_rate, s_win_rate); 
	    let f_winWidth = (f_win_rate / winRate) * 100; 
	    let s_winWidth = (s_win_rate / winRate) * 100; 
	    
	  	//pickrate 계산
		let pickrate = Math.max(f_pick_rate, s_pick_rate); 
	    let f_pickWidth = (f_pick_rate / pickrate) * 100; 
	    let s_pickWidth = (s_pick_rate / pickrate) * 100; 
	    
	  	//banrate 계산
		let banrate = Math.max(f_ban_rate, s_ban_rate); 
	    let f_banWidth = (f_ban_rate / banrate) * 100; 
	    let s_banWidth = (s_ban_rate / banrate) * 100; 
	    
		
		win_rate = '<div class="progress" style="height: 25px;">'+
		'<div class="progress-bar bg-danger" role="progressbar" style="width:'+f_winWidth+'%">'+
		f_win_rate+'%'+'</div>'+
		'<div class="progress-bar bg-info" role="progressbar" style="width:'+s_winWidth+'%">'+s_win_rate+'%'+'</div>'+
		'</div>';
		
		$('#pwin_progress').html(win_rate);
		
		pick_rate ='<div class="progress" style="height: 25px;">'+
		'<div class="progress-bar bg-danger" role="progressbar" style="width:'+f_pickWidth+'%">'+
		f_pick_rate+'%'+'</div>'+
		'<div class="progress-bar bg-info" role="progressbar" style="width:'+s_pickWidth+'%">'+s_pick_rate+'%'+'</div>'+
		'</div>';
		
		$('#ppick_progress').html(pick_rate);
		
		ban_rate = '<div class="progress" style="height: 25px;">'+
		'<div class="progress-bar bg-danger" role="progressbar" style="width:'+f_banWidth+'%">'+
		f_ban_rate+'%'+'</div>'+
		'<div class="progress-bar bg-info" role="progressbar" style="width:'+s_banWidth+'%">'+s_ban_rate+'%'+'</div>'+
		'</div>';
		
		$('#pban_progress').html(ban_rate);
		
		
	}).fail(err =>{
		console.log(err)
	})//매치업 승,픽,벤 끝
	
	//매치업 상대한 리스트 20까지
	$.ajax({
		method:'get',
		data:{champ_id:champ_id,champ_lane:champ_lane},
		url:'/personlol/matchup/champ-list'
	}).done(res => {
		console.log("확인해보세용")
		console.log(res)
		console.log("확인해보세요")
		
	}).fail(err => {
		
	})
	
	
})//도큐먼트 레디 끝

</script>

</html>