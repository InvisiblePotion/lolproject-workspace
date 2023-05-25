<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Summoner Test</title>
        <style>
            html{background-color: #444; color: #fff;}
        </style>
        <!-- jQuery 3.6.4 min CDN -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
            crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>SUMMONER TEST ZONE</h1>
        <input type="text" id="game-id-summoner-name" placeholder="summoner_name">
        <input type="text" id="game-id-on-where" placeholder="on_where">
        <button id="game-ids">게임 id 획득</button>
    </body>
    <script>
        function putGameIds(summoner_name, game_ids) {
            $.ajax({
                method: 'post',
                url: '/personlol/summoner/recent-game',
                data: {
                    'summoner_name': summoner_name,
                    'game_ids': game_ids}
            }).done((res)=>{console.log("done!");}).fail((err)=>{console.log("error...");})
        }

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
    </script>
</html>