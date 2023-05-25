<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
  <meta charset="UTF-8">
  <title>main</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="./resources/css/main.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
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
    }).fail(err=>{
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
  
</body>



</html>