/**
 * 현재 URL의 쿼리 파라미터에서 값을 가져온다
 * @param {string} key 쿼리 파라미터 키
 * @returns 쿼리 파라미터 값
 */
function getQueryString(key) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(key);
}

/**
 * 해당 소환사의 최근 20게임에 대한 게임 ID를 가져온다.   
 * `url: /personlol/summoner/game-id-list/`
 * @param {string} summoner_name 소환사 이름
 */
function getGameIds(summoner_name) {
    $.ajax({
        method: 'get',
        url: '/personlol/summoner/game-id-list',
        data: {'summoner_name': summoner_name}
    }).done((game_id_list)=>{
        console.log(game_id_list); // ### 로그
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
        url: '/personlol/summoner/recent-game',
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
        url: '/personlol/summoner/game-record',
        data: {'game_id_list': game_id_list}
    }).done((rawdata_list)=>{
        console.log(rawdata_list); // ### 로그
        const parse_keys = [
            'game','champion','spell','skill','skilltree',
            'rune','item','kda','gold','cs','damage','vision'];
        for (const idx in rawdata_list) {
            if (Object.hasOwnProperty.call(rawdata_list, idx)) {
                let game_data = rawdata_list[idx];
            
                // 파싱
                for (const idx in game_data) {
                    if (Object.hasOwnProperty.call(game_data, idx)) {
                        const part = game_data[idx];
                        for (const key of parse_keys) {
                            game_data[idx][key] = JSON.parse(part[key]);
                        }
                    }
                }
                inputGameDataShort(game_data, parseInt(idx)+1);
                inputGameDataExpend(game_data, parseInt(idx)+1);
            }
        }
    }).fail((err)=>{
        console.log(err);
    })
}

/**
 * RawData 테이블의 데이터를 사용해 접은 상태의 게임 전적 정보를 정해진 클래스가 붙은 각 태그에 삽입한다.
 * 태그에 붙여야 하는 클래스 이름에 대해서는 `소환사 전적 페이지 클래스 리스트.md` 참고
 * @param {object} game_data 한 게임 분량의 파싱된 RawData
 * @param {int} game_number 삽입할 태그의 위치 (게임의 순번, 1부터 시작)
 */
