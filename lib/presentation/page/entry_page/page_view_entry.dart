import 'package:caspa_v2/presentation/page/entry_page/widgets/btn_skip.dart';
import 'package:caspa_v2/presentation/page/entry_page/widgets/indicator_widget.dart';
import 'package:caspa_v2/presentation/page/entry_page/widgets/page_view_three.dart';
import 'package:caspa_v2/presentation/page/entry_page/widgets/page_view_two.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/animated_rotate.dart';
import 'package:caspa_v2/util/screen/image_rotate_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets/bck_image_widget.dart';
import 'widgets/page_view_one.dart';

class PageViewEntry extends StatefulWidget {
  const PageViewEntry({Key? key}) : super(key: key);

  @override
  _PageViewEntryState createState() => _PageViewEntryState();
}

ValueNotifier<int> indexValueNotifier = ValueNotifier(1);

class _PageViewEntryState extends State<PageViewEntry>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedRotate(
                angle: indexValueNotifier.value * 90, child: BackgroundImage()),
            Indicator(curr: indexValueNotifier.value),
            PageView(
              onPageChanged: (index) async {
                setState(() {
                  indexValueNotifier.value = index + 1;
                });
              },
              // controller: controller,
              children: [PageViewOne(), PageViewTwo(), PageViewThree()],
            ),
            ButtonSkip(indexValueNotifier.value),
          ],
        ),
      ),
    );
  }
}
