import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/dara_common_card_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

// ignore: must_be_immutable
class DaraSearchListComponent extends StatelessWidget {
  DaraCommonCardModel element;

  DaraSearchListComponent({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: appStore.isDarkModeOn
                  ? Colors.grey.withAlpha(70)
                  : daraPrimaryColor.withAlpha(70),
              borderRadius: radius(100)),
          padding: EdgeInsets.all(8),
          child: Image.asset('images/magnifier.png',
              height: 24,
              color: appStore.isDarkModeOn ? Colors.white : daraPrimaryColor),
        ),
        16.width,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(title: element.title, size: 16),
            4.height,
            Text(
              element.subtitle!,
              style: secondaryTextStyle(
                  color: appStore.isDarkModeOn
                      ? daraTextColorDarkMode
                      : daraPrimaryColor,
                  size: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}
