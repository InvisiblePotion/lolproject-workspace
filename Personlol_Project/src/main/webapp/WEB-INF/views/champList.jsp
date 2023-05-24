<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>champ list</title>

	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/champlist.css">

	<style type="text/css">
		.ul-group {
			padding: 0px;
		}
	</style>
</head>
<!-- 여기까지가 헤더!!!!!!!!!! -->
<div id="generic">
	<div class="area">
		<nav class="bener-container">
			<div class="bener">
				<a href="/personlol/main" class="imgfile"><img src="../resources/img/logotesting.png"></a>
				<div class="search-bar">
					<input class="summoner_name" type="text">
					<button class="gosummonerinfo" type="button">go!</button>
				</div>
				<div class="menu">
					<a href="/personlol/champion/" class="m-col">챔피언분석</a>
					<a href="/personlol/rank" class="m-col">랭킹</a>
					<a href="/personlol/duo/" class="m-col">듀오찾기</a>
					<a href=" " class="m-col">사용자분석</a>

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
</div>
<!-- 여기까지가 헤더!!!!!!! -->

<div class="container text-center">
	<div class="row">
		<div class='col'>
			<div class="search-container">
				<input type="text" class="search-summoner">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col" id="col1">
			<div id="btn-group1" class="btn-group" role="group" aria-label="Basic outlined example">
				<input type="button" class="btn btn-outline-primary 1" value="TOP">
				<input type="button" class="btn btn-outline-primary 1" value="JUNGLE">
				<input type="button" class="btn btn-outline-primary 1" value="MIDDLE">
				<input type="button" class="btn btn-outline-primary 1" value="BOTTOM">
				<input type="button" class="btn btn-outline-primary 1" value="UTILITY">
			</div>
		</div>
	</div class="row">

	<div class="row">

		<div class="col">
			<div class="search-container">
				<input type="text" class="search-champ" placeholder="챔피언 검색" id="search-champ">
			</div>
			<div class="btn-group" role="group" aria-label="Basic outlined example">
				<button type="button" class="btn btn-light" id="all_img">
					<img src="" alt="all" />
				</button>
				<button type="button" class="btn btn-light" id="top_img">
					<img src="" alt="Top" />
				</button>
				<button type="button" class="btn btn-light" id="jug_img">
					<img src="" alt="Jug" />
				</button>
				<button type="button" class="btn btn-light" id="mid_img">
					<img src="" alt="Mid" />
				</button>
				<button type="button" class="btn btn-light" id="bot_img">
					<img src="" alt="Bot" />
				</button>
				<button type="button" class="btn btn-light" id="util_img">
					<img src="" alt="Sup" />
				</button>
				<button type="button" class="btn btn-light" id="lote_img">
					<img src="" alt="lote" />
				</button>
			</div>
			<nav class="img-container">
				<ul class="ul-group">

				</ul>
			</nav>
		</div>

		<div class="col">
			<div id="table_list">
				<table class="table " id="head_table">
					<thead>
						<tr align="center">
							<th width="100px" style="font-size: 12px">번호</th>
							<th width="100px" style="font-size: 12px">챔피언</th>
							<th width="100px" style="font-size: 12px" id="table_tier">티어</th>
							<th width="100px" style="font-size: 12px" id="table_win_rate">승률</th>
							<th width="100px" style="font-size: 12px" id="table_pick_rate">픽률</th>
							<th width="100px" style="font-size: 12px" id="table_ban_rate">밴률</th>
							<th width="100px" style="font-size: 12px" id="table_counter">카운터</th>
						</tr>
					</thead>

				</table>
				<table id="list_table1" class="table "></table>

			</div>

		</div>
	</div class="row">



</div class="container text-center">


