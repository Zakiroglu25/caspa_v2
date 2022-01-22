import 'package:caspa_v2/infrastructure/cubits/package_statuses/package_statuses_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/package_statuses/packages_statuses_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/tab_count.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider(
        create: (context) => PackageStatusesCubit()..fetch(),
        child: BlocBuilder<PackageStatusesCubit, PackageStatusesState>(
          builder: (context, state) {
            if (state is PackageStatusesSuccess) {
              final Map<String, dynamic> packageMap = state.packageList!;
              return SliverCaspaBar(
                appbarHeight: 1,
                isScrollable: true,
                tabs: packageMap.entries
                    .map((entry) => Tab(
                          //   text: entry.key,
                          child: Row(
                            children: [
                              Text(entry.key),
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
    ));
  }
}
