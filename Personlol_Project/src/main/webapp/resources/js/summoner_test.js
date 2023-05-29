/**
 * 해당 소환사의 최근 20게임에 대한 게임 ID를 가져온다.   
 * `url: /personlol/summoner/game-id-list/`
 */
function getGameIds() {
    let summoner_name = $('#game-id-summoner-name').val()
    $.ajax({
        method: 'get',
        url: '/personlol/summoner/rest/game-ids/' + $('#game-id-on-where').val(),
        data: {'summoner_name': summoner_name}
    }).done((game_id_list)=>{
        console.log(game_id_list);
        putGameIds(summoner_name, game_id_list);
        getGameRecords(game_id_list)
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
    // .done((res)=>{console.log("done!");}).fail((err)=>{console.log("error...");})
}

/**
 * RawData 테이블에서 해당 게임 ID 리스트에 매치되는 게임 데이터를 가져온다
 * @param {string[]} game_id_list 게임 ID 리스트
 */
function getGameRecords(game_id_list) {
    $.ajax({
        method: 'post',
        url: '/personlol/summoner/rest/game-record',
        data: {'game_ids': game_id_list}
    }).done((rawdata)=>{
        console.log(rawdata);
        for (const game_data of rawdata) {
            
        }
    }).fail((err)=>{
        console.log(err);
    })
}

/**
 * RawData 테이블의 데이터를 사용해 접은 상태의 게임 전적 정보를 정해진 클래스가 붙은 각 태그에 삽입한다.
 * 태그에 붙여야 하는 클래스 이름에 대해서는 `소환사 전적 페이지 클래스 리스트.md` 참고
 * @param {object} game_data 한 게임 분량의 RawData
 */
function inputGameDataShort(game_data) {
    
}

$('#game-ids').click(getGameIds)
