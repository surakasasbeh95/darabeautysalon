import 'package:darabeautysalon/auth/auth.dart';
import 'package:darabeautysalon/utils/dara_constants.dart';
import 'package:darabeautysalon/widget/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../screens/dara_favourites_screen.dart';
import '../screens/dara_shopping_screen.dart';
import '../utils/dara_bottom_sheet.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'DaraAppointmentFragment.dart';

class DaraMoreFragment extends StatefulWidget {
  const DaraMoreFragment({super.key});

  @override
  State<DaraMoreFragment> createState() => _DaraMoreFragmentState();
}

class _DaraMoreFragmentState extends State<DaraMoreFragment> {
  // Future<void> signOut() async {
  //   await Auth().signOut();
  // }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperContainer(
            screenContext: context,
            child: Column(
              children: [
                16.height,
                Image.asset('images/face_one.png',
                        height: 100, width: 100, fit: BoxFit.cover)
                    .cornerRadiusWithClipRRect(100),
                8.height,
                Text('anita@gmail.com', style: boldTextStyle(color: white))
              ],
            ),
          ),
          lowerContainer(
            child: Column(
              children: [
                16.height,
                Row(
                  children: [
                    appStore.isDarkModeOn
                        ? Icon(Icons.brightness_2,
                            color: daraPrimaryColor, size: 30)
                        : Icon(Icons.wb_sunny_rounded,
                            color: daraPrimaryColor, size: 30),
                    16.width,
                    Text('Choose App Theme',
                            style: boldTextStyle(
                                size: 20,
                                color: appStore.isDarkModeOn
                                    ? white
                                    : daraSpecialColorDark))
                        .expand(),
                    Switch(
                      value: appStore.isDarkModeOn,
                      activeTrackColor: daraSpecialColor,
                      inactiveThumbColor: daraPrimaryColor,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (val) async {
                        appStore.toggleDarkMode(value: val);
                        await setValue(isDarkModeOnPref, val);
                      },
                    ),
                  ],
                )
                    .paddingOnly(left: 16, top: 8, right: 16, bottom: 8)
                    .onTap(() async {
                  if (getBoolAsync(isDarkModeOnPref)) {
                    appStore.toggleDarkMode(value: false);
                    await setValue(isDarkModeOnPref, false);
                  } else {
                    appStore.toggleDarkMode(value: true);
                    await setValue(isDarkModeOnPref, true);
                  }
                }),
                SettingItemWidget(
                  title: 'Check Appointments',
                  leading: Icon(Icons.calendar_today,
                      color: daraPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(
                      size: 20,
                      color:
                          appStore.isDarkModeOn ? white : daraSpecialColorDark),
                  onTap: () {
                    DaraAppointmentFragment().launch(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Favourites',
                  leading:
                      Icon(Icons.favorite, color: daraPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(
                      size: 20,
                      color:
                          appStore.isDarkModeOn ? white : daraSpecialColorDark),
                  onTap: () {
                    DaraFavouritesScreen().launch(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Orders',
                  leading: Icon(Icons.shopping_basket_rounded,
                      color: daraPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(
                      size: 20,
                      color:
                          appStore.isDarkModeOn ? white : daraSpecialColorDark),
                  onTap: () {
                    DaraShoppingScreen(isOrders: true).launch(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Contact Us',
                  leading: Icon(Icons.call, color: daraPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(
                      size: 20,
                      color:
                          appStore.isDarkModeOn ? white : daraSpecialColorDark),
                  onTap: () {
                    showSelectStaffBottomSheet(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Sign out',
                  leading:
                      Icon(Icons.logout, color: daraPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(
                      size: 20,
                      color:
                          appStore.isDarkModeOn ? white : daraSpecialColorDark),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, "/login");
                    showToast(message: "Successfully signed out");
                  },
                )
              ],
            ),
            screenContext: context,
          )
        ],
      ),
    );
  }
}
