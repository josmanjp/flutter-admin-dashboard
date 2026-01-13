import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),

      child: Builder(
        builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(
            context,
            listen: false,
          );
          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        onFieldSubmitted: (value) =>
                            registerFormProvider.validateForm(),
                        onChanged: (value) =>
                            registerFormProvider.updateNombre(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un nombre';
                          }
                          if (value.length < 5) {
                            return 'El nombre debe tener al menos 5 caracteres';
                          }

                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_sharp,
                        ),
                      ),

                      SizedBox(height: 20),

                      // Email
                      TextFormField(
                        onFieldSubmitted: (value) =>
                            registerFormProvider.validateForm(),
                        onChanged: (value) =>
                            registerFormProvider.updateEmail(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un email';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Por favor ingrese un email válido';
                          }
                          return null;
                        },

                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),

                      SizedBox(height: 20),

                      // Password
                      TextFormField(
                        onFieldSubmitted: (value) =>
                            registerFormProvider.validateForm(),
                        onChanged: (value) =>
                            registerFormProvider.updatePassword(value),
                        validator: (value) {
                          String pattern =
                              r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
                          RegExp regex = RegExp(pattern);
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese una contraseña';
                          } else if (!regex.hasMatch(value)) {
                            return 'La contraseña debe tener al menos 8 caracteres, incluyendo letras y números';
                          }
                          return null;
                        },

                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '*********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),

                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;

                          final AuthProvider authProvider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authProvider.register(
                            registerFormProvider.email,
                            registerFormProvider.password,
                            registerFormProvider.nombre,
                          );
                        },
                        text: 'Crear cuenta',
                      ),

                      SizedBox(height: 20),
                      LinkText(
                        text: 'Ir al login',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
