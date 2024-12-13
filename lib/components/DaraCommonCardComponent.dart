import 'package:darabeautysalon/utils/dara_constants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/dara_common_card_model.dart';
import '../screens/dara_single_component_screen.dart';
import '../utils/dara_colors.dart';

// ignore: must_be_immutable
class DaraCommonCardComponent extends StatefulWidget {
  DaraCommonCardModel element;
  bool fullScreenComponent;
  bool isFavList;

  DaraCommonCardComponent(
      {super.key,
      required this.element,
      required this.fullScreenComponent,
      required this.isFavList});

  @override
  State<DaraCommonCardComponent> createState() =>
      _DaraCommonCardComponentState();
}

class _DaraCommonCardComponentState extends State<DaraCommonCardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullScreenComponent ? context.width() - 32 : 250,
      decoration:
          BoxDecoration(color: context.cardColor, borderRadius: radius(32)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.element.image,
                width: widget.fullScreenComponent ? context.width() - 32 : 250,
                height: 150,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
              widget.element.saveTag
                  ? Container(
                      color: daraTextColorDarkMode.shade400,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.local_offer_rounded,
                              color: Color(0xff808080), size: 16),
                          2.width,
                          Text(
                            'Save up to 20% for next booking!',
                            style: secondaryTextStyle(color: Color(0xff636161)),
                          ).expand(),
                        ],
                      ),
                    )
                  : Offstage(),
              8.height,
              Text(widget.element.title,
                      style: boldTextStyle(
                          size: 18,
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : daraSpecialColorDark))
                  .paddingSymmetric(horizontal: 8),
              4.height,
              Text(widget.element.subtitle!,
                      style: secondaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? daraTextColorDarkMode
                              : daraPrimaryColor,
                          size: 12))
                  .paddingSymmetric(horizontal: 8),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      4.width,
                      Text(widget.element.rating!, style: boldTextStyle()),
                      2.width,
                      Text('(${widget.element.comments!})',
                          style: secondaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? daraTextColorDarkMode
                                  : daraPrimaryColor)),
                    ],
                  ),
                  Text(widget.element.distance!,
                      style: secondaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? daraTextColorDarkMode
                              : daraPrimaryColor)),
                ],
              ).paddingSymmetric(horizontal: 8),
              16.height,
            ],
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Icon(
              Icons.favorite,
              color:
                  widget.element.liked! ? Colors.amber : daraTextColorDarkMode,
              size: 24,
            ).onTap(() {
              widget.element.liked = !widget.element.liked.validate();
              if (widget.isFavList) {
                favList.remove(widget.element);
              }
              setState(() {});
            }),
          )
        ],
      ),
    ).onTap(() {
      DaraSingleComponentScreen(element: widget.element).launch(context);
    });
  }
}
