import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:chat/models/usuario.dart';
import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  Future login(String email, String password) async {
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
      print(loginResponse.usuario.nombre);
      print(loginResponse.usuario.email);
      print(loginResponse.token);
    }

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}
