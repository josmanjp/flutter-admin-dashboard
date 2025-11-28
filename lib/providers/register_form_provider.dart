import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombre = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      // Formulario válido
      print('Email: $email');
      print('Nombre: $nombre');
      print('Password: $password');
      // Aquí puedes agregar lógica de login
      return true;
    } else {
      print('Formulario no válido');
      return false;
    }
  }

  void updateNombre(String value) {
    nombre = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }
}
