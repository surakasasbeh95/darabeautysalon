import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/dara_shopping_model.dart';
import '../utils/dara_colors.dart';
import '../utils/dara_widgets.dart';

// ignore: must_be_immutable
class DaraShopComponent extends StatefulWidget {
  DaraShoppingModel element;

  DaraShopComponent({super.key, required this.element});

  @override
  State<DaraShopComponent> createState() => _DaraShopComponentState();
}

class _DaraShopComponentState extends State<DaraShopComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration:
          BoxDecoration(color: context.cardColor, borderRadius: radius(32)),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(
                widget.element.image,
                height: 170,
                width: 120,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(32),
              16.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(title: widget.element.name, maxLines: 2, size: 16)
                      .paddingRight(32),
                  8.height,
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      4.width,
                      titleText(title: widget.element.rate, size: 14),
                      4.width,
                      Text(widget.element.views,
                          style: secondaryTextStyle(color: daraPrimaryColor)),
                    ],
                  ),
                  8.height,
                  Row(
                    children: [
                      titleText(title: widget.element.cost, size: 16),
                      4.width,
                      Text(widget.element.mrp,
                          style: secondaryTextStyle(
                              color: daraPrimaryColor,
                              decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                  8.height,
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: daraPrimaryColor.withAlpha(50),
                          borderRadius: radius(100),
                          border: Border.all(color: daraPrimaryColor),
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.remove, color: daraPrimaryColor),
                      ).onTap(() {
                        if (widget.element.items > 1) {
                          widget.element.items = widget.element.items - 1;
                          setState(() {});
                        }
                      }, borderRadius: radius(100)),
                      16.width,
                      titleText(title: widget.element.items.toString()),
                      16.width,
                      Container(
                        decoration: BoxDecoration(
                          color: daraPrimaryColor.withAlpha(50),
                          borderRadius: radius(100),
                          border: Border.all(color: daraPrimaryColor),
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.add, color: daraPrimaryColor),
                      ).onTap(() {
                        widget.element.items = widget.element.items + 1;
                        setState(() {});
                      }, borderRadius: radius(100)),
                    ],
                  )
                ],
              ).expand(),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: widget.element.isAdded
                    ? Colors.teal
                    : daraPrimaryColor.withAlpha(50),
                borderRadius: radiusOnly(bottomRight: 32, topLeft: 32),
              ),
              child: IconButton(
                icon: Icon(
                    widget.element.isAdded
                        ? Icons.shopping_bag_outlined
                        : Icons.shopping_bag,
                    color: widget.element.isAdded
                        ? Colors.white
                        : daraPrimaryColor),
                onPressed: () {
                  widget.element.isAdded = !widget.element.isAdded;
                  setState(() {});
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
