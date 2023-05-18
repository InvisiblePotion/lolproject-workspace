<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>summoner info</title>
        <!-- jQuery 3.6.4 min CDN -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
            crossorigin="anonymous"></script>
		<link rel="stylesheet" href="../resources/css/summinfo.css">
	</head>
	<body>
<!-- 여기까지가 헤더!!!!!!!!!! -->
    <div id="generic">
        <div class="area">
            <nav class="bener-container">
                <div class="bener">
                    <a href=" " class="imgfile"><img src="../resources/img/logotesting.png" ></a>
                    <div class="search-bar">
                        <input type="text">
                        <button type="button">go!</button>
                    </div>
                    <div class="menu">
                        <a href="/personlol/champion/" class="m-col">챔피언분석</a>
                        <a href=" " class="m-col">랭킹</a>
                        <a href=" " class="m-col">듀오찾기</a>
                        <a href=" " class="m-col">사용자분석</a>
                        <a href="/personlol/example/test-logine" class="m-col login">로그인</a>
                    </div>
                </div>
            </nav>
        </div >
<!-- 여기까지가 헤더!!!!!!! -->
        <div class="area2">
            <div class="summoner-container">
                <div class="summoner">
                    <div class="summoner_icon">
                        <div class="summoner_level">286</div>
                    </div>
                    <div class="info">
                        <div class="summoner_tier">GOLD</div>
                        <div class="summoner_name">감귤해적</div>
                        <div></div>
                        <div></div>
                        <div class="buttons">
                            <button class="button">전적 갱신</button>
                            <button class="button">티어 그래프</button>
                        </div>
                        <div class="last-update">
                            <div>최근 업데이트: 3시간 전</div>
                        </div>
                    </div>
                </div>
                <div class="adver">광고창입니다.</div>
            </div>
            
        </div>
        <div class="nav-bar">
                <!-- <h2>종합</h2> -->
                <ul class="nav-item">
                    <li><a href="fdaf" class="nav-button">종합</a></li>
                    <li><a href="fdafda" class="nav-button">챔피언</a></li>
                    <li><a href="fdafd" class="nav-button">인게임 정보</a></li>
                    <div class="c18">
                        <div class="header">
                            <div>내 실력을 인공지능으로 확인!</div>
                            <button class="b15" type="button"></button>
                        </div>
                    </div>
                </ul>
            </div>
    </div>
    <div class="contents-container">
        <div class="solo-rank">
            <div class="solo-rank-box">
                <div class="header2">솔로랭크</div>
                <div class="tier-img-container">
                    <div class="tier-img"></div>
                    <div class="tier-info">
                        <div class="tier-name">challenger</div>
                        <div class="tier-lp">1,789 LP</div>
                    </div>
                    <div class="win-losses-container">
                        <div class="win-losses">190승 180패</div>
                        <div class="ratio">승률 62%</div>
                    </div>
                </div>
            </div>
            <div class="free-rank-container">
                <div class="free-rank">
                    자유랭크
                    <span>Unranked</span>
                </div>
            </div>
            <div class="mini-rank-container">
                <ul class="mini-rank-ul">
                    <li class="total-season"><button class="season-button">전체</button></li>
                    <li class="rest-season"><button class="season-button">솔로랭크</button></li>
                    <li class="rest-season"><button class="season-button">자유랭크</button></li>
                </ul>
                <!-- 챔피언 박스 칸 -->
                <div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <div class="champion-box">
                        <div class="face"><a href=" " class="face-img"></a></div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                            <div class="cs">cs 34.5 (1.5)</div>
                        </div>
                        <div class="box-kda">
                            <div class="">
                                <div class="cuuk">4.31:1 평점</div>
                            </div>
                            <div class="detail">1.6 / 3.8 / 14.8</div>
                        </div>
                        <div class="played">
                            <div class="persent">73%</div>
                            <div class="count">41 게임</div>
                        </div>
                    </div>
                    <a href="fafd" class="more">더 보기+다른 시즌 보기</a>
                </div>
            </div>
            <!-- 챔피언 박스 칸 -->
            <!-- 최근 승률 칸 입니다. -->
            <div class="recent-container">
                <div class="recent-title-container">
                    <div class="recent-title">최근 7일간의 랭크 승률</div>
                </div>
                <div class="header3">
                    <div class="pick">챔피언</div>
                    <div class="pick2">승률</div>
                </div>
                <ul>
                    <li class="header3-li">
                        <div class="face">
                            <a href=" " class="face-img2"></a>
                        </div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                        </div>
                        <div class="graph">
                            <div class="graph-bar">
                                <div class="fill left" ></div>
                                <div class="text left">5승</div>
                                <div class="fill right" ></div>
                                <div class="text right">2패</div>
                            </div>
                        </div>
                        <div class="winratio">71%</div>
                    </li>
                    <li class="header3-li">
                        <div class="face">
                            <a href=" " class="face-img2"></a>
                        </div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                        </div>
                        <div class="graph">
                            <div class="graph-bar">
                                <div class="fill left" ></div>
                                <div class="text left">5승</div>
                                <div class="fill right" ></div>
                                <div class="text right">2패</div>
                            </div>
                        </div>
                        <div class="winratio">71%</div>
                    </li>
                    <li class="header3-li">
                        <div class="face">
                            <a href=" " class="face-img2"></a>
                        </div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                        </div>
                        <div class="graph">
                            <div class="graph-bar">
                                <div class="fill left" ></div>
                                <div class="text left">5승</div>
                                <div class="fill right" ></div>
                                <div class="text right">2패</div>
                            </div>
                        </div>
                        <div class="winratio">71%</div>
                    </li>
                    <li class="header3-li">
                        <div class="face">
                            <a href=" " class="face-img2"></a>
                        </div>
                        <div class="box-info">
                            <div class="name">라칸</div>
                        </div>
                        <div class="graph">
                            <div class="graph-bar">
                                <div class="fill left" ></div>
                                <div class="text left">5승</div>
                                <div class="fill right" ></div>
                                <div class="text right">2패</div>
                            </div>
                        </div>
                        <div class="winratio">71%</div>
                    </li>
                </ul>
            </div class="recent-container">
            <!-- 최근 승률 칸 입니다. -->
            <div class="recent athor-summoner-container">
                <div class="athor-title">같은 팀으로 게임한 소환사들(최근 20게임)</div>
                <table>
                    <colgroup>
                        <col>
                        <col width="60">
                        <col width="60">
                        <col width="60">
                    </colgroup>
                    <thead>
                        <tr class="tp">
                            <th class="th-name" scope="col">소환사</th>
                            <th class="tp played" scope="col">게임</th>
                            <th class="tp win-lose" scope="col">승-패</th>
                            <th class="th-winratio" scope="col">승률</th>
                        </tr>
                    </thead>
                    <!-- tr태그 곱하기 10번입니다. -->
                    <tbody class="tdo">
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                        <tr>
                            <td class="tp name" scope="col"><a href="  " class="a-tag"><img src="" alt="" class="mini-img">닉네임니다</a></th>
                            <td class="tp played" scope="col">4</th>
                            <td class="tp win-lose" scope="col">3-1</th>
                            <td class="th-winratio" scope="col">75%</th>
                        </tr>
                    </tbody>
                    <!-- tr태그 곱하기 10번입니다. -->
                </table>
            </div>
        </div>
        <!--오른쪽 문단 -->
        <div class="real main-container">
            <div class="one main">
                <ul>
                    <li class="li-first">
                        <button class="TOTAL">전체</button>
                    </li>
                    <li class="li-other">
                        <button>솔로랭크</button>
                    </li>
                    <li class="li-other">
                        <button>자유랭크</button>
                    </li>
                    <li class="li-other">
                        <span>
                            <label class="hidden" for="queueType">큐 타입</label>
                            <select id="queueType">
                                <option value="TOTAL">큐 타입</option>
                                <option value="NORMAL">일반 (비공개 선택)</option>
                            </select>
                        </span>
                    </li>
                </ul>
                <div>
                    <div class="ch champ-search">
                        <div class="search">
                            <input type="text" placeholder="챔피언 검색">
                            <img src="" alt="">
                        </div>
                        <div class="content"></div>
                    </div>
                </div>
            </div>
            <div class="two main">
                <div class="status">그래프</div>
                <div class="champions">챔피언들</div>
                <div class="positions">포지션들</div>
            </div>
            <div class="three main">
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                <li class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">무작위 총력전</div>
                                    <div class="time-stamp">
                                        <div style="position: relative;">4일전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result">승리</div>
                                    <div class="length">19분 50초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="">
                                                    <span class="champion-level">18</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span>20</span>/
                                                <span class="d">8</span>/
                                                <span>27</span>
                                            </div>
                                            <div class="ratio">
                                                <span>5.88:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div style="position: relative;">킬관여85%</div>
                                            </div>
                                            <div class="ward">제어 와드 0</div>
                                            <div class="cs">
                                                <div style="position: relative;">CS 81 (4.1)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;">Diamond 3</div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                               <li class="first"><div><img src="" alt=""></div></li> 
                                            </ul>
                                            <div class="ward"><div><img src="" alt=""></div></div>
                                        </div>
                                        <div class="multi-kill">쿼드라킬</div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">자기이름</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img src="" alt="">
                                            </div>
                                            <div class="name">모짜르트</div>
                                        </li>
                                    </ul>
                                    <ul></ul>
                                </div>
                            </div>
                        </div>
                        <div class="action">
                            <button class="detail2">
                                <img src="" alt="">
                            </button>
                        </div>
                    </div>
                </li>
                
            </div>
            <div class="more2">더보기</div>
        </div>
        
        <!-- 오른쪽 문단 -->
    </div class="contents-container">
   
</body>
    <script>
    	

    </script>
</html>