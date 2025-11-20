import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: isHovered
          ? Colors.white.withAlpha(26)
          : widget.isActive
          ? Colors.white.withAlpha(26)
          : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          onHover: (value) {
            setState(() {
              isHovered = value;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white.withAlpha(77), //77 es el 30% de opacidad
                size: 20,
              ),
              SizedBox(width: 10),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white.withAlpha(
                    204,
                  ), //204 es el 80% de opacidad
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
