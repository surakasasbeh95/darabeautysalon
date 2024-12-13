import 'package:darabeautysalon/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_common_card_model.dart';
import '../screens/dara_single_portfolio_screen.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';

// ignore: must_be_immutable
class DaraPortfolioComponent extends StatelessWidget {
  List<DaraCommonCardModel> portfolioList = getRecommendedList();

  DaraPortfolioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: portfolioList.map((e) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          width: context.width() - 32,
          decoration:
              BoxDecoration(color: context.cardColor, borderRadius: radius(32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                e.image,
                width: context.width() - 32,
                height: 150,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
              8.height,
              Text(e.title,
                      style: boldTextStyle(
                          size: 18,
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark))
                  .paddingSymmetric(horizontal: 8),
              4.height,
              Row(
                children: [
                  Icon(Icons.favorite, color: daraPrimaryColor, size: 16),
                  2.width,
                  Text(e.likes!,
                      style: secondaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? daraTextColorDarkMode
                              : daraPrimaryColor,
                          size: 14)),
                  8.width,
                  Icon(Icons.messenger, color: daraPrimaryColor, size: 16),
                  2.width,
                  Text(e.comments!,
                      style: secondaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? daraTextColorDarkMode
                              : daraPrimaryColor,
                          size: 14)),
                ],
              ).paddingSymmetric(horizontal: 8),
              16.height,
            ],
          ),
        ).onTap(() {
          DaraSinglePortfolioScreen(element: e).launch(context);
        });
      }).toList(),
    ).paddingSymmetric(vertical: 8);
  }
}
