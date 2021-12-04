import 'package:caspa_v2/presentation/page/entry_page/page_view_entry.dart';
import 'package:flutter/material.dart';

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
