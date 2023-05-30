<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>summoner info</title>
<!-- jQuery 3.6.4 min CDN -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/summinfo.css">
</head>

<body>
	<div id="generic">
		<div class="area">
			<nav class="bener-container">
				<div class="bener">
					<a href="/personlol/main" class="imgfile"><img
						src="../resources/img/logotesting.png" height="25px"></a>
					<div class="search-bar">

						<input class="summoner_name_search" type="text"
							placeholdr="소환사명 검색....">
						<button class="gosummonerinfo2" type="button">go!</button>
					</div>
					<div class="menu">
						<a href="/personlol/champion/" class="m-col">챔피언분석</a> <a
							href="/personlol/rank" class="m-col rank">랭킹보기</a> <a
							href="/personlol/duo/" class="m-col">듀오찾기</a> <a
							href="/personlol/summonerstat/" class="m-col">사용자분석</a> <a
							href="/personlol/summoner/" class="m-col">소환사분석</a>


					</div>
					<div class="my-menu">
						<c:choose>
							<c:when test="${sessionScope.id ne null}">
								<a href="/personlol/mypage" class="m-col mypage">마이페이지</a>
							</c:when>
							<c:otherwise>
								<a href="/personlol/logine" class="m-col login">로그인</a>
							</c:otherwise>
						</c:choose>

						<div id="loginout">
							<c:if test="${sessionScope.id ne null}">
								<div class="loggedin-box">
									<span class="m-col loggedin">${sessionScope.id}님 환영합니다!</span>
								</div>
								<div class="logout-box">
									<span><a href="#" id="logout" class="m-col logout">로그아웃</a></span>
								</div>
							</c:if>
						</div id="loginout">
					</div>
				</div>
			</nav>
		</div>
	</div id="generic">
	<!-- 여기까지가 배너입니다. -->
	<div class="area2">
		<div class="summoner-container">
			<div class="summoner">
				<div class="summoner_icon">
					<div class="summoner_level">286</div>
				</div>
				<div class="info">
					<div class="summoner_tier">GOLD</div>
					<div class="summoner_name">감귤해적</div>
					<div></div>
					<div></div>
					<div class="buttons">
						<button class="button">전적 갱신</button>
						<button class="button">티어 그래프</button>
					</div>
					<div class="last-update">
						<div>최근 업데이트: 3시간 전</div>
					</div>
				</div>
			</div>
			<div class="adver">광고창입니다.</div>
		</div>

	</div>
	<div class="nav-bar">
		<!-- <h2>종합</h2> -->
		<ul class="nav-item">
			<li><a href="fdaf" class="nav-button">종합</a></li>
			<li><a href="fdafda" class="nav-button">챔피언</a></li>
			<li><a href="fdafd" class="nav-button">인게임 정보</a></li>
			<div class="c18">
				<div class="header">
					<div>내 실력을 인공지능으로 확인!</div>
					<button class="b15" type="button"></button>
				</div>
			</div>
		</ul>
	</div>
	</div>
	<div class="contents-container">
		<div class="solo-rank">
			<div class="solo-rank-box">
				<div class="header2">솔로랭크</div>
				<div class="tier-img-container">
					<div class="tier-img"></div>
					<div class="tier-info">
						<div class="tier-name">challenger</div>
						<div class="tier-lp">1,789 LP</div>
					</div>
					<div class="win-losses-container">
						<div class="win-losses">190승 180패</div>
						<div class="ratio">승률 62%</div>
					</div>
				</div>
			</div>
			<div class="free-rank-container">
				<div class="free-rank">
					자유랭크 <span>Unranked</span>
				</div>
			</div>
			<div class="mini-rank-container">
				<ul class="mini-rank-ul">
					<li class="total-season"><button class="season-button">전체</button></li>
				</ul>
				<!-- 챔피언 박스 칸 -->
				<div class="champion-container">

					<!-- 챔피언 박스 칸입니다. -->
					<div class="champion-box">
						<div class="face">
							<a href=" " class="face-img"></a>
						</div>
						<div class="box-info">
							<div class="name">라칸</div>
							<div class="cs">cs 34.5 (1.5)</div>
						</div>
						<div class="box-kda">
							<div class="">
								<div class="cuuk">4.31:1 평점</div>
							</div>
							<div class="detail">1.6 / 3.8 / 14.8</div>
						</div>
						<div class="played">
							<div class="persent">73%</div>
							<div class="count">41 게임</div>
						</div>
					</div>
					<!-- 챔피언 박스 칸입니다x8 -->

					<!-- <a href="fafd" class="more">더 보기+다른 시즌 보기</a> -->
				</div>
			</div>
			<!-- 챔피언 박스 칸 -->
			<!-- 최근 승률 칸 입니다. -->
			<div class="recent-container">
				<div class="recent-title-container">
					<div class="recent-title">최근 7일간의 랭크 승률</div>
				</div>
				<div class="header3">
					<div class="pick">챔피언</div>
					<div class="pick2">승률</div>
				</div>
				<ul>
					<!-- 최근 7일간의 랭크 승률 -->
					<li class="header3-li">
						<div class="face">
							<a href=" " class="face-img2"></a>
						</div>
						<div class="box-info">
							<div class="name">라칸</div>
						</div>
						<div class="graph">
							<div class="graph-bar">
								<div class="fill left"></div>
								<div class="text left">5승</div>
								<div class="fill right"></div>
								<div class="text right">2패</div>
							</div>
						</div>
						<div class="winratio">71%</div>
					</li>
					<!-- 최근 7일간의 랭크 승률 -->
				</ul>
			</div class="recent-container">
			<!-- 최근 승률 칸 입니다. -->
			<div class="recent athor-summoner-container">
				<div class="athor-title">같은 팀으로 게임한 소환사들(최근 20게임)</div>
				<table>
					<colgroup>
						<col>
						<col width="60">
						<col width="60">
						<col width="60">
					</colgroup>
					<thead>
						<tr class="tp">
							<th class="th-name" scope="col">소환사</th>
							<th class="tp played" scope="col">게임</th>
							<th class="tp win-lose" scope="col">승-패</th>
							<th class="th-winratio" scope="col">승률</th>
						</tr>
					</thead>
					<!-- tr태그 곱하기 10번입니다. -->
					<tbody class="tdo">
						<!-- 최근 함께한 사람들 -->
						<tr>
							<td class="tp name" scope="col"><a href="  " class="a-tag"><img
									src="" alt="" class="mini-img">닉네임니다</a>
							</th>
							<td class="tp played" scope="col">4
							</th>
							<td class="tp win-lose" scope="col">3-1
							</th>
							<td class="th-winratio" scope="col">75%
							</th>
						</tr>
						<!-- 최근 함께한 사람들 -->
					</tbody>
					<!-- tr태그 곱하기 10번입니다. -->
				</table>
			</div>
		</div>
		<!--오른쪽 문단 -->
		<div class="real main-container">
			<div class="one main">
				<ul>
					<li class="li-first">
						<button class="TOTAL">전체</button>
					</li>
					<li class="li-other">
						<button>솔로랭크</button>
					</li>
					<li class="li-other">
						<button>자유랭크</button>
					</li>
					<li class="li-other"><span> <label class="hidden"
							for="queueType">큐 타입</label> <select id="queueType">
								<option value="TOTAL">큐 타입</option>
								<option value="NORMAL">일반 (비공개 선택)</option>
						</select>
					</span></li>
				</ul>
				<div>
					<div class="ch champ-search">
						<div class="search">
							<input type="text" placeholder="챔피언 검색"> <img src=""
								alt="" class="img2">
						</div>
						<div class="content"></div>
					</div>
				</div>
			</div>
			<div class="two main">
				<div class="status">그래프</div>
				<div class="champions">챔피언들</div>
				<div class="positions">포지션들</div>
			</div>
			<div class="three main">
				<li class="main list">
					<div class="madiv list2">
						<div class="content">
							<div class="game-content">
								<div class="game">
									<div class="type">솔랭</div>
									<div class="time-stamp">
										<div style="position: relative;">4일전</div>
									</div>
									<div class="bar"></div>
									<div class="result">승리</div>
									<div class="length">19분 50초</div>
								</div>
								<div class="sinfo">
									<div class="into">
										<div class="champion">
											<div class="icon">
												<a href="fd"> <img src="" alt=""> <span
													class="champion-level">18</span>
												</a>
											</div>
											<div class="spells">
												<div class="spell">
													<div class="sp">
														<img src="" alt="">
													</div>
												</div>
												<div class="spell">
													<div class="sp">
														<img src="" alt="">
													</div>
												</div>
											</div>
											<div class="runes">
												<div class="rune">
													<div class="sp">
														<img src="" alt="">
													</div>
												</div>
												<div class="rune">
													<div class="sp">
														<img src="" alt="">
													</div>
												</div>
											</div>
										</div>
										<div class="kda">
											<div class="k-d-a">
												<span>20</span>/ <span class="d">8</span>/ <span>27</span>
											</div>
											<div class="ratio">
												<span>5.88:1</span> 평점
											</div>
										</div>
										<div class="status">
											<div class="p-kill">
												<div style="position: relative;">킬관여85%</div>
											</div>
											<div class="ward">제어 와드 0</div>
											<div class="cs">
												<div style="position: relative;">CS 81 (4.1)</div>
											</div>
											<div class="average-tier">
												<div style="position: relative;">Diamond 3</div>
											</div>
										</div>

									</div>
									<div class="intoto">
										<div class="items">
											<ul>
												<li class="first">
													<div>
														<img src="" alt="">
													</div>
												</li>
												<li class="first">
													<div>
														<img src="" alt="">
													</div>
												</li>
												<li class="first">
													<div>
														<img src="" alt="">
													</div>
												</li>
												<li class="first">
													<div>
														<img src="" alt="">
													</div>
												</li>
												<li class="first">
													<div>
														<img src="" alt="">
													</div>
												</li>
												<li class="first">
													<div>
														<img src="" alt="">
													</div>
												</li>
											</ul>
											<div class="ward">
												<div>
													<img src="" alt="">
												</div>
											</div>
										</div>
										<div class="multi-kill">쿼드라킬</div>
									</div>
								</div>
								<div class="participants">
									<ul>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5th">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">자기이름</div>
										</li>
									</ul>
									<ul>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
										<li class="p-5">
											<div class="icon" style="position: relative;">
												<img src="" alt="">
											</div>
											<div class="name">모짜르트</div>
										</li>
									</ul>
									<ul></ul>
								</div>
							</div>
						</div>
						<div class="action">
							<button class="detail2">
								<img src="" alt="">
							</button>
						</div>
					</div>
				</li>

			</div>
			<div class="more2">더보기</div>
		</div>

		<!-- 오른쪽 문단 -->
	</div class="contents-container">

