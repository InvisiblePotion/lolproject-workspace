<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 3.6.4 min CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="/resources/js/jquery.serializeObject.js"></script>


<link rel="stylesheet" type="text/css" href="./resources/css/duo.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
</script>

<style>
button {
	background-color: #F9B514;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal .bg {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}

.modalBox {
	position: absolute;
	background-color: #fff;
	width: 800px;
	height: 800px;
	padding: 15px;
}

.modalBox button {
	display: block;
	width: 80px;
	margin: 0 auto;
}

.hidden {
	display: none;
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
					<button type="button" class="openBtn" id="openBtn">글쓰기</button>
					<div class="modal hidden">
						<div class="bg"></div>
						<div class="modalBox">
							<form method="post">
								<input type="text" id="title" name="title" style="width: 40%;"
									placeholder="제목" /> <input type="text" id="content"
									name="content" style="width: 80%;" placeholder="내용" />
								<button id="subBtn" type="button" name="subBtn">등록</button>
							</form>
							<br>
							<button class="closeBtn">✖</button>
						</div>
					</div>
				</div>
			</div>


			<!-- 듀오찾기 전체 블럭 -->
			<div class="main-container">

				<!-- 듀오찾기 블럭 1개 사이즈 x18개 있음 가로 3개 세로 6개 최대 -->
				<div class="main-contents">
					<article class="time-text">
						<span size="11" class="blue-text">1분 전</span> <span size="11"
							class="gray-text">13분 후 만료</span>
					</article>
					<div id="info">
						<table class="table" id="table">
							<tr>
								<th>글번호</th>
								<th>작성일</th>
								<th>글제목</th>
								<th>글내용</th>
							</tr>
						</table>
						<c:forEach var="duo" items="${dList2}">
							<table>
								<tr>
									<td>${duo.duo_id}</td>
									<td>${duo.duo_date}</td>
									<td>${duo.duo_title}</td>
									<td>${duo.duo_content}</td>
									<td><a href="/personlol/duo/delete?duo_id=${duo.duo_id}">Delete</a></td>
								</tr>
							</table>
						</c:forEach>
					</div>
					<%-- <p>${duo.duo_id}</p>
                    <p>${duo.duo_date}</p>
                    <h1 size="15" color="text" class="title-text">${duo.duo_title}</h1>
                    <p size="13" class="p-tag">${duo.duo_content}</p> --%>
					<div class="main-bottom">
						<!-- 유저 초상화 -->
						<a href="fdaf" class="user-container"> <!-- <img src="" alt=""> -->
							<div class="lane-img"></div> <span size="12" class="user-id">Lory</span>
						</a>
						<!-- 주로하는 챔피언 -->
						<ol class="img-container">
							<div class="mini-img img1"></div>
							<div class="mini-img img2"></div>
							<div class="mini-img img3"></div>
						</ol>

						<div class="main-botton">
							<button class="copy-box">
								<span class="user-id">복사하기</span>
							</button>
							<button class="copy-box">
								<span class="user-id">케미보기</span>
							</button>
						</div>
					</div>
				</div>
				<!-- 듀오찾기 블럭 1개 사이즈  끝-->



			</div>
			<span size="14" class="main-more span-text">더보기</span>
		</div>
		<footer class="footer-container"> </footer>
	</div>
	<script type="text/javascript">
	  const open = () => {
	    document.querySelector(".modal").classList.remove("hidden");
	  }
	
	  const close = () => {
	    document.querySelector(".modal").classList.add("hidden");
	  }
	
	  document.querySelector(".openBtn").addEventListener("click", open);
	  document.querySelector(".closeBtn").addEventListener("click", close);
	  document.querySelector(".bg").addEventListener("click", close);
	</script>

	<script type="text/javascript">
		$('#subBtn').click(function() {
			title=$('#title').val()
			content=$('#content').val()
			console.log(title)
			console.log(content)
			$.ajax({
				method: 'post',
				url:'/personlol/duo/duo_write_ajax',
				data:{'duo_ownerid':'aaa99','duo_content':content,'duo_title':title}
			}).done(res => {
				console.log("res"+res);
			}).fail(err => {
				console.log(err)
			})
		})
	</script>
</body>
</html>