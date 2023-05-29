<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Summoner Test</title>
        <!-- jQuery 3.6.4 min CDN -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
            crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../resources/css/summinfo.css">
        <style>
            body {background-color: #444 !important; color: #fff !important;}
        </style>
    </head>
    <body>
        <h1>SUMMONER TEST ZONE</h1>
        <input type="text" id="game-id-summoner-name" placeholder="summoner_name">
        <input type="text" id="game-id-on-where" placeholder="on_where">
        <button id="game-ids">게임 id 획득</button>

        <!-- 1번 데이터 -->
        <li class="main list">
            <div class="madiv list2">
                <div class="content">
                    <div class="game-content">
                        <div class="game">
                            <div class="type">솔랭</div>
                            <div class="time-stamp">
                                <div class="raw-game-endtime" style="position: relative;">4일전</div>
                            </div>
                            <div class="bar"></div>
                            <div class="result raw-game-win">승리</div>
                            <div class="length raw-game-duration">19분 50초</div>
                        </div>
                        <div class="sinfo">
                            <div class="into">
                                <div class="champion">
                                    <div class="icon">
                                        <a href="fd">
                                            <img src="" alt="" class="raw-self-champion-icon">
                                            <span class="champion-level raw-self-champion-level">18</span>
                                        </a>
                                    </div>
                                    <div class="spells">
                                        <div class="spell">
                                            <div class="sp">
                                                <img src="" alt="" class="raw-self-champion-spell1">
                                            </div>
                                        </div>
                                        <div class="spell">
                                            <div class="sp">
                                                <img src="" alt="" class="raw-self-champion-spell2">
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
                                        <span class="raw-self-kda-kills">20</span>/
                                        <span class="raw-self-kda-deaths">8</span>/
                                        <span class="raw-self-kda-assists">27</span>
                                    </div>
                                    <div class="ratio">
                                        <span class="raw-self-kda-kda">5.88:1</span>
                                        평점
                                    </div>
                                </div>
                                <div class="status">
                                    <div class="p-kill">
                                        <div class="raw-self-kda-killparticipation" style="position: relative;">킬관여85%</div>
                                    </div>
                                    <div class="ward raw-self-vision-controlward">제어 와드 0</div>
                                    <div class="cs">
                                        <div class="raw-self-cs-totalcs raw-self-cs-perminute" style="position: relative;">CS 81 (4.1)</div>
                                    </div>
                                    <div class="average-tier">
                                        <div style="position: relative;">Diamond 3</div>
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
                                <div class="multi-kill raw-self-kda-multikill">쿼드라킬</div>
                            </div>
                        </div>
                        <div class="participants">
                            <ul>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part1-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part1-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part2-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part2-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part3-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part3-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part4-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part4-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5th">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part5-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part5-summoner-name">자기이름</div>
                                </li>
                            </ul>
                            <ul>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part6-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part6-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part7-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part7-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part8-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part8-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part9-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part9-summoner-name">모짜르트</div>
                                </li>
                                <li class="p-5">
                                    <div class="icon" style="position: relative;">
                                        <img class="raw-part10-champion-icon" src="" alt="">
                                    </div>
                                    <div class="name raw-part10-summoner-name">모짜르트</div>
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

        <!-- 2번 데이터 -->
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
                                        <li class="first">
                                            <div><img src="" alt=""></div>
                                        </li>
                                        <li class="first">
                                            <div><img src="" alt=""></div>
                                        </li>
                                        <li class="first">
                                            <div><img src="" alt=""></div>
                                        </li>
                                        <li class="first">
                                            <div><img src="" alt=""></div>
                                        </li>
                                        <li class="first">
                                            <div><img src="" alt=""></div>
                                        </li>
                                        <li class="first">
                                            <div><img src="" alt=""></div>
                                        </li>
                                    </ul>
                                    <div class="ward">
                                        <div><img src="" alt=""></div>
                                    </div>
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
    </body>
    <script>
        /**
         * 해당 소환사의 최근 20게임에 대한 게임 ID를 가져온다.   
         * `url: /personlol/summoner/game-ids/`
         */
        function getGameIds() {
            let summoner_name = $('#game-id-summoner-name').val()
            $.ajax({
                method: 'get',
                url: '/personlol/summoner/rest/game-ids/' + $('#game-id-on-where').val(),
                data: {'summoner_name': summoner_name}
            }).done((res)=>{
                console.log(res);
                putGameIds(summoner_name, res);
                getGameRecords(res)
            }).fail((err)=>{
                console.log(err);
            });
        }

        /** 
         * summoner_recent_game 테이블에 게임 id를 넣는다
         * `url: /personlol/summoner/recent-game`
         * @param {string} summoner_name
         * @param {string[]} game_ids
         */
        function putGameIds(summoner_name, game_ids) {
            $.ajax({
                method: 'post',
                url: '/personlol/summoner/rest/recent-game',
                data: {
                    'summoner_name': summoner_name,
                    'game_ids': game_ids}
            })
            // .done((res)=>{console.log("done!");}).fail((err)=>{console.log("error...");})
        }

        /**
         * RawData 테이블에서 해당 게임 ID 리스트에 매치되는 게임 데이터를 가져온다
         * @param {string[]} game_id_list
         */
        function getGameRecords(game_id_list) {
            $.ajax({
                method: 'post',
                url: '/personlol/summoner/rest/game-record',
                data: {'game_ids': game_id_list}
            }).done((res)=>{
                console.log(res);
            }).fail((err)=>{
                console.log(err);
            })
        }

        $('#game-ids').click(getGameIds)
    </script>
</html>