package com.gdj51.Dulegil.util;

import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionAttributeStore;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping(value="/echo")
public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//맵을 쓸때 방법
		//sessions.put(session.getId, session);
		//list쓸때 방법
		sessionList.add(session);
		//세션값을 불러온
		//0번째 중괄호에 session.getId()을 넣으라는 뜻
		log.info("{} 연결됨", session.getId());
		
		//Session값을 가지고 데이터베이스등의 작업을 하면 채팅 참여 사용자 정보 리스트를 구현할 수 있다.
		
		System.out.println("채팅방 입장자: " + session.getPrincipal().getName());

	}
	//웹 소켓 서버로 데이터를 전송했을 경우
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//0번째에 session.getId() 1번째에 message.getPayload() 넣음
		log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		//log.info("{}로 부터 {} 받음", new String[]{session.getId(), message.getPayload()});
		
		//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
		//getPrincipal()를 이용해서 세션에 몰려있는 유저의 정보를 불러온다. 세션의 정보는 User를 이용한 것과 동일하다
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
		}
		//맵 방법
		//Iterator<String> sessionIds = Sessions.ketSet().iterator();
		//String sessionId = "";
//		while(sessionIds.hasNext()) {
//			sessionId = sessionIds.next();
//			sessions.get(sessionId).sendMessage(new TextMessage("dule:" + message.getPayload()));
//		}
		//연결되어 있는 모든 클라이언트들에게 메시지 전송한다
		//session.sendMessage(new TextMessage("dule:" + message.getPayload()));
	}
	
	//클라이언트와 연결이 끊어진 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		//리스트 삭제
		sessionList.remove(session);
		
		//맵 삭제
		//sessions.remove(session.getId());
		
		log.info("{} 연결 끊김.", session.getId());
		
		System.out.println("채팅방 퇴장자: " + session.getPrincipal().getName());
	}
}
