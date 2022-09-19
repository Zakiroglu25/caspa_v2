import 'dart:async';

import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/constants/colors.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../whell_page/well_win_page.dart';
import 'spinner_well.dart';

class Roulette extends StatelessWidget {
  final StreamController<int> _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    var timer = Timer(
        Duration(seconds: 4), //the wanted duration for the timer
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WellWinPage(),
            )));

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySizedBox.h26,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () =>Go.pop(context),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.black),
                        width: 24,
                        height: 24,
                        child: Center(
                            child: Icon(
                          Icons.clear_outlined,
                          color: MyColors.white,
                        ))),
                  )
                ],
              ),
              MySizedBox.h22,
              Text(
                "Çarxı oyunu",
                style: AppTextStyles.coHead400.copyWith(fontSize: 25),
              ),
              MySizedBox.h22,
              SvgPicture.asset(Assets.svgCarx),
              MySizedBox.h8,
              Text(
                  "Hər həftə oyna və hədiyyə sahibi ol. Sadəcə çarxı fırlat və bəxtini sına",
                  style: AppTextStyles.coHead400.copyWith(fontSize: 16)),
              Center(
                child: SpinningWheel(
                  Image.asset(Assets.whell),
                  width: 310,
                  height: 310,
                  spinResistance: 0.6,
                  canInteractWhileSpinning: false,
                  dividers: 5,
                  onUpdate: _dividerController.add,
                  onEnd: _dividerController.add,
                  secondaryImage: Image.asset(Assets.center300),
                  secondaryImageHeight: 110,
                  secondaryImageWidth: 110,
                  shouldStartOrStop: _wheelNotifier.stream,
                ),
              ),
              Spacer(),
              CaspaButton(
                  borderRadius: 100,
                  h: 64,
                  textSize: 25,
                  text: "Çarxı fırla",
                  color: MyColors.black,
                  onTap: () {
                    _wheelNotifier.sink.add(_generateRandomVelocity());
                    timer;
                  }),
              MySizedBox.h70,
            ],
          ),
        ),
      ),
    );
  }

  double _generateRandomVelocity() => 10000 + 1200;
}
