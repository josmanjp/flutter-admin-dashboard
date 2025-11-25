import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({super.key, this.title, required this.child});
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
          ],
          child,
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [BoxShadow(color: Colors.black.withAlpha(13), blurRadius: 5)],
  );
}