function inputGameDataShort(game_data, game_number) {
    const summoner_name = getQueryString('summoner_name');
    const time_now = Date.now();

    let self_number = null;
    for (const idx in game_data) {
        if (Object.hasOwnProperty.call(game_data, idx)) {
            const part = game_data[idx];
            if (part['participant_name'] == summoner_name) {self_number = parseInt(idx);}
        }
    }
    const duration_min = Math.floor(parseInt(game_data[0]['game']['gameDuration']) / 60);
    const duration_sec = parseInt(game_data[0]['game']['gameDuration']) % 60;
    const prefix = '.raw-record-container .raw-record-item:nth-child('+game_number+') '; // ### 컨테이너와 각 게임 클래스 맞춰야 함!

    let time_elapsed = time_now - game_data[0]['game']['gameEndTimestamp'];
    if (time_elapsed >= 86400000) {
        $(prefix+'.raw-game-endtime').html(Math.floor(time_elapsed / 86400000)+'일 전');
    } else if (time_elapsed >= 3600000) {
        $(prefix+'.raw-game-endtime').html(Math.floor(time_elapsed / 3600000)+'시간 전');
    } else {
        $(prefix+'.raw-game-endtime').html(Math.floor(time_elapsed / 60000)+'분 전');
    }
    game_data[0]['champion']['win'] == 1 ? $(prefix+'.raw-game-win').html('승리') : $(prefix+'.raw-game-win').html('패배');
    $(prefix+'.raw-game-duration').html(duration_min+'분 '+duration_sec+'초');
    $(prefix+'.raw-self-champion-icon')[0].src = '../resources/dd/img/champion/icon-id/'+game_data[self_number]['champion']['championId']+'.png';
    $(prefix+'.raw-self-champion-level').html(game_data[self_number]['champion']['champLevel']);
    $(prefix+'.raw-self-spell-spell1')[0].src = '../resources/dd/img/summonerspell/'+game_data[self_number]['spell']['summoner1Id']+'.png';
    $(prefix+'.raw-self-spell-spell2')[0].src = '../resources/dd/img/summonerspell/'+game_data[self_number]['spell']['summoner2Id']+'.png';
    $(prefix+'.raw-self-rune-core-mainrune')[0].src = '../resources/dd/img/rune/perk/'+game_data[self_number]['rune']['runeCorePerk']+'.png';
    $(prefix+'.raw-self-rune-runetype-sub')[0].src = '../resources/dd/img/rune/style/'+game_data[self_number]['rune']['runeSubStyle']+'.png';
    $(prefix+'.raw-self-kda-kills').html(game_data[self_number]['kda']['kills']);
    $(prefix+'.raw-self-kda-deaths').html(game_data[self_number]['kda']['deaths']);
    $(prefix+'.raw-self-kda-assists').html(game_data[self_number]['kda']['assists']);
    game_data[self_number]['kda']['deaths'] == 0 ? $(prefix+'.raw-self-kda-kda').html('Perfect') : $(prefix+'.raw-self-kda-kda').html(parseFloat(game_data[self_number]['kda']['kda']).toFixed(2)+':1');
    $(prefix+'.raw-self-kda-killparticipation').html('킬관여 '+(parseFloat(game_data[self_number]['kda']['killParticipation'])*100).toFixed(0)+'%');
    $(prefix+'.raw-self-vision-controlward').html('제어 와드 '+game_data[self_number]['vision']['controlWardsPlaced']);
    $(prefix+'.raw-self-cs').html('CS '+game_data[self_number]['cs']['totalMinionsKilled']+' ('+(parseInt(game_data[self_number]['cs']['totalMinionsKilled'])/duration_min).toFixed(1)+')');
    for (let idx = 0; idx < 6; idx++) {
        if (game_data[self_number]['item']['item'+idx] == 0) {
            $(prefix+'.raw-self-item-item'+(parseInt(idx)+1))[0].src = ''
        } else {
            $(prefix+'.raw-self-item-item'+(parseInt(idx)+1))[0].src = '../resources/dd/img/item/'+game_data[self_number]['item']['item'+idx]+'.png';
        }
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
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-champion-icon')[0].src = '../resources/dd/img/champion/icon-id/'+game_data[idx]['champion']['championId']+'.png';
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-summoner-name').html(game_data[idx]['participant_name']);
    }
}

/**
 * RawData 테이블의 데이터를 사용해 펼친 상태의 게임 전적 정보를 정해진 클래스가 붙은 각 태그에 삽입한다.
 * 태그에 붙여야 하는 클래스 이름에 대해서는 `소환사 전적 페이지 클래스 리스트.md` 참고
 * @param {object} game_data 한 게임 분량의 파싱된 RawData
 * @param {int} game_number 삽입할 태그의 위치 (게임의 순번, 1부터 시작)
 */
