import 'package:caspa_v2/infrastructure/cubits/package_statuses/package_statuses_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/package_statuses/packages_statuses_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/tab_count.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';


class PackagePage extends StatelessWidget {
   PackagePage({Key? key, this.back}) : super(key: key);
  final bool? back;

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        context.read<PackageStatusesCubit>().fetch(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PackageStatusesCubit, PackageStatusesState>(
            builder: (context, state) {
              bbbb("state: $state");
              if (state is PackageStatusesSuccess) {
                final Map<String, dynamic> packageMap = state.packageList!;
                return SliverCaspaBar(
                  appbarHeight: 1,
                  back: back,
                  isScrollable: true,
                  notification: true,
                  first: packageMap.values.toList().indexWhere((element) =>
                      PackageAndCount.fromJson(element).count! > 0),
                  tabs: packageMap.entries
                      .map((entry) => Tab(
                            //   text: entry.key,
                            child: Row(
                              children: [

                                Text(
                                  entry.key,
                                  style: AppTextStyles.sanF600.copyWith(
                                      fontSize: 15.sp, letterSpacing: 0.3),
                                ),
                                // Text(
                                //   entry.key,
                                //   style: AppTextStyles.sanF600.copyWith(
                                //       fontSize: 16.sp, letterSpacing: 0.3),
                                // ),
                                MySizedBox.w5,
                                TabCount(
                                    count: PackageAndCount.fromJson(entry.value)
                                        .count)
                              ],
                            ),
                            height: 65,
                          ))
                      .toList(),
                  tabPages: packageMap.entries
                      .map((entry) => Pager.waitingPackages(
                          packages:
                              PackageAndCount.fromJson(entry.value).packages))
                      .toList(),
                  title: MyText.packages,
                  sliverChild: MySizedBox.h0,
                );
              } else {
                return CaspaLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}
