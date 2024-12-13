import 'package:darabeautysalon/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_common_card_model.dart';
import '../utils/dara_colors.dart';

// ignore: must_be_immutable
class DaraCardComponentTwo extends StatefulWidget {
  DaraCommonCardModel element;

  DaraCardComponentTwo({super.key, required this.element});

  @override
  State<DaraCardComponentTwo> createState() => _DaraCardComponentTwoState();
}

class _DaraCardComponentTwoState extends State<DaraCardComponentTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 140,
      decoration:
          BoxDecoration(color: context.cardColor, borderRadius: radius(16)),
      child: Row(
        children: [
          Image.asset(
            widget.element.image,
            width: 80,
            height: 140,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRectOnly(topLeft: 16, bottomLeft: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      4.width,
                      Text(widget.element.rating!,
                          style: boldTextStyle(size: 14)),
                      2.width,
                      Text(widget.element.comments!,
                          style: secondaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? Colors.white
                                  : daraPrimaryColor,
                              size: 12)),
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: widget.element.liked!
                        ? Colors.amber
                        : daraTextColorDarkMode,
                    size: 18,
                  ).onTap(() {
                    widget.element.liked = !widget.element.liked.validate();
                    setState(() {});
                  }),
                ],
              ),
              4.height,
              Text(widget.element.title,
                  style: primaryTextStyle(
                      color: appStore.isDarkModeOn
                          ? Colors.white
                          : daraSpecialColorDark)),
              4.height,
              Text(
                widget.element.subtitle!,
                style: secondaryTextStyle(
                    color:
                        appStore.isDarkModeOn ? Colors.white : daraPrimaryColor,
                    size: 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingSymmetric(horizontal: 8, vertical: 8).expand()
        ],
      ),
    );
  }
}
