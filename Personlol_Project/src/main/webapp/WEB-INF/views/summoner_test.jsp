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
        <button id="game-ids">게임 id 획득</button>
        <div class="container">
            <!-- 1번 데이터 -->
            <li id="record" class="main list">
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
                                            <div class="raw-self-cs" style="position: relative;">CS 81 (4.1)</div>
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
            <li id="record" class="main list">
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
                                            <div class="raw-self-cs" style="position: relative;">CS 81 (4.1)</div>
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
        </div>

    </body>
    <script>
        /**
         * 해당 소환사의 최근 20게임에 대한 게임 ID를 가져온다.   
         * `url: /personlol/summoner/game-id-list/`
         * @param {string} summoner_name 소환사 이름
         */
        function getGameIds(summoner_name) {
            $.ajax({
                method: 'get',
                url: '/personlol/summoner/rest/game-id-list',
                data: {'summoner_name': summoner_name}
            }).done((game_id_list)=>{
                console.log(game_id_list);
                getGameRecords(game_id_list);
                putGameIds(summoner_name, game_id_list); // ### summoner_recent_game 테이블에서 꺼내와도 작동하는 문제 존재(성능 이슈)
            }).fail((err)=>{
                console.log(err);
            });
        }

        /** 
         * summoner_recent_game 테이블에 게임 id를 넣는다
         * `url: /personlol/summoner/recent-game`
         * @param {string} summoner_name 소환사 이름
         * @param {string[]} game_id_list 게임 ID 리스트
         */
        function putGameIds(summoner_name, game_id_list) {
            $.ajax({
                method: 'post',
                url: '/personlol/summoner/rest/recent-game',
                data: {
                    'summoner_name': summoner_name,
                    'game_id_list': game_id_list}
            })
        }

        /**
         * RawData 테이블에서 해당 게임 ID 리스트에 매치되는 게임 데이터를 가져온다
         * @param {string[]} game_id_list 게임 ID 리스트
         */
        function getGameRecords(game_id_list) {
            $.ajax({
                method: 'post',
                url: '/personlol/summoner/rest/game-record',
                data: {'game_id_list': game_id_list}
            }).done((rawdata_list)=>{
                console.log(rawdata_list);
                for (const idx in rawdata_list) {
                    if (Object.hasOwnProperty.call(rawdata_list, idx)) {
                        if (idx >= 2) {return;} // ### 테스트를 위해 입력할 게임 수를 2개로 제한
                        const game_data = rawdata_list[idx];
                        inputGameDataShort(game_data, parseInt(idx)+1);
                    }
                }
            }).fail((err)=>{
                console.log(err);
            })
        }

        /**
         * RawData 테이블의 데이터를 사용해 접은 상태의 게임 전적 정보를 정해진 클래스가 붙은 각 태그에 삽입한다.
         * 태그에 붙여야 하는 클래스 이름에 대해서는 `소환사 전적 페이지 클래스 리스트.md` 참고
         * @param {object} game_data 한 게임 분량의 RawData
         * @param {int} game_number 삽입할 태그의 위치 (게임의 순번, 1부터 시작)
         */
        function inputGameDataShort(game_data, game_number) {
            const summoner_name = $('#game-id-summoner-name').val() // ### 소환사 이름 가져오는 위치 변경 필요!
            const time_now = Date.now();
            const parse_keys = [
                'game','champion','spell','skill','skilltree',
                'rune','item','kda','gold','cs','damage','vision'];

            // 파싱
            for (const idx in game_data) {
                if (Object.hasOwnProperty.call(game_data, idx)) {
                    const part = game_data[idx];
                    for (const key of parse_keys) {
                        game_data[idx][key] = JSON.parse(part[key]);
                    }
                }
            }

            let self_number = null;
            for (const idx in game_data) {
                if (Object.hasOwnProperty.call(game_data, idx)) {
                    const part = game_data[idx];
                    if (part['participant_name'] == summoner_name) {self_number = parseInt(idx);}
                }
            }
            const duration_min = Math.floor(parseInt(game_data[0]['game']['gameDuration']) / 60);
            const duration_sec = parseInt(game_data[0]['game']['gameDuration']) % 60;
            const prefix = '.container #record:nth-child('+game_number+') '; // ### 컨테이너와 각 게임 클래스 맞춰야 함!

            let time_elapsed = time_now - game_data[0]['game']['gameEndTimestamp'];
            if (time_elapsed >= 86400000) {
                $(prefix+'.raw-game-endtime').html(Math.floor(time_elapsed / 86400000)+'일 전');
            } else if (time_elapsed >= 3600000) {
                $(prefix+'.raw-game-endtime').html(Math.floor(time_elapsed / 3600000)+'시간 전');
            } else {
                $(prefix+'.raw-game-endtime').html(Math.floor(time_elapsed / 60000)+'분 전');
            }
            game_data[0]['champion']['win'] == 1 ? $(prefix+'.raw-game-win').html('승리') : $(prefix+'.raw-game-win').html('패배') // ## 이거 되나...?
            $(prefix+'.raw-game-duration').html(duration_min+'분 '+duration_sec+'초'); // ### 
            $(prefix+'.raw-self-champion-icon')[0].src = '../resources/dd/img/champion/icon/Ahri.png'; // ### 챔피언 아이콘 DB에서 가져와야 함!
            $(prefix+'.raw-self-champion-level').html(game_data[self_number]['champion']['champLevel']);
            $(prefix+'.raw-self-spell-spell1')[0].src = '../resources/dd/img/spell/'+game_data[self_number]['spell']['summoner1Id']+'.png'; // ### 주소, 확장자 맞춰야 함!
            $(prefix+'.raw-self-spell-spell2')[0].src = '../resources/dd/img/spell/'+game_data[self_number]['spell']['summoner2Id']+'.png'; // ### 주소, 확장자 맞춰야 함!
            $(prefix+'.raw-self-rune-core-mainrune')[0].src = '../resources/dd/img/rune/perk/'+game_data[self_number]['rune']['runeCorePerk']+'.png';
            $(prefix+'.raw-self-rune-runetype-sub')[0].src = '../resources/dd/img/rune/style/'+game_data[self_number]['rune']['runeSubStyle']+'.png';
            $(prefix+'.raw-self-kda-kills').html(game_data[self_number]['kda']['kills']);
            $(prefix+'.raw-self-kda-deaths').html(game_data[self_number]['kda']['deaths']);
            $(prefix+'.raw-self-kda-assists').html(game_data[self_number]['kda']['assists']);
            $(prefix+'.raw-self-kda-kda').html(game_data[self_number]['kda']['assists']+':1');
            $(prefix+'.raw-self-kda-killparticipation').html('킬관여 '+(parseInt(game_data[self_number]['kda']['killParticipation'])*100).toFixed(2)+'%');
            $(prefix+'.raw-self-vision-controlward').html('제어 와드 '+game_data[self_number]['vision']['controlWardsPlaced']);
            $(prefix+'.raw-self-cs').html('CS '+game_data[self_number]['cs']['totalMinionsKilled']+' ('+(parseInt(game_data[self_number]['cs']['totalMinionsKilled'])/duration_min).toFixed(1)+')');
            for (let idx = 0; idx < 6; idx++) {
                $(prefix+'.raw-self-item-item'+(parseInt(idx)+1))[0].src = '../resources/dd/img/item/'+game_data[self_number]['item']['item'+idx]+'.png';
            }
            $(prefix+'.raw-self-item-trinket')[0].src = '../resources/dd/img/item/'+game_data[self_number]['item']['item6']+'.png';
            switch (parseInt(game_data[self_number]['kda']['largestMultiKill'])) {
                case 0:
                    $(prefix+'.multi-kill').css('display', 'none'); // ### 디자인 상태에 따라 변경 필요
                    $(prefix+'.raw-self-kda-multikill').html('');
                    break;
                case 1:
                $(prefix+'.multi-kill').css('display', 'none'); // ### 디자인 상태에 따라 변경 필요
                    $(prefix+'.raw-self-kda-multikill').html('');
                    break;
                case 2:
                    $(prefix+'.raw-self-kda-multikill').html('더블킬');
                    break;
                case 3:
                    $(prefix+'.raw-self-kda-multikill').html('트리플킬');
                    break;
                case 4:
                    $(prefix+'.raw-self-kda-multikill').html('쿼드라킬');
                    break;
                case 5:
                    $(prefix+'.raw-self-kda-multikill').html('펜타킬');
                    break;
            }
            for (let idx = 0; idx < 10; idx++) {
                $(prefix+'.raw-part'+(parseInt(idx)+1)+'-champion-icon')[0].src = '../resources/dd/img/champion/icon/Ahri.png'; // ### 챔피언 아이콘 DB에서 가져와야 함!
                $(prefix+'.raw-part'+(parseInt(idx)+1)+'-summoner-name').html(game_data[idx]['participant_name']);
            }
        }

        $('#game-ids').click(()=>{ // ### 페이지에 맞게 조건 변경 필요 ($(function (){}))
            getGameIds($('#game-id-summoner-name').val())  // ### 소환사 이름 가져오는 위치 변경 필요!
        })
    </script>
</html>