import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return ClipOval(
      //hace circular la imagen
      child: Container(
        child: Image.network(
          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
