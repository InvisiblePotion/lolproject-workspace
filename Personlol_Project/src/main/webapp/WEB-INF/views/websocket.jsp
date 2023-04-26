<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>test-websocekt</title>
        <style>
            html{background-color: #444; color: #fff;}
        </style>
    </head>
    <body>
        <h1>websocekt.jsp</h1>
        <button onclick="connect()">웹소켓 작동</button>
        <input type="text" id="msg" placeholder="메시지">
        <button onclick="sendMessage(document.getElementById('msg').value)">메시지 송신?</button>
    </body>
    <script>
        // 웹소켓
        let websocket;
     
        //입장 버튼을 눌렀을 때 호출되는 함수
        function connect() {
            // 웹소켓 주소
            var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/ex_ws";
            // 소켓 객체 생성
            websocket = new WebSocket(wsUri);
            //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
            websocket.onopen = onOpen;
            websocket.onmessage = onMessage;
            websocket.onerror = onError;
            
            console.log(websocket);
        }
        
        //웹 소켓에 연결되었을 때 호출될 함수
        function onOpen() {

        }

        function onError(err) {
            console.log(err);
        }
        
        // * 1 메시지 전송
        function sendMessage(message){
            console.log('전송한 메시지: ', message);
            websocket.send(message)
        }
        
        // * 2 메세지 수신
        function onMessage(evt) {
            console.log('받은 메시지: ', evt);
        }

    </script>
</html>