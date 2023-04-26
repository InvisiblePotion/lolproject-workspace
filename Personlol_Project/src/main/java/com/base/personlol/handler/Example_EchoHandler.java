package com.base.personlol.handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Example_EchoHandler extends TextWebSocketHandler{
	
	// 로그인중인 개별유저
	// Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	/**
     * websocket 연결 성공 시
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	log.info("접속됨:");
    }
    
    
 
    /**
     * websocket 연결 종료 시
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	log.info("종료됨..");
    }
    
    /**
     * websocket 메세지 수신 및 송신
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//    	log.info("들어온 값: {}", message.getPayload());
//    	log.info("들어온 값:", message);
    	System.out.println(message.getPayload());
    	session.sendMessage(message);
    }

}
