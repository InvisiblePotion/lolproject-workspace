/** 
 * summoner_recent_game 테이블에 게임 id를 넣는 함수
 * @param {string} summoner_name
 * @param {string[]} game_ids
 */
function putGameIds(summoner_name, game_ids) {
    $.ajax({
        method: 'post',
        url: '/personlol/summoner/recent-game',
        data: {
            'summoner_name': summoner_name,
            'game_ids': game_ids}
    })
    // .done((res)=>{console.log("done!");}).fail((err)=>{console.log("error...");})
}

/** 
 * 
 */
function getGameIds() {
    let summoner_name = $('#game-id-summoner-name').val()
    $.ajax({
        method: 'get',
        url: '/personlol/summoner/game-ids/' + $('#game-id-on-where').val(),
        data: {'summoner_name': summoner_name}
    }).done((res)=>{
        console.log(res);
        putGameIds(summoner_name, res);
    }).fail((err)=>{
        console.log(err);
    });
}

$('#game-ids').click(getGameIds)