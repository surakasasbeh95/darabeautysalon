import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import 'dara_enable_notification_screen.dart';

class DaraEnableLocationScreen extends StatefulWidget {
  const DaraEnableLocationScreen({super.key});

  @override
  State<DaraEnableLocationScreen> createState() =>
      _DaraEnableLocationScreenState();
}

class _DaraEnableLocationScreenState extends State<DaraEnableLocationScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(daraSpecialColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          20.height,
          Column(
            children: [
              Image.asset('images/map.png', height: 200),
              Text(
                  'In order to use Beauty Master location services must be enabled',
                  style: boldTextStyle(
                      color: appStore.isDarkModeOn
                          ? Colors.white
                          : daraSpecialColorDark),
                  textAlign: TextAlign.center),
              16.height,
              Text(
                'Accessing your location will allow you to find places near you, and provides the ability to use Beauty Master to book services.',
                style: secondaryTextStyle(
                    color: appStore.isDarkModeOn
                        ? Colors.white
                        : daraSpecialColorDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              AppButton(
                width: context.width() - 40,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                padding: EdgeInsets.all(16),
                color: daraPrimaryColor,
                onTap: () {
                  DaraEnableNotificationScreen().launch(context);
                },
                child: Text('Enable Location',
                    style: boldTextStyle(color: Colors.white)),
              ),
              20.height,
              Text('Maybe Later',
                  style: boldTextStyle(
                      color: appStore.isDarkModeOn
                          ? daraPrimaryColor
                          : Colors.grey)),
            ],
          )
        ],
      ).paddingAll(20),
    );
  }
}
