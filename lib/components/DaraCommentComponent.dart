import 'package:darabeautysalon/main.dart';
import 'package:darabeautysalon/models/dara_comment_model.dart';
import 'package:darabeautysalon/utils/dara_colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/dara_widgets.dart';

// ignore: must_be_immutable
class DaraCommentComponent extends StatefulWidget {
  DaraCommentModel element;

  DaraCommentComponent({super.key, required this.element});

  @override
  _DaraCommentComponentState createState() => _DaraCommentComponentState();
}

class _DaraCommentComponentState extends State<DaraCommentComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.element.image,
                    height: 40, width: 40, fit: BoxFit.cover)
                .cornerRadiusWithClipRRect(100),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.element.name,
                    style: primaryTextStyle(
                        color: appStore.isDarkModeOn
                            ? daraTextColorDarkMode
                            : daraSpecialColor)),
                titleText(title: widget.element.message, size: 16),
                Text(
                  '${widget.element.time}  . Reply',
                  style: secondaryTextStyle(
                      color: appStore.isDarkModeOn
                          ? daraTextColorDarkMode
                          : daraSpecialColor),
                )
              ],
            )
          ],
        ).expand(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.element.isLiked
                ? Icon(Icons.favorite, color: Colors.amber).onTap(() {
                    widget.element.isLiked = !widget.element.isLiked;
                    setState(() {});
                  })
                : Icon(Icons.favorite_outline, color: daraPrimaryColor)
                    .onTap(() {
                    widget.element.isLiked = !widget.element.isLiked;
                    setState(() {});
                  }),
            Text(widget.element.likes,
                style: secondaryTextStyle(color: daraPrimaryColor))
          ],
        )
      ],
    ).paddingOnly(
        top: 8, bottom: 8, left: widget.element.isSubComment ? 50 : 0);
  }
}
