import 'package:darabeautysalon/screens/dara_purchase_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/DaraFloatingActionComponent.dart';
import '../main.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

class DaraTopOffersScreen extends StatefulWidget {
  const DaraTopOffersScreen({super.key});

  @override
  State<DaraTopOffersScreen> createState() => _DaraTopOffersScreenState();
}

class _DaraTopOffersScreenState extends State<DaraTopOffersScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn
        ? appStore.scaffoldBackground!
        : daraLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(daraSpecialColor);
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
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: daraPrimaryColor),
          onPressed: () {
            finish(context);
          },
        ),
        title: titleText(title: 'Top Offers'),
        actions: [
          IconButton(
            icon: Icon(Icons.search_sharp, size: 30, color: daraPrimaryColor),
            onPressed: () {
              PurchaseMoreScreen(enableAppbar: true).launch(context);
            },
          ),
          8.width,
        ],
      ),
      body: PurchaseMoreScreen(),
      floatingActionButton: DaraFloatingActionComponent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
