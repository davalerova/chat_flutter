import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  _ChatPageState();
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child:
                Text('Da', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          SizedBox(width: 10),
          Text('David Valero')
        ],
      )),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => ChatMessage(
                texto: _messages[i].texto,
                uuid: _messages[i].uuid,
                animationController: _messages[i].animationController,
              ),
              reverse: true,
            ),
          ),
          // Divider(
          //   height: 0,
          // ),
          SafeArea(
              child: Container(
                  color: Colors.white,
                  // height: 50,
                  child: _inputChat())),
        ],
      ),
    );
  }

  Container _inputChat() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: _handleSubmit,
              onChanged: (texto) => {
                setState(() {
                  if (texto.trim().isNotEmpty) {
                    _estaEscribiendo = true;
                  } else {
                    _estaEscribiendo = false;
                  }
                })
              },
              decoration: InputDecoration.collapsed(
                  hintText: 'Mensaje', border: InputBorder.none),
              focusNode: _focusNode,
            ),
          ),
          // Botón de enviar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: IconTheme(
              data: IconThemeData(color: Colors.blue[400]),
              child: Platform.isIOS
                  ? IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text)
                            : null,
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _estaEscribiendo
                                  ? Colors.blue
                                  : Colors.black),
                        ),
                      ),
                    )
                  : IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text)
                            : null,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.isEmpty) return;
    final newMessage = ChatMessage(
        uuid: '0',
        texto: texto.trim(),
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 400)));
    _textController.clear();
    _focusNode.requestFocus();

    _messages.insert(0, newMessage);

    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }
}
