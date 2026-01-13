import 'package:flutter/material.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey <FormState> formKey = GlobalKey<FormState>();


  final AuthProvider authProvider;
  

  String email    = '';
  String password = '';

  LoginFormProvider({
    required this.authProvider
  });

  validateForm(){
    //TODO: implementar validaciones
    if (formKey.currentState?.validate() ?? false) {
      // Formulario válido
     // print('Email: $email');
      //print('Password: $password');
      // Aquí puedes agregar lógica de login
      authProvider.login(email, password);
    }
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