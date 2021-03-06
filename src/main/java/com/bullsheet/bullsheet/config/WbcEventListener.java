package com.bullsheet.bullsheet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;
 
@Component
public class WbcEventListener {
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;
 
    @EventListener
    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
        System.out.println("well something went wrong. Probably the connection to wsocket");
    }
 
    @EventListener
    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        String username = (String) headerAccessor.getSessionAttributes().get("username");
        if(username != null) {
            Message chatMessage = new Message();
            chatMessage.setType(Message.MessageType.LEAVE);
            chatMessage.setSender(username);
 
            messagingTemplate.convertAndSend("/bullsheet/chat", chatMessage);
        }
    } 
}