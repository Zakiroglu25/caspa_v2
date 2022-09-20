import 'dart:async';
import 'dart:math';

import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infrastructure/cubits/wheel_cubit/index.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../util/constants/colors.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/delegate/pager.dart';
import 'spinner_well.dart';

class WheelPage extends StatelessWidget {
  final StreamController<int> _dividerController = StreamController<int>();

  HiveService get _prefs => locator<HiveService>();

  final _wheelNotifier = StreamController<double>();

  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.paddingA16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySizedBox.h26,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Go.pop(context),
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
              "Çarx oyunu",
              style: AppTextStyles.coHead400.copyWith(fontSize: 25),
            ),
            MySizedBox.h22,
            SizedBox(width: 24, height: 24, child: Image.asset(Assets.svgCarx)),
            MySizedBox.h8,
            Text(
                "Hər həftə oyna və hədiyyə sahibi ol. Sadəcə çarxı fırlat və bəxtini sına",
                style: AppTextStyles.coHead400.copyWith(fontSize: 16)),
            Spacer(),
            BlocConsumer<WheelCubit, WheelState>(
              listener: (context, state) {
                //bbbb("sohu stae: $state");
                // if (state is WheelSuccess) {
                //   _wheelNotifier.sink.add(0);
                // }
              },
              builder: (context, state) {
                return Center(
                  child: SpinningWheel(
                    Image.asset(Assets.whell),
                    width: 310,
                    height: 310,
                    spinResistance: 0.6,
                    canInteractWhileSpinning: false,
                    dividers: 5,
                    onUpdate: _dividerController.add,
                    onEnd: _dividerController.add,
                    //onEnd: () {},
                    secondaryImage: Image.asset(Assets.center300),
                    secondaryImageHeight: 110,
                    secondaryImageWidth: 110,
                    shouldStartOrStop: _wheelNotifier.stream,
                  ),
                );
              },
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

                  // context.read<WheelCubit>().fetch();
                  Timer(Duration(seconds: 3),
                      () => Go.replace(context, Pager.wheelResult()));
                }),
            MySizedBox.h70,
          ],
        ),
      ),
    );
  }

  double _generateRandomVelocity() => 10000.0 + Random().nextInt(2000);
}
