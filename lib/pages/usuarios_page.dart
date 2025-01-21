import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(
        isOnline: true, nombre: 'Juan', email: 'juan@gmail.com', uuid: '1234'),
    Usuario(
        isOnline: false, nombre: 'Pepe', email: 'pepe@gmail.com', uuid: '1235'),
    Usuario(
        isOnline: true,
        nombre: 'Pedro',
        email: 'pedro@gmail.com',
        uuid: '1236'),
    Usuario(
        isOnline: false, nombre: 'Luis', email: 'luis@gmail.com', uuid: '1237'),
    Usuario(
        isOnline: true,
        nombre: 'Maria',
        email: 'maria@gmail.com',
        uuid: '1238'),
    Usuario(
        isOnline: false,
        nombre: 'Juana',
        email: 'juana@gmail.com',
        uuid: '1239'),
    Usuario(
        isOnline: true, nombre: 'Jose', email: 'jose@gmail.com', uuid: '1240'),
    Usuario(
        isOnline: false,
        nombre: 'Carlos',
        email: 'carlos@gmail.com',
        uuid: '1241'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        title: const Text('Mi nombre'),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.check_circle, color: Colors.green),
            // child: const Icon(Icons.offline_bolt, color: Colors.red),
          ),
        ],
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, i) => ListTile(
              title: Text(usuarios[i].nombre),
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text(usuarios[i].nombre.substring(0, 2)),
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: usuarios[i].isOnline
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.circular(100)),
              ),
              onTap: () {}),
          separatorBuilder: (_, i) => Divider(),
          itemCount: usuarios.length),
    );
  }
}
