import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../infrastructure/cubits/select_packages_pay/select_packages_pay_cubit.dart';
import '../../../../widget/main/selectable_package/selectable_package.dart';
import 'sselect_packages_continue_button.dart';

class SelectablePackagesList extends StatelessWidget {
  final List<Package> packageList;

  SelectablePackagesList({
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

            return StreamBuilder<List<Package>>(
                stream: BlocProvider.of<SelectPackagesPayCubit>(context)
                    .selectedOrdersStream,
                builder: (context, snapshot) {
                  return SelectablePackage(
                    index: index,
                    package: currentPackage,
                    selected: snapshot.data?.contains(currentPackage) ?? false,
                    price: "${currentPackage.cargoPrice!} USD",
                    onTap: () => context
                        .read<SelectPackagesPayCubit>()
                        .addOrder(currentPackage),
                  );
                });
          },
        ),
        SelectPackagesContinueButton()
      ],
    );
  }
}