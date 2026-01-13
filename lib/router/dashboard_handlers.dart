import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/router/router.dart';

class DashboardHandlers {
  // Add your admin handler methods here
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(
        context,
        listen: false,
      ).setCurrentPageUrl(Flurorouter.dashboardRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        // Handle  admin login
        return DashboardView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(
        context,
        listen: false,
      ).setCurrentPageUrl(Flurorouter.iconsRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        // Handle  admin login
        return IconsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(
        context,
        listen: false,
      ).setCurrentPageUrl(Flurorouter.blankRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return BlankView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler categories = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(
        context,
        listen: false,
      ).setCurrentPageUrl(Flurorouter.categoriesRoute);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return CategoriesView();
      } else {
        return LoginView();
      }
    },
  );
}
