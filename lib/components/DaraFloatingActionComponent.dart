import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/dara_map_screen.dart';
import '../utils/dara_bottom_sheet.dart';
import '../utils/dara_colors.dart';

class DaraFloatingActionComponent extends StatelessWidget {
  const DaraFloatingActionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration:
          BoxDecoration(color: daraTextColorDarkMode, borderRadius: radius(32)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('images/adjust.png', height: 20, color: Colors.white),
          4.width,
          Text('Filter', style: secondaryTextStyle(color: Colors.white))
              .onTap(() {
            showFilterBottomSheet(context);
          }),
          Text(' | ', style: primaryTextStyle(color: Colors.white)),
          Icon(Icons.map_outlined, color: Colors.white),
          Text('Map', style: secondaryTextStyle(color: Colors.white)).onTap(() {
            DaraMapScreen().launch(context);
          }),
        ],
      ),
    );
  }
}
