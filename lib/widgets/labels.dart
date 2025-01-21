import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String texto;
  final String textoLink;
  const Labels(
      {super.key,
      required this.ruta,
      required this.texto,
      required this.textoLink});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(texto, style: TextStyle(color: Colors.black54, fontSize: 15)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ruta);
          },
          child: Text(textoLink,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
