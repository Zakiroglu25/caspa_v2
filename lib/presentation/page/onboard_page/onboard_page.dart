import 'package:caspa_v2/presentation/page/onboard_page/widgets/page_view_two.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/screen/animated_rotate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/bck_image_widget.dart';
import 'widgets/btn_skip.dart';
import 'widgets/indicator_widget.dart';
import 'widgets/page_view_one.dart';
import 'widgets/page_view_three.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);
  @override
  _OnboardPageState createState() => _OnboardPageState();
}

ValueNotifier<int> indexValueNotifier = ValueNotifier(1);

class _OnboardPageState extends State<OnboardPage>
    with TickerProviderStateMixin {
  PageController? pageController;
  double currentPageValue = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController!.addListener(() {
      setState(() {
        currentPageValue = (pageController!.page! + 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedRotate(
              angle: (currentPageValue) * 90,
              child: BackgroundImage(),
              duration: Duration(milliseconds: 0),
            ),
            Indicator(curr: currentPageValue.round()),
            PageView(
              onPageChanged: (index) {},
              controller: pageController,
              children: [PageViewOne(), PageViewTwo(), PageViewThree()],
            ),
            ButtonSkip(currentPageValue.round()),
          ],
        ),
      ),
    );
  }
}
