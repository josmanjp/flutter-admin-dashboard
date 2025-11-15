import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // Aquí puedes agregar la lógica de autenticación
  String? _token;
  
  login(String email, String password) {
    //TODO: implementar lógica de login
    _token = 'asfasf.sfasfasf.sas2231as.asfasf';
    print('Almacenar token: $_token');
    notifyListeners();

  } 


}
