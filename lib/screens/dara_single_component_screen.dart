import 'package:darabeautysalon/screens/dara_call_screen.dart';
import 'package:darabeautysalon/screens/dara_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/DaraOurServiveComponent.dart';
import '../components/DaraPortfolioComponent.dart';
import '../main.dart';
import '../models/dara_common_card_model.dart';
import '../models/dara_message_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';
import '../utils/flutter_rating_bar.dart';
import 'dara_single_image_screen.dart';

class DaraSingleComponentScreen extends StatefulWidget {
  DaraCommonCardModel element;

  DaraSingleComponentScreen({super.key, required this.element});

  @override
  _DaraSingleComponentScreenState createState() =>
      _DaraSingleComponentScreenState();
}

class _DaraSingleComponentScreenState extends State<DaraSingleComponentScreen> {
  List<String> tabList = [
    'OUR SERVICES',
    'PORTFOLIO',
    'STORE',
    'ABOUT',
    'REVIEW'
  ];

  int selectedTab = 0;

  Widget getSelectedTabComponent() {
    if (selectedTab == 0) {
      return DaraOurServiveComponent();
    } else {
      return DaraPortfolioComponent();
    }
  }

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn
          ? appStore.scaffoldBackground!
          : daraLightScaffoldBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: appStore.isDarkModeOn
                  ? appStore.scaffoldBackground!
                  : daraLightScaffoldBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: daraPrimaryColor),
                onPressed: () {
                  finish(context);
                },
              ).visible(innerBoxIsScrolled),
              title: titleText(title: widget.element.title)
                  .visible(innerBoxIsScrolled),
              actions: [
                IconButton(
                  icon: Icon(Icons.subdirectory_arrow_right,
                      color: daraPrimaryColor),
                  onPressed: () {
                    DaraSingleImageScreen(element: widget.element)
                        .launch(context);
                  },
                ).visible(innerBoxIsScrolled),
                IconButton(
                  icon: widget.element.liked!
                      ? Icon(Icons.favorite, color: daraPrimaryColor)
                      : Icon(Icons.favorite_outline, color: daraPrimaryColor),
                  onPressed: () {
                    widget.element.liked = !widget.element.liked!;
                    setState(() {});
                  },
                ).visible(innerBoxIsScrolled),
              ],
              leadingWidth: 30,
              pinned: true,
              elevation: 0.5,
              expandedHeight: 450,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 66, left: 30, right: 50),
                collapseMode: CollapseMode.parallax,
                background: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          widget.element.image,
                          height: 300,
                          width: context.width(),
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: radius(100),
                                color: context.cardColor,
                              ),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 16, top: 30),
                              child: Icon(Icons.arrow_back,
                                  color: daraPrimaryColor),
                            ).onTap(() {
                              finish(context);
                            }, borderRadius: radius(100)),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 16, top: 30),
                                  child: Icon(Icons.subdirectory_arrow_right,
                                      color: daraPrimaryColor),
                                ).onTap(() {
                                  DaraSingleImageScreen(element: widget.element)
                                      .launch(context);
                                }, borderRadius: radius(100)),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 16, top: 30),
                                  child: widget.element.liked!
                                      ? Icon(Icons.favorite,
                                          color: daraPrimaryColor)
                                      : Icon(Icons.favorite_outline,
                                          color: daraPrimaryColor),
                                ).onTap(() {
                                  widget.element.liked = !widget.element.liked!;
                                  setState(() {});
                                }, borderRadius: radius(100)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      color: appStore.isDarkModeOn
                          ? appStore.scaffoldBackground!
                          : daraLightScaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(title: widget.element.title),
                          8.height,
                          Text(
                            widget.element.subtitle!,
                            style: secondaryTextStyle(
                                color: appStore.isDarkModeOn
                                    ? Colors.white
                                    : daraPrimaryColor,
                                size: 12),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(widget.element.rating!,
                                  style: boldTextStyle()),
                              2.width,
                              RatingBar(
                                initialRating: widget.element.rating.toDouble(),
                                minRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  //
                                },
                              ),
                              6.width,
                              Text(widget.element.comments!,
                                  style: secondaryTextStyle(
                                      color: daraTextColorDarkMode)),
                            ],
                          ),
                          8.height,
                          Wrap(
                            spacing: 16,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: daraPrimaryColor),
                                  color: appStore.isDarkModeOn
                                      ? appStore.scaffoldBackground!
                                      : daraLightScaffoldBackgroundColor,
                                  borderRadius: radius(32),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.call_outlined,
                                        color: daraPrimaryColor),
                                    4.width,
                                    Text('Call us',
                                        style: boldTextStyle(
                                            color: daraPrimaryColor)),
                                  ],
                                ),
                              ).onTap(() {
                                DaraCallScreen().launch(context);
                              }, borderRadius: radius(32)),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: daraPrimaryColor),
                                  color: appStore.isDarkModeOn
                                      ? appStore.scaffoldBackground!
                                      : daraLightScaffoldBackgroundColor,
                                  borderRadius: radius(32),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('images/chat.png',
                                        height: 20, color: daraPrimaryColor),
                                    8.width,
                                    Text('Send Message',
                                        style: boldTextStyle(
                                            color: daraPrimaryColor)),
                                  ],
                                ),
                              ).onTap(() {
                                DaraChatScreen(
                                    element: DaraMessageModel(
                                  image: widget.element.image,
                                  name: widget.element.title,
                                  message:
                                      'Do you want to confirm yor appointment?',
                                  isActive: false,
                                  lastSeen: 'today , at 11:30 am',
                                )).launch(context);
                              }),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: appStore.isDarkModeOn
                ? daraSecondBackgroundColorDark
                : daraSecondBackgroundColorLight,
            borderRadius: radiusOnly(topLeft: 32, topRight: 32),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.height,
                HorizontalList(
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
                getSelectedTabComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
