<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


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
						src="./resources/img/logotesting.png"></a>
					<div class="search-bar">
						<input type="text">
						<button type="button">go!</button>
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
							<!-- <span size="12" class="gametext">모든 티어</span> -->
							<select class="form-select" aria-label="Default select example" style="width: 100px">
							  <option selected>티어</option>
							  <option value="CHELLENGER">챌린저</option>
							  <option value="GRANDMASTER">그랜드마스터</option>
							  <option value="MASTER">마스터</option>
							  <option value="PLATINUM">플레티넘</option>
							  <option value="GOLD">골드</option>
							  <option value="SILVER">실버</option>
							  <option value="BRONZE">브론즈</option>
							  <option value="IRON">아이언</option>
							  <option value="Unranked">언랭</option>
							</select>
						</div>
					</div>

					<div class="lane-bar-bottom">
						<button type="button" class="box2 rebox" width="52" height="40" value = "all">전체</button>
						<button type="button" class="box2 rebox" width="52" height="40" id="top" value="top">탑</button>
						<button type="button" class="box2 rebox" width="52" height="40" id="jungle" value="jungle">정글</button>
						<button type="button" class="box2 rebox" width="52" height="40" id="mid" value="mid">미드</button>
						<button type="button" class="box2 rebox" width="52" height="40" id="bottom" value="bottom">바텀</button>
						<button type="button" class="box2 rebox" width="52" height="40" id="support" value="support">서폿</button>
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
						<div id="result1">안녕하세요</div>
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
				<button type ="button" id="load-more-button">더 보기</button>
			</span>
			<p id="result"></p>
		</div>
		<footer class="footer-container"> </footer>
	</div>
	
	<script type="text/javascript">
	
	// 모달창 닫기 버튼 클릭 시
	$(".close").click(function() {
		$("#myModal").css("display", "none"); // 모달창을 숨김
	});
	
	//업데이트 버튼 클릭 시
	$(".update").click(function() {
		
		
	});
	
	
	
	$('#myBtn').click(function() {
	    // 로그인 상태 확인 요청 보내기
	    $.ajax({
	        url: '/personlol/duo/isLoggedIn',
	        type: 'GET',
	        success: function(response) {
	            if (response) {
	                // 로그인 중인 경우에만 동작
	                // AJAX 요청 등 필요한 작업 수행
	                $("#myModal").css("display", "block"); // 모달창을 보이게 함
	                //window.location.href = '/personlol/duo/';
	            } else {
	                alert('로그인 후 글을 작성할 수 있습니다.');
	            }
	        },
	        error: function() {
	            alert('서버 요청 중 오류가 발생했습니다.');
	        }
	    });
	});
	
	
	let page = 1; // 현재 페이지 번호

	
	//게시글 시작
	$(document).ready(function() {
	    // 전체 버튼에 해당하는 값을 전달하여 초기 내용을 가져옵니다.
	    loadContent('all', page, "null");
	});
	
	//박스 클릭시
	$('.box2.rebox').click(function() {
	    const selectedId = $(this).val();
	    // 클릭된 버튼의 내용을 가져옵니다.
	    loadContent(selectedId, page,"null");
	});
	
	
	

	
	
	function loadContent(selectedId, page, tier) {
	    $('.main-container').empty();

	    $.ajax({
	        method: 'get',
	        url: '/personlol/duo/lane',
	        data: { "lane": selectedId, "page": page, "tier":tier},
	        dataType: 'json'
	   
	    }).done((res) => {
	        console.log(selectedId);
	        let div = $('<div></div>');

	        $.each(res, function (i, line) {
	            let mainContents = $('<div class="main-contents"></div>');
	            let date = $('<article class="time-text"><span size="11" class="blue-text">' + new Date(line.DUO_DATE).toLocaleString('en-US', { timeStyle: 'short' }) + '</span></article>');
	            let title = $('<h1 size="15" color="text" class="title-text">' + line.DUO_TITLE + '</h1>');
	            let content = $('<p size="13" class="p-tag">' + line.DUO_CONTENT + '</p>');
	            let resultDiv = $('<div class="result-div"></div>');
	            let userContainer = $('<a href="fdaf" class="user-container"><div class="lane-img"></div><span size="12" class="user-id">' + line.USER_LOLNAME + '</span></a>');
	            let mainBotton = $('<div class="main-botton"></div>');

	            isLoggedIn().then((loggedIn) => {
	                if (loggedIn) {
	                    // 로그인 상태인 경우에만 동작
	                    isLoggedIn().then((loginCheck) => {
	                        if (line.DUO_OWNERID == String(loginCheck)) {
	                            console.log('성공');
	                            let deleteLink = $('<button class="copy-box"><span class="user-id"><a href="/personlol/duo/delete?duo_id=' + line.DUO_ID + '" id="wh">삭제하기</a></span></button>');
	                            mainBotton.append(deleteLink);
	                        } else {
	                            console.log('실패');
	                            let acceptLink = $('<button class="copy-box"><span class="user-id"><a href="/personlol/duo/accept/' + line.DUO_ID + '" id="wh">수락하기</a></span></button>');
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

	                $('.main-container').append(mainContents);
	            });
	        });

	        $('#result1').html(div);

	    }).fail((jqXHR, textStatus, errorThrown) =>  {
	        console.log(jqXHR);
	        console.log(textStatus);
	        console.log(errorThrown);
	        $('#result').html('무언가 잘못되었습니다 히잉... (F12로 개발자 도구 로그를 확인해주세요.)');
	    });
	}
	
	// 더보기(페이징) 버튼 클릭 이벤트 처리
	$('#load-more-button').on('click', function() {
	    page++; // 페이지 번호 증가
	    
	    console.log(page)
	    
	    loadContent("all", page, "null"); // 새로운 페이지 번호로 게시글 로드
	});
	

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
	
	// 셀렉트 옵션
	$('.form-select').change(function() {
	  	const selectTier = $(this).val();
	  	// 선택된 값의 처리
	  	console.log(selectTier)
	  	loadContent("all",page,selectTier)
	});
	
	
	</script>
</body>
</html>