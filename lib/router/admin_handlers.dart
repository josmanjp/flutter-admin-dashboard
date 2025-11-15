import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';

class AdminHandlers {
  // Add your admin handler methods here

  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      // Handle  admin login
      return LoginView();
    },
  );

  static Handler register = Handler(
    handlerFunc: (context, parameters) {
      // Handle admin registration
      return RegisterView();
    },
  );
} 
