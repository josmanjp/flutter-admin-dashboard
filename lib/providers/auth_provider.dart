import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // Aquí puedes agregar la lógica de autenticación
  String? _token;

  login(String email, String password) {
    //TODO: implementar lógica de login
    _token = 'asfasf.sfasfasf.sas2231as.asfasf';

    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.getString('token');
 
    notifyListeners();
  }
}
