import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({super.key, required this.child, this.width, this.title});
  final String? title;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: buildBoxDecoration(),
      // ignore: prefer_if_null_operators
      width: width != null ? width : null,
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
