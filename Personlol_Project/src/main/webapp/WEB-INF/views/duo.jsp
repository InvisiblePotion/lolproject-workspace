<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css" href="../resources/css/duo.css">


<style>
	/* 모달창 스타일 */
	.modal {
		display: none; /* 모달창을 처음에는 숨김 */
		position: fixed; /* 모달창 위치를 고정 */
		z-index: 1; /* 모달창을 가장 위에 놓음 */
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto; /* 모달창이 스크롤 가능하도록 함 */
		background-color: rgba(0, 0, 0, 0.4); /* 배경색과 투명도 설정 */
	}
	.modal-content {
		background-color: #fefefe; /* 모달창 내용의 배경색 설정 */
		margin: 15% auto; /* 모달창이 화면 중앙에 위치하도록 함 */
		padding: 20px;
		border: 1px solid #888;
		width: 80%; /* 모달창의 너비 설정 */
	}
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	.close:hover,
	.close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
</style>

</head>


<body>
	<!-- 베너 css입니다 -->
	<div id="zero">
		<div class="bener-container">
			<nav class="bener">
				<div class="bener2">
					<a href="/personlol/main" class="imgfile"><img
						src="../resources/img/logotesting.png"></a>
					<div class="search-bar">
						<input class="summoner_name" type="text">
              			<button class="gosummonerinfo" type="button">go!</button>
					</div>
					<div class="menu">
						<a href=" " class="m-col">playerport</a> <a href=" " class="m-col">듀오찾기</a>
						<a href=" " class="m-col">협곡차트</a> <a href=" " class="m-col">멀티서치
							AI</a>
					</div>
				</div>
			</nav>
			<div class="something">
				<a href="fsdf" class="she"> <span size="12" class="saying">personlol
						같이 만들 분 찾아요!</span>
				</a>
			</div>
		</div>
	</div id="zero">
	<!-- 베너 css입니다 -->

	<div id="one">
		<div class="title">
			<span size="48" class="main-text">듀오찾기</span> <span size="12"
				class="sub-text">케미분석으로 나와 가장 잘 맞는 파트너를 찾아보세요!</span>
		</div>
		<div class="lane-bar-container">
			<div class="lane-bar">
				<button class="update">업데이트</button>
				<div class="lane-bar-mid">
					<div class="categori">
						<div class="box1 game">
							<span size="12" class="gametext">모든 큐</span>
						</div>
						<div class="box1 game tier">
							<span size="12" class="gametext">모든 티어</span>
						</div>
					</div>

					<div class="lane-bar-bottom">
						<button type="button" class="box2 all" width="52" height="40">전체</button>
						<button type="button" class="box2 rebox" width="52" height="40">탑</button>
						<button type="button" class="box2 rebox" width="52" height="40">정글</button>
						<button type="button" class="box2 rebox" width="52" height="40">미드</button>
						<button type="button" class="box2 rebox" width="52" height="40">바텀</button>
						<button type="button" class="box2 rebox" width="52" height="40">서폿</button>
					</div>

				</div>

				<div>
					<button type="button" class="myBtn" id="myBtn">글쓰기</button>
					<!-- 모달창 -->
					<div id="myModal" class="modal">
						<!-- 모달창 내용 -->
						<div class="modal-content">
							<span class="close">&times;</span>
							<p>글 작성용 모달입니다.</p>
							<form action="/personlol/duo/insert" method="post" name="insertFrm">
							    <label for="title">제목</label>
							   	<input id="duo_title" name="duo_title">
							    <label for="content">내용</label>
							    <textarea id="duo_content" name="duo_content"></textarea>
							    <button id="commitModal">작성 완료</button>
							</form>
						</div>
					</div>
				</div>
			
			</div>


			<!-- 듀오찾기 전체 블럭 -->
			<div class="main-container">
			<!-- 듀오찾기 블럭 1개 사이즈 x18개 있음 가로 3개 세로 6개 최대 -->
				<c:forEach var="duo" items="${dList2}">
					<div class="main-contents">
						<article class="time-text">
							<span size="11" class="blue-text">${duo.duo_date}</span> 
						</article>
						<h1 size="15" color="text" class="title-text">${duo.duo_title}</h1>
                   		<p size="13" class="p-tag">${duo.duo_content}</p>
						
						<div class="main-bottom">
							<!-- 유저 초상화 -->
							<a href="fdaf" class="user-container"> <!-- <img src="" alt=""> -->
								<div class="lane-img"></div>
								<span size="12" class="user-id">
									<c:set var="userLolName" value="${userInfoMap[duo.duo_ownerid].user_lolname}" />
									<c:out value="${userLolName}" />
								</span>
								<!--  Lory -->
							</a>
							<!-- 주로하는 챔피언 -->
							<ol class="img-container">
								<div class="mini-img img1"></div>
								<div class="mini-img img2"></div>
								<div class="mini-img img3"></div>
							</ol>
						</div>
						
						<div class="main-botton">
						
							<button class="copy-box">
								<span class="user-id">
									<c:if test="${duo.duo_ownerid == loginCheck}">
										<a href="/personlol/duo/delete?duo_id=${duo.duo_id}" id="wh">삭제하기</a>
									</c:if>
								</span>
							</button>
							
							<button class="copy-box">
								<span class="user-id">
									<c:if test="${duo.duo_ownerid != loginCheck}">
										<a href="/personlol/duo/accept/${duo.duo_id}" id="wh">수락하기</a> 
									</c:if>
								</span>
							</button>
						</div>
					</div class="main-contents">
				<!-- 듀오찾기 블럭 1개 사이즈  끝-->
				</c:forEach>
			</div class="main-container">

								
			

			
			</div>
			
			<span size="14" class="main-more span-text">
				<button id="load-more-button">더 보기</button>
			</span>
		
		</div>
		<footer class="footer-container"> </footer>
	</div>
	<script type="text/javascript">
	// 모달창 열기 버튼 클릭 시
	$("#myBtn").click(function() {
		$("#myModal").css("display", "block"); // 모달창을 보이게 함
	});

	// 모달창 닫기 버튼 클릭 시
	$(".close").click(function() {
		$("#myModal").css("display", "none"); // 모달창을 숨김
	});
	
	//업데이트 버튼 클릭 시
	$(".update").click(function() {
		 location.reload();
	});
	
	
	
	$(document).ready(function() {
	    var page = 2; // 추가 게시물을 불러올 때 사용할 페이지 번호 초기화

	    // 더 보기 버튼 클릭 이벤트 처리
	    $("#load-more-button").click(function(e) {
	        e.preventDefault(); //페이지 더보기 클릭 시 리로딩 방지.
	        loadMorePosts();
	    });

	    // 추가 게시물을 가져와서 추가하는 함수
	    function loadMorePosts() {
	        $.ajax({
	            url: "/?page=" + page,
	            method: "GET",
	            success: function(data) {
	                if (data.length > 0) {
	                    // 새로운 게시물을 additional-posts div에 추가합니다
	                    $("#main-container").append(data);

	                    // 다음 불러오기를 위해 페이지 번호 증가
	                    page++;
	                } else {
	                    // 더 이상 불러올 게시물이 없으면 더 보기 버튼 또는 링크를 숨깁니다
	                    $("#load-more-button").hide();

	                }
	            },
	            error: function() {
	                console.log("게시물을 불러오는 중에 오류가 발생했습니다.");
	            }
	        });
	    }
	});
	
	</script>
	
	<script>
		$('.gosummonerinfo').click(function () {
			const summoner_name = $('.summoner_name').val();
			console.log(summoner_name);
			const encoded_name = encodeURIComponent(summoner_name);
			const url = '/personlol/summoner/?summoner_name=' + encoded_name;
			location.href = url;
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