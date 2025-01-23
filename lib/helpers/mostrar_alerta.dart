import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mostrarAlerta(BuildContext context, String texto, String subtitulo) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(texto),
            content: Text(subtitulo),
            actions: [
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          );
        });
  }
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
          content: Text(subtitulo),
          actions: [
            MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        );
      });
}
