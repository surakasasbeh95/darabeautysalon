import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

class HomeFragmentHeadComponent extends StatelessWidget {
  const HomeFragmentHeadComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return upperContainer(
      screenContext: context,
      child: Column(
        children: [
          40.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.amber, size: 50),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New York',
                          style: boldTextStyle(color: Colors.white, size: 14)),
                      Wrap(
                        children: [
                          Text('32',
                              style:
                                  boldTextStyle(size: 24, color: Colors.white)),
                          Text(
                            '°C',
                            style: TextStyle(
                                fontFeatures: [FontFeature.superscripts()],
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: radius(100)),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.notifications_none,
                  color: daraSpecialColorDark,
                  size: 30,
                ),
              )
            ],
          ),
          16.height,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radius(32),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: AppTextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search_sharp, color: daraPrimaryColor),
                  hintText: 'Search your services..',
                  hintStyle: boldTextStyle(color: daraPrimaryColor)),
              textFieldType: TextFieldType.NAME,
              cursorColor: daraPrimaryColor,
            ),
          ),
          16.height,
        ],
      ),
    );
  }
}
