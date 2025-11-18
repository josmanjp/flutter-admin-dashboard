import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  // Aquí puedes agregar la lógica de autenticación
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    //Al iniciar el provider, verificar si está autenticado
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: implementar lógica de login
    _token = 'asfasf.sfasfasf.sas2231as.asfasf';

    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.getString('token');
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  logout() {
    //TODO: implementar lógica de login
    _token = '';

    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 1));
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: validar el token con el backend

    await Future.delayed(const Duration(seconds: 1));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
