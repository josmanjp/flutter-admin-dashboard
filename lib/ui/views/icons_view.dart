import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons View', style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                child: Center(child: Icon(Icons.access_alarm_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'access_time_rounded',
                child: Center(child: Icon(Icons.access_time_rounded)),
                width: 170,
              ),
              WhiteCard(
                title: 'all_inbox_outlined',
                child: Center(child: Icon(Icons.all_inbox_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'desktop_mac_sharp',
                child: Center(child: Icon(Icons.desktop_mac_sharp)),
                width: 170,
              ),
              WhiteCard(
                title: 'add_chart_sharp',
                child: Center(child: Icon(Icons.add_chart_sharp)),
                width: 170,
              ),
              WhiteCard(
                title: 'add_photo_alternate_sharp',
                child: Center(child: Icon(Icons.add_photo_alternate_sharp)),
                width: 170,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
