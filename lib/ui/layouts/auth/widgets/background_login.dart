import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image:AssetImage('assets/twitter-white-logo.png'), 
              width: 400,
            ),
          ),
        )),
      );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/twitter-bg.png'),
          fit: BoxFit.cover,
        ),
      );
  }
}
