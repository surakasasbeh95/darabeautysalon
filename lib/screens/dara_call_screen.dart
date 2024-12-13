// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';

import '../utils/dara_colors.dart';

class DaraCallScreen extends StatefulWidget {
  String? image;

  DaraCallScreen({
    super.key,
    this.image,
  });

  @override
  State<DaraCallScreen> createState() => _DaraCallScreenState();
}

class _DaraCallScreenState extends State<DaraCallScreen> {
  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Stack(
          children: [
            PurchaseMoreScreen(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/face_one.png',
                  height: 150,
                  width: 110,
                  fit: BoxFit.cover,
                )
                    .cornerRadiusWithClipRRect(24)
                    .paddingSymmetric(vertical: 46, horizontal: 20),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: radiusOnly(topLeft: 32, topRight: 32),
                      color: daraSpecialColorDark.withOpacity(0.7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.videocam_off,
                            color: daraPrimaryColor,
                            size: 30,
                          ),
                          8.height,
                          Text('Video',
                              style: primaryTextStyle(color: daraPrimaryColor))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.flip_camera_ios,
                            color: daraPrimaryColor,
                            size: 30,
                          ),
                          8.height,
                          Text('Flip',
                              style: primaryTextStyle(color: daraPrimaryColor))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mic_off,
                            color: daraPrimaryColor,
                            size: 30,
                          ),
                          8.height,
                          Text('Mute',
                              style: primaryTextStyle(color: daraPrimaryColor))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.red, borderRadius: radius(100)),
                            child: Icon(
                              Icons.call_end,
                              color: Colors.white,
                            ),
                          ),
                          Text('End',
                              style: primaryTextStyle(color: daraPrimaryColor))
                        ],
                      ).onTap(() {
                        finish(context);
                      }, borderRadius: radius(100)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
