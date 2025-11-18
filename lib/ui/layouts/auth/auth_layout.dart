// ignore_for_file: sized_box_for_whitespace

import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_login.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        //thumbVisibility: true,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            //desktop with overflow detection
            LayoutBuilder(
              builder: (context, constraints) {
                // Calculamos si el contenido desktop cabe
                bool hasEnoughWidth = size.width > 1000;
                bool hasEnoughHeight = size.height > 600;

                // Estimamos el espacio mínimo necesario para el contenido
                double minContentHeight =
                    500; // Altura mínima estimada del formulario + título
                double minContentWidth =
                    900; // Ancho mínimo para desktop (600 form + 300 background)

                // Verificamos si hay suficiente espacio real
                bool fitsDesktopLayout =
                    hasEnoughWidth &&
                    hasEnoughHeight &&
                    size.width >= minContentWidth &&
                    (size.height * 0.95) >= minContentHeight;

                return fitsDesktopLayout
                    ? _DesktopBody(child: child)
                    : _MobileBody(child: child);
              },
            ),
            //footer
            LinksBar(),
          ],
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomTitle(),
          Container(width: double.infinity, height: 420, child: child),

          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundLogin(),
          ),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({required this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.white,
      child: Row(
        children: [
          //Background
          Expanded(child: BackgroundLogin()),

          //Login Form
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                CustomTitle(),
                SizedBox(height: 50),
                Expanded(child: child),
              ],
            ),
          ),
        ], //children
      ),
    );
  }
}
