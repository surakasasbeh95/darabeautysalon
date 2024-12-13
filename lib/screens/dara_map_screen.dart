import 'package:darabeautysalon/main.dart';
import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/DaraCardComponentTwo.dart';
import '../models/dara_common_card_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_data_generator.dart';

class DaraMapScreen extends StatefulWidget {
  static String tag = '/DaraMapScreen';

  const DaraMapScreen({super.key});

  @override
  DaraMapScreenState createState() => DaraMapScreenState();
}

class DaraMapScreenState extends State<DaraMapScreen> {
  List<DaraCommonCardModel> recommendedList = getRecommendedList();

  //final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: Stack(
        children: [
          PurchaseMoreScreen(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: radius(100)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: daraPrimaryColor),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                      ),
                      8.width,
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: radius(100)),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: daraPrimaryColor),
                            8.width,
                            Text('New York', style: boldTextStyle()),
                            8.width,
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: context.cardColor, borderRadius: radius(100)),
                    child: Image.asset('images/adjust.png',
                        height: 26, color: daraPrimaryColor),
                  ),
                ],
              ).paddingOnly(left: 16, top: 30, right: 16),
              HorizontalList(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                spacing: 12,
                itemCount: recommendedList.length,
                itemBuilder: (context, index) {
                  return DaraCardComponentTwo(element: recommendedList[index]);
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 110),
        child: FloatingActionButton(
          onPressed: () {
            //
          },
          mini: true,
          backgroundColor: context.cardColor,
          child: Icon(Icons.my_location, color: daraPrimaryColor),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: radiusOnly(topRight: 32, topLeft: 32)),
        child: Text('Show 45+ Places',
            style: boldTextStyle(), textAlign: TextAlign.center),
      ),
    );
  }
}
