import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../fragments/DaraAppointmentFragment.dart';
import '../fragments/DaraChatFragment.dart';
import '../fragments/DaraHomeFragment.dart';
import '../fragments/DaraMoreFragment.dart';
import '../main.dart';
import '../models/dara_dashboard_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';

class DaraDashboardScreen extends StatefulWidget {
  final bool flag;

  const DaraDashboardScreen({super.key, required this.flag});

  @override
  State<DaraDashboardScreen> createState() => _DaraDashboardScreenState();
}

class _DaraDashboardScreenState extends State<DaraDashboardScreen> {
  List<DaraDashboardModel> list = getDashboardList();

  int selectedTab = 0;

  Widget getFragment() {
    if (selectedTab == 0) {
      return DaraHomeFragment();
    } else if (selectedTab == 1) {
      return PurchaseMoreScreen();
    } else if (selectedTab == 2) {
      return DaraAppointmentFragment();
    } else if (selectedTab == 3) {
      return DaraChatFragment();
    } else {
      return DaraMoreFragment();
    }
  }

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.flag) {
      setStatusBarColor(appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor);
    } else {
      setStatusBarColor(Colors.transparent);
    }

    super.dispose();
  }

  Color getDashboardColor() {
    if (!appStore.isDarkModeOn) {
      if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
        return daraSecondBackgroundColorLight;
      } else {
        return daraLightScaffoldBackgroundColor;
      }
    } else {
      if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
        return daraSecondBackgroundColorDark;
      } else {
        return appStore.scaffoldBackground!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getDashboardColor(),
      body: getFragment(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.cardColor,
        unselectedItemColor: daraPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedTab,
        items: list.map((e) {
          return BottomNavigationBarItem(
            icon: Image.asset(e.unSelectedIcon,
                height: 24, color: daraPrimaryColor),
            activeIcon: Image.asset(e.selectedIcon,
                height: 24, color: daraPrimaryColor),
            label: '',
          );
        }).toList(),
      ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
    );
  }
}
