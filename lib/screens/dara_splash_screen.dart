// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import 'dara_walk_through_screen.dart';

class DaraSplashScreen extends StatefulWidget {
  const DaraSplashScreen({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  State<DaraSplashScreen> createState() => _DaraSplashScreenState();
}

class _DaraSplashScreenState extends State<DaraSplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3), () {
    //   // ignore: use_build_context_synchronously
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => widget.child!),
    //       (route) => false);
    // });
    init();
    super.initState();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    await 3.seconds.delay;
    // ignore: use_build_context_synchronously
    finish(context);
    // ignore: use_build_context_synchronously
    const DaraWalkThroughScreen().launch(context, isNewTask: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/daralogo.png', height: 200),
          Text('Dara Salon',
              style: boldTextStyle(
                  size: 20,
                  color: appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark)),
        ],
      ).center(),
    );
  }
}
