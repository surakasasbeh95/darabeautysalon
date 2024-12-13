import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/dara_colors.dart';

class DaraSeacrFragmentHeaderComponent extends StatefulWidget {
  const DaraSeacrFragmentHeaderComponent({super.key});

  @override
  State<DaraSeacrFragmentHeaderComponent> createState() =>
      _DaraSeacrFragmentHeaderComponentState();
}

class _DaraSeacrFragmentHeaderComponentState
    extends State<DaraSeacrFragmentHeaderComponent> {
  TextEditingController searchCont = TextEditingController();

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.height,
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: context.cardColor, borderRadius: radius(32)),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppTextField(
                controller: searchCont,
                onChanged: (text) {
                  searchText = text;
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search_sharp, color: daraPrimaryColor),
                  hintText: 'Search',
                  hintStyle: primaryTextStyle(color: daraPrimaryColor),
                  suffixIcon: searchText.isNotEmpty
                      ? Icon(Icons.cancel, color: daraPrimaryColor).onTap(() {
                          searchCont.clear();
                        })
                      : Offstage(),
                ),
                textFieldType: TextFieldType.NAME,
                cursorColor: daraPrimaryColor,
              ),
            ).flexible(flex: 3),
            TextButton(
                onPressed: () {},
                child: Text('Cancel',
                    style: boldTextStyle(color: daraTextColorDarkMode))),
          ],
        ),
        16.height,
      ],
    );
  }
}
