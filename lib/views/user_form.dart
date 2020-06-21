import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState
                    .validate(); // Checando validação do formulario

                if (isValid) {
                  _form.currentState.save();
                  // esse Provider não precisa ser notificado listen: false
                  Provider.of<UsersProvider>(context, listen: false)
                      .addOrputUser(
                    User(
                      id: _formData['id'],
                      name: _formData['name'],
                      email: _formData['email'],
                      avatarUrl: _formData['avatarUrl'],
                    ),
                  );

                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return 'Informe o nome do usuário';

                    return null;
                  }, // Validando o campo Nome
                  onSaved: (value) => _formData['name'] = value),
              TextFormField(
                  decoration: InputDecoration(labelText: 'e-Mail'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return 'Informe o e-mail do usuário';

                    return null;
                  }, // Validando o campo e-mail
                  onSaved: (value) => _formData['email'] = value),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Url do avatar'),
                  onSaved: (value) => _formData['avatarUrl'] = value),
            ],
          ),
        ),
      ), // Adicionando um espaço par anão ficar grudado
    );
  }
}
