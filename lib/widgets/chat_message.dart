import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uuid;

  const ChatMessage({super.key, required this.texto, required this.uuid});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: uuid == '0'
            ? _OwnMessage(texto: texto)
            : _OtherMessage(texto: texto));
  }
}

class _OtherMessage extends StatelessWidget {
  const _OtherMessage({
    required this.texto,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
            decoration: BoxDecoration(
              color: Color(0xFFE4E5E8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(texto,
                style: TextStyle(fontSize: 16, color: Colors.black54))));
  }
}

class _OwnMessage extends StatelessWidget {
  const _OwnMessage({
    required this.texto,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
            decoration: BoxDecoration(
              color: Color(0xff4D9EF6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(texto,
                style: TextStyle(fontSize: 16, color: Colors.white))));
  }
}
