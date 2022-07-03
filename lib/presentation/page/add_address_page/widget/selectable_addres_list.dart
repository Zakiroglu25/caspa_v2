import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/add_address_page/widget/selectable_add_address.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../infrastructure/cubits/select_packages_pay/select_packages_pay_cubit.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../widget/main/selectable_package/selectable_package.dart';
import '../../select_packages_pay_page/widgets/sselect_packages_continue_button.dart';

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
            if(currentPackage.weight != null){
              return StreamBuilder<List<Package>>(
                  stream: BlocProvider.of<SelectPackagesPayCubit>(context)
                      .selectedOrdersStream,
                  builder: (context, snapshot) {
                    return SelectableAddAddress(
                      index: index,
                      package: currentPackage,
                      selected: snapshot.data?.contains(currentPackage) ?? false,
                      price: "${currentPackage.cargoPrice!} USD",
                      onTap: () => context
                          .read<SelectPackagesPayCubit>()
                          .addOrder(currentPackage),
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
                  style: AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
                ),
              )),
        )
      ],
    );
  }
}
