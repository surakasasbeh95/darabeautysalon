import 'package:darabeautysalon/auth/auth.dart';
import 'package:darabeautysalon/widget/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'dara_forget_password_screen.dart';
import 'dara_register_screen.dart';

class DaraLoginScreen extends StatefulWidget {
  const DaraLoginScreen({super.key});

  @override
  State<DaraLoginScreen> createState() => _DaraLoginScreenState();
}

class _DaraLoginScreenState extends State<DaraLoginScreen> {
  FocusNode password = FocusNode();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _loginFormkey = GlobalKey<FormState>();
  final Auth _auth = Auth();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          _emailTextController.text, _passwordTextController.text);
      String email = _emailTextController.text;
      String password = _passwordTextController.text;

      User? user = await _auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        showToast(message: "User is successfully created");
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, "/home");
      } else {
        showToast(message: "Some error happend");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

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
            child: headerText(title: 'Login'),
          ),
          lowerContainer(
            screenContext: context,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  Row(
                    children: [
                      Text('Not a member yet?',
                          style: boldTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraSpecialColorDark)),
                      TextButton(
                        onPressed: () {
                          DaraRegisterScreen().launch(context);
                        },
                        child: Text(
                          'Register Now',
                          style: boldTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraPrimaryColor
                                  : daraGreyColor),
                        ),
                      )
                    ],
                  ),
                  30.height,
                  Form(
                    key: _loginFormkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter your email',
                            style: primaryTextStyle(
                                color: appStore.isDarkModeOn
                                    ? daraTextColorDarkMode
                                    : daraSpecialColor,
                                size: 14)),
                        AppTextField(
                          keyboardType: TextInputType.emailAddress,
                          nextFocus: password,
                          textFieldType: TextFieldType.EMAIL,
                          autoFocus: true,
                          validator: (value) {
                            if (_emailTextController.text.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          controller: _emailTextController,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Password',
                                style: primaryTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? daraTextColorDarkMode
                                        : daraSpecialColor,
                                    size: 14)),
                            TextButton(
                              onPressed: () {
                                DaraForgetPasswordScreen().launch(context);
                              },
                              child: Text('Forgot Password',
                                  style: boldTextStyle(
                                      color: appStore.isDarkModeOn
                                          ? daraPrimaryColor
                                          : daraGreyColor,
                                      size: 14)),
                            )
                          ],
                        ),
                        AppTextField(
                          focus: password,
                          textFieldType: TextFieldType.PASSWORD,
                          autoFocus: true,
                          cursorColor: daraPrimaryColor,
                          validator: (value) {
                            if (_passwordTextController.text.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          controller: _passwordTextController,
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
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AppButton(
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: EdgeInsets.all(16),
                        color: daraPrimaryColor,
                        onTap: () {
                          if (_loginFormkey.currentState!.validate()) {
                            signInWithEmailAndPassword();

                            //
                          }
                        },
                        child: Text('Login',
                            style: boldTextStyle(color: Colors.white)),
                      ).expand(),
                      16.width,
                      AppButton(
                        height: 40,
                        width: 40,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        padding: EdgeInsets.all(16),
                        color: Colors.grey,
                        child:
                            Icon(Icons.qr_code_scanner_rounded, color: white),
                      ),
                    ],
                  ),
                  30.height,
                  // Text(
                  //   'or login with',
                  //   style: secondaryTextStyle(
                  //       color: appStore.isDarkModeOn
                  //           ? daraTextColorDarkMode
                  //           : daraSpecialColorDark),
                  // ).center(),
                  // 30.height,
                  // DaraSocialIconsLoginComponents().center(),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          ).expand()
        ],
      ),
    );
  }
}
