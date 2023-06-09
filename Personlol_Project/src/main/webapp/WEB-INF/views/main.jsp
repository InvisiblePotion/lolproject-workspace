<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
            <a href="/personlol/main" class="imgfile"><img src="./resources/img/logotesting.png"></a>
            <div class="search-bar">

              <input class="summoner_name" type="text">
              <button class="gosummonerinfo" type="button">go!</button>
            </div>
            <div class="menu">
              <a href="/personlol/champion/" class="m-col">챔피언분석</a>
              <a href="/personlol/rank" class="m-col">랭킹</a>
              <a href="/personlol/duo/" class="m-col">듀오찾기</a>
              <a href="/personlol/summoner/" class="m-col">사용자분석</a>

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
                  <div><span class="m-col">${sessionScope.id}님 환영합니다!</span></div>
                  <div><span><a href="#" id="logout" class="m-col logout">로그아웃</a></span></div>
                </c:if>
              </div id="loginout">

            </div>
          </div>



        </nav>
      </div>
    </div id="generic">

    <div id="maindiv">

      <div id="m_logo">
        <img
          src="https://opgg-static.akamaized.net/logo/20230414083144.6eb75aa6cdf74acba088a2c108e5a061.png?image=q_auto,f_webp,w_auto&amp;v=1681505802343"
          alt="OP.GG logo (밀리오)" title="밀리오" id=m_log_img>
      </div id="m_logo">

      <div id="searchdiv">
        <div>
          <fieldset>
            <legend>전적 검색</legend>
            <form class="main-search-form">
              <input id="search-input" class="summoner_name main-search"><button
                class="gosummonerinfo main-btn">전적검색</button>
            </form>
          </fieldset>
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
          <div class="line-info top_val">

          </div>

        </div class="m_lane top">

        <div class="m_lane jug">
          <div class="line-info">
            <h2>jug</h2>
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
          <div class="line-info jug_val">

          </div>
        </div class="m_lane jug">

        <div class="m_lane mid">
          <div class="line-info">
            <h2>mid</h2>
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
          <div class="line-info mid_val">

          </div>

        </div class="m_lane mid">

        <div class="m_lane ad">
          <div class="line-info">
            <h2>ad</h2>
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
          <div class="line-info ad_val">

          </div>
        </div class="m_lane ad">

        <div class="m_lane sup">
          <div class="line-info">
            <h2>sup</h2>
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
          <div class="line-info sup_val">

          </div>


        </div class="m_lane ">

      </div id="lanediv">

      <div id="duodiv">
        <div class="duolist">
          <h2>듀오1</h2>
        </div id="duolist">
        <div class="duolist">
          <h2>듀오2</h2>
        </div id="duolist">
        <div class="duolist">
          <h2>듀오3</h2>
        </div id="duolist">

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

	<div id="wrapdiv">

		<div id="generic">
			<div class="area">
				<nav class="bener-container">
					<div class="bener">
						<a href="/personlol/main" class="imgfile"><img
							src="./resources/img/logotesting.png" height="25px"></a>
						<div class="search-bar">

							<input class="summoner_name_search" type="text"
								placeholdr="소환사명 검색....">
							<button class="gosummonerinfo" type="button">go!</button>
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

		<div id="maindiv">

			<div id="m_logo">
				<img
					src="https://opgg-static.akamaized.net/logo/20230414083144.6eb75aa6cdf74acba088a2c108e5a061.png?image=q_auto,f_webp,w_auto&amp;v=1681505802343"
					alt="OP.GG logo (밀리오)" title="밀리오" id=m_log_img>
			</div id="m_logo">

			<div id="searchdiv">
				<div>
					<fieldset>
						<legend>전적 검색</legend>
						<input class="summoner_name">
						<button class="gosummonerinfo">전적검색</button>
					</fieldset>
				</div>
			</div id="searchdiv">

			<div id="lanediv">
				<div class=m_lane>
					<h2>top</h2>
				</div class=m_lane>

				<div class=m_lane>
					<h2>mid</h2>
				</div class=m_lane>

				<div class=m_lane>
					<h2>jungle</h2>
				</div class=m_lane>

				<div class=m_lane>
					<h2>ad</h2>
				</div class=m_lane>

				<div class=m_lane>
					<h2>sup</h2>
				</div class=m_lane>

			</div id="lanediv">

			<div id="duodiv">
				<div class="duolist">
					<h2>듀오1</h2>
				</div id="duolist">
				<div class="duolist">
					<h2>듀오2</h2>
				</div id="duolist">
				<div class="duolist">
					<h2>듀오3</h2>
				</div id="duolist">
			</div id="duodiv">

		</div id="maindiv">

		<footer>
			<div>
				<h2>하단 footer</h2>
			</div>
		</footer>

	</div id="wrapdiv">

	<script>
  $('.gosummonerinfo').click(function() {
	  //siblings = this의 형제중 클래스 묶인거 가져오고 필터로 둘 중 있는거 찾아오기
	  let summoner_name = $(this).siblings('.summoner_name').filter(function() {
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
      method:'get',
      url : '/personlol/user/checkserver',
      data:{"user_lolname":summoner_name}
    }).done(res=>{
      console.log(res);
      if(res == "1"){
    	  location.href = go_url;
      }else if(res == "-999"){
    	  alert("등록되지않은 소환사입니다 다시 입력해주세요")

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
        if (res == "1") {
          location.href = go_url;
        } else if (res == "-999") {
          alert("등록되지않은 소환사입니다 다시 입력해주세요")
        }
      }).fail(err => {
        console.log(err);
      })

    });

    $('#search-input').click(function () {
      let timer;
      let dbSearch = $('#db_search');

      if (dbSearch.length === 0) {
        let make_div = '<div id="db_search" class="search-db">검색어를 입력하여주세요.</div>';
        $('.main-search-form').append(make_div);
        dbSearch = $('#db_search');
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
            $('#search-input').empty();
            $('#searchdiv').css('margin-bottom','300px')
            $('#db_search').css('height','300px')
            for (let i in res) {
              let list = res[i]
              console.log(list);
              let summoner_info = '';
              summoner_info +=
                '<div class ="s_summoner_box"><div class = "summoner_icon"><img class="summoner_icon_img" src="./resources/dd/img/profileicon/' +
                list.summoner_profile + '.png" alt=""></img></div>' +
                '<div class = "s_summoner_name">' + list.summoner_name + '</div>' +
                '<div class = "s_summoner_lv_tier">' + list.summoner_tier + '</div></div>'
              console.log(summoner_info);
              $('#db_search').append(summoner_info);
            }
          }).fail(err => {
            console.log(err);
          })
        }, 1000);
      });
      // $('#search-input').focusout(function () {
      //   $('#searchdiv').css('margin-bottom','100px')
      //   dbSearch.remove();
      // });
    });
  </script>


  <script>

	<script>

    //로그아웃
    $('#logout').click(function () {
      location.href = '/personlol/logout';
      console.log("로그아웃");
      alert("로그아웃");
    })
  </script>

</body>



</html>