function inputGameDataExpend(game_data, game_number) {

    const duration_min = Math.floor(parseInt(game_data[0]['game']['gameDuration']) / 60);
    const prefix = '.raw-record-container .raw-record-item:nth-child('+game_number+') '; // ### 펼친 뒤의 구조에 맞게 바꿔야 함! (현재는 접힌 상태 기준)
    
    let max_dealt_damage = 0; // ### 바를 표시하지 않는다면 필요 없는 코드
    let max_taken_damage = 0; // ### 바를 표시하지 않는다면 필요 없는 코드
    
    for (let idx = 0; idx < 10; idx++) {
        // >:champion
        // raw-part0-champion-icon (일단은 inputGameDataShort()에서 처리됨)
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-champion-level').html(game_data[idx]['champion']['champLevel'])
        
        // >:spell
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-spell-spell1')[0].src = '../resources/dd/img/summonerspell/'+game_data[idx]['spell']['summoner1Id']+'.png';
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-spell-spell2')[0].src = '../resources/dd/img/summonerspell/'+game_data[idx]['spell']['summoner2Id']+'.png';
        
        // >:rune
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-rune-core-mainrune')[0].src = '../resources/dd/img/rune/perk/'+game_data[idx]['rune']['runeCorePerk']+'.png';
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-rune-runetype-sub')[0].src = '../resources/dd/img/rune/style/'+game_data[idx]['rune']['runeSubStyle']+'.png';
        
        // >:summoner
        // raw-part0-summoner-name (일단은 inputGameDataShort()에서 처리됨)
        
        // >:kda
        let kda_data = game_data[idx]['kda']['kills']+'/'+game_data[idx]['kda']['deaths']+'/'+game_data[idx]['kda']['assists']+' ('+(parseFloat(game_data[idx]['kda']['killParticipation'])*100).toFixed(0)+'%)';
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-kda-data').html(kda_data);
        game_data[idx]['kda']['deaths'] == 0 ? $(prefix+'.raw-part'+(parseInt(idx)+1)+'-kda-kda').html('Perfect') : $(prefix+'.raw-part'+(parseInt(idx)+1)+'-kda-kda').html(parseFloat(game_data[idx]['kda']['kda']).toFixed(2)+':1');
        
        // >:damage
        const damage_dealt = parseInt(game_data[idx]['damage']['totalDamageDealtToChampions']);
        if (damage_dealt > max_dealt_damage) {max_dealt_damage = damage_dealt;} // ### 바를 표시하지 않는다면 필요 없는 코드
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-damage-dealt').html(damage_dealt);
        const taken_damage = parseInt(game_data[idx]['damage']['totalDamageTaken']);
        if (taken_damage > max_taken_damage) {max_taken_damage = taken_damage;} // ### 바를 표시하지 않는다면 필요 없는 코드
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-damage-taken').html(taken_damage);

        // >:vision
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-vision-controlward').html(game_data[idx]['vision']['controlWardsPlaced']);
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-vision-warddata').html(game_data[idx]['vision']['wardsPlaced']+'/'+game_data[idx]['vision']['wardsKilled']);
        
        // >:cs
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-cs-total').html(game_data[idx]['cs']['totalMinionsKilled']);
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-cs-perminute').html((parseInt(game_data[idx]['cs']['totalMinionsKilled'])/duration_min).toFixed(1));
    
        // >:item
        for (let item_idx = 0; item_idx < 6; item_idx++) {
            if (game_data[self_number]['item']['item'+item_idx] == 0) {
                $(prefix+'.raw-part'+(parseInt(idx)+1)+'-item-item'+(parseInt(item_idx)+1))[0].src = ''
            } else {
                $(prefix+'.raw-part'+(parseInt(idx)+1)+'-item-item'+(parseInt(item_idx)+1))[0].src = '../resources/dd/img/item/'+game_data[self_number]['item']['item'+item_idx]+'.png';
            }
        }
        $(prefix+'.raw-part'+(parseInt(idx)+1)+'-item-trinket')[0].src = '../resources/dd/img/item/'+game_data[self_number]['item']['item6']+'.png';
    }
}

