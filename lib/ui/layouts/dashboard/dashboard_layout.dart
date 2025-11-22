import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Center(
        child: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) Sidebar(),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //navbar
                      Navbar(),

                      SizedBox(height: 10),
                      Expanded(
                        child: widget.child,
                      ), //muestra la vista correspondiente
                    ], //children
                  ),
                ),
              ],
            ),

            if (size.width < 700)
              AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(SideMenuProvider.movement.value, 0),
                      child: Sidebar(),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
