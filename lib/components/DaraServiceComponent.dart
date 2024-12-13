import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/dara_service_list_model.dart';
import '../utils/dara_bottom_sheet.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

// ignore: must_be_immutable
class DaraServiceComponent extends StatelessWidget {
  DaraServiceListModel element;

  DaraServiceComponent({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(title: element.name, size: 14, maxLines: 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${element.cost}+',
                  style: secondaryTextStyle(
                    color: appStore.isDarkModeOn
                        ? daraTextColorDarkMode
                        : daraPrimaryColor,
                    size: 12,
                  ),
                ),
                16.width,
                Text(
                  element.time,
                  style: secondaryTextStyle(
                    color: appStore.isDarkModeOn
                        ? daraTextColorDarkMode
                        : daraPrimaryColor,
                    size: 12,
                  ),
                ),
              ],
            )
          ],
        ).expand(),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: daraPrimaryColor.withAlpha(50),
                borderRadius: radius(100),
                border: Border.all(color: daraPrimaryColor),
              ),
              padding: EdgeInsets.all(6),
              child: Icon(Icons.info, color: daraPrimaryColor),
            ),
            8.width,
            AppButton(
              width: 60,
              padding: EdgeInsets.all(0),
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              color: daraPrimaryColor,
              onTap: () {
                showBookBottomSheet(context, element);
              },
              child: Text('Book',
                  style: boldTextStyle(color: Colors.white, size: 12)),
            ),
          ],
        )
      ],
    ).paddingSymmetric(vertical: 8);
  }
}
