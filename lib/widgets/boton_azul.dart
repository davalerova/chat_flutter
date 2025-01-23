import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final Function onPressed;
  final bool isDisabled; // Nuevo parámetro para controlar el estado del botón

  const BotonAzul(
      {super.key,
      required this.texto,
      required this.onPressed,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: isDisabled ? Colors.grey : Colors.blue,
            shape: const StadiumBorder(),
          ),
          onPressed: isDisabled ? null : () => onPressed(),
          child: Text(
            texto,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
