import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_service_list_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';
import '../utils/dara_widgets.dart';
import 'DaraServiceComponent.dart';

// ignore: must_be_immutable
class DaraOurServiveComponent extends StatelessWidget {
  List<DaraServiceListModel> popularServiceList = getPopularServiceList();
  List<DaraServiceListModel> otherServiceList = getOtherServiceList();

  DaraOurServiveComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: daraPrimaryColor.withAlpha(50),
            borderRadius: radius(32),
            border: Border.all(color: daraPrimaryColor),
          ),
          child: AppTextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search_sharp, color: daraPrimaryColor),
              hintText: 'Search for Services',
              hintStyle: secondaryTextStyle(color: daraPrimaryColor),
            ),
            textFieldType: TextFieldType.NAME,
            cursorColor: daraPrimaryColor,
          ),
        ),
        16.height,
        titleText(title: 'Popular Services'),
        16.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: popularServiceList.map((e) {
            return DaraServiceComponent(element: e);
          }).toList(),
        ),
        16.height,
        titleText(title: 'Other Services'),
        16.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: otherServiceList.map((e) {
            return DaraServiceComponent(element: e);
          }).toList(),
        ),
        30.height,
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