</body>
<script>
    function getQueryString(key) {
        //url 가져오는거
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(key);
    }
    const summoner_name = getQueryString('summoner_name')

    //summoner_name 값 가져오기
    console.log(summoner_name)
    $.ajax({
        method: 'get',
        url: '/personlol/summoner/info',
        data: {
            'summoner_name': summoner_name
        },
        contentType: 'application/json; charset=utf-8'
    }).done(res => {
        let ratio = Math.floor((res.summoner_wins/(res.summoner_wins+res.summoner_losses))*100);
        console.log(res);
    	$('.summoner_tier').html(res.summoner_tier)
        $('.summoner_name').html(summoner_name)
        $('.summoner_level').html(res.summoner_level)
        $('.summoner_icon').html('<img src="../resources/dd/img/profileicon/' + res.summoner_profile +
            '.png" width="100%">');
        $('.tier-name').html(res.summoner_tier)
        $('.win-losses').html(res.summoner_wins + '승 ' +res.summoner_losses+'패 ')
        $('.ratio').html('승률 '+ratio+' %')
        
        //티어별 사진 변경됨 가져오는 값은 대문자. 파일 이름은 소문자
        if(res.summoner_tier === "MASTER"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-master'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "CHELLENGER"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-challenger'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "GRANDMASTER"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-grandmaster'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "PLATINUM"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-platinum'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "DIAMOND"){
             $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-diamond'+
             '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "GOLD"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-gold'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "SILVER"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-silver'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "BRONZE"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-bronze'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }else if(res.summoner_tier === "IRON"){
            $('.tier-img').html('<img src="../resources/ranked-emblem/emblem-iron'+
            '.png"  height="100%" width="100%" class="img-tier">');
        }
        //티어별 사진 변경됨
        
        
    }).fail(err => {
        console.log(err);
    })
