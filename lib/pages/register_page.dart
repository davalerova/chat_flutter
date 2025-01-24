import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                    titulo: 'Registro',
                  ),
                  const _Form(),
                  const Labels(
                    ruta: 'login',
                    texto: '¿Ya tienes cuenta?',
                    textoLink: 'Ingresa ahora!',
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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.perm_identity_rounded,
              placeholder: 'Nombre',
              textController: nameController),
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
              texto: 'Crear cuenta',
              isDisabled: authService.autenticando,
              onPressed: () async {
                FocusScope.of(context).unfocus(); // Ocultar teclado
                final registerSuccess = await authService.register(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim());
                if (!mounted) return;
                if (registerSuccess == true) {
                  socketService.connect();
                  // Si el login es correcto, redirige a la página de inicio
                  Navigator.pushReplacementNamed(context, 'usuarios');
                } else {
                  mostrarAlerta(
                      context, 'Registro incorrecto', registerSuccess);
                }
              }),
        ],
      ),
    );
  }
}
