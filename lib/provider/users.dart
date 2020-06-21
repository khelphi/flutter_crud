import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

// Criamos um Provider para que tudo fique externado em um unico lugar

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};
// metodos expostos

  // Get all
  List<User> get all {
    return [..._items.values]; // Obtemos um alista atualizada
  }

  // get Count
  int get count {
    return _items.length;
  }

  // Get By Index
  User byindex(int index) {
    return _items.values.elementAt(index);
  }

  void addOrputUser(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id))
      updateUser(user);
    else
      createUser(user);

    // Atualização da interface grafica  todos que estavam observando...
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id.trim().isNotEmpty) {
      _items.remove(user.id);
      notifyListeners();
    }
  }

  updateUser(User user) {
    _items.update(user.id, (value) => user);
  }

  createUser(User user) {
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
      id,
      () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl),
    );
  }
}
