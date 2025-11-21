import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
          hint: 'Buscar',
          icon: Icons.search_outlined,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.grey.withAlpha(26), //0.1 de opacidad
    borderRadius: BorderRadius.circular(10),
  );
}
