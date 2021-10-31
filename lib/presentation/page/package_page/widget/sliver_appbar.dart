import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      expandedHeight: 300.0,
      automaticallyImplyLeading: false,
      pinned: true,
      stretch: true,
      floating: true,
      stretchTriggerOffset: 300,
      leadingWidth: 0,
      elevation: 0,
      backwardsCompatibility: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              top: 8,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Container(height: 30, width: 30, child: BackButton()),
              ),
            ),
            Positioned(
              //left: 0,
              //right: 0,
              top: 70,
              left: 20,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text('''Bağlamalar''',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.coHead400
                        .copyWith(color: Colors.black, fontSize: 24)),
              ),
            ),
            Positioned(
              left: 10,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 76.0),
                child: Image.asset(Assets.pngbox),
              ),
            ),
            Positioned(
              //top: 100,
              left: 20,
              // alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    MyText.packageText,
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: AppTextStyles.coHead400
                        .copyWith(fontSize: 16, color: MyColors.grey165),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   //top: 100,
            //   left: 20,
            //   // alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 0.0),
            //     child: Container(
            //       width: 159,
            //       child: CaspaButton()
            //     ),
            //   ),
            // ),
          ],
        ),
        centerTitle: true,
        title: Container(
          color: Colors.transparent,
          width: double.maxFinite,
          height: 300,
          child: Stack(alignment: Alignment.topCenter, children: <Widget>[
            Positioned(
              left: 0,
              top: 8,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Container(height: 30, width: 30, child: BackButton()),
              ),
            ),
            Positioned(
              //left: 0,
              //right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2.0, top: 15),
                child: Text('''Bağlamalar''',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.sanF400.copyWith(color: Colors.black)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
