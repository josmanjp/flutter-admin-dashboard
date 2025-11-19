import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dashboard Layout', style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
            CustomOutlinedButton(
              text: 'Salir',
              onPressed: () {
                final authProvider = Provider.of<AuthProvider>(
                  context,
                  listen: false,
                );
                authProvider.logout();
              },
            ),
            Expanded(child: child), //muestra la vista correspondiente
          ], //children
        ),
      ),
    );
  }
}
