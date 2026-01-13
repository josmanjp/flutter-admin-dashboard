import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String text;
  final bool isFilled;
  final Color color;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.isFilled = false,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(StadiumBorder()),
        backgroundColor: WidgetStateProperty.all(color.withValues(alpha: 0.5)),
        overlayColor: WidgetStateProperty.all(color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 5),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
