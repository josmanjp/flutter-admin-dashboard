import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Center(
        child: Row(
          children: [
            Sidebar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Expanded(child: child), //muestra la vista correspondiente
                ], //children
              ),
            ),
          ],
        ),
      ),
    );
  }
}
