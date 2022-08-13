import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/add_address_page/widget/selectable_add_address.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../infrastructure/cubits/select_packages_pay/select_packages_pay_cubit.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';

class SelectableAddAddressList extends StatelessWidget {
  final List<Package> packageList;

  SelectableAddAddressList({
    required this.packageList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: Physics.never,
          itemCount: packageList.length,
          padding: Paddings.paddingB110,
          itemBuilder: (context, index) {
            final currentPackage = packageList[index];
            if (currentPackage.weight != null) {
              return StreamBuilder<List<Package>>(
                  stream: BlocProvider.of<SelectPackagesPayCubit>(context)
                      .selectedOrdersStream,
                  builder: (context, snapshot) {
                    return Slidable(
                      key: const ValueKey(0),

                      // The start action pane is the one at the left or the top side.
                      endActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(12),
                            onPressed: doNothing,
                            backgroundColor: MyColors.mainOpacity,
                            foregroundColor: MyColors.mainColor,
                            icon: Icons.delete_outline,
                          ),
                          MySizedBox.w4,
                          SlidableAction(
                            autoClose: false,
                            borderRadius: BorderRadius.circular(12),
                            onPressed: doNothing,
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                          ),
                        ],
                      ),
                      child: SelectableAddAddress(
                        index: index,
                        package: currentPackage,
                        selected:
                            snapshot.data?.contains(currentPackage) ?? false,
                        onTap: () => context
                            .read<SelectPackagesPayCubit>()
                            .addOrder(currentPackage),
                      ),
                    );
                  });
            }
            return SizedBox();
          },
        ),
        Positioned(
          bottom: 30,
          right: 80,
          left: 80,
          child: Container(
              width: 165,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.mainOpacity),
              child: Center(
                child: Text(
                  "+ Yeni ünvan əlavə et",
                  style:
                      AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
                ),
              )),
        )
      ],
    );
  }
}

void doNothing(BuildContext context) {}