</script>
<script>
    $('.gosummonerinfo').click(function () {
        //siblings = this의 형제중 클래스 묶인거 가져오고 필터로 둘 중 있는거 찾아오기
        let summoner_name = $(this).siblings('.summoner_name').filter(function () {
            return $(this).val() !== "";
        }).first().val();

        if (!summoner_name) {
            console.log("검색어가 비어있습니다.");
            return;
        }

        console.log(summoner_name);
        const encoded_name = encodeURIComponent(summoner_name);
        const go_url = '/personlol/summoner/?summoner_name=' + encoded_name;
        $.ajax({
            method: 'get',
            url: '/personlol/user/checkserver',
            data: {
                "user_lolname": summoner_name
            }
        }).done(res => {
            console.log(res);
            if (res == "1") {
                location.href = go_url;
            } else if (res == "-999") {
                alert("등록되지않은 소환사입니다 다시 입력해주세요")
            }
        }).fail(err => {
            console.log(err);
        })

    });
</script>
<script>
    //로그아웃
    $('#logout').click(function () {
        location.href = '/personlol/logout';
        console.log("로그아웃");
        alert("로그아웃");
    })
</script>

<!-- 왼쪽 첫번째 챔피언 박스 -->
<script>
	$.ajax({
	    method: 'get',
	    url: '/personlol/summoner/champion',
	    data: {
	        	'summoner_name': summoner_name 
	    },
	    contentType: 'application/json; charset=utf-8'
	}).done(res => {
		console.log(res)
		
	    $.each(res, function (i, champ) {
	        // KDA 값 가져오기
	        let kda = JSON.parse(champ.KDA);
	        
	        // KDA 값 활용 예시
	        let kills = kda.kills;
	        let deaths = kda.deaths;
	        let assists = kda.assists;
	    	
	        //게시글 왼쪽
	    	let champion_box = $('<div class="champion-box"></div>');
	    	let icon = $('<div class="face"><a href="naver.com" class="face-img"><img src="../resources/'+champ.CHAMP_ICON+'" width="32px"></a></div>');
	    	let name = $('<div class="box-info"><div class="name">'+champ.CHAMP_NAME+'</div></div>');
	    	let kda_box = $('<div class="box-kda"></div>')
	    	let detail = $('<div class="detail">'+kda.kills+' / '+kda.deaths+' / '+kda.assists+'</div>')
	    	kda_box.append(detail);
	    	champion_box.append(icon);
	    	champion_box.append(name);
	    	champion_box.append(kda_box);
	    	$('.champion-container').append(champion_box);
	    });
		

	}).fail(err => {
	    console.log(err);
	})

