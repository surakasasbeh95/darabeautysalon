import 'package:darabeautysalon/models/dara_master_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/dara_calender_screen.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';

// ignore: must_be_immutable
class DaraMyMasterComponent extends StatelessWidget {
  List<DaraMasterModel> myMasterList = getMyMastersList();

  DaraMyMasterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
        padding: EdgeInsets.symmetric(horizontal: 16),
        spacing: 16,
        itemCount: myMasterList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 190,
            width: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 60,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.only(top: 50, bottom: 30),
                    decoration: BoxDecoration(
                        borderRadius: radius(32), color: context.cardColor),
                    child: Text(myMasterList[index].name,
                        style: boldTextStyle(), textAlign: TextAlign.center),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(myMasterList[index].image,
                          height: 100, width: 100, fit: BoxFit.cover)
                      .cornerRadiusWithClipRRect(100),
                ),
                Positioned(
                  bottom: 0,
                  child: AppButton(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    color: daraPrimaryColor,
                    onTap: () {
                      DaraCalenderScreen(isStaffBooking: true).launch(context);
                    },
                    child: Text(myMasterList[index].position,
                        style: boldTextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
