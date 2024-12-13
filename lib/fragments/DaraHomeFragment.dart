import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/DaraCommonCardComponent.dart';
import '../components/DaraHomeFragmentHeadComponent.dart';
import '../components/DaraMyMasterComponent.dart';
import '../components/DaraTopServiceHomeComponent.dart';
import '../main.dart';
import '../models/dara_common_card_model.dart';
import '../screens/dara_recommended_screen.dart';
import '../screens/dara_top_offers_screen.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';
import '../utils/dara_widgets.dart';

class DaraHomeFragment extends StatefulWidget {
  const DaraHomeFragment({super.key});

  @override
  State<DaraHomeFragment> createState() => _DaraHomeFragmentState();
}

class _DaraHomeFragmentState extends State<DaraHomeFragment> {
  List<DaraCommonCardModel> specialOffersList = getSpecialOffersList();

  List<DaraCommonCardModel> recommendedList = getRecommendedList();

  @override
  void initState() {
    setStatusBarColor(daraSpecialColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeFragmentHeadComponent(),
            lowerContainer(
              screenContext: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  titleText(title: 'My Master')
                      .paddingSymmetric(horizontal: 16),
                  20.height,
                  DaraMyMasterComponent(),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Top Services'),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                               DaraTopOffersScreen().launch(context);
                            },
                            child: Text('See All',
                                style: boldTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? daraPrimaryColor
                                        : daraTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: appStore.isDarkModeOn
                                  ? daraPrimaryColor
                                  : daraTextColorDarkMode,
                              size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  DaraTopServiceHomeComponent(),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Special Offers'),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              DaraTopOffersScreen().launch(context);
                            },
                            child: Text('See All',
                                style: boldTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? daraPrimaryColor
                                        : daraTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: appStore.isDarkModeOn
                                  ? daraPrimaryColor
                                  : daraTextColorDarkMode,
                              size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  HorizontalList(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: specialOffersList.length,
                    itemBuilder: (context, index) {
                      return DaraCommonCardComponent(
                          element: specialOffersList[index],
                          fullScreenComponent: false,
                          isFavList: false);
                    },
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Catologue').expand(),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              DaraRecommendedScreen().launch(context);
                            },
                            child: Text('See All',
                                style: boldTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? daraPrimaryColor
                                        : daraTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: appStore.isDarkModeOn
                                  ? daraPrimaryColor
                                  : daraTextColorDarkMode,
                              size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  HorizontalList(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: recommendedList.length,
                    itemBuilder: (context, index) {
                      return DaraCommonCardComponent(
                          element: recommendedList[index],
                          fullScreenComponent: false,
                          isFavList: false);
                    },
                  ),
                  40.height,
                ],
              ).cornerRadiusWithClipRRectOnly(topRight: 40),
            ),
          ],
        ),
      ),
    );
  }
}
