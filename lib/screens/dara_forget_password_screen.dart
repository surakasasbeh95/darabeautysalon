import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'dara_change_password_screen.dart';

class DaraForgetPasswordScreen extends StatelessWidget {
  const DaraForgetPasswordScreen({super.key});

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
            child: headerText(title: 'Forget Password'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text(
                        'Please enter your email below to receive your password reset instructions.',
                        style: primaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? Colors.white
                                : daraSpecialColorDark,
                            size: 14)),
                    30.height,
                    Text('Email',
                        style: primaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraSpecialColor,
                            size: 14)),
                    AppTextField(
                      keyboardType: TextInputType.emailAddress,
                      textFieldType: TextFieldType.EMAIL,
                      autoFocus: true,
                      cursorColor: daraPrimaryColor,
                      textStyle: boldTextStyle(
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark),
                      suffix: Icon(Icons.check, color: Colors.teal),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraPrimaryColor
                                    : context.iconColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraPrimaryColor
                                    : context.iconColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: appStore.isDarkModeOn
                                    ? daraPrimaryColor
                                    : context.iconColor)),
                      ),
                    ),
                    300.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode.withOpacity(0.5)
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
                              color: daraPrimaryColor,
                              borderRadius: radius(100)),
                          child: IconButton(
                            icon:
                                Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: () {
                              DaraChangePasswordScreen().launch(context);
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
