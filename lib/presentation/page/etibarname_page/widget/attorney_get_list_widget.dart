import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/widget/list_attornneys_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttorneyListWidget extends StatelessWidget {
  final List<Data> attorneyList;

  AttorneyListWidget({
    Key? key,
    required this.attorneyList,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              physics: Physics.never,
              itemBuilder: (context, index) {
                Data data = attorneyList[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Etibarnamə ",
                          style:
                              UITextStyle.tW600Black.copyWith(fontSize: 16.sp),
                        ),
                        Spacer(),
                        Container(
                          width: 40.sp,
                          height: 40.sp,
                          decoration: BoxDecoration(
                            color: MyColors.grey245,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: SizedBox(
                                width: 24.sp,
                                height: 24.sp,
                                child: SvgPicture.asset(Assets.svgEdit)),
                          ),
                        ),
                        MySizedBox.w10,
                        InkWell(
                          onTap: () {
                            Alert.show(context,
                                title: "Silmək istədiyinizdən əminsiniz?",
                            content: "Xatırladaq ki, geri dönüşü yoxdur!",
                              image: Image.asset("assers/png/boxpng.png")

                            );
                          },
                          child: Container(
                            width: 40.sp,
                            height: 40.sp,
                            decoration: BoxDecoration(
                              color: MyColors.grey245,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: SizedBox(
                                  width: 24.sp,
                                  height: 24.sp,
                                  child: SvgPicture.asset(Assets.svgTrash)),
                            ),
                          ),
                        )
                      ],
                    ),
                    AttorneyUnicorn(
                      fullname: data.fullName,
                      fin: data.fin,
                      passport: data.idNumber,
                    ),
                  ],
                );
              },
              itemCount: attorneyList.length)),
    );
  }
}
