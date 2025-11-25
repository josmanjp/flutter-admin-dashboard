import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Card 1',
            child: Text('Content of Card 1', style: CustomLabels.body),
          ),
        ],
      ),
    );
  }
}
