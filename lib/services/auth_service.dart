import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat/models/usuario.dart';
import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  bool _autenticando = false;
  final _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  bool get autenticando => _autenticando;
  set autenticando(bool value) => {
        _autenticando = value,
        notifyListeners(),
      };

  // Getters y Setters del Token
  static Future<String?> getToken() async {
    final storage = FlutterSecureStorage(
        aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ));
    final token = await storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final storage = FlutterSecureStorage(
        aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ));
    await storage.delete(key: 'token');
  }

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
    _autenticando = false;
    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      await _eliminarToken();
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    autenticando = true;
    final data = {
      'nombre': name,
      'email': email,
      'password': password,
    };

    Uri url = Uri.parse('${Environment.apiUrl}/login/new');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    _autenticando = false;
    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      await _eliminarToken();
      final respBody = jsonDecode(response.body);
      return respBody['msg'];
    }
  }

  Future<bool> _guardarToken(String token) async {
    await _storage.write(key: 'token', value: token);
    return true;
  }

  Future<String?> _eliminarToken() async {
    await _storage.delete(key: 'token');
    return null;
  }
}
