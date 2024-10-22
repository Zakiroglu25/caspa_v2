import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/cubits/wheel_cubit/index.dart';
import '../../../infrastructure/services/sound_service.dart';
import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/assets.dart';
import '../../../util/constants/colors.dart';
import '../../../util/constants/sized_box.dart';
import '../../../util/delegate/navigate_utils.dart';

class WheelResultPage extends StatefulWidget {
  const WheelResultPage({Key? key}) : super(key: key);

  @override
  State<WheelResultPage> createState() => _WheelResultPageState();
}

class _WheelResultPageState extends State<WheelResultPage> {
  late final SoundManager _pageManager;

  playWinSound() async {
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
    await audioPlayer.open(
      Audio(
        'assets/sounds/win.mp3',
      ),
    );
  }

  playFailSound() async {
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
    await audioPlayer.open(
      Audio(
        'assets/sounds/fail.mp3',
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.wheelBck,
        body: BlocBuilder<WheelCubit, WheelState>(builder: (context, state) {
          if (state is WheelSuccess) {
            String? res = state.wheel;
            if(res != "0"){
              playWinSound();
            }else{
              playFailSound();
            }
            return Stack(
              children: [
                Positioned(
                  top: 54,
                  right: 16,
                  child: InkWell(
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
                          size: 16,
                        ))),
                  ),
                ),
                if (res == "0")
                  Positioned(
                    top: 98,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 295,
                          child: Text(
                            "Cəmi 7 gün sonra, bir daha cəhd edin",
                            style: AppTextStyles.coHead400
                                .copyWith(fontSize: 25, height: 1.3),
                          ),
                        ),
                        MySizedBox.h24,
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(Assets.svgCarx)),
                        MySizedBox.h8,
                        SizedBox(
                          width: 295,
                          child: Text(MyText.badResultWheel,
                              style: AppTextStyles.coHead400
                                  .copyWith(fontSize: 16, height: 1.3)),
                        ),
                        MySizedBox.h16,
                        Image.asset(Assets.pngColorfulBack)
                      ],
                    ),
                  )
                else
                  Positioned(
                    top: 98,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyText.congrated,
                          style: AppTextStyles.coHead400.copyWith(fontSize: 25),
                        ),
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(Assets.pngGift)),
                        MySizedBox.h8,
                        SizedBox(
                          width: 295,
                          child: Text(
                              "Siz Caspa-dan ${res} azn məbləğində hədiyyə çatdırılma balansı qazandınız!",
                              style: AppTextStyles.coHead400
                                  .copyWith(fontSize: 16)),
                        ),
                        MySizedBox.h16,
                        Image.asset(Assets.pngColorfulBack)

                      ],
                    ),
                  ),
                if (res == "0")
                  Positioned(bottom: 0, child: Image.asset(Assets.pngWheelGirl))
                else
                  Positioned(
                    bottom: 0,
                    child: Image.asset(Assets.winWin),
                  )
              ],
            );
          } else if (state is WheelInProgress) {
            return Scaffold(body: Center(child: CaspaLoading()));
          } else {
            return CaspaLoading();
          }
        }));
  }
}
