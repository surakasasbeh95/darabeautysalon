import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_common_card_model.dart';
import '../utils/dara_colors.dart';

class DaraSingleImageScreen extends StatefulWidget {
  DaraCommonCardModel element;

  DaraSingleImageScreen({super.key, required this.element});

  @override
  _DaraSingleImageScreenState createState() => _DaraSingleImageScreenState();
}

class _DaraSingleImageScreenState extends State<DaraSingleImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.element.image), fit: BoxFit.cover),
        ),
        child: Row(
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
          ],
        ),
      ),
    );
  }
}
