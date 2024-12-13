import 'package:darabeautysalon/main.dart';
import 'package:darabeautysalon/models/dara_models.dart';
import 'package:darabeautysalon/screens/dara_dashboard_screen.dart';
import 'package:darabeautysalon/utils/dara_colors.dart';
import 'package:darabeautysalon/utils/dara_constants.dart';
import 'package:darabeautysalon/utils/dara_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class DaraVisitor extends StatefulWidget {
  const DaraVisitor({super.key});

  @override
  State<DaraVisitor> createState() => _DaraVisitorState();
}

class _DaraVisitorState extends State<DaraVisitor> {
  final FocusNode _phoneNumber = FocusNode();
  String _selectedReason = "", _selectedReasonId = "";
  final _nameTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _addVisitorFormkey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  List<PairValue> _reasons = [
    PairValue("1", "Instagram"),
    PairValue("2", "Facebook"),
    PairValue("3", "Friends"),
    PairValue("4", "Relative")
  ];
  final GlobalKey<FormFieldState> _reasonKey = GlobalKey();
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
            child: headerText(title: 'Join Us'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Form(
                  key: _addVisitorFormkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.height,
                      30.height,
                      Text('Name',
                          style: primaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraSpecialColor,
                              size: 14)),
                      AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        nextFocus: _phoneNumber,
                        textFieldType: TextFieldType.NAME,
                        autoFocus: true,
                        controller: _nameTextController,
                        validator: (value) {
                          if (_nameTextController.text == "") {
                            return ("Required Field");
                          } else {
                            return null;
                          }
                        },
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
                      Text('Phone Number',
                          style: primaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraSpecialColor,
                              size: 14)),
                      AppTextField(
                        focus: _phoneNumber,
                        textFieldType: TextFieldType.PHONE,
                        autoFocus: true,
                        cursorColor: daraPrimaryColor,
                        controller: _phoneTextController,
                        validator: (value) {
                          if (_phoneTextController.text == "") {
                            return ("Required Field");
                          } else {
                            return null;
                          }
                        },
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
                      20.height,
                      Text('Where did you hear about us?',
                          style: primaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraSpecialColor,
                              size: 14)),
                      10.height,
                      DropdownButtonFormField(
                        isExpanded: true,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            FontAwesomeIcons.chevronDown,
                            color: black,
                            size: 15,
                          ),
                        ),
                        validator: (value) {
                          if (_selectedReasonId.isEmpty) {
                            return ("Required Field");
                          } else {
                            return null;
                          }
                        },
                        hint: SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          child: Text(
                            _selectedReason.isNotEmpty
                                ? _selectedReason
                                : ("select"),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        decoration: getFormControlDecoration(
                          suffixIcon: _selectedReason.isEmpty
                              ? null
                              : InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        _selectedReasonId = "";
                                        _selectedReason = "";
                                        _reasonKey.currentState!.reset();
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.clear,
                                  ),
                                ),
                        ),
                        items: _reasons.map((PairValue value) {
                          return DropdownMenuItem<PairValue>(
                            value: value,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .65,
                              child: Text(
                                value.name,
                                style: textFormFieldStyle,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (PairValue? value) {
                          setState(() {
                            if (value != null) {
                              _selectedReason = value.name;
                              _selectedReasonId = value.id;
                            }
                          });
                        },
                        key: _reasonKey,
                      ),
                      30.height,
                      AppButton(
                        width: context.width() - 32,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: EdgeInsets.all(16),
                        color: daraPrimaryColor,
                        onTap: () {
                          if (_addVisitorFormkey.currentState!.validate()) {
                            DaraDashboardScreen(
                              flag: true,
                            ).launch(context);
                          }
                        },
                        child: Text('Join Now',
                            style: boldTextStyle(color: Colors.white)),
                      ),
                      30.height,
                      30.height,
                      Text(
                        'By clicking Join Dara salon, you agreeing to',
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
