import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_state.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_cubit.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/app_operations.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/formatter/masked_text_controller_phone.dart';
import '../../../../util/screen/ink_wrapper.dart';

class AddNewAdressButton extends StatelessWidget {
  const AddNewAdressButton({Key? key, required this.regions}) : super(key: key);
  final List<Region> regions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWrapper(
        onTap: () {
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(),
          // );
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(),
          // );
          // Go.to(
          //     context,
          //     BlocProvider(
          //       create: (context) => DeliveryAdressOperationsCubit(),
          //       child: AddressOperationsPage(
          //         regions: regions,
          //       ),
          //     ));
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) =>
                Pager.deliveryAddressOperations(regions: regions),
          );
        },
        child: Container(
            width: 165,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.mainOpacity),
            child: Center(
              child: Text(
                MyText.addNewAdressX,
                style:
                    AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
              ),
            )),
      ),
    );
  }
}
