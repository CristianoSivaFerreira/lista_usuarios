import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_crud/data/dummy_user.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  // Criando um map
  Map<String, User> _items = {...DUMMY_USERS};

  // Metodo para retornar todos os usuários clonando eles para não gerar uma referencia para ele
  List<User> get all {
    return [..._items.values];
  }

  // Metodo para contar os usuários
  int get count {
    return _items.length;
  }

  // Recuperando o index
  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    // Verificando se já contém o ID
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      final id = Random().nextDouble().toString();
        _items.putIfAbsent(
          id,
          () => User(
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl,
          ),
        );
      }

      notifyListeners();
      
    }

    //! ou alterar
    void remove(User user) {
      if (user != null && user.id != null) {
        _items.remove(user.id);
        notifyListeners();
      }
    }

  }

