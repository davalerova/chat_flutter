import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/widgets/widgets.dart';
import 'package:chat/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(
                    titulo: 'Messenger',
                  ),
                  const _Form(),
                  const Labels(
                    ruta: 'register',
                    texto: '¿No tienes cuenta?',
                    textoLink: 'Crea una ahora!',
                  ),
                  const Text('Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200)),
                ],
              ),
            ),
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
    final authService = Provider.of<AuthService>(context, listen: false);
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
          BotonAzul(
              texto: 'Ingresar',
              isDisabled: authService.autenticando,
              onPressed: () async {
                FocusScope.of(context).unfocus(); // Ocultar teclado
                final loginSuccess = await authService.login(
                    emailController.text.trim(),
                    passwordController.text.trim());
                if (!mounted) return;
                if (loginSuccess) {
                  // Si el login es correcto, redirige a la página de inicio
                  Navigator.pushReplacementNamed(context, 'usuarios');
                } else {
                  // Muestra un error si falla el login
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Error al iniciar sesión')),
                  // );
                  mostrarAlerta(context, 'Login incorrecto',
                      'Revise sus credenciales nuevamente');
                }
              }),
        ],
      ),
    );
  }
}