</script>

<script>
	//게시글 본문
 	$.ajax({
	    method: 'get',
	    url: '/personlol/summoner/main',
	    data: {
	        	'summoner_name': summoner_name 
	    },
	    contentType: 'application/json; charset=utf-8'
	}).done(res => {
		console.log(res)
		console.log('@@@@@@@@@@@@@@')
		
		$.each(res, function (k, champ2){
	        // 컬럼 배열 값 가져오기
	        let champion_data = JSON.parse(champ2.CHAMPION);
	        // 배열속 컬럼 값 활용 예시
 	        let win = champion_data.win;
	        let level = champion_data.champLevel;
			
		   
 	       var totalSeconds = champ2.GAME_DURATION; 
 	       var minutes = Math.floor(totalSeconds / 60);
 	       var seconds = totalSeconds % 60;

 	       var timestamp = champ2.GAME_CREATE_TIME; // 주어진 타임스탬프
 	       var targetDate = new Date(timestamp); // 주어진 타임스탬프를 날짜 객체로 변환

 	       var currentDate = new Date(); // 현재 날짜와 시간을 담은 객체
 	       var timeDiff = currentDate.getTime() - targetDate.getTime(); // 현재 날짜와 주어진 날짜의 차이를 밀리초로 계산

 	       var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24)); // 밀리초를 일(day)로 변환

 	       console.log(daysDiff + "일 전");
	          
	        
	        
		   let result = (win === 1) ? "승리" : "패배";
			
		   let main_list = $('<li class="main list"><div class="madiv list2">'+
				   '<div class="content"><div class="game-content">'+
				   
				   '</div></div>'+
				   '</div></li>')
 		   let game = $('<div class="game">'+
				   		'<div class="type">솔랭</div>'+
				   		'<div class="time-stamp"></div>'+
				   		'<div class="bar"></div>'+
				   		'<div class="result">'+result+'</div>'+
				   '</div>')  

 		   main_list.find('.game-content').append('<div class="game">'+
											   		'<div class="type">솔랭</div>'+
								 '<div class="time-stamp"><div style="position: relative">'+daysDiff+'일 전'+'</div></div>'+
											   		'<div class="time-stamp"></div>'+
											   		'<div class="bar"></div>'+
											   		'<div class="result">'+result+'</div>'+
											   		'<div class="length">'+minutes+'분'+seconds+'초'+'</div>'+
			  									   '</div>');
		   
		   main_list.find('.game-content').append('<div class="sinfo"><div class="into"></div></div>');
		   
 		   let champion = $('<div class="champion">'+
	   							'<div class="icon">'+
				'<a href="http://localhost:8088/personlol/champion/detail?champ_id='+champ2.CHAMP_ID+'">'+
				'<img src="../resources/'+champ2.CHAMP_ICON+'" width="48" height="48">'+
				'<span class="champion-level">'+level+'</span>'+
	   			'</a></div>'+
	   					'<div class="spells">'+
	   						'<div class="spell"><div class="sp">'+'<img src'+
	   						'</div></div>'+
	   					'</div>'+
	   					 '<div class="runes"></div>'+
	   					'</div>'); 
		   
		   
		   
		   
		   main_list.find('.into').append(champion)

		   
		   let item_div = $('<div></div>')
		   
		   $('.three').append(main_list);
		   //game_content까지는 넣어야함
	    });
		
	}).fail(err => {
	    console.log(err);
	}) 
</script>
</html>