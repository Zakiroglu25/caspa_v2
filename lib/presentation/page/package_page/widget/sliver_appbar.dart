import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 310,
      floating: true,
      pinned: false,
      snap: true,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                MyText.packages,
                style: TextStyle(fontSize: 25),
              ),
              Image.asset("assets/png/boxpng.png"),
              const Padding(
                padding: EdgeInsets.only(right: 32.0),
                child: Text(
                  "Hörmətli müştəri, bu bölmədə olan bağlamalar sizə qısa zamanda çatdırılacaq. Əlavə məlumat əldə etmək üçün qaynar xətt: *1453",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              MySizedBox.h12,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(159, 44),
                    // primary: MyColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  //NavigateUtils.pushReplacement(context, LandingPage());
                },
                child: const Text(
                  "Yeni bağlama sifarişi",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              MySizedBox.h30,
            ],
          ),
        ),
      ),
    );
  }
}
