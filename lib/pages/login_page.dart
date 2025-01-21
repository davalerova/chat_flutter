import 'package:flutter/material.dart';

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
              const _Logo(),
              const _Form(),
              const _Labels(),
              const Text('Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200)),
            ],
          ),
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Image.asset('assets/tag-logo.png'),
          const SizedBox(height: 20),
          Text('Messenger', style: Theme.of(context).textTheme.titleLarge),
        ]),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        TextField(),
        FilledButton(onPressed: () {}, child: const Text('Login')),
      ],
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels();

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
