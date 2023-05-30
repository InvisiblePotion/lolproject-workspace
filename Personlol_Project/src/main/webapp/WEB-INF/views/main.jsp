<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/header.css">
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">


</head>

<body>
	<div id="wrapdiv">

		<div id="generic">
			<div class="area">
				<nav class="bener-container">
					<div class="bener">
						<a href="/personlol/main" class="imgfile"><img
							src="./resources/img/navLogo.png" height="28px" width="100px"></a>
						<div class="search-bar">

							<input class="summoner_name summoner_name_search" type="text"
								placeholdr="소환사명 검색....">
							<button class="gosummonerinfo" type="button" id="ggg">go!</button>
						</div>
						<div class="menu">
							<a href="/personlol/champion/" class="m-col">챔피언분석</a> <a
								href="/personlol/rank" class="m-col rank">랭킹보기</a> <a
								href="/personlol/duo/" class="m-col">듀오찾기</a> <a
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

		<div id="maindiv">

			<div id="m_logo">
				<img
					src="./resources/img/mainlogo.png" title="메인로고" id=m_log_img width="50%" >
			</div id="m_logo">

			<div id="searchdiv">
				<div class=>
					<div class="main-search-form">
						<fieldset>
							<!-- <legend>전적 검색</legend> -->
							<input id="search-input" class="summoner_name main-search">
							<button type="button" class="gosummonerinfo main-btn">전적검색</button>
						</fieldset>
					</div>
				</div>
			</div id="searchdiv">

			<div id="lanediv">
				<div class="m_lane top">

					<div class="line-info">
						<h4>TOP</h4>
					</div>

					<!-- 설명 -->
					<div id="table_list">
						<table class="table " id="head_table">
							<thead>
								<tr class="tr_champ" align="center">
									<th width="150px" style="font-size: 12px">챔피언</th>
									<th width="50px" style="font-size: 12px" id="table_tier">티어</th>
								</tr>
							</thead>
						</table>
						<table id="list_table1" class="table "></table>
					</div>

					<!-- for문으로 넣을 곳 자리잡기용 -->
					<div class="line-info top_val"></div>

				</div class="m_lane top">

				<div class="m_lane jug">
					<div class="line-info">
						<h4>Jungle</h4>
					</div>
					<!-- 설명 -->
					<div id="table_list">
						<table class="table " id="head_table">
							<thead>
								<tr class="tr_champ" align="center">
									<th width="150px" style="font-size: 12px">챔피언</th>
									<th width="50px" style="font-size: 12px" id="table_tier">티어</th>
								</tr>
							</thead>
						</table>
						<table id="list_table1" class="table "></table>
					</div>
					<!-- for문으로 넣을 곳 자리잡기용 -->
					<div class="line-info jug_val"></div>
				</div class="m_lane jug">

				<div class="m_lane mid">
					<div class="line-info">
						<h4>Mid</h4>
					</div>

					<!-- 설명 -->
					<div id="table_list">
						<table class="table " id="head_table">
							<thead>
								<tr class="tr_champ" align="center">
									<th width="150px" style="font-size: 12px">챔피언</th>
									<th width="50px" style="font-size: 12px" id="table_tier">티어</th>
								</tr>
							</thead>
						</table>
						<table id="list_table1" class="table "></table>
					</div>
					<!-- for문으로 넣을 곳 자리잡기용 -->
					<div class="line-info mid_val"></div>

				</div class="m_lane mid">

				<div class="m_lane ad">
					<div class="line-info">
						<h4>AD</h4>
					</div>

					<!-- 설명 -->
					<div id="table_list">
						<table class="table " id="head_table">
							<thead>
								<tr class="tr_champ" align="center">
									<th width="150px" style="font-size: 12px">챔피언</th>
									<th width="50px" style="font-size: 12px" id="table_tier">티어</th>
								</tr>
							</thead>
						</table>
						<table id="list_table1" class="table "></table>
					</div>
					<!-- for문으로 넣을 곳 자리잡기용 -->
					<div class="line-info ad_val"></div>
				</div class="m_lane ad">

				<div class="m_lane sup">
					<div class="line-info">
						<h4>Support</h4>
					</div>

					<!-- 설명 -->
					<div id="table_list">
						<table class="table " id="head_table">
							<thead>
								<tr class="tr_champ" align="center">
									<th width="150px" style="font-size: 12px">챔피언</th>
									<th width="50px" style="font-size: 12px" id="table_tier">티어</th>
								</tr>
							</thead>
						</table>
						<table id="list_table1" class="table "></table>
					</div>
					<!-- for문으로 넣을 곳 자리잡기용 -->
					<div class="line-info sup_val"></div>


				</div class="m_lane ">

			</div id="lanediv">

			<div id="duodiv">
				<div class="main_paging back_page">
					<img class="pageing_img" src="./resources/img/backpage.png" alt="">
				</div>
				<div class="duolist-container">
