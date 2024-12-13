import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_common_card_model.dart';
import '../utils/dara_bottom_sheet.dart';
import '../utils/dara_colors.dart';

class DaraSinglePortfolioScreen extends StatefulWidget {
  DaraCommonCardModel element;

  DaraSinglePortfolioScreen({super.key, required this.element});

  @override
  _DaraSinglePortfolioScreenState createState() =>
      _DaraSinglePortfolioScreenState();
}

class _DaraSinglePortfolioScreenState extends State<DaraSinglePortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(widget.element.image), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: radius(100),
              color: context.cardColor,
            ),
            padding: EdgeInsets.all(12),
            child: Image.asset('images/x.png',
                height: 16, fit: BoxFit.cover, color: daraPrimaryColor),
          ).onTap(() {
            finish(context);
          }),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.element.title,
                      style: boldTextStyle(color: Colors.white, size: 20)),
                  4.height,
                  Text(widget.element.subtitle!,
                      style: secondaryTextStyle(color: Colors.white, size: 12)),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: radius(100),
                      color: context.cardColor,
                    ),
                    padding: EdgeInsets.all(8),
                    child: widget.element.liked!
                        ? Icon(Icons.favorite, color: daraPrimaryColor)
                        : Icon(Icons.favorite_outline, color: daraPrimaryColor),
                  ).onTap(() {
                    widget.element.liked = !widget.element.liked!;
                    setState(() {});
                  }, borderRadius: radius(100)),
                  8.height,
                  Text(widget.element.likes!,
                      style: secondaryTextStyle(color: Colors.white, size: 12)),
                  20.height,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: radius(100),
                      color: context.cardColor,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Image.asset('images/chat.png',
                        height: 16, fit: BoxFit.cover, color: daraPrimaryColor),
                  ).onTap(() {
                    showCommentBottomSheet(context);
                  }, borderRadius: radius(100)),
                  8.height,
                  Text(widget.element.comments!,
                      style: secondaryTextStyle(color: Colors.white, size: 12)),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
