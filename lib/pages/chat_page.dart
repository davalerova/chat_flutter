import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
