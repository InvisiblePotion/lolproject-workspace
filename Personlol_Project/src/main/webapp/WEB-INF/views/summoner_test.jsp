<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Summoner Test</title>
        <!-- jQuery 3.6.4 min CDN -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
            crossorigin="anonymous"></script>
        <script src="../resources/js/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="../resources/css/summinfo.css">
        <style>
            body {background-color: #444 !important; color: #fff !important;}
        </style>
    </head>
    <body>
        <h1>SUMMONER TEST ZONE</h1>
        <input type="text" id="game-id-summoner-name" placeholder="summoner_name">
        <button id="game-ids">게임 id 획득</button>
        <div class="container">
            <c:forEach var="idx" begin="1" end="20">
                <!-- ${idx}번 데이터 -->
                <li id="record" class="main list">
                    <div class="madiv list2">
                        <div class="content">
                            <div class="game-content">
                                <div class="game">
                                    <div class="type">솔랭</div>
                                    <div class="time-stamp">
                                        <div class="raw-game-endtime" style="position: relative;">0일 전</div>
                                    </div>
                                    <div class="bar"></div>
                                    <div class="result raw-game-win">승패</div>
                                    <div class="length raw-game-duration">00분 00초</div>
                                </div>
                                <div class="sinfo">
                                    <div class="into">
                                        <div class="champion">
                                            <div class="icon">
                                                <a href="fd">
                                                    <img src="" alt="" class="raw-self-champion-icon">
                                                    <span class="champion-level raw-self-champion-level">0</span>
                                                </a>
                                            </div>
                                            <div class="spells">
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="" class="raw-self-spell-spell1">
                                                    </div>
                                                </div>
                                                <div class="spell">
                                                    <div class="sp">
                                                        <img src="" alt="" class="raw-self-spell-spell2">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="runes">
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="" class="raw-self-rune-core-mainrune">
                                                    </div>
                                                </div>
                                                <div class="rune">
                                                    <div class="sp">
                                                        <img src="" alt="" class="raw-self-rune-runetype-sub">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="kda">
                                            <div class="k-d-a">
                                                <span class="raw-self-kda-kills">0</span>/
                                                <span class="raw-self-kda-deaths">0</span>/
                                                <span class="raw-self-kda-assists">0</span>
                                            </div>
                                            <div class="ratio">
                                                <span class="raw-self-kda-kda">0.00:1</span>
                                                평점
                                            </div>
                                        </div>
                                        <div class="status">
                                            <div class="p-kill">
                                                <div class="raw-self-kda-killparticipation" style="position: relative;">킬관여 0%</div>
                                            </div>
                                            <div class="ward raw-self-vision-controlward">제어 와드 0</div>
                                            <div class="cs">
                                                <div class="raw-self-cs" style="position: relative;">CS 0 (0)</div>
                                            </div>
                                            <div class="average-tier">
                                                <div style="position: relative;"></div>
                                            </div>
                                        </div>
                
                                    </div>
                                    <div class="intoto">
                                        <div class="items">
                                            <ul>
                                                <li class="first">
                                                    <div><img class="raw-self-item-item1" src="" alt=""></div>
                                                </li>
                                                <li class="first">
                                                    <div><img class="raw-self-item-item2" src="" alt=""></div>
                                                </li>
                                                <li class="first">
                                                    <div><img class="raw-self-item-item3" src="" alt=""></div>
                                                </li>
                                                <li class="first">
                                                    <div><img class="raw-self-item-item4" src="" alt=""></div>
                                                </li>
                                                <li class="first">
                                                    <div><img class="raw-self-item-item5" src="" alt=""></div>
                                                </li>
                                                <li class="first">
                                                    <div><img class="raw-self-item-item6" src="" alt=""></div>
                                                </li>
                                            </ul>
                                            <div class="ward">
                                                <div><img class="raw-self-item-trinket" src="" alt=""></div>
                                            </div>
                                        </div>
                                        <div class="multi-kill raw-self-kda-multikill"></div>
                                    </div>
                                </div>
                                <div class="participants">
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part1-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part1-summoner-name">Player1</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part2-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part2-summoner-name">Player2</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part3-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part3-summoner-name">Player3</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part4-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part4-summoner-name">Player4</div>
                                        </li>
                                        <li class="p-5th">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part5-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part5-summoner-name">Player5</div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part6-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part6-summoner-name">Player6</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part7-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part7-summoner-name">Player7</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part8-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part8-summoner-name">Player8</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part9-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part9-summoner-name">Player9</div>
                                        </li>
                                        <li class="p-5">
                                            <div class="icon" style="position: relative;">
                                                <img class="raw-part10-champion-icon" src="" alt="">
                                            </div>
                                            <div class="name raw-part10-summoner-name">Player10</div>
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
            </c:forEach>
        </div>

    </body>
<script src="../resources/js/summoner_test.js"></script>
</html>