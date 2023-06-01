<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

<!-- Bootstrap JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- 마이페이지 css -->
<link rel="stylesheet" type="text/css" href="./resources/css/header.css">
<link rel="stylesheet" type="text/css" href="./resources/css/mypage.css">

<!-- Bootstrap chart -->
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<body>	
	<div id="generic">
		<div class="area">
			<nav class="bener-container">
				<div class="bener">
					<a href="/personlol/main" class="imgfile"><img
						src="./resources/img/navLogo.png" height="28px" width="100px"></a>
					<div class="search-bar">

						<input class="summoner_name summoner_name_search" type="text"
							placeholdr="소환사명 검색....">
						<button class="gosummonerinfo" type="button" id="ggg">go!</button>
					</div>
					<div class="menu">
						<a href="/personlol/champion/" class="m-col">챔피언분석</a> <a
							href="/personlol/rank" class="m-col rank">랭킹보기</a> <a
							href="/personlol/duo/" class="m-col">듀오찾기</a> 
							<a href="#" class="m-col summoner-info">소환사분석</a>


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

	<div class="container">
		<div class="row">
			<div class="col">
				<div class="row">&nbsp;</div>
				
				<div class="row">
					<div class="d-grid gap-2 col mx-auto">
						<div id="SUMMONER_PROFILE" style="float:center">소환사아이콘</div>
					</div>
				</div>
			</div>
			
			<div class="col" id="info">
				<div class="row">&nbsp;</div>
				<div class="row">
					<div class="col" id="info-t">회원 아이디</div>
					<div class="col" id="info-b">
						<div id="cur_lolname">user_name</div>
					</div>
				</div>
				
				<div class="row">&nbsp;</div>
				
				<div class="row">
					<div class="col" id="info-t">소환사 이름</div>
					<div class="col" id="info-b">
						<div id="lol_name">cur_lolname</div>
					</div>
				</div>
				
				<div class="row">&nbsp;</div>
				
				<div class="row">
					<div class="col" id="info-t">소환사 티어</div>
					<div class="col" id="info-b">
						<div id="tier">티어</div>
					</div>
				</div>
				<div class="row">&nbsp;</div>
				<div class="row">
					<div class="col" id="info-t">최근 경기 활약	</div>
					<div class="col" id="info-b">
						<div id = "score">aa</div>
					</div>
				</div>
				
				<div class="row">&nbsp;</div>
				
				<div class="row text-center" id="mt">
					<div class="lol_acount_change">
						<!-- 모달을 띄우는 버튼 -->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop"
							width="100%">LOL계정변경하기</button>
						<!-- 모달 -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel">롤
											계정 변경</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!-- 여기에 원하는 내용을 추가하세요 -->
										<div class="form-group">
											<label for="lolname">변경할 계정</label> <input type="text"
												class="form-control" id="newlolname"
												placeholder="변경할 LOL계정을 입력하세요">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary" id="re_lolname">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">&nbsp;</div>
				<div class="row">
					<div class="col">
						<div class="d-grid gap-2 col mx-auto">
							<button type="button" class="btn-outline-secondary" id="selectcode">인증 코드 확인</button>
						</div>
					</div>
					<div class="col">
						<div class="d-grid gap-2 col mx-auto">
							<button type="button" class="btn-outline-secondary" id="changecode">인증 코드 변경</button>
						</div>
					</div>
				</div>
			</div>
		
		<div class="row">&nbsp;</div>
		
		<div class="row"> <!-- 머신런칭 차트분석 -->
			<div class="title_chart">
				<div class="row" id="chart_title"></div>
			</div>
			<div class="row">&nbsp;</div>
			<div class="container">
				<canvas id="myChart"></canvas>
			</div>
		</div>
		
		<div class="row">&nbsp;</div>
		
		<div class="row" id="duo-write">		
			<div class="col" id="titles">내가 작성한 듀오 글
				<div class="row" id="box">
					<div class="col-8">
						<div class="row" id="duo_t2">
							<div class="col-2" id="duo_t3">제목</div>
							<div class="col">
								<div class="duo-title-font">제목</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-2">내용</div>
							<div class="col">
								<div class="duo-write-boardspan">내용1</div>
							</div>
						</div>
						
					</div>
					
					<div class="col float-right" id="duo-write-title">
						<div class="duo-write-delete-button">
							<button type="button" class="btn btn-light" id="boardDelete" style="float:right">글 삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div><!-- 듀오 끝 -->
		
		<div class="row">&nbsp;</div>
		
		<div class="row">
			<div class="row" id="titles">도착한 듀오 요청</div>	
			
			<div class="row" id="box">
				<div class="col-8">
					<div class="offer-list-write-box request"></div>
				</div>
				
				<div class="col float-right">
					<div class="offer-reload-box">
						<button type="button" class="btn btn-light" style="float:right" id="offer-reload-button1">갱신</button>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="row">&nbsp;</div>
		
		<div class="row" id="titles">수락한 듀오 요청
			<div class="row" id="box">
				<div class="col-8">
					<div class="offer-list-write-box result">수락내용</div>
				</div>
				
				<div class="col float-right">
					<div class="offer-reload-box">
						<button type="button" class="btn btn-light" style="float:right" id="offer-reload-button2">갱신</button>
					</div>
				</div>

			</div>
		</div>
		
		<div class="row">&nbsp;</div>
		
		<div class="row">
			<div class="col">
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="button" class="btn btn-outline-success" id="changpw" style="float:center">비밀번호 변경</button>
				</div>
			</div>
			<div class="col">
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="button" class="btn btn-outline-danger" id="deletemember" style="float:center">회원탈퇴</button>
				</div>
			</div>
		</div>
		<div class="row">&nbsp;</div>
	</div>

	<footer></footer>

	<footer></footer>

	<script>
        //summoner_name 가지고 포워딩 하기위한 함수
        function gosummoner(summoner_name) {
            console.log(summoner_name)
            const encoded_name = encodeURIComponent(summoner_name);
            const url = '/personlol/summoner/?summoner_name=' + encoded_name;
            location.href = url
        }
    </script>

	<script>
        // 시작시 롤 네임 뿌려주기 위한 코드
        $.ajax({
            method: 'get',
            url: '/personlol/mypage/getnameicon',
            //summoner_name이 깨져서 utf-8로
            contentType: 'application/json; charset=utf-8',
        }).done(res => {
            console.log(res);
            $('#cur_lolname').text(res.user_id);
            $('#lol_name').text(res.summoner_name);
            $('#tier').text(res.summoner_tier);
            $('#SUMMONER_PROFILE').html('<img src="./resources/dd/img/profileicon/' + res.summoner_profile +
                '.png">');
            const summoner_name = res.summoner_name;
            
            $('#gosummonerinfo').click(function () {
                console.log(summoner_name);
                gosummoner(summoner_name);
            });
            $.ajax({
				method: 'get',
				data:{name:summoner_name},
				url:'/personlol/mypage/score_data',				
			}).done(res => {
				console.log(res);
				$('#score').html(res[0]);
				$('#chart_title').html('최근 '+ res.length +'경기 머신런닝 경기 결과 분석');
				const resArray = res;
				const resultArray=[];				
				
				var counts = {};
				
				for (var i = 0; i < resArray.length; i++) {
				  var item = resArray[i];
				  counts[item] = counts[item] ? counts[item] + 1 : 1;				   
				}
				
				var keys = Object.keys(counts); // 객체의 모든 키(key)를 추출하여 배열로 반환
				var values = Object.values(counts);
				console.log(keys)	
				
				// 색상에 대한 함수 정의
				function getColorByTier(tier) {
				  switch (tier) {
				    case 'IRON': // IRON
				      return 'rgba(051, 051, 051, 0.2)';
				    case 'BRONZE': // BRONZE
				      return 'rgba(102,051, 000, 0.2)';
				    case 'SILVER': // SILVER
				      return 'rgba(204, 204, 204, 0.2)';
				    case 'GOLD': // GOLD
					  return 'rgba(255, 255, 051, 0.2)';
				    case 'PLATINUM': // PLA
						  return 'rgba(051, 255, 051, 0.2)';
				    case 'DIAMOND': // DIA
						  return 'rgba(051, 000, 255, 0.2)';
				    case 'MASTER': // MAS
						  return 'rgba(153, 102, 255, 0.2)';
				    case 'GRANDMASTER': // GRAND
						  return 'rgba(153, 000, 051, 0.2)';
				    case 'CHALLENGER': // CH
						  return 'rgba(255, 051, 153, 0.2)';
				  }
				}
				// resultArray를 순회하며 색상을 매핑하여 backgroundColor 배열에 추가
				let backgroundColors = keys.map((tier) => getColorByTier(tier));
				
				
				var ctx = document.getElementById('myChart').getContext('2d');
		        var chart = new Chart(ctx, {
		          // 챠트 종류를 선택
		          type: 'pie',

		          // 챠트를 그릴 데이타
		          data: {
		            labels: keys,
		            datasets: [{
		              label: '최근 경기에서의 활약도',
		              data: values,
		              backgroundColor: backgroundColors,
		              borderColor: backgroundColors,        	 

		            }]
		          },
		          
		          options: {}
		        });

				
				
			}).fail(err => {
				
			})
        }).fail(err => {
            console.log(err);
        });

        //듀오요청 들어온거 불러오기 함수화
        function getrequestfunc() {
            $.ajax({
                method: 'get',
                url: '/personlol/mypage/getrequest'
            }).done(res => {
                console.log("res",res);
                $('.offer-list-write-box.request').empty();
                for (let m in res) {
                	  let obj = res[m];
                	  console.log("obj",obj);
                	  for (let k in obj) {
                	    let val = obj[k];
                	    console.log(val);
                	    if (val === "null") {
                	      $('.offer-list-write-box.request').append('<div class="offer-list-write">' +
                	        '아직 듀오 신청이 도착하지 않았습니다.' + '</div>');
                	    } else {
                	    	$('.offer-list-write-box.request').append('<div class="offer-list-write"><span class="list-write-span">' + val +
                	    		    '</span><button type="button" class="btn btn-light" onclick="request_accept(this)" value="' + val + '">수락</button><button type="button" id="refusebtn" class="btn btn-light" onclick="request_refuse(this)" value="' + val + '">거절</button></div>');

                	    }
                	  }
                	}
            }).fail(err => {
                console.log(err);
            })


        }
        //실제 불러오기
        getrequestfunc();
        
        //듀오 목록 불러오기
        function getduofunc() {
        	$.ajax({
                method: 'get',
                url: '/personlol/mypage/myduo'
            }).done(res => {
                console.log("듀오 목록: ", res);
                console.log("length",res.length)
                $('.offer-list-write-box.result').empty();
                if(res.length == 0){
                    $('.offer-list-write-box.result').append('<div class="offer-list-write">' +
                            '아직 듀오를 수락한 기록이 없습니다.' + '</div>');
                }
                for (let i in res) {
                    let val = res[i];
                    console.log("한번 벗긴거: ", val);
                    for (let j in val) {
                        let d_name = val[j];
                        console.log("두번 벗긴거", d_name);
                        $('.offer-list-write-box.result').append('<div class="offer-list-write"><span class="list-write-duo">' + d_name +
                           '</span><button type="button" class="btn btn-light" onclick="duo_del(this)" value="' + d_name + '">삭제</button></div>'); 
                    }
                }
            }).fail(err => {
                console.log(err);
            });
        }
        //실제 duolist불러오기
        getduofunc();


        //내 글 불러오기
        $.ajax({
            method: 'get',
            url: '/personlol/mypage/myboard'
        }).done(res => {
            console.log(res.duo_title);
            if (res.duo_title != null) {
                $('.duo-title-font').html(res.duo_title)
                $('.duo-write-boardspan').text(res.duo_content)
            } else {
                $('.duo-title-font').html("글 작성 후 이용해주세요.")
                $('.duo-write-boardspan').text("작성된 글이 없습니다.")
            }

        }).fail(err => {
            console.log(err);
        })
    </script>

	<script>
    	//듀오 요청 수락
    	function request_accept(info){
    		let request_id ={'user_lolname':info.value}

            console.log(request_id);
    		$.ajax({
    			method:'put',
                url:'/personlol/mypage/acceptduo',
                contentType: 'application/json',
                data: JSON.stringify(request_id)
    		}).done(res=>{
                console.log(res);
                if(res!="err"){
                	alert("요청이 승인되었습니다.")
                    location.href = '/personlol/mypage'
                }else{
                    alert("err")
                }
            }).fail(err=>{
                console.log(err);
            })
            
    	}
    	//듀오 요청 거절
    	function request_refuse(info) {
    		let request_id = {'user_lolname':info.value};

    	    console.log(request_id);
    	    // 밑에는 ajax
    	    $.ajax({
                method:'delete',
                url:'/personlol/mypage/deleterequest',
                contentType: 'application/json',
                data: JSON.stringify(request_id)
            }).done(res=>{
                console.log(res);
                if(res == "1"){
                	console.log("듀오 요청 거절 성공")
                	alert("요청을 성공적으로 거절하였습니다.")
                	location.href = '/personlol/mypage'
                }else{
                    console.log(res);
                    alert("요청 거부에 실패했습니다.")
                }
            }).fail(err=>{
                console.log(err);
            }) 
    	}

    	//듀오 삭제하는 친구
    	function duo_del(info){
    	    let request_id = {'user_lolname':info.value};
            $.ajax({
                method:'put',
                url:'/personlol/mypage/duodel',
                contentType: 'application/json',
                data: JSON.stringify(request_id)
            }).done(res=>{
                console.log(res);
                if(res == "1"){
                	alert("삭제가 완료되었습니다.")
                	location.href = '/personlol/mypage'
                }else{
                    alert("오류발생하였습니다.")
                }
            }).fail(err=>{
                console.log(err);
            })
    	}
    </script>

	<script>
        //로그아웃
        $('#logout').click(function () {
            location.href = '/personlol/logout';
            console.log("로그아웃");
            alert("로그아웃");
        })
    </script>

	<script>
        //갱신버튼 클릭시 갱신하는 메소드
        $('#offer-reload-button1').click(function () {
            alert("요청이 완료되었습니다.");
            getrequestfunc();
            getduofunc();
        })
        $('#offer-reload-button2').click(function () {
            alert("요청이 완료되었습니다.");
            getrequestfunc();
            getduofunc();
        })
    </script>

	<script>
        // 롤 네임 바꾸기
        $('#re_lolname').click(function () {
            changelolname = {
                'changelolname': $('#newlolname').val()
            };

            $.ajax({
                method: 'put',
                url: '/personlol/mypage/relolname',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(changelolname)
            }).done(res => {
                console.log(res);
                $('#staticBackdrop').modal('hide');
                location.reload();
            }).fail(err => {
                console.log(err);
            });
        });
    </script>
	<script>
    	//게시글 삭제
        $('#boardDelete').click(function () {
            $.ajax({
                method: 'put',
                url: '/personlol/mypage/deleteboard',
                contentType: 'application/json; charset=utf-8'
            }).done(res => {
                console.log(res);
                if (res == "1") {
                    alert("성공적으로 삭제되었습니다.")
                    location.href = '/personlol/mypage';
                } else {
                    alert("게시물이 존재하지 않습니다.")
                }
            }).fail(err => {
                console.log(err);
            })
        })
    </script>

	<script>
        //코드 확인
        $('#selectcode').click(function () {
            user_id = $('#userid').val()
            user_pw = $('#userpw').val()
            user_lolname = $('#lol-account').val()

            $.ajax({
                method: 'get',
                url: '/personlol/mypage/selectcode',
            }).done(res => {
                console.log(res)
                $('#selectcode').text(res)
            }).fail(err => {
                console.log(err)
            })
        })

        //코드 변경
        $('#changecode').click(function () {
            console.log('<%=session.getAttribute("id")%>');
            id = {
                'user_id': '<%=session.getAttribute("id")%>',
                'user_code': '0'
            };

            $.ajax({
                method: 'put',
                url: '/personlol/user/newcode',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(id)

            }).done(res => {
                console.log("성공!");
                console.log(res);
                $('#selectcode').text("인증 코드 확인")
                //버튼 기능 끄기
            }).fail(err => {
                console.log(err);
            })
        })
    </script>

	<script>
        //회원 탈퇴
        $('#deletemember').click(function () {
            console.log("삭제눌렀어용");
            id = {
                'user_id': '<%=session.getAttribute("id")%>'
            };
            $.ajax({
                method: 'delete',
                url: '/personlol/user/deletemember',
                contentType: 'application/json',
                data: JSON.stringify(id)
            }).done(res => {
                console.log(res);
                alert("회원 탈퇴가 완료되었습니다.");
                location.href = "/personlol/main";
            }).fail(err => {
                console.log(err);
                alert("회원 탈퇴 중 오류가 발생하였습니다.");
            })
        })
    </script>

	<script>
        //비밀번호 변경
        $('#changpw').click(function () {
            location.href = "/personlol/changepw";
        })
    </script>

	<script>
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
                console.log(res);
                if (res == "1") {
                    location.href = go_url;
                } else if (res == "-999") {
                    alert("등록되지않은 소환사입니다 다시 입력해주세요")
                }
            }).fail(err => {
                console.log(err);
            })

        });
        
        
        
    </script>
    
<script>
		$('.summoner-info').click(function () {
			$.ajax({
				method:'get',
				url:'/personlol/user/main-gosummoner-info',
				
			}).done(res => {
				if(res.length != 0){
					location.href ='/personlol/summoner/?summoner_name='+res
				}else{
					alert("로그인을 해주세요!")
					location.href ='/personlol/logine'
				}
				
			}).fail(err => {
				console.log(err)
				
			})
		});//클릭 이벤트 끝
	</script>

</body>

</html>