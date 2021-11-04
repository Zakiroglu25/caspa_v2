import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewThree extends StatelessWidget {
  const PageViewThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width:SizeConfig.safeBlockHorizontal! * 200,
          height: SizeConfig.safeBlockVertical! *50,
          child: Image.asset(
            'assets/png/moto.png',
          ),
        ),
        Spacer(),
        const Center(
          child: Text(
            "Kuryer xidmətini də bizdən sifariş edin",
            style: TextStyle(
              fontFamily: "CoHeadline",
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: MyColors.mainBlue2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Pozitivlik qəlbimizdədir! Bunu yaymağı hədəfləyirik.",
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyColors.splashLittleText,
                fontSize: 14,
                fontFamily: "San Francisco"),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(343, 52),
                primary: MyColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
               create: (context)=>LoginCubit()
               ,child: LoginPage())));
            },
            child: const Text(
              "Başla",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
