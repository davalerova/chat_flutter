import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('¿No tienes cuenta?',
            style: TextStyle(color: Colors.black54, fontSize: 15)),
        Text('¡Crea una ahora!',
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
