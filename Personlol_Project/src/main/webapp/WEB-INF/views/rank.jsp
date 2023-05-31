<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ranking</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/header.css">	
<link rel="stylesheet" href="./resources/css/rank.css">

</head>

<body>
	<div id="generic">
		<div class="area">
			<nav class="bener-container">
				<div class="bener">
					<a href="/personlol/main" class="imgfile"><img
						src="./resources/img/navLogo.png" height="28px" width="100px"></a>
					<div class="search-bar">

						<input class="summoner_name_search" type="text"
							placeholdr="소환사명 검색....">
						<button class="gosummonerinfo2" type="button">go!</button>
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


	<!-- 헤더 다음부분 -->
	<div class="container text-center bcolor">
		<div class="row">
			<div class="col">
				<div class="btn-toolbar justify-content-between" role="toolbar"
					aria-label="Toolbar with button groups">
					<div class="btn-group" role="group" aria-label="First group">
						<button type="button" onclick="getranking(this)" id="get_ch"
							class="btn btn-outline-secondary" value="ch">챌린져</button>
						<button type="button" onclick="getranking(this)" id="get_gm"
							class="btn btn-outline-secondary" value="gm">그랜드마스터</button>
						<button type="button" onclick="getranking(this)" id="get_m"
							class="btn btn-outline-secondary" value="master">마스터</button>

					</div>
					<div class="input-group">
						<div class="input-group-text" id="btnGroupAddon2">Search</div>
						<input type="text" class="form-control"
							placeholder="소환사명 검색..."
							aria-label="Input group example"
							aria-describedby="btnGroupAddon2">
					</div>
				</div>
			</div>


		</div>
		<div class="row">
			<div class="col">
				<div id="main">
					<div id="img"></div>
					<div id="table_list">
						<table class="table table-hover" id="head_table">
							<thead>
								<tr height="25" align="center">
									<td width="50px">랭킹</td>
									<td width="480px">소환사</td>
									<td width="175px">티어</td>
									<td width="175px">LP</td>
								</tr>
							</thead>
						</table>
						<div id="info"></div>
					</div>
				</div>
			</div>

		</div>

	</div class="list-container">
	<div id="pagenum"></div id="pagenum">

	<script>
		//페이지 불러옴과 동시에 실행되는 함수
		getajax('lol_ch', 1)
		highpage('lol_ch')

		//디폴트
		let cur_rank = 'ch'
		
		//버튼 클릭시 실행되는 함수(챌,그마,마 정보 ,page정보)가지고 감
		function getranking(info) {
			cur_rank = info.value
			highpage('lol_' + cur_rank)
			getajax('lol_' + info.value, 1)
		}

		//페이지 번호 눌렀을때 info = page
		function pageclick(info) {
			//페이지 눌렀을때 정보가져오기
			getajax('lol_' + cur_rank, info)
		}

		

		
		
		
		
		
		//페이지 전체 가져오기(몇 페이지 나와야하는지 받아오는 함수)
		function highpage(rank) {
		  $.ajax({
		    method: 'get',
		    url: '/personlol/rank/highpage',
		    data: {
		      'rank': rank
		    }
		  }).done(res => {
		    console.log(res);
		    let pList = '';
		    let startIndex = 0; // 현재 페이지의 시작 인덱스
		    //Math.ceil 소숫점 이하를 반올림하여 가장 가까운 정수로 변환
		    let totalPages = Math.ceil(res / 5); // 전체 페이지 수 (한 페이지에 5개의 번호)
		
		    // 이전 버튼을 클릭했을 때 호출되는 함수
		    function showPreviousNumbers() {
		      if (startIndex >= 5) {
		        startIndex -= 5;
		        fetchPageNumbers();
		      }
		    }
		
		    // 다음 버튼을 클릭했을 때 호출되는 함수
		    function showNextNumbers() {
		      if (startIndex + 5 < res) {
		        startIndex += 5;
		        fetchPageNumbers();
		      }
		    }
		
		    // 페이지 번호를 가져와서 표시하는 함수
		    function fetchPageNumbers() {
		      let endIdx = startIndex + 5; // 현재 페이지의 끝 인덱스
		      if (endIdx > res) {
		        endIdx = res;
		      }
		
		      pList = '';
		      for (let i = startIndex; i < endIdx; i++) {
		        pList += '<div class="page-box"><a href="#" onclick="pageclick(' + (i + 1) + ')">' + (i + 1) + '</a></div>';
		      }
		
		      $('.page-box').remove(); // 기존 페이지 번호 요소 제거
		      $('.prev-button').remove(); // 이전 버튼 요소 제거
		      $('.next-button').remove(); // 다음 버튼 요소 제거
		
		      $('#pagenum').append(pList);
		
		      // 이전 버튼 추가
		      if (startIndex >= 5) {
		        let prevButton = $('<div class="prev-button"><button>이전</button></div>');
		        prevButton.click(showPreviousNumbers);
		        $('#pagenum').prepend(prevButton);
		      }
		
		      // 다음 버튼 추가
		      if (endIdx < res) {
		        let nextButton = $('<div class="next-button"><button>다음</button></div>');
		        nextButton.click(showNextNumbers);
		        $('#pagenum').append(nextButton);
		      }
		    }
		
		    fetchPageNumbers();
		  }).fail(err => {
		    console.log(err);
		  });
		}


		//비동기실행(랭킹정보 가져오는 함수)
		function getajax(rank, page) {
			$.ajax({
				method: 'get',
				url: '/personlol/rank/ranking',
				data: {
					'rank': rank,
					'page': page
				},
			}).done(res => {
				console.log(res);

				let cList = '';
				$.each(res, function (i, r) {
				  cList += '<tr height="25" onclick="window.location.href=\'/personlol/summoner/?summoner_name=' + r.summonerName + '\'">' +
				    '<td width="50px">' + r.ranking + '</td>' +
				    '<td width="480px">' + r.summonerName + '</td>' +
				    '<td width="175px">' + r.tier + '</td>' +
				    '<td width="175px">' + r.leaguePoints + '</td>' +
				    '</tr>'; // 여기서 </table>을 삭제하고 </tr>로 변경
				});
				$('#info').html('<table width="100px" class="table table-hover" id="info_table">' + cList + '</table>'); // 여기서 테이블 전체를 감싸는 태그 추가

			}).fail(err => {
				console.log(res);
			});
		}
	</script>

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