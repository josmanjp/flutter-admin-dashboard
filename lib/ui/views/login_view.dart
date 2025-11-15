import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      
      create: ( _) => LoginFormProvider( authProvider: authProvider ),

      child: Builder(builder: (context)  {
        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);
    
        return Container(
          margin: EdgeInsets.only(top: size.width > 1000 ? 100 : 20),
          padding: EdgeInsets.symmetric( horizontal: 20 ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints( maxWidth: 370 ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: loginFormProvider.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    // Email
                    TextFormField(
                      onChanged: (value) => loginFormProvider.updateEmail(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese un email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Por favor ingrese un email válido';
                        }
                        return null;
                      },
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined
                      ),
                    ),
        
                    SizedBox( height: 20 ),
        
                    // Password
                    TextFormField(
                      onChanged: (value) => loginFormProvider.updatePassword(value),
                      validator: ( value ) {
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
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '*********',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded
                      ),
                    ),
                    
                    SizedBox( height: 20 ),
                    CustomOutlinedButton(
                      onPressed: () {
                        loginFormProvider.validateForm();
                      }, 
                      text: 'Ingresar',
                    ),
        
        
                    SizedBox( height: 20 ),
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushNamed( context, Flurorouter.registerRoute );
                      },
                    )
        
                  ],
                )
              ),
            ),
          ),
        );
      }
      )
    );
  }

}