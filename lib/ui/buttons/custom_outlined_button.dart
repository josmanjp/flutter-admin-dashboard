import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {

  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blue,
    this.isFilled = false
  });


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder( borderRadius: BorderRadius.circular(30))
        ),
        side: WidgetStateProperty.all(
          BorderSide( color: color )
        ),
        backgroundColor: WidgetStateProperty.all(
          isFilled ? color.withValues(alpha: 0.3) : Colors.transparent
        ),
        foregroundColor: WidgetStateProperty.all(color),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return color.withValues(alpha: 0.2); // Color al hacer clic
          }
          if (states.contains(WidgetState.hovered)) {
            return color.withValues(alpha: 0.1); // Color al hacer hover
          }
          return null; // Color por defecto
        }),
      ),
      onPressed: () => onPressed(), 
      child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        child: Text( 
          text,
          style: TextStyle( fontSize: 16 ),
        ),
      )
    );
  }
}