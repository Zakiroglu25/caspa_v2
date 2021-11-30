import 'package:caspa_v2/presentation/page/entry_page/widgets/btn_skip.dart';
import 'package:caspa_v2/presentation/page/entry_page/widgets/indicator_widget.dart';
import 'package:caspa_v2/presentation/page/entry_page/widgets/page_view_three.dart';
import 'package:caspa_v2/presentation/page/entry_page/widgets/page_view_two.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'widgets/bck_image_widget.dart';
import 'widgets/page_view_one.dart';

class PageViewEntry extends StatefulWidget {
  const PageViewEntry({Key? key}) : super(key: key);

  @override
  _PageViewEntryState createState() => _PageViewEntryState();
}

class _PageViewEntryState extends State<PageViewEntry>
    with TickerProviderStateMixin {
  //final controller = PageController(viewportFraction: 0.8, keepPage: true);
  PageController controller = PageController();
  var currentPageValue = 0.0;

  int curr = 1;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const BackgroundImage(),
            Indicator(curr: curr),
            if(curr != 3)
            SizedBox(
                child: PageView.builder(
                  onPageChanged: (num) async {
                    setState(() {
                      curr = num + 1;
                    });
                  },
                  controller: controller,
                  itemBuilder: (context, position) {
                    if (position == 0) {
                      return const PageViewOne();
                    } else if (position == 1) {
                      return const PageViewTwo();
                    } else {
                      return const PageViewThree();
                    }
                  },
                  itemCount: 3,
                )),

            ButtonSkip(),
          ],
        ),
      ),
    );
  }
}
