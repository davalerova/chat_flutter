import 'package:chat/models/mensaje.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:chat/global/environment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioSeleccionado;

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final response = await http
        .get(Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId'), headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken() ?? '',
    });
    if (response.statusCode == 200) {
      final chatResponse = mensajesResponseFromJson(response.body);
      final chat = chatResponse.mensajes;
      return chat;
    } else {
      return [];
    }
  }
}