// function recordItemExtender() {
//     $('.raw-record-container').append(
//         <li class="main list raw-record-item">
//         \t<div class="madiv_wrap">
//         \t\t<div class="madiv list2">
//         \t\t\t<div class="content">
//                         <div class="game-content">
//         \t\t\t\t\t<div class="game">
//         \t\t\t\t\t\t<div class="type">솔랭</div>
//         \t\t\t\t\t\t<div class="time-stamp">
//         \t\t\t\t\t\t\t<div class="raw-game-endtime" style="position: relative;">0일 전</div>
//         \t\t\t\t\t\t</div>
//         \t\t\t\t\t\t<div class="bar"></div>
//         \t\t\t\t\t\t<div class="result raw-game-win">-</div>
//         \t\t\t\t\t\t<div class="length raw-game-duration">00분 00초</div>
//         \t\t\t\t\t</div>
//                             <div class="sinfo">
//                                 <div class="into">
//                                     <div class="champion">
//                                         <div class="icon">
//                                             <a href="fd"><img class="raw-self-champion-icon" src="" alt=""><span class="champion-level raw-self-champion-level">18</span>
//                                             </a>
//                                         </div>
//                                         <div class="spells">
//                                             <div class="spell">
//                                                 <div class="sp">
//                                                     <img class="raw-self-spell-spell1" src="" alt="">
//                                                 </div>
//                                             </div>
//                                             <div class="spell">
//                                                 <div class="sp">
//                                                     <img class="raw-self-spell-spell2" src="" alt="">
//                                                 </div>
//                                             </div>
//                                         </div>
//                                         <div class="runes">
//                                             <div class="rune">
//                                                 <div class="sp">
//                                                     <img class="raw-self-rune-core-mainrune" src="" alt="">
//                                                 </div>
//                                             </div>
//                                             <div class="rune">
//                                                 <div class="sp">
//                                                     <img class="raw-self-rune-runetype-sub" src="" alt="">
//                                                 </div>
//                                             </div>
//                                         </div>
//                                     </div>
//                                     <div class="kda">
//                                         <div class="k-d-a">
//                                             <span class="raw-self-kda-kills">0</span> / <span class="d raw-self-kda-deaths">0</span> / <span class="raw-self-kda-assists">0</span>
//                                         </div>
//                                         <div class="ratio">
//                                             <span class="raw-self-kda-kda">0:1</span> 평점
//                                         </div>
//                                     </div>
//                                     <div class="status">
//                                         <div class="p-kill">
//                                             <div class="raw-self-kda-killparticipation" style="position: relative;">킬관여 0%</div>
//                                         </div>
//                                         <div class="ward raw-self-vision-controlward">제어 와드 0</div>
//                                         <div class="cs">
//                                             <div class="raw-self-cs" style="position: relative;">CS 0 (0)</div>
//                                         </div>
//                                         <div class="average-tier">
//                                             <div style="position: relative;"><!-- ### 랭크 데이터 삭제됨 --></div>
//                                         </div>
//                                     </div>
    
//                                 </div>
//                                 <div class="intoto">
//                                     <div class="items">
//                                         <ul>
//                                             <li class="first">
//                                                 <div>
//                                                     <img class="raw-self-item-item1" src="" alt="">
//                                                 </div>
//                                             </li>
//                                             <li class="first">
//                                                 <div>
//                                                     <img class="raw-self-item-item2" src="" alt="">
//                                                 </div>
//                                             </li>
//                                             <li class="first">
//                                                 <div>
//                                                     <img class="raw-self-item-item3" src="" alt="">
//                                                 </div>
//                                             </li>
//                                             <li class="first">
//                                                 <div>
//                                                     <img class="raw-self-item-item4" src="" alt="">
//                                                 </div>
//                                             </li>
//                                             <li class="first">
//                                                 <div>
//                                                     <img class="raw-self-item-item5" src="" alt="">
//                                                 </div>
//                                             </li>
//                                             <li class="first">
//                                                 <div>
//                                                     <img class="raw-self-item-item6" src="" alt="">
//                                                 </div>
//                                             </li>
//                                         </ul>
//                                         <div class="ward">
//                                             <div>
//                                                 <img class="raw-self-item-trinket" src="" alt="">
//                                             </div>
//                                         </div>
//                                     </div>
//                                     <div class="multi-kill raw-self-kda-multikill"></div>
//                                 </div>
//                             </div>
//                             <div class="participants">
//                                 <ul>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part1-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part1-summoner-name">Player1</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part2-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part2-summoner-name">Player2</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part3-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part3-summoner-name">Player3</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part4-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part4-summoner-name">Player4</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part5-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part5-summoner-name">Player5</div>
//                                     </li>
//                                 </ul>
//                                 <ul>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part6-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part6-summoner-name">Player6</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part7-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part7-summoner-name">Player7</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part8-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part8-summoner-name">Player8</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part9-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part9-summoner-name">Player9</div>
//                                     </li>
//                                     <li class="p-5">
//                                         <div class="icon" style="position: relative;">
//                                             <img class="raw-part10-champion-icon" src="" alt="">
//                                         </div>
//                                         <div class="name raw-part10-summoner-name">Player10</div>
//                                     </li>
//                                 </ul>
//                                 <ul></ul>
//                             </div>
//         \t\t\t\t</div>
//         \t\t\t</div>
//         \t\t\t<div class="action">
//                         <button class="detail2">
//                             <img src="" alt="">
//                         </button>
//         \t\t\t</div>
//         \t\t</div>
//         \t\t<div class="list2_detail raw-expend-container">
//                     <div class="list2_detail2">
//                         <div class="detail2 summoner_info">소환사정보</div>
//                         <div class="detail2 summoner_kda">KDA</div>
//                         <div class="detail2 summoner_damage">딜량</div>
//                         <div class="detail2 summoner_ward">와드</div>
//                         <div class="detail2 summoner_cs">CS</div>
//                         <div class="detail2_summoner_items">아이템 빌드</div>
//                     </div>
//         \t\t</div>
//         \t</div>
//         </li>
//     )
// }

