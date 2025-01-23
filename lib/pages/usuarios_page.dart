import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [];
  // final usuarios = [
  //   Usuario(
  //       isOnline: true, nombre: 'Juan', email: 'juan@gmail.com', uuid: '1234'),
  //   Usuario(
  //       isOnline: false, nombre: 'Pepe', email: 'pepe@gmail.com', uuid: '1235'),
  //   Usuario(
  //       isOnline: true,
  //       nombre: 'Pedro',
  //       email: 'pedro@gmail.com',
  //       uuid: '1236'),
  //   Usuario(
  //       isOnline: false, nombre: 'Luis', email: 'luis@gmail.com', uuid: '1237'),
  //   Usuario(
  //       isOnline: true,
  //       nombre: 'Maria',
  //       email: 'maria@gmail.com',
  //       uuid: '1238'),
  //   Usuario(
  //       isOnline: false,
  //       nombre: 'Juana',
  //       email: 'juana@gmail.com',
  //       uuid: '1239'),
  //   Usuario(
  //       isOnline: true, nombre: 'Jose', email: 'jose@gmail.com', uuid: '1240'),
  //   Usuario(
  //       isOnline: false,
  //       nombre: 'Carlos',
  //       email: 'carlos@gmail.com',
  //       uuid: '1241'),
  // ];
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropMaterialHeader(),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.substring(0, 2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: usuario.online ? Colors.green[300] : Colors.red[300],
              borderRadius: BorderRadius.circular(100)),
        ),
        onTap: () {});
  }

  _cargarUsuarios() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
