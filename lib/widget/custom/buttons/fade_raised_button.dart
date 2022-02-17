// Flutter imports:
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

class FadeRaisedButton extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final Widget? child;
  final bool? loading;

  FadeRaisedButton({this.onTap, this.title, this.child, this.loading});

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;

    return Container(
      //color: Colors.deepPurpleAccent,
      height: 120,
      child: Stack(
        children: [
          IgnorePointer(
            child: Container(
              //
              // height: 80,

              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    MyColors.white,
                    MyColors.white,

                    // Color.fromRGBO(240, 243, 248, 1),
                    MyColors.white.withOpacity(0.9),
                    // Color.fromRGBO(240, 243, 248, 1).withOpacity(0.7),
                    MyColors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // stops: [0.0, 1.0],
                  //    tileMode: TileMode.clamp
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 55, bottom: 20),
              child: CaspaButton(
                loading: loading ?? false,
                textColor: Colors.white,
                onTap: onTap,
                text: title,
                child: child,
              ),
            ),
          )
        ],
      ),
    );
  }
}
