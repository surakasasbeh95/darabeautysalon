import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/DaraAppointMentTabComponent.dart';
import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

class DaraAppointmentFragment extends StatefulWidget {
  const DaraAppointmentFragment({super.key});

  @override
  State<DaraAppointmentFragment> createState() =>
      _DaraAppointmentFragmentState();
}

class _DaraAppointmentFragmentState extends State<DaraAppointmentFragment> {
  List<String> tabList = ['UPCOMING', 'PAST'];
  int selectedTab = 0;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn
            ? appStore.scaffoldBackground!
            : daraLightScaffoldBackgroundColor,
        elevation: 0,
        leading: SizedBox(),
        leadingWidth: 16,
        title: titleText(title: 'Appointments'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: appStore.isDarkModeOn
                ? daraSecondBackgroundColorDark
                : daraSecondBackgroundColorLight,
            borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: tabList.map((e) {
                  int index = tabList.indexOf(e);
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: radius(32),
                      color: selectedTab == index
                          ? daraPrimaryColor
                          : Colors.transparent,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      tabList[index],
                      style: boldTextStyle(
                        size: 14,
                        color: selectedTab == index
                            ? white
                            : appStore.isDarkModeOn
                                ? daraPrimaryColor
                                : daraSpecialColorDark,
                      ),
                    ).onTap(() {
                      selectedTab = index;
                      setState(() {});
                    }),
                  );
                }).toList(),
              ).center(),
              20.height,
              DaraAppointMentTabComponent(
                  tabOne: selectedTab == 0 ? true : false),
              20.height,
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
