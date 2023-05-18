<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 마이페이지 css -->
    <link rel="stylesheet" type="text/css" href="./resources/css/mypage.css">
</head>

<body>
    <!-- 여기까지가 헤더!!!!!!!!!! -->
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
                        <a href="/personlol/champion/champlist" class="m-col">챔피언분석</a>
                        <a href="/personlol/summoner/rank" class="m-col">랭킹</a>
                        <a href="/personlol/duo" class="m-col">듀오찾기</a>
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
    <div class="information container">
        <div class="information box">
            <div class="contents box">
                <div class="user_icon_box">
                    <div id="SUMMONER_PROFILE" class="">
                    </div>
                    <button class="button tier_AI" type="button">티어/AI</button>
                    <button class="button duo_find" type="button">듀오 찾는 여부</button>
                </div>
                <div class="user_info">
                    <ul>
                        <li>
                            <div class="user_name">
                                <span id="cur_lolname">광포한까마귀</span>
                            </div>
                        </li>
                        <li class="mt">
                            <div class="lol_acount_change">
                                <!-- 모달을 띄우는 버튼 -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#staticBackdrop">
                                    LOL계정변경하기
                                </button>
                                <!-- 모달 -->
                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
                                    data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">롤 계정 변경</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- 여기에 원하는 내용을 추가하세요 -->
                                                <div class="form-group">
                                                    <label for="lolname">변경할 계정</label>
                                                    <input type="text" class="form-control" id="newlolname"
                                                        placeholder="변경할 LOL계정을 입력하세요">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">닫기</button>
                                                <button type="button" class="btn btn-primary"
                                                    id="re_lolname">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </li>
                        <li class="mt">
                            <div class="win-lose">
                                <div class="wl button">
                                    <button id="gosummonerinfo">전적</button>
                                </div>
                                <div class="wl button">
                                    <button>분석</button>
                                </div>
                            </div>
                        </li>
                        <li class="mt">
                            <div class="verification-code">
                                <button id="selectcode">인증 코드 확인</button>
                            </div>
                        </li>
                        <li class="mt">
                            <div class="verification-code">
                                <button id="changecode">인증 코드 변경</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="duo-container">
        <div class="duo-write-container">
            <div class="duo-write">
                <div class="duo-write-title">
                    <div class="duo-title-font">듀오 찾는 내 글</div>
                </div>
                <div class="duo-write-main">
                    <div>
                        <span>안녕하세요 듀오를 찾습니다. 주로 6~9시에 플레이합니다.</span>
                    </div>
                </div>
                <div class="duo-write-delete">
                    <div class="duo-write-delete-button">
                        <button>삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="offer-container">
        <div class="offer-list-container">
            <div class="offer-list-write-box">
                <div class="offer-list-write">
                    오퍼 승인 요청 들어온 것들
                </div>
                <div class="offer-list-write">
                    오퍼 승인 요청 들어온 것들
                </div>
                <div class="offer-list-write">
                    오퍼 승인 요청 들어온 것들
                </div>
                <div class="offer-list-write">
                    오퍼 승인 요청 들어온 것들
                </div>
            </div>
            <div class="offer-reload-box">
                <div class="offer-reload">
                    <button class="offer-reload-button">갱신!</button>
                </div>
            </div>
        </div>
    </div>

    <div class="offer-container">
        <div class="offer-list-container">
            <div class="offer-list-write-box">
                <div class="offer-list-write">
                    오퍼 승인 완료된 글
                </div>
                <div class="offer-list-write">
                    오퍼 승인 완료된 글
                </div>
                <div class="offer-list-write">
                    오퍼 승인 완료된 글
                </div>
                <div class="offer-list-write">
                    오퍼 승인 완료된 글
                </div>
            </div>
            <div class="offer-reload-box">
                <div class="offer-reload">
                    <button class="offer-reload-button">갱신!</button>
                </div>
            </div>
        </div>
    </div>
    <div class="acount-container">
        <div class="change-password-container">
            <div class="change-password-box">
                <div class="change-password"><button id="changpw">비밀번호 변경</button></div>
            </div>

            <!-- 회원탈퇴 -->
            <div class="change-password-box">
                <div class="change-password"><button id="deletemember">회원탈퇴</button></div>
            </div>

        </div>
    </div>
    <footer></footer>

    <script>
        //summoner_name 가지고 포워딩 하기위한 함수
        function gosummoner(summoner_name) {
            console.log(summoner_name)
            const encoded_name = encodeURIComponent(summoner_name);
            const url = '/personlol/summoner/?summoner_name=' + encoded_name;
            location.href = url;
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
            $('#SUMMONER_PROFILE').html('<img src="./resources/dd/img/mypagetest/' + res.summoner_profile +
                '.png">');
            const summoner_name = res.summoner_name;
            console.log(summoner_name);
            $('#gosummonerinfo').click(function () {
                console.log(summoner_name);
                gosummoner(summoner_name);
            });
        }).fail(err => {
            console.log(err);
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
            console.log('<%= session.getAttribute("id") %>');
            id = {
                'user_id': '<%= session.getAttribute("id") %>',
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
                'user_id': '<%= session.getAttribute("id") %>'
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
        $('#changpw').click(function () {
            location.href = "/personlol/changepw";
        })
    </script>


</body>

</html>