'use strict';

var sendM = document.querySelector('#sendM');
var messageInput = document.querySelector('#message');
var messages = document.querySelector('#messages');
 
var stompClient = null;
var username = null;

function connect() {
    username = document.querySelector('#username').innerText.trim();
      
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
 
    stompClient.connect({}, connecting);
}
connect();
 
function connecting() {
    stompClient.subscribe('/bullsheet/chat', onMessageReceived);
    stompClient.send("/bs/chat.addUser", {}, JSON.stringify({sender: username, type: 'JOIN'}));
}
 
function sendMessage(event) {
    var messageContent = messageInput.value.trim();
    if(messageContent && stompClient) {
        var chatMessage = {
            sender: username,
            content: messageInput.value,
            type: 'CHAT'
        };
        stompClient.send("/bs/chat.sendMessage", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}

function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);
    var messageElement = document.createElement('p');
 
    if(message.type === 'JOIN') {
        message.content = message.sender + ' is available.';
        var textElement = document.createElement('span');
        var textElementItalic = document.createElement('i');
        var messageText = document.createTextNode(message.content);
        textElementItalic.appendChild(messageText);
        textElement.appendChild(textElementItalic);
        messageElement.appendChild(textElement);
        messages.appendChild(messageElement);
    } else if (message.type === 'LEAVE') {
        message.content = message.sender + ' is not available anymore.';
        var textElement = document.createElement('span');
        var textElementItalic = document.createElement('i');
        var messageText = document.createTextNode(message.content);
        textElementItalic.appendChild(messageText);
        textElement.appendChild(textElementItalic);
        messageElement.appendChild(textElement);
        messages.appendChild(messageElement);
        scrollToBottom();
    } else {
        var usernameElement = document.createElement('span');
        var usernameElementBold = document.createElement('b');
        var usernameText = document.createTextNode(message.sender);
        var usernameSpace = document.createTextNode(": ");
        var textElement = document.createElement('span');
        var messageText = document.createTextNode(message.content);
        usernameElementBold.appendChild(usernameText);
        usernameElement.appendChild(usernameElementBold);
        messageElement.appendChild(usernameElement);
        messageElement.appendChild(usernameSpace);
        textElement.appendChild(messageText);
        messageElement.appendChild(textElement);
        messages.appendChild(messageElement);
        scrollToBottom();
    }

}

function scrollToBottom() {
    messages.scrollTop = messages.scrollHeight;
}

scrollToBottom();

sendM.addEventListener('submit', sendMessage, true);