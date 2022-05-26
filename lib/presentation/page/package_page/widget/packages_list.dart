import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/all_payment_packages/all_payment.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/main/package_box/package_box.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';

class PackagesList extends StatelessWidget {
  final List<Package>? packages;

  PackagesList({required this.packages});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final sW = size.width;
    final List<Package>? packageList = packages!.reversed.toList();
    return Stack(
      children: [
        // if(packages[3].customStatus != null)
        ListOrEmpty(
            description: MyText.emptyDesc,
            list: packageList,
            child: GridView.builder(
              padding: Paddings.paddingA20,
              physics: Physics.alwaysBounce,
              itemCount: packageList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (1 / 1.15),
              ),
              itemBuilder: (
                context,
                index,
              ) {
                return PackageBox(
                  package: packageList[index],
                  w: sW,
                  index: index,
                );
              },
            )),
        ///bunu harda gostereciyik bilmirem deyesen catibda olacaq
        ///birdeki bu butun tablarda gorsenmemelidi ne qeder eledim tapammadim
        Positioned(
          right: 16,
          bottom: 16,
          child: GestureDetector(
            onTap: () {
              Go.to(context, AllPaymentPackages());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColors.black34,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Toplam ödə 💰",
                  style: AppTextStyles.sanF500
                      .copyWith(color: MyColors.white, fontSize: 14.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
