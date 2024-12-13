import 'package:darabeautysalon/components/DaraShopComponent.dart';
import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';
import 'package:darabeautysalon/utils/dara_data_generator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

class DaraShoppingScreen extends StatefulWidget {
  bool isOrders;

  DaraShoppingScreen({super.key, required this.isOrders});

  @override
  State<DaraShoppingScreen> createState() => _DaraShoppingScreenState();
}

class _DaraShoppingScreenState extends State<DaraShoppingScreen> {
  List<String> tabList = ['ALL PRODUCTS', 'HAIR CARE', 'COSMETIC', 'SKIN CARE'];

  int selectedTab = 0;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    super.initState();
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
        backgroundColor: appStore.isDarkModeOn
            ? appStore.scaffoldBackground!
            : daraLightScaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: daraPrimaryColor),
        leadingWidth: 30,
        title: titleText(title: widget.isOrders ? 'Orders' : 'Shopping'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: appStore.isDarkModeOn
                ? daraSecondBackgroundColorDark
                : daraSecondBackgroundColorLight,
            borderRadius: radiusOnly(topLeft: 32, topRight: 32)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.isOrders
                  ? Offstage()
                  : Column(
                      children: [
                        HorizontalList(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: tabList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: radius(32),
                                color: selectedTab == index
                                    ? daraPrimaryColor
                                    : Colors.transparent,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                tabList[index],
                                style: boldTextStyle(
                                  size: 12,
                                  color: selectedTab == index
                                      ? white
                                      : appStore.isDarkModeOn
                                          ? daraPrimaryColor
                                          : daraSpecialColorDark,
                                ),
                              ).onTap(() {
                                selectedTab = index;
                                setState(() {});
                              }),
                            );
                          },
                        ),
                        16.height,
                        Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: daraPrimaryColor.withAlpha(50),
                            borderRadius: radius(100),
                            border: Border.all(color: daraPrimaryColor),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: AppTextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search_sharp,
                                    color: daraPrimaryColor),
                                hintText: 'Search for Products',
                                hintStyle:
                                    boldTextStyle(color: daraPrimaryColor)),
                            textFieldType: TextFieldType.NAME,
                            cursorColor: daraPrimaryColor,
                          ),
                        ),
                        16.height,
                        Column(
                          children: getProductList().map((e) {
                            return DaraShopComponent(element: e);
                          }).toList(),
                        ),
                      ],
                    ),
              widget.isOrders
                  ? PurchaseMoreScreen().withSize(
                      width: context.width(), height: context.height())
                  : Offstage(),
              40.height,
            ],
          ),
        ),
      ),
    );
  }
}
