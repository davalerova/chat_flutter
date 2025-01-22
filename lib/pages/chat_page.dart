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
          Divider(
            height: 1,
          ),
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
              decoration: InputDecoration(
                  hintText: 'Enviar mensaje', border: InputBorder.none),
            ),
          ),
          // Botón de enviar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: IconTheme(
              data: IconThemeData(color: Colors.blue[400]),
              child: Platform.isIOS
                  ? CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text('Enviar',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        print(_textController.text);
                        _textController.clear();
                        FocusScope.of(context).requestFocus();
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        print(_textController.text);
                        _textController.clear();
                        FocusScope.of(context).requestFocus();
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
