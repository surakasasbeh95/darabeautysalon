import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';

class DaraLoginNowScreen extends StatefulWidget {
  const DaraLoginNowScreen({super.key});

  @override
  State<DaraLoginNowScreen> createState() => _DaraLoginNowScreenState();
}

class _DaraLoginNowScreenState extends State<DaraLoginNowScreen> {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/check.png', height: 200),
          Text('Congrats!',
              style: boldTextStyle(
                  color: appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark,
                  size: 30)),
          16.height,
          Text(
            'You have successfully change password. Please use new password when logging in.',
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
              finish(context);
              finish(context);
              finish(context);
            },
            child: Text('Login Now', style: boldTextStyle(color: Colors.white)),
          ),
        ],
      ).paddingAll(20),
    );
  }
}
