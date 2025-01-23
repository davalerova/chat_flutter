import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:chat/models/usuario.dart';
import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  bool _autenticando = false;

  bool get autenticando => _autenticando;
  set autenticando(bool value) => {
        _autenticando = value,
        notifyListeners(),
      };

  Future login(String email, String password) async {
    autenticando = true;
    final data = {
      'email': email,
      'password': password,
    };

    Uri url = Uri.parse('${Environment.apiUrl}/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;
      _autenticando = false;
      return true;
    } else {
      _autenticando = false;
      return false;
    }
  }
}
