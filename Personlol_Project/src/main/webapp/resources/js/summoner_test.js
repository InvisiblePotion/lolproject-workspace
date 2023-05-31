function reloadPlayRecord() {
    const summoner_name = getQueryString('summoner_name')
    $('.btn-reload-playrecord').css('background-color', '#729769');
    $('.btn-reload-playrecord').html('전적 갱신 중<br>(약 30초 소요)');
    $.ajax({
        method: 'get',
        url: 'http://localhost:8095/personlol/summoner/reload-playrecord',
        data: {'summoner_name': summoner_name},

    }).done((res)=>{
        console.log(res);
        $('.btn-reload-playrecord').css('background-color', '#699097');
        $('.btn-reload-playrecord').html('가져오는 중<br>(약 10초 소요)');
        getGameIds(summoner_name, true);
    }).fail((err)=>{
        console.log(err);
    });
}

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
 * @param {boolean} is_reload_record 전적 갱신으로 실행 여부
 */
function getGameIds(summoner_name, is_reload_record) {
    $.ajax({
        method: 'get',
        url: '/personlol/summoner/game-id-list',
        data: {'summoner_name': summoner_name}
    }).done((game_id_list)=>{
        console.log(game_id_list); // ### 로그
        getGameRecords(game_id_list, is_reload_record);
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
 * @param {boolean} is_reload_record 전적 갱신으로 실행 여부
 */
function getGameRecords(game_id_list, is_reload_record) {
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

                extendRecordItem(parseInt(idx)+1);
                for (let p = 0; p < 10; p++) {
                    extendExpendParticipant(parseInt(idx)+1, parseInt(p)+1);
                }
                inputGameDataShort(game_data, parseInt(idx)+1);
                inputGameDataExpend(game_data, parseInt(idx)+1);
            }
        }
        if (is_reload_record) {
            $('.btn-reload-playrecord').css('background-color', '#f7ea79');
            $('.btn-reload-playrecord').html('갱신 완료!');
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
    const prefix = '.raw-record-container .raw-record-number-'+game_number+' '; // ### 컨테이너와 각 게임 클래스 맞춰야 함!

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
            $(prefix+'.raw-self-item-item'+(parseInt(idx)+1)).hide();
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
        $(prefix+'.raw-part-number-'+(parseInt(idx)+1)+'.raw-part-champion-icon')[0].src = '../resources/dd/img/champion/icon-id/'+game_data[idx]['champion']['championId']+'.png';
        $(prefix+'.raw-part-number-'+(parseInt(idx)+1)+'.raw-part-summoner-name').html(game_data[idx]['participant_name']);
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
    
    let max_dealt_damage = 0; // ### 바를 표시하지 않는다면 필요 없는 코드
    let max_taken_damage = 0; // ### 바를 표시하지 않는다면 필요 없는 코드
    
    for (let idx = 0; idx < 10; idx++) {

        let prefix = '.raw-record-container .raw-record-number-'+game_number+' .raw-part-number-'+(parseInt(idx)+1)+' ';

        // >:champion
        $(prefix+'.raw-part-champion-icon')[0].src = '../resources/dd/img/champion/icon-id/'+game_data[idx]['champion']['championId']+'.png';
        $(prefix+'.raw-part-champion-level').html(game_data[idx]['champion']['champLevel'])
        
        // >:spell
        $(prefix+'.raw-part-spell-spell1')[0].src = '../resources/dd/img/summonerspell/'+game_data[idx]['spell']['summoner1Id']+'.png';
        $(prefix+'.raw-part-spell-spell2')[0].src = '../resources/dd/img/summonerspell/'+game_data[idx]['spell']['summoner2Id']+'.png';
        
        // >:rune
        $(prefix+'.raw-part-rune-core-mainrune')[0].src = '../resources/dd/img/rune/perk/'+game_data[idx]['rune']['runeCorePerk']+'.png';
        $(prefix+'.raw-part-rune-runetype-sub')[0].src = '../resources/dd/img/rune/style/'+game_data[idx]['rune']['runeSubStyle']+'.png';
        
        // >:summoner
        $(prefix+'.raw-part-summoner-name').html(game_data[idx]['participant_name']);
        
        // >:kda
        let kda_data = game_data[idx]['kda']['kills']+'/'+game_data[idx]['kda']['deaths']+'/'+game_data[idx]['kda']['assists']+' ('+(parseFloat(game_data[idx]['kda']['killParticipation'])*100).toFixed(0)+'%)';
        $(prefix+'.raw-part-kda-data').html(kda_data);
        game_data[idx]['kda']['deaths'] == 0 ? $(prefix+'.raw-part-kda-kda').html('Perfect') : $(prefix+'.raw-part-kda-kda').html(parseFloat(game_data[idx]['kda']['kda']).toFixed(2)+':1');
        
        // >:damage
        const damage_dealt = parseInt(game_data[idx]['damage']['totalDamageDealtToChampions']);
        if (damage_dealt > max_dealt_damage) {max_dealt_damage = damage_dealt;} // ### 바를 표시하지 않는다면 필요 없는 코드
        $(prefix+'.raw-part-damage-dealt').html(damage_dealt);
        const taken_damage = parseInt(game_data[idx]['damage']['totalDamageTaken']);
        if (taken_damage > max_taken_damage) {max_taken_damage = taken_damage;} // ### 바를 표시하지 않는다면 필요 없는 코드
        $(prefix+'.raw-part-damage-taken').html(taken_damage);

        // >:vision
        $(prefix+'.raw-part-vision-controlward').html(game_data[idx]['vision']['controlWardsPlaced']);
        $(prefix+'.raw-part-vision-warddata').html(game_data[idx]['vision']['wardsPlaced']+'/'+game_data[idx]['vision']['wardsKilled']);
        
        // >:cs
        $(prefix+'.raw-part-cs-total').html(game_data[idx]['cs']['totalMinionsKilled']);
        $(prefix+'.raw-part-cs-perminute').html((parseInt(game_data[idx]['cs']['totalMinionsKilled'])/duration_min).toFixed(1));
    
        // >:item
        for (let item_idx = 0; item_idx < 6; item_idx++) {
            if (game_data[idx]['item']['item'+item_idx] == 0) {
                $(prefix+'.raw-part-item-item'+(parseInt(item_idx)+1)).hide();
            } else {
                $(prefix+'.raw-part-item-item'+(parseInt(item_idx)+1))[0].src = '../resources/dd/img/item/'+game_data[idx]['item']['item'+item_idx]+'.png';
            }
        }
        $(prefix+'.raw-part-item-trinket')[0].src = '../resources/dd/img/item/'+game_data[idx]['item']['item6']+'.png';
    }
}

/**
 * .raw-record-container 하위에 게임 레코드 1개를 만든다
 * @param {int} record_number 상위 (record_number)번째 전적
 */
function extendRecordItem(record_number) {
    $('.raw-record-container').append(
        '<li class="raw-record-number-'+record_number+' main list raw-record-item">'+
        '\t<div class="madiv_wrap">'+
        '\t\t<div class="madiv list2">'+
        '\t\t\t<div class="content">'+
        '\t\t\t\t<div class="game-content">'+
        '\t\t\t\t\t<div class="game">'+
        '\t\t\t\t\t\t<div class="type">솔랭</div>'+
        '\t\t\t\t\t\t<div class="time-stamp">'+
        '\t\t\t\t\t\t\t<div class="raw-game-endtime" style="position: relative;">0일 전</div>'+
        '\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t<div class="bar"></div>'+
        '\t\t\t\t\t\t<div class="result raw-game-win">-</div>'+
        '\t\t\t\t\t\t<div class="length raw-game-duration">00분 00초</div>'+
        '\t\t\t\t\t</div>'+
        '\t\t\t\t\t<div class="sinfo">'+
        '\t\t\t\t\t\t<div class="into">'+
        '\t\t\t\t\t\t\t<div class="champion">'+
        '\t\t\t\t\t\t\t\t<div class="icon">'+
        '\t\t\t\t\t\t\t\t\t<a href="fd"><img class="raw-self-champion-icon" src="" alt=""><span class="champion-level raw-self-champion-level">18</span>'+
        '\t\t\t\t\t\t\t\t\t</a>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="spells">'+
        '\t\t\t\t\t\t\t\t\t<div class="spell">'+
        '\t\t\t\t\t\t\t\t\t\t<div class="sp">'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-spell-spell1" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t<div class="spell">'+
        '\t\t\t\t\t\t\t\t\t\t<div class="sp">'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-spell-spell2" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="runes">'+
        '\t\t\t\t\t\t\t\t\t<div class="rune">'+
        '\t\t\t\t\t\t\t\t\t\t<div class="sp">'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-rune-core-mainrune" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t<div class="rune">'+
        '\t\t\t\t\t\t\t\t\t\t<div class="sp">'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-rune-runetype-sub" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t<div class="kda">'+
        '\t\t\t\t\t\t\t\t<div class="k-d-a">'+
        '\t\t\t\t\t\t\t\t\t<span class="raw-self-kda-kills">0</span> / <span class="d raw-self-kda-deaths">0</span> / <span class="raw-self-kda-assists">0</span>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="ratio">'+
        '\t\t\t\t\t\t\t\t\t<span class="raw-self-kda-kda">0:1</span> 평점'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t<div class="status">'+
        '\t\t\t\t\t\t\t\t<div class="p-kill">'+
        '\t\t\t\t\t\t\t\t\t<div class="raw-self-kda-killparticipation" style="position: relative;">킬관여 0%</div>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="ward raw-self-vision-controlward">제어 와드 0</div>'+
        '\t\t\t\t\t\t\t\t<div class="cs">'+
        '\t\t\t\t\t\t\t\t\t<div class="raw-self-cs" style="position: relative;">CS 0 (0)</div>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="average-tier">'+
        '\t\t\t\t\t\t\t\t\t<div style="position: relative;"><!-- ### 랭크 데이터 삭제됨 --></div>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t<div class="intoto">'+
        '\t\t\t\t\t\t\t<div class="items">'+
        '\t\t\t\t\t\t\t\t<ul>'+
        '\t\t\t\t\t\t\t\t\t<li class="first">'+
        '\t\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-item1" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t\t\t<li class="first">'+
        '\t\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-item2" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t\t\t<li class="first">'+
        '\t\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-item3" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t\t\t<li class="first">'+
        '\t\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-item4" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t\t\t<li class="first">'+
        '\t\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-item5" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t\t\t<li class="first">'+
        '\t\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-item6" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t\t</ul>'+
        '\t\t\t\t\t\t\t\t<div class="ward">'+
        '\t\t\t\t\t\t\t\t\t<div>'+
        '\t\t\t\t\t\t\t\t\t\t<img class="raw-self-item-trinket" src="" alt="">'+
        '\t\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t<div class="multi-kill raw-self-kda-multikill"></div>'+
        '\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t</div>'+
        '\t\t\t\t\t<div class="participants">'+
        '\t\t\t\t\t\t<ul>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-1 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-1 name raw-part-summoner-name">Player1</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-2 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-2 name raw-part-summoner-name">Player2</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-3 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-3 name raw-part-summoner-name">Player3</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-4 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-4 name raw-part-summoner-name">Player4</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-5 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-5 name raw-part-summoner-name">Player5</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t</ul>'+
        '\t\t\t\t\t\t<ul>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-6 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-6 name raw-part-summoner-name">Player6</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-7 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-7 name raw-part-summoner-name">Player7</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-8 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-8 name raw-part-summoner-name">Player8</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-9 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-9 name raw-part-summoner-name">Player9</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t\t<li class="p-5">'+
        '\t\t\t\t\t\t\t\t<div class="icon" style="position: relative;">'+
        '\t\t\t\t\t\t\t\t\t<img class="raw-part-number-10 raw-part-champion-icon" src="" alt="">'+
        '\t\t\t\t\t\t\t\t</div>'+
        '\t\t\t\t\t\t\t\t<div class="raw-part-number-10 name raw-part-summoner-name">Player10</div>'+
        '\t\t\t\t\t\t\t</li>'+
        '\t\t\t\t\t\t</ul>'+
        '\t\t\t\t\t\t<ul></ul>'+
        '\t\t\t\t\t</div>'+
        '\t\t\t\t</div>'+
        '\t\t\t</div>'+
        '\t\t\t<div class="action">'+
        '\t\t\t\t<button onclick="toggleRecordExpend(this)" class="raw-record-number-'+record_number+' detail2 btn-expend-toggle">'+ // ### 위치기억
        '\t\t\t\t\t<img src="" alt="">'+
        '\t\t\t\t</button>'+
        '\t\t\t</div>'+
        '\t\t</div>'+
        '\t\t<div class="list2_detail raw-expend-container" style="display: none">'+
        '\t\t\t<div class="list2_expend">'+
        '\t\t\t\t<div class="summoner_info">소환사정보</div>'+
        '\t\t\t\t<div class="summoner_kda">KDA</div>'+
        '\t\t\t\t<div class="summoner_damage">딜량</div>'+
        '\t\t\t\t<div class="summoner_ward">와드</div>'+
        '\t\t\t\t<div class="summoner_cs">CS</div>'+
        '\t\t\t\t<div class="summoner_items">아이템 빌드</div>'+
        '\t\t\t</div>'+
        '\t\t</div>'+
        '\t</div>'+
        '</li>'
    )
}

/**
 * .raw-expend-container 하위에 참가자 한명을 만든다
 * @param {int} game_number 삽입할 태그의 위치 (게임의 순번, 1부터 시작)
 * @param {int} part_number 참가자 번호 (1~10)
 */
function extendExpendParticipant(game_number, part_number) {
    $('.raw-record-container .raw-record-number-'+game_number+' .raw-expend-container').append(
        $(
        '<div class="raw-part-number-'+part_number+' list2_expend raw-expend-item">'+
        '\t<div class="expend champ_icon">'+
        '\t\t<img class="raw-part-champion-icon" src="" alt="">'+
        '\t\t<div class="expend champ_icon_level raw-part-champion-level">1.2</div>'+
        '\t</div>'+
        '\t<div class="expend spells">'+
        '\t\t<img class="raw-part-spell-spell1" src="" alt="">'+
        '\t\t<img class="raw-part-spell-spell2" src="" alt="">'+
        '\t</div>'+
        '\t<div class="expend runes">'+
        '\t\t<img class="raw-part-rune-core-mainrune" src="" alt="">'+
        '\t\t<img class="raw-part-rune-runetype-sub" src="" alt="">'+
        '\t</div>'+
        '\t<div class="expend name raw-part-summoner-name">4</div>'+
        '\t<div class="expend s_kda">'+
        '\t\t<div class="expend k-d-a raw-part-kda-data">5.3</div>'+
        '\t\t<div class="expend kda raw-part-kda-kda">5.6</div>'+
        '\t</div>'+
        '\t<div class="expend damage">'+
        '\t\t<div class="expend dealing">'+
        '\t\t\t<div class="expend d_num raw-part-damage-dealt">d_1</div>'+
        '\t\t\t<div class="expend deal_graph"></div>'+
        '\t\t</div>'+
        '\t\t<div class="expend taken">'+
        '\t\t\t<div class="expend t_num raw-part-damage-taken">t_1</div>'+
        '\t\t\t<div class="expend taken_graph"></div>'+
        '\t\t</div>'+
        '\t</div>'+
        '\t<div class="expend ward">'+
        '\t\t<div class="expend warding raw-part-vision-controlward">w-1</div>'+
        '\t\t<div class="expend del_ward raw-part-vision-warddata">w-2</div>'+
        '\t</div>'+
        '\t<div class="expend s_cs">'+
        '\t\t<div class="game_cs raw-part-cs-total">8.3</div>'+
        '\t\t<div class="cs_min raw-part-cs-perminute">8.6</div>'+
        '\t</div>'+
        '\t<div class="expend items">'+
        '\t\t<img class="raw-part-item-item1" src="" alt="">'+
        '\t\t<img class="raw-part-item-item2" src="" alt="">'+
        '\t\t<img class="raw-part-item-item3" src="" alt="">'+
        '\t\t<img class="raw-part-item-item4" src="" alt="">'+
        '\t\t<img class="raw-part-item-item5" src="" alt="">'+
        '\t\t<img class="raw-part-item-item6" src="" alt="">'+
        '\t\t<img class="raw-part-item-trinket" src="" alt="">'+
        '\t</div>'+
        '</div>'
        )
    )
}

function toggleRecordExpend(tag) {
    const tag_num = tag.classList[0].replace('raw-record-number-','');
    $('.raw-record-container .raw-record-item:nth-child('+tag_num+') .raw-expend-container').toggle();
}

$(function () {
    getGameIds(getQueryString('summoner_name'));
});