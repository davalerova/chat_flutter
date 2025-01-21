import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  const BotonAzul({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Colors.blue,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: Text(
            texto,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
