import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

// Criando o Widget para cada item da dista de usuarios

class UserTile extends StatelessWidget{
  
  // Instanciando o User
  final User user;

  // Injetando o User no construtor do UserTile
  const UserTile(this.user);
  
  
  @override
  Widget build(BuildContext context){
    
    // ListTile é o bloquinho que usamos dentro do listView
    // ja tem as posicoes pré definidas
    
    //Caso não tenhamos informações do avatar, iremos mostrar um icom padrão
    // do contrario a imagem do avatarUrl
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty 
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    
    return ListTile(
      leading: avatar,                                                         // Imagem do avatar do Widget
      title: Text(user.name),                                                  // Titulo do bloquinho
      subtitle: Text(user.email),                                              // Sub Titulo do bloquinho
      trailing: Container(                                                     // Estrutura de Conteiner para a lista de items/Botões de Edit e Delete para o Bloquinho
        width: 100,                                                            // definimos a largura de 100 para não encavalar as imagens
        child: Row(                                                            // Filhos que esse bloquinho tem
                       children: <Widget>[
                                          IconButton(icon: Icon(Icons.edit),   // definindo icone de Edit
                                          color: Colors.blue,                 // Cor do icon
                                          onPressed: (){}),                    // definindo icone de Edit
                                          IconButton(icon: Icon(Icons.delete), // definindo icone de Edit
                                          color: Colors.red,                   // Cor do icon
                                          onPressed: (){}),                    // definindo icone de Edit


                                         ],


                      ),
      ),
    );
  }
}