<script>
	$(document).ready(function () {
		/*아이콘 부분*/
		$.ajax({
			method: 'get',
			url: '/personlol/champimg',
		}).done(res => {
			console.log(res)
			/*아이콘 띄우기  */
			let icon_img = ''
			$.each(res, function (i, img) {
				icon_img +=
					'<a href="/personlol/champion/detail?champ_id=' + img.champ_id + '">' +
					'<img class="icon_img" width="70" height="70" src="../resources/' + img.champ_icon + '" alt="이미지">'
			})
			$('.ul-group').html(icon_img);
		}).fail(err => {
			console.log(err)
		}) //



		$('#all_img').click(function () {
			$.ajax({
				method: 'get',
				data: {
					champ_icon: 'champ_icon'
				},
				url: '/personlol/champimg',
			}).done(res => {
				console.log(res)
				/*아이콘 띄우기  */
				let icon_img = ''
				$.each(res, function (i, img) {
					icon_img += 
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="70" height="70" src="../resources/' + img.champ_icon + '" alt="이미지">'
				})
				$('.ul-group').html(icon_img);
			}).fail(err => {
				console.log(err)
			})
		}) //

		$('#top_img').click(function () {
			$.ajax({
				method: 'get',
				data: {
					lane: 'TOP'
				},
				url: '/personlol/champimg-top',
			}).done(res => {
				console.log(res)
				let top_img = ''
				$.each(res, function (i, img) {
					top_img += 
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="70" height="70" src="../resources/' + img.champ_icon +
						'" alt="이미지">'
				})
				$('.ul-group').html(top_img);

			}).fail(err => {
				console.log(err)
			})
		}) //

		$('#jug_img').click(function () {
			$.ajax({
				method: 'get',
				data: {
					lane: 'JUNGLE'
				},
				url: '/personlol/champimg-jug',
			}).done(res => {

				let jug_img = ''
				$.each(res, function (i, img) {
					jug_img +=
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="70" height="70" src="../resources/' + img.champ_icon +
						'" alt="이미지">'
				})
				$('.ul-group').html(jug_img);

			}).fail(err => {
				console.log(err)
			})
		}) //

		$('#mid_img').click(function () {
			$.ajax({
				method: 'get',
				data: {
					lane: 'MIDDLE'
				},
				url: '/personlol/champimg-mid',
			}).done(res => {

				let mid_img = ''
				$.each(res, function (i, img) {
					mid_img += 
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="70" height="70" src="../resources/' + img.champ_icon +
						'" alt="이미지">'
				})
				$('.ul-group').html(mid_img);

			}).fail(err => {
				console.log(err)
			})
		}) //

		$('#bot_img').click(function () {
			$.ajax({
				method: 'get',
				data: {
					lane: 'BOTTOM'
				},
				url: '/personlol/champimg-bot',
			}).done(res => {
				let bot_img = ''
				$.each(res, function (i, img) {
					bot_img += 
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="70" height="70" src="../resources/' + img.champ_icon +
						'" alt="이미지">'
				})
				$('.ul-group').html(bot_img);

			}).fail(err => {
				console.log(err)
			})
		}) //

		$('#util_img').click(function () {
				$.ajax({
					method: 'get',
					data: {
						lane: 'UTILITY'
					},
					url: '/personlol/champimg-bot',
				}).done(res => {
					let util_img = ''
					$.each(res, function (i, img) {
						util_img += 
							'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
							'<img class="icon_img" width="70" height="70" src="../resources/' + img
							.champ_icon + '" alt="이미지">'
					})
					$('.ul-group').html(util_img);

				}).fail(err => {
					console.log(err)
				})
			}) //




			<!--리스트 관련 함수 생성-- >

			// 테이블 찍어주는 함수
			function updateTableData(data) {
				let lane_list_sort = '';

				$.each(data, function (i, list) {
					lane_list_sort +=
						'<tr><td class="number">' +
						(i + 1) +
						'</td>' +
						'<td align="left" width="120px">' +
						'<a href="/personlol/champion/detail?champ_id=' + list.champ_id +'&lane='+list.lane+'">'+
						'<img width="30" height="30" src="../resources/'+
						list.champ_icon +'" alt="이미지">' +
						'<span style="font-size: 12px; font-weight: bold;">' +
						list.champ_name +
						'</span> </td>' +
						'<td align="left">' +
						0 +
						'</td>' +
						'<td align="left">' +
						list.win_rate +
						'</td>' +
						'<td align="left">' +
						list.pick_rate +
						'</td>' +
						'<td align="left">' +
						list.ban_rate +
						'</td>' +
						'<td align="left">' +
						0 +
						'</td> </tr>';
				});

				$('#list_table1').html(lane_list_sort);
			} //찍어주는 함수 끝

		//win 클릭시 함수
		function handleTableWinRateClick() {
			if (isSorting) return; // 정렬 중일 때는 추가 클릭 이벤트를 무시

			isSorting = true; // 정렬 중 플래그 설정

			// console.log("두번째 웨얼:" + where);
			// 정렬 순서 변경
			if (sortOrder === 'ASC') {
				sortOrder = 'DESC';
			} else {
				sortOrder = 'ASC';
			}

			$.ajax({
				method: 'get',
				url: '/personlol/list/sorted/winRate/' + where,
				data: {
					lane: where,
					sort: sortOrder
				}
			}).done(res => {
				console.log(res);
				updateTableData(res);
				isSorting = false; // 정렬 종료 후 플래그 초기화
			}).fail(err => {
				console.log(err);
			});
		}

		//pick 클릭시 함수
		function handleTablePickRateClick() {
			if (isSorting) return; // 정렬 중일 때는 추가 클릭 이벤트를 무시

			isSorting = true; // 정렬 중 플래그 설정

			// console.log("두번째 웨얼:" + where);
			// 정렬 순서 변경
			if (sortOrder === 'ASC') {
				sortOrder = 'DESC';
			} else {
				sortOrder = 'ASC';
			}

			$.ajax({
				method: 'get',
				url: '/personlol/list/sorted/pickRate/' + where,
				data: {
					lane: where,
					sort: sortOrder
				}
			}).done(res => {
				console.log(res);
				updateTableData(res);

				isSorting = false; // 정렬 종료 후 플래그 초기화

			}).fail(err => {
				console.log(err);
			});
		}

		//ban 클릭시 함수
		function handleTableBanRateClick() {
			if (isSorting) return; // 정렬 중일 때는 추가 클릭 이벤트를 무시

			isSorting = true; // 정렬 중 플래그 설정

			// console.log("두번째 웨얼:" + where);

			// 정렬 순서 변경
			if (sortOrder === 'ASC') {
				sortOrder = 'DESC';
			} else {
				sortOrder = 'ASC';
			}

			$.ajax({
				method: 'get',
				url: '/personlol/list/sorted/banRate/' + where,
				data: {
					lane: where,
					sort: sortOrder
				}
			}).done(res => {
				console.log(res);
				updateTableData(res);

				isSorting = false; // 정렬 종료 후 플래그 초기화

			}).fail(err => {
				console.log(err);
			});
		}






		/*챔프 리스트 초기부분 */
		$.ajax({
			method: 'get',
			url: '/personlol/list',
			data: {
				lane: 'TOP'
			},

		}).done(res => {
			updateTableData(res);



		}).fail(err => {

		}) //

		//라인별 버튼 눌렀을때 비동기 처리 부분
		var where;
		//초기 정렬 순서 설정
		let sortOrder = 'ASC';

		let isSorting = false; // 정렬 중 여부를 나타내는 변수

		$('.1').click(function () {
			if (isSorting) return; // 정렬 중일 때는 추가 클릭 이벤트를 무시

			where = $(this).val();
			//console.log("첫번째 웨얼:"+where);

			$.ajax({
				method: 'get',
				url: '/personlol/list/' + where,
				data: {
					lane: where
				}

			}).done(res => {
				updateTableData(res)
				// 승률 클릭시
				$('#table_win_rate').click(handleTableWinRateClick);

				// 픽률 클릭시
				$('#table_pick_rate').click(handleTablePickRateClick);

				//밴률 클릭시
				$('#table_ban_rate').click(handleTableBanRateClick);


			}).fail(err => {
				console.log(err)
			})



		}) //

		$('#search-champ').on('input', function () {
			var searchTerm = $(this).val(); // 검색 입력란의 값을 가져옵니다.
			console.log('검색어:', searchTerm);

			$.ajax({
				method: 'get',
				url: '/personlol/champion/search',
				data: {
					searchVal: searchTerm
				},

			}).done(res => {
				let icon_img = ''
				$.each(res, function (i, img) {
					icon_img += 
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="70" height="70" src="../resources/' + img
						.champ_icon + '" alt="이미지">'
				})
				$('.ul-group').html(icon_img);

			}).fail(err => {
				console.log(err)
			})



		}) //


	}); //도큐뭔트 뤠디
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