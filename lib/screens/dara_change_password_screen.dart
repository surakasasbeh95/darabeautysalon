import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'dara_login_now_screen.dart';

class DaraChangePasswordScreen extends StatelessWidget {
  FocusNode newPassword = FocusNode();
  FocusNode confirmPassword = FocusNode();

  DaraChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: Column(
        children: [
          upperContainer(
            screenContext: context,
            child: headerText(title: 'Change Password'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text(
                        'Reset code was sent to your email. Please enter the code and create a new password.',
                        style: primaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? Colors.white
                                : daraSpecialColorDark,
                            size: 14)),
                    30.height,
                    Text('Reset Code',
                        style: primaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraSpecialColor,
                            size: 14)),
                    AppTextField(
                      nextFocus: newPassword,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textFieldType: TextFieldType.PHONE,
                      autoFocus: true,
                      cursorColor: daraPrimaryColor,
                      textStyle: boldTextStyle(
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraPrimaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraPrimaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraPrimaryColor)),
                      ),
                    ),
                    16.height,
                    Text('New Password',
                        style: primaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraSpecialColor,
                            size: 14)),
                    AppTextField(
                      focus: newPassword,
                      nextFocus: confirmPassword,
                      textInputAction: TextInputAction.next,
                      textFieldType: TextFieldType.PASSWORD,
                      cursorColor: daraPrimaryColor,
                      suffixIconColor: appStore.isDarkModeOn
                          ? Colors.white
                          : daraPrimaryColor,
                      textStyle: boldTextStyle(
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraPrimaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraPrimaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraPrimaryColor)),
                      ),
                    ),
                    16.height,
                    Text('Confirm Password',
                        style: primaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraSpecialColor,
                            size: 14)),
                    AppTextField(
                      focus: confirmPassword,
                      textInputAction: TextInputAction.done,
                      textFieldType: TextFieldType.PASSWORD,
                      cursorColor: daraPrimaryColor,
                      textStyle: boldTextStyle(
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark),
                      suffix: Icon(Icons.check, color: Colors.teal),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                      ),
                    ),
                    100.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode.withAlpha(50)
                                  : daraPrimaryColor.withAlpha(70),
                              borderRadius: radius(100)),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: appStore.isDarkModeOn
                                    ? Colors.white
                                    : daraPrimaryColor),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal, borderRadius: radius(100)),
                          child: IconButton(
                            icon: Icon(Icons.check, color: Colors.white),
                            onPressed: () {
                              DaraLoginNowScreen().launch(context);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
              )).expand()
        ],
      ),
    );
  }
}
