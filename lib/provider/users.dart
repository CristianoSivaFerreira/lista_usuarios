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
}
