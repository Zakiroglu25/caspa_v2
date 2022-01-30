import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/stepper.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/status_list.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'product_properties.dart';
import 'package_report_buttons.dart';

class PackageSliverList extends StatelessWidget {
  const PackageSliverList({Key? key, required this.package}) : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          MySizedBox.h26,
          SectionName(
            title: MyText.status,
            hP: 16,
          ),
          MySizedBox.h26,
          PackageStepper(
            titles: StatusList.stepsString,
            currentStatustes: package.archive ?? [],
          ),
          PackageReportButtons(
            package: package,
          ),
          MySizedBox.h32,
          ProductProperties(
            package: package,
          ),
        ],
      ),
    );
  }
}
