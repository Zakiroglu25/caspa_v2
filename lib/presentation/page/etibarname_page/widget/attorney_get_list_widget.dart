import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/widget/attorney_box.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/widget/list_attornneys_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttorneyListWidget extends StatelessWidget {
  final List<Attorney> attorneyList;

  AttorneyListWidget({
    Key? key,
    required this.attorneyList,
  });

  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
      list: attorneyList,
      child: ListView.builder(
          shrinkWrap: true,
          physics: Physics.never,
          itemBuilder: (context, index) {
            Attorney data = attorneyList[index];
            return FadeInUp(
                duration: Duration(milliseconds: AppOperations.getTime(index)),
                child: AttorneyBox(data));
          },
          itemCount: attorneyList.length),
    );
  }
}
