import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/widget/caspa_appbar/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliverNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 6.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Container(
            height: 43,
            width: 43,
            child: Stack(
              children: [
                NotificationWidget(),
                // Positioned(
                //     right: 7,top: 6,
                //     child: SvgPicture.asset(Assets.svgEllipse))
              ],
            )),
      ),
    );
  }
}
