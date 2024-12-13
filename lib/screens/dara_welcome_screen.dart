import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import 'dara_dashboard_screen.dart';

class DaraWelcomeScreen extends StatelessWidget {
  const DaraWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/welcome.png', height: 200),
          Text('Welcome to Beauty Master!',
              style: boldTextStyle(
                  color: appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark,
                  size: 24)),
          16.height,
          Text(
            'Find the best beauty salon in your local abd book the dream visit.',
            style: secondaryTextStyle(
                color: appStore.isDarkModeOn
                    ? Colors.white
                    : daraSpecialColorDark),
            textAlign: TextAlign.center,
          ),
          16.height,
          AppButton(
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            padding: EdgeInsets.all(16),
            width: 150,
            color: daraPrimaryColor,
            onTap: () {
              DaraDashboardScreen(flag: true).launch(context);
            },
            child:
                Text('Let\'s Start', style: boldTextStyle(color: Colors.white)),
          ),
        ],
      ).paddingAll(20),
    );
  }
}