<!-- 					<div class="duolist">
					
					</div id="duolist"> -->
				</div>
				

				<div class="main_paging next_page">
					<img class="pageing_img" src="./resources/img/nextpage.png" alt="">
				</div>

			</div id="duodiv">

		</div id="maindiv">

		<footer>
			<div>
				<h2>하단 footer</h2>
			</div>
		</footer>

	</div id="wrapdiv">

	<script>
    //TOP;
    $.ajax({
      method: 'get',
      url: '/personlol/mainchamp',
      data: {
        'lane': 'TOP'
      }
    }).done(res => {
      let top_img = '';
      $('.top_val').empty();
      for (let i in res) {
        let val = res[i];
        top_img = '<a href="/personlol/champion/detail?champ_id=' + val.champ_id + '&lane=' + val.lane + '">' +
          '<div class="top3"><div class="c_img">' +
          '<img class="champ_img" src="./resources/dd/img/champion/icon/' + val.champ_key + '.png" alt="챔피언 사진">' +
          '</div><div class="c_name top3_name">' + val.champ_name + '</div><div class="c_tier">' + val.pick_rate +
          '</div>' +
          '</div></a>';
        $('.top_val').append(top_img);
      }
    }).fail(err => {
      console.log(err);
    });

    //jug;
    $.ajax({
      method: 'get',
      url: '/personlol/mainchamp',
      data: {
        'lane': 'JUNGLE'
      }
    }).done(res => {
      let top_img = '';
      $('.jug_val').empty();
      for (let i in res) {
        let val = res[i];
        top_img = '<a href="/personlol/champion/detail?champ_id=' + val.champ_id + '&lane=' + val.lane + '">' +
          '<div class="top3"><div class="c_img">' +
          '<img class="champ_img" src="./resources/dd/img/champion/icon/' + val.champ_key + '.png" alt="챔피언 사진">' +
          '</div><div class="c_name top3_name">' + val.champ_name + '</div><div class="c_tier">' + val.pick_rate +
          '</div>' +
          '</div></a>';
        $('.jug_val').append(top_img);
      }
    }).fail(err => {
      console.log(err);
    });

    //mid;
    $.ajax({
      method: 'get',
      url: '/personlol/mainchamp',
      data: {
        'lane': 'MIDDLE'
      }
    }).done(res => {
      let top_img = '';
      $('.mid_val').empty();
      for (let i in res) {
        let val = res[i];
        top_img = '<a href="/personlol/champion/detail?champ_id=' + val.champ_id + '&lane=' + val.lane + '">' +
          '<div class="top3"><div class="c_img">' +
          '<img class="champ_img" src="./resources/dd/img/champion/icon/' + val.champ_key + '.png" alt="챔피언 사진">' +
          '</div><div class="c_name top3_name">' + val.champ_name + '</div><div class="c_tier">' + val.pick_rate +
          '</div>' +
          '</div></a>';
        $('.mid_val').append(top_img);
      }
    }).fail(err => {
      console.log(err);
    });

    //ad;
    $.ajax({
      method: 'get',
      url: '/personlol/mainchamp',
      data: {
        'lane': 'BOTTOM'
      }
    }).done(res => {
      let top_img = '';
      $('.ad_val').empty();
      for (let i in res) {
        let val = res[i];
        top_img = '<a href="/personlol/champion/detail?champ_id=' + val.champ_id + '&lane=' + val.lane + '">' +
          '<div class="top3"><div class="c_img">' +
          '<img class="champ_img" src="./resources/dd/img/champion/icon/' + val.champ_key + '.png" alt="챔피언 사진">' +
          '</div><div class="c_name top3_name">' + val.champ_name + '</div><div class="c_tier">' + val.pick_rate +
          '</div>' +
          '</div></a>';
        $('.ad_val').append(top_img);
      }
    }).fail(err => {
      console.log(err);
    });

    //sup;
    $.ajax({
      method: 'get',
      url: '/personlol/mainchamp',
      data: {
        'lane': 'UTILITY'
      }
    }).done(res => {
      let top_img = '';
      $('.sup_val').empty();
      for (let i in res) {
        let val = res[i];
        top_img = '<a href="/personlol/champion/detail?champ_id=' + val.champ_id + '&lane=' + val.lane + '">' +
          '<div class="top3"><div class="c_img">' +
          '<img class="champ_img" src="./resources/dd/img/champion/icon/' + val.champ_key + '.png" alt="챔피언 사진">' +
          '</div><div class="c_name top3_name">' + val.champ_name + '</div><div class="c_tier">' + val.pick_rate +
          '</div>' +
          '</div></a>';
        $('.sup_val').append(top_img);
      }
    }).fail(err => {
      console.log(err);
    });


    //최신 듀오 리스트 가져오기
    let pageing = 1;
    
    
    $('.next_page').click(function(){
      pageing++;
      console.log("페이징 정보: " + pageing);
      loadDuo(pageing) 
      }
    );
    
    $('.back_page').click(function(){
      pageing--;
      console.log("페이징 정보: "+pageing);
      loadDuo(pageing);
    })


    let keyupActive = true;
    $('.gosummonerinfo').click(function () {
      keyupActive = false
      console.log("작동하니?");
      let summoner_name = $(this).siblings('.summoner_name').filter(function () {
        return $(this).val() !== "";
      }).first().val();

      if (!summoner_name) {
        console.log("검색어가 비어있습니다.");
        alert("검색어가 비어있습니다.");
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
        if (res == "1") {
          location.href = go_url;
        } else if (res == "-999") {
          alert("등록되지 않은 소환사입니다. 다시 입력해주세요.");
          location.href = '/personlol/main'
        }
      }).fail(err => {
        console.log(err);
      });
    });


    $('#search-input').click(function () {
      $(this).val('')

      if (!keyupActive) {
        return
      }

      let timer;
      $('#db_search').remove();
      let dbSearch = $('#db_search')

      if (dbSearch.length === 0) {
        let make_div = '<div id="db_search" class="search-db">검색어를 입력하여주세요.</div>';
        $('.main-search-form').append(make_div);
      }

      $('#search-input').keyup(function () {
        $('#db_search').empty();
        clearTimeout(timer);
        timer = setTimeout(function () {
          let summoner_lolname = $('#search-input').val();
          console.log(summoner_lolname)
          $.ajax({
            method: 'get',
            url: '/personlol/summoner/search-summoner',
            data: {
              'summoner_name': summoner_lolname
            }
          }).done(res => {
            if (res.length === 0) {
              let make_div = '<div id="db_search" class="search-db">검색어를 입력하여주세요.</div>';
              $('.main-search-form').append(make_div);
            }
            $('#search-input').empty();
            $('#searchdiv').css('margin-bottom', '300px')
            $('#db_search').css('height', '300px')
            $('#db_search').empty();
            for (let i in res) {
              let list = res[i]
              console.log(list.summoner_name);
              let summoner_info = '';
              summoner_info += '<a href="/personlol/summoner/?summoner_name=' + list.summoner_name +
                '">' +
                '<div class ="s_summoner_box"><div class = "summoner_icon"><img class="summoner_icon_img" src="./resources/dd/img/profileicon/' +
                list.summoner_profile + '.png" alt=""></img></div>' +
                '<div class = "s_summoner_name">' + list.summoner_name + '</div>' +
                '<div class = "s_summoner_lv_tier">' + list.summoner_tier + '</div></div></a>'
              console.log(summoner_info);
              $('#db_search').append(summoner_info);
            }
          }).fail(err => {
            console.log(err);
          })
        }, 1000);
      });
    });


    // $('#search-input').focusout(function () {
    //   $('#searchdiv').css('margin-bottom', '100px')
    //   $('#db_search').hide();
    // });
    $('#search-input').on('focusout', function (event) {
      let click = $(event.relatedTarget).is('#db_search');
      let a_click = $(event.relatedTarget).is('a');

      if (!click && !a_click) {
        $('#searchdiv').css('margin-bottom', '100px');
        $('#db_search').hide();
      }
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

  <script>
  	let page_num = 1; // 현재 페이지 번호
  	
	$(document).ready(function () {
		loadDuo(page_num);

	});
  	
  	function loadDuo(page_num){
  		  $('.duolist-container').empty();
		  //메인듀오가져오기;
		  $.ajax({
		    method: 'get',
		    url: '/personlol/duo/main_duo',
		    data: {
		      'page_num': page_num
		    }
		  }).done(res => {
			$.each(res, function (i, line) {
				let duolist = $('<div class="duolist"></div>')
				let mainContents = $('<div class="main-contents"></div>');
				let date = $('<article class="time-text"><span size="11" class="blue-text">' + new Date(line.DUO_DATE)
					.toLocaleString('en-US', {
						timeStyle: 'short'
					}) + '</span></article>');
				let title = $('<h1 size="15" color="text" class="title-text">' + line.DUO_TITLE + '</h1>');
				let content = $('<p size="13" class="p-tag">' + line.DUO_CONTENT + '</p>');
				let resultDiv = $('<div class="result-div"></div>');
				let userContainer = $(
					'<a href="fdaf" class="user-container"><div class="lane-img"></div><span size="12" class="user-id">' +
					line.USER_LOLNAME + '</span></a>');
				let mainBotton = $('<div class="main-botton"></div>');
	
				isLoggedIn().then((loggedIn) => {
					if (loggedIn) {
						// 로그인 상태인 경우에만 동작
						isLoggedIn().then((loginCheck) => {
							if (line.DUO_OWNERID == String(loginCheck)) {
								console.log('성공');
								let deleteLink = $(
									'<button class="copy-box"><span class="user-id"><a href="/personlol/duo/delete?duo_id=' +
									line.DUO_ID + '" id="wh">삭제하기</a></span></button>');
								mainBotton.append(deleteLink);
							} else {
								console.log('실패');
								let acceptLink = $(
									'<button class="copy-box"><span class="user-id"><a href="/personlol/duo/request/' +
									line.DUO_ID + '" id="wh">요청하기</a></span></button>');
								mainBotton.append(acceptLink);
							}
						});
					}
	
					resultDiv.append(userContainer);
					mainContents.append(date);
					mainContents.append(title);
					mainContents.append(content);
					mainContents.append(resultDiv);
					mainContents.append(mainBotton);
					
					$('.duolist-container').append(mainContents);
					});
				});
	
				//$('#result1').html(div);
		   
			
		  }).fail(err => {
		    console.log(err);
		  });
  	}
  	
  	
	function isLoggedIn() {
		// 서버로부터 세션 정보를 전달받아 로그인 상태를 확인하는 함수
		// 로그인 상태인 경우 Promise를 resolve하고, 로그아웃 상태인 경우 Promise를 reject합니다.
		return new Promise((resolve, reject) => {
			$.ajax({
				method: 'get',
				url: '/personlol/duo/check-login-status', // 서버에서 세션 상태를 확인하는 API 엔드포인트
				async: true, // 비동기적으로 요청 처리
				success: function (response) {
					var loggedIn = response.loggedIn;
					var loginCheck = response.loginCheck; // loginCheck 변수를 선언하여 값을 받아옴
					console.log(loginCheck);
					resolve(loginCheck);
				},
				error: function (error) {
					console.log(error);
					reject(error);
				}
			});
		});
	}
  </script>

</body>

</html>