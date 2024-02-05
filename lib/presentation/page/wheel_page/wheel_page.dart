import 'dart:async';
import 'dart:math';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';
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

  final ValueNotifier<bool> _wheelActivityNotifier = ValueNotifier<bool>(false);



  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: MyColors.wheelBck,
        body: Padding(
          padding: Paddings.paddingA16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySizedBox.h32,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (!_wheelActivityNotifier.value) {
                        Go.pop(context);
                      }
                    },
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
                          size: 16,
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
              SizedBox(
                  width: 24, height: 24, child: Image.asset(Assets.svgCarx)),
              MySizedBox.h8,
              Text(
                  "Hər həftə oyna və hədiyyə sahibi ol. Sadəcə çarxı fırlat və bəxtini sına",
                  style: AppTextStyles.coHead400
                      .copyWith(fontSize: 16, height: 1.3)),
              Spacer(),
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
                  //onEnd: () {},
                  secondaryImage: Image.asset(Assets.center300),
                  secondaryImageHeight: 110,
                  secondaryImageWidth: 110,
                  shouldStartOrStop: _wheelNotifier.stream,
                ),
              ),
              Spacer(),
              ValueListenableBuilder<bool>(
                valueListenable: _wheelActivityNotifier,
                builder: (_, value, child) {
                  if (!value) {
                    return CaspaButton(
                        borderRadius: 100,
                        h: 64,
                        textSize: 25,
                        text: "Çarxı fırlat",
                        color: MyColors.black,
                        onTap: () {
                          Vibration.vibrate(duration: 2000);
                          _wheelNotifier.sink.add(_generateRandomVelocity());
                          _wheelActivityNotifier.value = true;
                          // context.read<WheelCubit>().fetch();
                          Timer(Duration(seconds: 3),
                              () => Go.replace(context, Pager.wheelResult()));
                        });
                  }

                  return SizedBox.shrink();
                },
              ),
              MySizedBox.h70,
            ],
          ),
        ),
      ),
    );
  }

  double _generateRandomVelocity() => 10000.0 + Random().nextInt(2000);
}