/**
 * 펼친 상태의 참가자 리스트에 한명을 만든다
 * @param {int} game_number 삽입할 태그의 위치 (게임의 순번, 1부터 시작)
 * @param {int} part_number 참가자 번호 (1~10)
 */
function expendRecordExtender(game_number, part_number) {
    $('.raw-record-container .raw-record-item:nth-child('+game_number+') .raw-expend-container').append(
        $(
        '<div class="list2_detail2 raw-expend-item">'+
        '\t<div class="detail2 champ_icon">'+
        '\t\t<div class="detail2 champ_icon_icon raw-part'+part_number+'-champion-icon">1.1</div>'+
        '\t\t<div class="detail2 champ_icon_level raw-part'+part_number+'-champion-level">1.2</div>'+
        '\t</div>'+
        '\t<div class="detail2 spells">'+
        '\t\t<div class="detail2 spells_1 raw-part'+part_number+'-spell-spell1">2.1</div>'+
        '\t\t<div class="detail2 spells_2 raw-part'+part_number+'-spell-spell2">2.2</div>'+
        '\t</div>'+
        '\t<div class="detail2 runes">'+
        '\t\t<div class="detail2 runes_1 raw-part'+part_number+'-rune-core-mainrune">3.1</div>'+
        '\t\t<div class="detail2 runes_2 raw-part'+part_number+'-rune-runetype-sub">3.2</div>'+
        '\t</div>'+
        '\t<div class="detail2 name raw-part'+part_number+'-summoner-name">4</div>'+
        '\t<div class="detail2 s_kda">'+
        '\t\t<div class="detail2 k-d-a raw-part'+part_number+'-kda-data">5.3</div>'+
        '\t\t<div class="detail2 kda raw-part'+part_number+'-kda-kda">5.6</div>'+
        '\t</div>'+
        '\t<div class="detail2 damage">'+
        '\t\t<div class="detail2 dealing">'+
        '\t\t\t<div class="detail2 d_num raw-part'+part_number+'-damage-dealt">d_1</div>'+
        '\t\t\t<div class="detail2 deal_graph">d_2</div>'+
        '\t\t</div>'+
        '\t\t<div class="detail2 taken">'+
        '\t\t\t<div class="detail2 t_num raw-part'+part_number+'-damage-taken">t_1</div>'+
        '\t\t\t<div class="detail2 taken_graph">t_2</div>'+
        '\t\t</div>'+
        '\t</div>'+
        '\t<div class="detail2 ward">'+
        '\t\t<div class="detail2 warding raw-part'+part_number+'-vision-controlward">w-1</div>'+
        '\t\t<div class="detail2 del_ward raw-part'+part_number+'-warddata">w-2</div>'+
        '\t</div>'+
        '\t<div class="detail2 s_cs">'+
        '\t\t<div class="game_cs raw-part'+part_number+'-cs-total">8.3</div>'+
        '\t\t<div class="cs_min raw-part'+part_number+'-cs-perminute">8.6</div>'+
        '\t</div>'+
        '\t<div class="detail2 items">'+
        '\t\t<img raw-part'+part_number+'-item-item1 src="" alt="">'+
        '\t\t<img raw-part'+part_number+'-item-item2 src="" alt="">'+
        '\t\t<img raw-part'+part_number+'-item-item3 src="" alt="">'+
        '\t\t<img raw-part'+part_number+'-item-item4 src="" alt="">'+
        '\t\t<img raw-part'+part_number+'-item-item5 src="" alt="">'+
        '\t\t<img raw-part'+part_number+'-item-item6 src="" alt="">'+
        '\t\t<img raw-part'+part_number+'-item-trinket src="" alt="">'+
        '\t</div>'+
        '</div>'
        )
    )
}

$(function () {
    getGameIds(getQueryString('summoner_name'))
})