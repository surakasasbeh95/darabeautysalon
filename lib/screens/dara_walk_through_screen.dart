import 'package:darabeautysalon/screens/dara_visitor.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';
import 'dara_dashboard_screen.dart';
import 'dara_login_screen.dart';

class DaraWalkThroughScreen extends StatefulWidget {
  const DaraWalkThroughScreen({super.key});

  @override
  State<DaraWalkThroughScreen> createState() => _DaraWalkThroughScreenState();
}

class _DaraWalkThroughScreenState extends State<DaraWalkThroughScreen> {
  List<WalkThroughModelClass> walkThroughList = getWalkThroughList();

  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: context.width(),
                  height: context.height(),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: walkThroughList.length,
                    itemBuilder: (context, i) {
                      return Image.asset(walkThroughList[i].image!,
                          fit: BoxFit.cover);
                    },
                    onPageChanged: (value) {
                      setState(() => currentIndexPage = value);
                    },
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 30,
                  child:
                      Text('SKIP', style: boldTextStyle(color: white, size: 14))
                          .onTap(() {
                    DaraDashboardScreen(flag: false)
                        .launch(context, isNewTask: true);
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(walkThroughList[currentIndexPage].title!,
                        style: boldTextStyle(
                            size: 24,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    16.height,
                    Text(walkThroughList[currentIndexPage].subTitle!,
                        style: primaryTextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        textAlign: TextAlign.center),
                    32.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < walkThroughList.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 4,
                            width: i == currentIndexPage ? 30 : 14,
                            decoration: BoxDecoration(
                              color:
                                  i == currentIndexPage ? white : Colors.grey,
                              borderRadius: radius(12),
                            ),
                          ),
                      ],
                    ),
                    40.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.all(16),
                          width: 150,
                          color: daraPrimaryColor,
                          onTap: () {
                            DaraLoginScreen().launch(context, isNewTask: true);
                          },
                          child: Text('Login Now',
                              style: boldTextStyle(color: Colors.white)),
                        ),
                        16.width,
                        AppButton(
                          width: 150,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.all(16),
                          color: Colors.grey,
                          onTap: () {
                            DaraVisitor().launch(context, isNewTask: true);
                          },
                          child: Text('Join Now',
                              style: boldTextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    50.height,
                  ],
                ).paddingOnly(bottom: 24, right: 16, left: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
