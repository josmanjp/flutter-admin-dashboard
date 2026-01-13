import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationServices.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final SideMenuProvider sideMenuProvider = Provider.of<SideMenuProvider>(
      context,
    );
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 15),
          TextSeparator(text: 'Main'),
          // ... Opciones del menú
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () {
              navigateTo(Flurorouter.dashboardRoute);
            },
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),

          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/orders',
          ),
          MenuItem(
            text: 'Analytics',
            icon: Icons.show_chart_outlined,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/analytics',
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.category_outlined,
            onPressed: () {
              navigateTo(Flurorouter.categoriesRoute);
            },
            isActive:
                sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/products',
          ),
          MenuItem(
            text: 'Discounts',
            icon: Icons.discount_outlined,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/discounts',
          ),
          MenuItem(
            text: 'Customers',
            icon: Icons.people_outline,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/customers',
          ),
          SizedBox(height: 15),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () {
              navigateTo(Flurorouter.iconsRoute);
            },
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/marketing',
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.campaign_outlined,
            onPressed: () {},
            isActive: sideMenuProvider.currentPage == '/dashboard/campaign',
          ),
          MenuItem(
            text: 'Blank Page',
            icon: Icons.post_add_outlined,
            onPressed: () {
              navigateTo(Flurorouter.blankRoute);
            },
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
          ),

          SizedBox(height: 15),
          TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {
              final authProvider = Provider.of<AuthProvider>(
                context,
                listen: false,
              );
              authProvider.logout();
            },
            isActive: false, // Logout nunca debe estar activo
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092043)]),
    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
  );
}
