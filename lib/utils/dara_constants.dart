import 'package:darabeautysalon/main.dart';
import 'package:darabeautysalon/utils/dara_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_common_card_model.dart';
import 'dara_data_generator.dart';

const appName = 'dara';

List<DaraCommonCardModel> favList = getFavList();
const isDarkModeOnPref = 'isDarkModeOnPref';

var textFormFieldStyle = TextStyle(
  color: black,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

getFormControlDecoration({
  Widget? suffixIcon,
  String? hintText,
  bool? isDateTime = false,
  bool? isDate = false,
  bool? isTime = false,
  Function()? onTapDate,
  Function()? onTapTime,
  Color? fillColor = Colors.white,
}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: isDateTime == true
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onTapDate,
                child: Icon(
                  Icons.calendar_month_outlined,
                  color: !appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: onTapTime,
                child: Icon(
                  FontAwesomeIcons.clock,
                  color: !appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        : isDate == true
            ? InkWell(
                onTap: onTapDate,
                child: Icon(
                  Icons.calendar_month_outlined,
                  color: !appStore.isDarkModeOn
                      ? Colors.white
                      : daraSpecialColorDark,
                  size: 25,
                ),
              )
            : isTime == true
                ? InkWell(
                    onTap: onTapTime,
                    child: Icon(
                      FontAwesomeIcons.clock,
                      color: !appStore.isDarkModeOn
                          ? Colors.white
                          : daraSpecialColorDark,
                      size: 25,
                    ),
                  )
                : suffixIcon,
    hintStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 15,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: daraSpecialColorDark,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: daraSpecialColorDark,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
    fillColor: fillColor,
    filled: true,
  );
}
