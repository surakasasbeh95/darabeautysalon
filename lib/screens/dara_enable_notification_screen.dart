import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import 'dara_welcome_screen.dart';

class DaraEnableNotificationScreen extends StatelessWidget {
  const DaraEnableNotificationScreen({super.key});

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
              Image.asset('images/notification.png', height: 200),
              Text('Get notified about new deals, messages, people and more.',
                  style: boldTextStyle(
                      color: appStore.isDarkModeOn
                          ? Colors.white
                          : daraSpecialColorDark),
                  textAlign: TextAlign.center),
              16.height,
              Text(
                'Turn on push notifications to help you don\'t missing anything awesome.',
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
                  DaraWelcomeScreen().launch(context);
                },
                child: Text('Enable Notification',
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
