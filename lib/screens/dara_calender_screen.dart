import 'package:darabeautysalon/components/DaraAvailabilityComponent.dart';
import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/dara_service_list_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import 'dara_shopping_screen.dart';

class DaraCalenderScreen extends StatefulWidget {
  DaraServiceListModel? element;
  bool isStaffBooking;

  DaraCalenderScreen({super.key, this.element, required this.isStaffBooking});

  @override
  _DaraCalenderScreenState createState() => _DaraCalenderScreenState();
}

class _DaraCalenderScreenState extends State<DaraCalenderScreen> {
  List<DaraServiceListModel> availabilityList = [];

  int selectedTimer = 0;

  List<String> availableTimes = ['14:30', '15:00', '16:00'];

  List<String> timers = [
    'Anytime',
    'Morning',
    'Afternoon',
    'Evening',
    'Special time'
  ];

  String getYear() {
    return DateFormat.yMMM().format(DateTime.now());
  }

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    super.initState();
  }

  Widget bookAppointment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(title: 'Availability'),
        16.height,
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: availableTimes.map((e) {
            int index = availableTimes.indexOf(e);
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedTimer == index
                    ? daraPrimaryColor
                    : daraPrimaryColor.withAlpha(50),
                borderRadius: radius(32),
                border: Border.all(color: daraPrimaryColor),
              ),
              child: Text(e,
                  style: primaryTextStyle(
                      color: selectedTimer == index
                          ? Colors.white
                          : appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark)),
            ).onTap(() {
              selectedTimer = index;
              setState(() {});
            });
          }).toList(),
        ),
        16.height,
        Divider(),
        16.height,
        DaraAvailabilityComponent(element: widget.element!),
        16.height,
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: daraPrimaryColor.withAlpha(50),
            borderRadius: radius(32),
            border: Border.all(color: daraPrimaryColor),
          ),
          child: Text(' + Add another Services',
              style: primaryTextStyle(
                  color: appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark)),
        ).onTap(() {
          finish(context);
          finish(context);
        }),
      ],
    );
  }

  Widget bookStaff() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText(title: 'Timers'),
        16.height,
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: timers.map((e) {
            int index = timers.indexOf(e);
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedTimer == index
                    ? daraPrimaryColor
                    : daraPrimaryColor.withAlpha(50),
                borderRadius: radius(32),
                border: Border.all(color: daraPrimaryColor),
              ),
              child: Text(e,
                  style: primaryTextStyle(
                      color: selectedTimer == index
                          ? Colors.white
                          : appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark)),
            ).onTap(() {
              selectedTimer = index;
              setState(() {});
            });
          }).toList(),
        ),
      ],
    );
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
      appBar: AppBar(
        // title: titleText(title: getYear()),
        backgroundColor: appStore.isDarkModeOn
            ? appStore.scaffoldBackground!
            : daraLightScaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: 30,
        iconTheme: IconThemeData(color: daraPrimaryColor),
      ),
      body: PurchaseMoreScreen(),
      floatingActionButton: !widget.isStaffBooking
          ? Container(
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: daraPrimaryColor, borderRadius: radius(32)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Go to Store',
                      style: boldTextStyle(color: Colors.white)),
                  IconButton(
                      onPressed: () {
                        DaraShoppingScreen(isOrders: false).launch(context);
                      },
                      icon: Icon(Icons.arrow_forward, color: Colors.white)),
                ],
              ),
            )
          : AppButton(
              width: context.width() - 32,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              padding: EdgeInsets.all(16),
              color: daraPrimaryColor,
              onTap: () {
                finish(context);
              },
              child:
                  Text('Book Now', style: boldTextStyle(color: Colors.white)),
            ),
    );
  }
}
