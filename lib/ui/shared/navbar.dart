import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: double.infinity,
      decoration: builBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              icon: Icon(Icons.menu_outlined),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black, // Color de fondo
                overlayColor: Colors.transparent, // Elimina el efecto de splash
              ),
              onPressed: () {
                SideMenuProvider.openMenu();
              },
            ),

          SizedBox(width: 5),

          if (size.width > 400)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),

          Spacer(),
          NotificationsIndicator(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration builBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
  );
}
