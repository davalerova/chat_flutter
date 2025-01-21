import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  const CustomInput(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 5),
                blurRadius: 5,
              )
            ]),
        child: TextField(
            autocorrect: false,
            keyboardType: keyboardType,
            controller: textController,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
              contentPadding: const EdgeInsets.all(15),
              prefixIcon: Icon(icon),
            )));
  }
}
