import 'package:flutter/material.dart';

import '../onboard_page.dart';
import 'page_view_one.dart';
import 'page_view_three.dart';
import 'page_view_two.dart';

class PageViews extends StatefulWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (index) async {
         setState(() {
        indexValueNotifier.value = index + 1;
        });
      },
      // controller: controller,
      children: [PageViewOne(), PageViewTwo(), PageViewThree()],
    );
  }
}
