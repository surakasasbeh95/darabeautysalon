import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_master_model.dart';
import '../screens/dara_top_offers_screen.dart';
import '../utils/dara_data_generator.dart';

// ignore: must_be_immutable
class DaraTopServiceHomeComponent extends StatelessWidget {
  List<DaraServiceModel> topServiceList = getTopServicesHomeList();

  DaraTopServiceHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
        padding: EdgeInsets.symmetric(horizontal: 16),
        spacing: 16,
        itemCount: topServiceList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: context.cardColor, borderRadius: radius(32)),
                child: Image.asset(topServiceList[index].image, height: 36),
              ).onTap(() {
                DaraTopOffersScreen().launch(context);
              }),
              8.height,
              Text(topServiceList[index].name, style: boldTextStyle(size: 14)),
            ],
          );
        });
  }
}
