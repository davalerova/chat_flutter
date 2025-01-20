import 'package:chat/pages/pages.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'usuarios': (_) => const UsuariosPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'chat': (_) => const ChatPage(),
  'loading': (_) => const LoadingPage(),
};
