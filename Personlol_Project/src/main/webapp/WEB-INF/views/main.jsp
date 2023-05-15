<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

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
              <input type="text">
              <button type="button">go!</button>
            </div>
            <div class="menu">
              <a href="/personlol/champlist" class="m-col">챔피언분석</a>
              <a href=" " class="m-col">랭킹</a>
              <a href=" " class="m-col">듀오찾기</a>
              <a href=" " class="m-col">사용자분석</a>
              <a href="/personlol/logine" class="m-col login">로그인</a>
            </div>
          </div>
        </nav>
      </div>
    </div  id="generic">

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
            <input>
            <button>전적검색</button>
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

</body>
</html>