import 'package:darabeautysalon/auth/auth.dart';
import 'package:darabeautysalon/widget/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/DaraSocialIconsLoginComponents.dart';
import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'dara_enable_location_screen.dart';
import 'dara_login_screen.dart';

class DaraRegisterScreen extends StatefulWidget {
  const DaraRegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DaraRegisterScreenState createState() => _DaraRegisterScreenState();
}

class _DaraRegisterScreenState extends State<DaraRegisterScreen> {
  FocusNode password = FocusNode();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _SignUpFormkey = GlobalKey<FormState>();

  final Auth _auth = Auth();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          _emailTextController.text, _passwordTextController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  @override
  void initState() {
    setStatusBarColor(daraSpecialColor);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperContainer(
            screenContext: context,
            child: headerText(title: 'Register'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Form(
                  key: _SignUpFormkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.height,
                      Row(
                        children: [
                          Text('Are you a member?',
                              style: boldTextStyle(
                                  color: appStore.isDarkModeOn
                                      ? Colors.white
                                      : daraSpecialColorDark)),
                          TextButton(
                            onPressed: () {
                              const DaraLoginScreen().launch(context);
                            },
                            child: Text('Login Now',
                                style: boldTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? daraPrimaryColor
                                        : Colors.grey)),
                          )
                        ],
                      ),
                      30.height,
                      Text('Enter your email',
                          style: primaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraSpecialColor,
                              size: 14)),
                      AppTextField(
                        validator: (value) {
                          if (_emailTextController.text.isEmpty) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        nextFocus: password,
                        textFieldType: TextFieldType.EMAIL,
                        autoFocus: true,
                        cursorColor: daraPrimaryColor,
                        textStyle: boldTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraPrimaryColor),
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
                      20.height,
                      Text('Password',
                          style: primaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraSpecialColor,
                              size: 14)),
                      AppTextField(
                        focus: password,
                        validator: (value) {
                          if (_passwordTextController.text.isEmpty) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        controller: _passwordTextController,
                        textFieldType: TextFieldType.PASSWORD,
                        autoFocus: true,
                        cursorColor: daraPrimaryColor,
                        textStyle: boldTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraPrimaryColor),
                        suffixIconColor: daraPrimaryColor,
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
                      30.height,
                      AppButton(
                        width: context.width() - 32,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: const EdgeInsets.all(16),
                        color: daraPrimaryColor,
                        onTap: () async {
                          if (_SignUpFormkey.currentState!.validate()) {
                            String email = _emailTextController.text;
                            String password = _passwordTextController.text;

                            User? user = await _auth.signUpWithEmailAndPassword(
                                email, password);

                            if (user != null) {
                              showToast(
                                  message: "User is successfully created");
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, "/home");
                            } else {
                              showToast(message: "Some error happend");
                            }
                            //
                          }
                        },
                        child: Text('Join Now',
                            style: boldTextStyle(color: Colors.white)),
                      ),
                      30.height,
                      Text(
                        'or register with',
                        style: secondaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraSpecialColorDark),
                      ).center(),
                      30.height,
                      DaraSocialIconsLoginComponents().center(),
                      30.height,
                      Text(
                        'By clicking Join Beauty Master, you agreeing to',
                        style: secondaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? Colors.white
                                : daraSpecialColorDark,
                            size: 12),
                      ).center(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('the ',
                              style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn
                                      ? Colors.white
                                      : daraSpecialColorDark,
                                  size: 12)),
                          Text('Terms of Use',
                              style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn
                                      ? daraPrimaryColor
                                      : Colors.grey,
                                  decoration: TextDecoration.underline)),
                          Text(' and the ',
                              style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn
                                      ? Colors.white
                                      : daraSpecialColorDark,
                                  size: 12)),
                          Text('Privacy Policy',
                              style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn
                                      ? daraPrimaryColor
                                      : Colors.grey,
                                  decoration: TextDecoration.underline)),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                ),
              )).expand()
        ],
      ),
    );
  }
}
