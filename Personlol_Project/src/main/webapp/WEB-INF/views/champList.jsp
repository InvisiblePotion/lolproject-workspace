<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>champ list</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/champlist.css">

<style type="text/css">
.ul-group {
	padding: 0px;
}
</style>
</head>
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

<div class="container text-center bcolor">
	<div class="row">
		<div class="col" id="col1">
			<div id="btn-group1" class="btn-group" role="group"
				aria-label="Basic outlined example">
				<input type="button" class="btn btn-outline-primary 1" value="TOP">
				<input type="button" class="btn btn-outline-primary 1"
					value="JUNGLE"> <input type="button"
					class="btn btn-outline-primary 1" value="MIDDLE"> <input
					type="button" class="btn btn-outline-primary 1" value="BOTTOM">
				<input type="button" class="btn btn-outline-primary 1"
					value="UTILITY">
			</div>
		</div>
	</div class="row">

	<div class="row">

		<div class="col-4">
			<div class="search-container">
				<input type="text" class="search-champ" placeholder="챔피언 검색"
					id="search-champ">
			</div>
			<div class="btn-group" role="group" id="btn-group2"
				aria-label="Basic outlined example">

				<button type="button" class="btn btn-light" id="top_img">
					<img
						src="../resources/ranked-positions/Position_Challenger-Top.png"
						alt="Top" width="40" height="40"/>
				</button>
				<button type="button" class="btn btn-light" id="jug_img">
					<img
						src="../resources/ranked-positions/Position_Challenger-Jungle.png"
						alt="Jug" width="40" height="40" />
				</button>
				<button type="button" class="btn btn-light" id="mid_img">
					<img
						src="../resources/ranked-positions/Position_Challenger-Mid.png"
						alt="Mid" width="40" height="40" />
				</button>
				<button type="button" class="btn btn-light" id="bot_img">
					<img
						src="../resources/ranked-positions/Position_Challenger-Bot.png"
						alt="Bot" width="40" height="40"/>
				</button>
				<button type="button" class="btn btn-light" id="util_img">
					<img
						src="../resources/ranked-positions/Position_Challenger-Support.png"
						alt="Sup" width="40" height="40"/>
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
							
							<td width="170px" style="font-size: 12px" >
								<span style="font-weight: bold; color: #c8c8c8; font-size: 20px;">챔피언</span>
							</td>
							<td width="100px" style="font-size: 12px" id="table_tier">
								<span style="font-weight: bold; color: #c8c8c8; font-size: 20px;">티어</span>
							</td>
							<td width="100px" style="font-size: 12px" id="table_win_rate">
								<span style="font-weight: bold; color: #c8c8c8; font-size: 20px;">승률</span>
							</td>
							<td width="100px" style="font-size: 12px" id="table_pick_rate">
								<span style="font-weight: bold; color: #c8c8c8; font-size: 20px;">픽률</span>
							</td>
							<td width="100px" style="font-size: 12px" id="table_ban_rate">
								<span style="font-weight: bold; color: #c8c8c8; font-size: 20px;">밴률</span>
							</td>
							<td width="120px" style="font-size: 12px" id="table_counter">
								<span style="font-weight: bold; color: #c8c8c8; font-size: 20px;">카운터</span>
							</td>
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
			data: {
				lane: 'TOP'
			},
			url: '/personlol/champimg-top',
		}).done(res => {
			console.log(res)
			let top_img = ''
			$.each(res, function (i, img) {
				top_img +=
					'<li class="img_list">'+
					'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
					'<img class="icon_img" width="60" height="60" src="../resources/' + img.champ_icon +'" alt="이미지">'+
					'<span class="name">'+img.champ_name+'</span>'+
					'</a>'+
					'</li>'
					
			})
			$('.ul-group').html(top_img);

		}).fail(err => {
			console.log(err)
		})//




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
					let shortenedName = img.champ_name.length > 6 ? img.champ_name.slice(0, 6) + '...' : img.champ_name;
					top_img += 
						'<li class="img_list">'+
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="60" height="60" src="../resources/' + img.champ_icon +'" alt="이미지">'+
						'<span class="name">'+shortenedName+'</span>'+
						'</a>'+
						'</li>'				})
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
					let shortenedName = img.champ_name.length > 6 ? img.champ_name.slice(0, 6) + '...' : img.champ_name;
					jug_img +=
						'<li class="img_list">'+
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="60" height="60" src="../resources/' + img.champ_icon +'" alt="이미지">'+
						'<span class="name">'+shortenedName+'</span>'+
						'</a>'+
						'</li>'
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
					let shortenedName = img.champ_name.length > 6 ? img.champ_name.slice(0, 6) + '...' : img.champ_name;
					mid_img += 
						'<li class="img_list">'+
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="60" height="60" src="../resources/' + img.champ_icon +'" alt="이미지">'+
						'<span class="name">'+shortenedName+'</span>'+
						'</a>'+
						'</li>'
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
					let shortenedName = img.champ_name.length > 6 ? img.champ_name.slice(0, 6) + '...' : img.champ_name;
					bot_img += 
						'<li class="img_list">'+
						'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
						'<img class="icon_img" width="60" height="60" src="../resources/' + img.champ_icon +'" alt="이미지">'+
						'<span class="name">'+shortenedName+'</span>'+
						'</a>'+
						'</li>'
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
						let shortenedName = img.champ_name.length > 6 ? img.champ_name.slice(0, 6) + '...' : img.champ_name;
						util_img += 
							'<li class="img_list">'+
							'<a href="/personlol/champion/detail?champ_id=' + img.champ_id +'&lane='+img.lane+'">'+
							'<img class="icon_img" width="60" height="60" src="../resources/' + img.champ_icon +'" alt="이미지">'+
							'<span class="name">'+shortenedName+'</span>'+
							'</a>'+
							'</li>'
					})
					$('.ul-group').html(util_img);

				}).fail(err => {
					console.log(err)
				})
			}) //




			//<!--리스트 관련 함수 생성-- >

			// 테이블 찍어주는 함수
			function updateTableData(data) {
				
				let lane_list_sort_last = '';
				$.each(data, function (i, list) {
					
					//카운터 챔프3개 이미지 갖고오기
					$.ajax({
						method:'get',
						data:{champ_id:list.champ_id,champ_lane:list.lane},
						url:'/personlol/list/counter-info'
						
					}).done(res=>{
						let lane_list_sort = '';
						let counter_icons =[];
						
						$.each(res, function(i,counter) {
							let counter_champ = counter.champ_id_y
							let counter_icon = counter.champ_icon
							
							console.log("잘해보자이말이야")
							console.log(counter_champ)
							console.log(counter_icon)
							console.log("잘해보자이말이야")
							
							counter_icons.push(
									'<a href="/personlol/champion/matchup?champ_id='+ list.champ_id +'&lane='+list.lane+'&match_champ='+counter_champ+'">'+
									'<img width="30" height="30" src="../resources/'+counter_icon +'" alt="이미지">'
									);
						})
						
						lane_list_sort +=
							'<tr>'+
							'<td align="left" class="list_td" >' +
							'<a href="/personlol/champion/detail?champ_id=' + list.champ_id +'&lane='+list.lane+'">'+
							'<img width="	30" height="30" src="../resources/'+
							list.champ_icon +'" alt="이미지">' +
							'<span style="font-size: 12px; font-weight: bold;">' +
							list.champ_name +
							'</span> </td>' +
							'<td align="center" width="100px">' +
							0 +
							'</td>' +
							'<td align="center" width="100px">' +
							'<span style="color: #828282;">'+list.win_rate +'%</span>'+
							'</td>' +
							'<td align="center" width="100px">' +
							'<span style="color: #828282;">'+list.pick_rate +'%</span>'+
							'</td>' +
							'<td align="center" width="100px">' +
							'<span style="color: #828282;">'+list.ban_rate +'%</span>'+
							'</td>' +
							'<td align="center" class="counter_img" width="120">' +
							counter_icons.join('') +
							'</td> </tr>';
							
							lane_list_sort_last += lane_list_sort
							
							if (i === data.length - 1) {
				                $('#list_table1').html(lane_list_sort_last);
				            }
					}).fail(err => {
						
					})//카운터 챔프3개	 이미지 끝
					
				});//each list 끝
				
				
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
		
		let isWinRateDescending = true; // 정렬 방식을 내림차순으로 설정
		
		//초기정보 정렬
		function sortTableByWinRate() {
		    var rows = $('#list_table1 tbody tr').get();

		    rows.sort(function(a, b) {
		        var rateA = parseFloat($(a).find('td:eq(2)').text());
		        var rateB = parseFloat($(b).find('td:eq(2)').text());

		        if (isWinRateDescending) {
		            return rateB - rateA; // 내림차순 정렬
		        } else {
		            return rateA - rateB; // 오름차순 정렬
		        }
		    });

		    $('#list_table1 tbody').empty().append(rows);
		}


		
		/*챔프 리스트 초기부분 */
		$.ajax({
			method: 'get',
			url: '/personlol/list',
			data: {
				lane: 'TOP'
			},

		}).done(res => {
			
			 $(document).on('click', '#table_win_rate', function() {
			        isWinRateDescending = !isWinRateDescending; // 정렬 방식을 토글 (내림차순 <-> 오름차순)
			        sortTableByWinRate();
			    });
			 
			 let sortedData = res.sort((a, b) => b.win_rate - a.win_rate); //정렬부분
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
				console.log(res)
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