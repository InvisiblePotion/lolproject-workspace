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
    <script src="../resources/js/summoner_test.js"></script>
</html>