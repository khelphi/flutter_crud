import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user-tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),                                      // definindo icon de Add na barra
              onPressed: () {                                             // Função do Botão de adicionar
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);     // Navegando para a Rota de Formulario

                //users.remove(users.byindex(0)); // Delete

                /* 
                                         users.addOrputUser(User(
                                           id: '4',
                                           name:'Denis Fernandes',
                                           email:'khelphi@yahoo.com.br',
                                           avatarUrl: ''
                                         ));
                                         */ // Update
              })
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) =>
              UserTile(users.byindex(i)) // Acessando o elemento
          ),
    );
  }
}
