import 'package:flutter/material.dart';
import 'package:chat/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(),
              const _Form(),
              const Labels(),
              const Text('Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200)),
            ],
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.alternate_email,
              placeholder: 'Correo',
              textController: emailController,
              keyboardType: TextInputType.emailAddress,
              isPassword: false),
          CustomInput(
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              textController: passwordController,
              keyboardType: TextInputType.text,
              isPassword: true),
          FilledButton(
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}
