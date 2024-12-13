import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/dara_message_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'dara_call_screen.dart';

class DaraChatScreen extends StatefulWidget {
  final DaraMessageModel element;

  const DaraChatScreen({super.key, required this.element});

  @override
  _DaraChatScreenState createState() => _DaraChatScreenState();
}

class _DaraChatScreenState extends State<DaraChatScreen> {
  List<String> inputMessageList = [];

  TextEditingController comment = TextEditingController();
  var form_key = GlobalKey<FormState>();

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
        leadingWidth: 30,
        iconTheme: IconThemeData(color: daraPrimaryColor),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.element.image,
                    height: 40, width: 40, fit: BoxFit.cover)
                .cornerRadiusWithClipRRect(100),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                titleText(title: widget.element.name, size: 16),
                Text(
                  widget.element.isActive!
                      ? 'Active now'
                      : widget.element.lastSeen.validate(),
                  style: secondaryTextStyle(
                      color: appStore.isDarkModeOn
                          ? daraTextColorDarkMode
                          : daraPrimaryColor),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              DaraCallScreen().launch(context);
            },
            icon: Icon(Icons.call_outlined),
          ),
          IconButton(
            onPressed: () {
              DaraCallScreen().launch(context);
            },
            icon: Icon(Icons.videocam_outlined),
          ),
        ],
      ),
      extendBody: false,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: context.width(),
        height: context.height(),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: appStore.isDarkModeOn
              ? daraSecondBackgroundColorDark
              : daraSecondBackgroundColorLight,
          borderRadius: radiusOnly(topRight: 32, topLeft: 32),
        ),
        child: PurchaseMoreScreen(),
      ),
      bottomNavigationBar: Form(
        key: form_key,
        child: Container(
          decoration: BoxDecoration(
              color: appStore.isDarkModeOn
                  ? daraSecondBackgroundColorDark
                  : daraSecondBackgroundColorLight),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: daraPrimaryColor.withAlpha(50),
                  borderRadius: radius(32),
                  border: Border.all(color: daraPrimaryColor),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppTextField(
                  controller: comment,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add comment',
                    hintStyle: secondaryTextStyle(color: daraPrimaryColor),
                  ),
                  textFieldType: TextFieldType.NAME,
                  cursorColor: daraPrimaryColor,
                ),
              ).flexible(flex: 3),
              16.width,
              Container(
                decoration: BoxDecoration(
                    color: daraPrimaryColor, borderRadius: radius(100)),
                child: IconButton(
                  icon: Icon(Icons.arrow_upward, color: Colors.white),
                  onPressed: () {
                    if (form_key.currentState!.validate() &&
                        comment.text != '') {
                      inputMessageList.add(comment.text);
                      setState(() {});
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
