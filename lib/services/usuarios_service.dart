import 'package:http/http.dart' as http;

import 'package:chat/models/usuarios_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final response =
          await http.get(Uri.parse('${Environment.apiUrl}/usuarios'), headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? '',
      });
      if (response.statusCode == 200) {
        final usuariosResponse = usuariosResponseFromJson(response.body);
        return usuariosResponse.usuarios;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
    // Lógica para obtener los usuarios
  }

  Future<void> addUsuario(Usuario usuario) async {
    // Lógica para agregar un usuario
  }

  Future<void> updateUsuario(Usuario usuario) async {
    // Lógica para actualizar un usuario
  }

  Future<void> deleteUsuario(Usuario usuario) async {
    // Lógica para eliminar un usuario
  }
}
