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

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/summonerstat.css">
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


	<!-- 여기까지가 배너입니다. -->
	<div class="container good">
		<div class="row">
			<div class="col">챔피언사진</div>
			<div class="col">소환사 이름</div>
			<div class="col">소환사 육각형 그래프</div>
		</div>
		<div class="row">
			<div class="col">탑 80</div>
			<div class="col">미드 80</div>
		</div>
		<div class="row row-cols-5">
			<div class="col">말파이트</div>
			<div class="col">kills</div>
			<div class="col">Death</div>
			<div class="col">Assists</div>
			<div class="col">cs</div>
			<div class="col">야스오</div>
			<div class="col">kills</div>
			<div class="col">Death</div>
			<div class="col">Assists</div>
			<div class="col">cs</div>
		</div>
		<div class="row">
			<div class="col">무언가 컨텐츠가 들어갈자리</div>
		</div>
		<div class="row">
			<div class="col">그래프 들어갈자리</div>
		</div>
	</div>

	<footer>
		<div>
			<h2>하단 footer</h2>
		</div>
	</footer>



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