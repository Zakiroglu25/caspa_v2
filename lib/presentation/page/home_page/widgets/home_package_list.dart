import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/tabs/waiting_package_tab.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/elements/package_box.dart';
import 'package:caspa_v2/widget/elements/package_box_home.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePackageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> PackageCubit()..fetch(),
      child: BlocBuilder<PackageCubit, PackageState>(
        builder: (context, state) {

          if (state is PackagesInProgress) {
            return Container(
                height: 116.sm,
                child: CaspaLoading.blue());
          } else if (state is PackagesSuccess) {
            final List<Package>? packageList =
            state.packageList!.reversed.toList();
            // packageList!.clear();

            return ListOrEmpty(list: packageList, child: FadeIn(
              child: SizedBox(
                height: 116.sm,
                // width: 284,
                child: ListView.separated(
                  padding: Paddings.paddingH20,
                  separatorBuilder: (context, index) {
                    return MySizedBox.w12;
                  },
                  shrinkWrap: true,
                  itemCount: packageList!.length,
                  physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PackageBoxHome(
                      packageList[index], w: 284.sp,
                    );
                  },
                ),
              ),
            ));          } else {
            return EmptyWidget();
          }

        },
      ),
    );
  }
}
