// ignore_for_file: avoid_print

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/services/navigation_services.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  // Aquí puedes agregar la lógica de autenticación
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

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

    NavigationServices.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {
    //TODO: implementar lógica de registro

    final data = {'correo': email, 'password': password, 'nombre': name};

    CafeApi.httpPost('/usuarios', data)
        .then((json) {
          final authResponse = AuthResponse.fromMap(json);
          this.user = authResponse.usuario;
          _token = authResponse.token;

          LocalStorage.prefs.setString('token', _token!);
          LocalStorage.prefs.setString('nameUser', this.user!.nombre);
          LocalStorage.prefs.getString('token');
          LocalStorage.prefs.getString('nameUser');
          authStatus = AuthStatus.authenticated;
          NavigationServices.replaceTo(Flurorouter.dashboardRoute);
          notifyListeners();
        })
        .catchError((e) {
          //print('Error en el registro: $e');
          NotificationsService.ShowSnackBarError('Error en el registro: $e');
        });
  }

  logout() {
    //TODO: implementar lógica de login
    _token = '';

    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
    NavigationServices.replaceTo(Flurorouter.loginRoute);
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
