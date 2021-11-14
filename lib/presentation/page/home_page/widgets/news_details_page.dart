import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CaspaAppbar(contextA: context,centerTitle: true,title: 'News',),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/png/newsbvk.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 112,
            right: 112,
            top: 96,
            child: SvgPicture.asset(
              Assets.svgCaspaLogoWithName,
            ),
          ),
          Positioned(
            top: 189,
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16.0),
              child: Column(
                children: [
                  Text("Düşüməyə dəyməz, təyyarələr \nartıq Bakıya qayıdır",textAlign: TextAlign.center,maxLines: 2,
                      style: AppTextStyles.coHead400
                          .copyWith(color: Colors.white, fontSize: 24)),

                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 262,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16,right: 16.0),
          //     child: Container(
          //       child: Text("Sürətli çatdırılma istəyirsən, amma yox səbr gözləmək? Etməyəcəyimizdən narahat olmayın. Sürətli çatdırılma istəyirsən, amma yox səbr gözləmək? Etməyəcəyimizdən narahat olmayın. ",textAlign: TextAlign.center,maxLines: 2,
          //           style: AppTextStyles.coHead400
          //               .copyWith(color: Colors.white, fontSize: 24)),
          //     ),
          //   ),
          // ),


        ],
      ),
    );
  }
}
