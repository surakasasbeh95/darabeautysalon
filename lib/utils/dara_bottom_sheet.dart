import 'package:darabeautysalon/components/DaraCommentComponent.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/dara_comment_model.dart';
import '../models/dara_master_model.dart';
import '../models/dara_service_list_model.dart';
import '../screens/dara_calender_screen.dart';
import '../screens/dara_call_screen.dart';
import 'dara_colors.dart';
import 'dara_data_generator.dart';
import 'dara_widgets.dart';

void showFilterBottomSheet(BuildContext context) {
  double value = 5.0;

  bool distChecked = false;
  bool topChecked = false;
  bool specialChecked = false;
  bool mobileChecked = false;
  bool onlineChecked = false;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon:
                      Icon(Icons.cancel_rounded, color: daraTextColorDarkMode),
                ),
              ),
              titleText(title: 'Filters', size: 24),
              16.height,
              Text('Sort by',
                  style: boldTextStyle(
                      color: appStore.isDarkModeOn
                          ? white
                          : daraSpecialColorDark)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Distance',
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                  IconButton(
                    icon: distChecked
                        ? Icon(Icons.check_circle, color: daraPrimaryColor)
                        : Icon(Icons.circle_outlined, color: daraPrimaryColor),
                    onPressed: () {
                      distChecked = !distChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Reviewed',
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                  IconButton(
                    icon: topChecked
                        ? Icon(Icons.check_circle, color: daraPrimaryColor)
                        : Icon(Icons.circle_outlined, color: daraPrimaryColor),
                    onPressed: () {
                      topChecked = !topChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              16.height,
              Row(
                children: [
                  Text('Distance ',
                      style: boldTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                  Text('${value.round().toString()} miles',
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: daraPrimaryColor,
                  inactiveTrackColor: daraPrimaryColor.withAlpha(70),
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: daraPrimaryColor,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 12.0,
                  ),
                  overlayColor: daraPrimaryColor.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                  max: 20,
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
              ),
              16.height,
              Text('Others',
                  style: boldTextStyle(
                      color: appStore.isDarkModeOn
                          ? white
                          : daraSpecialColorDark)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Special Offers',
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                  IconButton(
                    icon: specialChecked
                        ? Icon(Icons.check_circle, color: daraPrimaryColor)
                        : Icon(Icons.circle_outlined, color: daraPrimaryColor),
                    onPressed: () {
                      specialChecked = !specialChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mobile Services',
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                  IconButton(
                    icon: mobileChecked
                        ? Icon(Icons.check_circle, color: daraPrimaryColor)
                        : Icon(Icons.circle_outlined, color: daraPrimaryColor),
                    onPressed: () {
                      mobileChecked = !mobileChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Online Services',
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? white
                              : daraSpecialColorDark)),
                  IconButton(
                    icon: onlineChecked
                        ? Icon(Icons.check_circle, color: daraPrimaryColor)
                        : Icon(Icons.circle_outlined, color: daraPrimaryColor),
                    onPressed: () {
                      onlineChecked = !onlineChecked;
                      setState(() {});
                    },
                  ),
                ],
              ),
              16.height,
              Row(
                children: [
                  AppButton(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(color: daraPrimaryColor, width: 2)),
                    padding: EdgeInsets.all(16),
                    color: context.cardColor,
                    onTap: () {
                      //
                    },
                    child: Text('Clear', style: boldTextStyle()),
                  ),
                  16.width,
                  AppButton(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    padding: EdgeInsets.all(16),
                    color: daraPrimaryColor,
                    onTap: () {
                      //
                    },
                    child: Text('Show 45+ places',
                        style: boldTextStyle(color: Colors.white)),
                  ).expand(),
                ],
              ),
              30.height,
            ],
          ).paddingAll(16);
        });
      });
}

