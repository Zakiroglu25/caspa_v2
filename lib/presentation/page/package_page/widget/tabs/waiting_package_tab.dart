import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:caspa_v2/widget/elements/package_box.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../grid_list_model.dart';



class WaitingPackageTab extends StatelessWidget {
  WaitingPackageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final sW = size.width;

    return BlocBuilder<PackageCubit, PackageState>(
      builder: (context, state) {
        if (state is PackagesInProgress) {
          return CaspaLoading.blue();
        } else if (state is PackagesSuccess) {
          final List<Package>? packageList =
              state.packageList!.reversed.toList();
         // packageList!.clear();

          return ListOrEmpty(
              list: packageList,
              child: ScrollConfiguration(
                behavior: NoScrollBehavior(),
                child: GridView.builder(
                  padding: Paddings.paddingA20,
                  physics: Physics.never,
                  itemCount: packageList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 3
                        : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: (1 / 1),
                  ),
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return PackageBox(
                      packageList[index],
                      w: sW,
                    );
                  },
                ),
              ));
        } else {
          return EmptyWidget();
        }
      },
    );
  }
}
