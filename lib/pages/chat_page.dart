import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
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
              itemCount: 100,
              itemBuilder: (_, i) => ListTile(
                title: Text('Item $i'),
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
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: _inputChat())),
          ),
        ],
      ),
    );
  }

  Container _inputChat() {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) {
                print(_textController.text);
                _textController.clear();
                _focusNode.requestFocus();
                setState(() {
                  _estaEscribiendo = false;
                });
              },
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
                        onPressed: _estaEscribiendo ? _handleSubmit : null,
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
                        onPressed: _estaEscribiendo ? _handleSubmit : null,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  _handleSubmit() {
    print(_textController.text);
    _textController.clear();
    _focusNode.requestFocus();

    setState(() {
      _estaEscribiendo = false;
    });
  }
}
