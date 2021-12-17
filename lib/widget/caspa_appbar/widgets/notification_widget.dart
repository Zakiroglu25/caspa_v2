import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'ellipse.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Go.to(context, Pager.notifications),
      child: Container(
        color: Colors.transparent,
        width: 43,
        height: 43,
        padding: EdgeInsets.only(right: 6, left: 10, top: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/bell.svg',
              color: MyColors.black,
            ),
            Ellipse()
            // BlocBuilder<HeaderCubit, HeaderState>(
            //   builder: (context, state) {
            //     if (state is HeaderSuccess) {
            //
            //       // return state.headerResult != null
            //       //     ? (state.headerResult.notification
            //       //     ? Ellipse()
            //       //     : Container())
            //       //     : Container();
            //
            //       return Ellipse();
            //     } else if (state is HeaderInProgress) {
            //       return
            //         // state.headerResult != null
            //         //   ? (state.headerResult.notification
            //         //       ? Ellipse()
            //         //       : Container())
            //         //   :
            //         Container();
            //     } else {
            //
            //       return Container();
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
