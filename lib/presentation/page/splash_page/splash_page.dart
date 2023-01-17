import 'dart:async';

import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/widget/general/caspa_logo_with_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'widgets/caspa_az_text.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {


    VideoPlayerController? _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/video/fly.mp4");
    _controller!.initialize().then((_) {
      _controller!.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller!.play();
          _visible = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: VideoPlayer(_controller!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.transparent,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _getVideoBackground(),
            // Lottie.asset(Assets.snow, repeat: true),
            // Positioned(
            //     left: 0,
            //     bottom: 0,
            //     child: SizedBox(
            //         width: 220.w,
            //         height: 340.h,
            //         child: Lottie.asset(Assets.santaAnim, repeat: false))),
            CaspaLogoWithName(),
            CaspaAzText()
          ],
        ),
      ),
    );
  }
}
