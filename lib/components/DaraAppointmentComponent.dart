import 'package:darabeautysalon/main.dart';
import 'package:darabeautysalon/utils/dara_colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_appointment_model.dart';
import '../utils/dara_widgets.dart';

// ignore: must_be_immutable
class DaraAppointmentComponent extends StatefulWidget {
  DaraAppointmentModel element;

  DaraAppointmentComponent({super.key, required this.element});

  @override
  // ignore: library_private_types_in_public_api
  _DaraAppointmentComponentState createState() =>
      _DaraAppointmentComponentState();
}

class _DaraAppointmentComponentState extends State<DaraAppointmentComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.element.isSelected
            ? appStore.isDarkModeOn
                ? Colors.white.withAlpha(30)
                : daraSpecialColorDark.withAlpha(30)
            : context.cardColor,
        borderRadius: radius(32),
        border: Border.all(
            color: widget.element.isSelected
                ? appStore.isDarkModeOn
                    ? Colors.white
                    : daraSpecialColorDark
                : context.cardColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.element.image,
                  height: 50, width: 50, fit: BoxFit.cover)
              .cornerRadiusWithClipRRect(32),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.element.salonName,
                  style: primaryTextStyle(color: daraPrimaryColor, size: 14)),
              2.height,
              titleText(title: widget.element.service, size: 16, maxLines: 2),
              2.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timelapse, color: daraPrimaryColor, size: 16),
                  4.width,
                  Text(widget.element.time,
                      style: secondaryTextStyle(
                          size: 12,
                          color: appStore.isDarkModeOn
                              ? daraTextColorDarkMode
                              : daraSpecialColorDark))
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag_rounded,
                      color: daraPrimaryColor, size: 14),
                  4.width,
                  Text(widget.element.product,
                      style: secondaryTextStyle(
                          size: 12,
                          color: appStore.isDarkModeOn
                              ? daraTextColorDarkMode
                              : daraSpecialColorDark))
                ],
              )
            ],
          ).expand()
        ],
      ),
    ).onTap(() {
      widget.element.isSelected = !widget.element.isSelected;
      setState(() {});
    });
  }
}