void showBookBottomSheet(BuildContext context, DaraServiceListModel element) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon:
                      Icon(Icons.cancel_rounded, color: daraTextColorDarkMode),
                ),
              ),
              titleText(title: element.name, size: 24),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: primaryTextStyle(
                    color: appStore.isDarkModeOn
                        ? Colors.white
                        : daraSpecialColorDark),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      titleText(title: element.cost, size: 16, maxLines: 2),
                      Text(
                        element.time,
                        style: secondaryTextStyle(
                            color: appStore.isDarkModeOn
                                ? daraTextColorDarkMode
                                : daraPrimaryColor),
                      )
                    ],
                  ),
                  AppButton(
                    //padding: EdgeInsets.all(0),
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    color: daraPrimaryColor,
                    onTap: () {
                      DaraCalenderScreen(
                              element: element, isStaffBooking: false)
                          .launch(context);
                    },
                    child: Text('Book Now',
                        style: boldTextStyle(color: Colors.white, size: 12)),
                  ),
                ],
              )
            ],
          ).paddingAll(16);
        });
      });
}

void showCommentBottomSheet(BuildContext context) {
  List<DaraCommentModel> list = getCommentsList();

  TextEditingController comment = TextEditingController();
  var formKey = GlobalKey<FormState>();

  showModalBottomSheet(
      backgroundColor: appStore.isDarkModeOn
          ? daraSecondBackgroundColorDark
          : daraSecondBackgroundColorLight,
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon:
                      Icon(Icons.cancel_rounded, color: daraTextColorDarkMode),
                ),
              ).paddingOnly(right: 16, top: 16),
              titleText(title: 'Comments', size: 24)
                  .paddingSymmetric(horizontal: 16),
              16.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: list.map((e) {
                  return DaraCommentComponent(element: e);
                }).toList(),
              ).paddingSymmetric(horizontal: 16),
              Form(
                key: formKey,
                child: Container(
                  decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
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
                            hintStyle:
                                secondaryTextStyle(color: daraPrimaryColor),
                          ),
                          textFieldType: TextFieldType.NAME,
                          cursorColor: daraPrimaryColor,
                        ),
                      ).flexible(flex: 3),
                      Container(
                        decoration: boxDecorationDefault(
                            color: daraPrimaryColor, borderRadius: radius(100)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward, color: Colors.white),
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                comment.text != '') {
                              list.add(DaraCommentModel(
                                  isSubComment: false,
                                  isLiked: false,
                                  likes: '0',
                                  name: 'You',
                                  message: comment.text,
                                  time: 'just now',
                                  image: 'images/face_one.png'));
                              setState(() {});
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      });
}

void showSelectStaffBottomSheet(BuildContext context) {
  List<DaraMasterModel> myMasterList = getMyMastersList();

  int selectedTab = 0;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon:
                      Icon(Icons.cancel_rounded, color: daraTextColorDarkMode),
                ),
              ),
              titleText(title: 'Select Staff', size: 24),
              16.height,
              Wrap(
                children: myMasterList.map((e) {
                  int index = myMasterList.indexOf(e);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(e.image,
                                  height: 30, width: 30, fit: BoxFit.cover)
                              .cornerRadiusWithClipRRect(100),
                          8.width,
                          Text(e.name,
                              style: primaryTextStyle(
                                  color: appStore.isDarkModeOn
                                      ? white
                                      : daraSpecialColorDark)),
                        ],
                      ),
                      IconButton(
                        icon: selectedTab == index
                            ? Icon(Icons.check_circle, color: daraPrimaryColor)
                            : Icon(Icons.circle_outlined,
                                color: daraPrimaryColor),
                        onPressed: () {
                          selectedTab = index;
                          setState(() {});
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
              50.height,
              AppButton(
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: daraPrimaryColor,
                onTap: () {
                  finish(context);
                  DaraCallScreen(image: myMasterList[selectedTab].image)
                      .launch(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.call, color: Colors.white),
                    6.width,
                    Text('Call Now', style: boldTextStyle(color: Colors.white)),
                  ],
                ),
              ).center(),
              30.height,
            ],
          ).paddingAll(16);
        });
      });
}
