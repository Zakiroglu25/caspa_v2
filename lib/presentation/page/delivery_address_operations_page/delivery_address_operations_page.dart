import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_cubit.dart';
import '../../../infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_state.dart';
import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/assets.dart';
import '../../../util/constants/paddings.dart';
import '../../../util/constants/sized_box.dart';
import '../../../util/constants/text.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../widget/custom/buttons/null_icon_button.dart';
import 'widgets/fields/details_field_deliver_operations.dart';
import 'widgets/fields/name_field_deliver_operations.dart';

import '../home_page/widgets/section_name.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_state.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_cubit.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/app_operations.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/formatter/masked_text_controller_phone.dart';
import '../../../../widget/custom/buttons/null_icon_button.dart';
import 'widgets/fields/number_field.dart';
import 'widgets/fields/region_field_delivery_operations.dart';

class DeliveryAddressOperationsPage extends StatelessWidget {
  DeliveryAddressOperationsPage({Key? key, required this.regions})
      : super(key: key);
  final List<Region> regions;

  final TextEditingController nameController =
      TextEditingController(text: "${''}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: SafeArea(
        top: false,
        child: BlocConsumer<DeliveryAdressOperationsCubit,
            DeliveryAdressOperationsState>(
          listener: (context, state) {
            if (state is DeliveryAdressOperationsSuccess) {
              Go.pop(context);
              context.read<DeliveryAddressCubit>().get();
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(Assets.svgClose),
                      ),
                      onPressed: () => Go.pop(context),
                    ),
                    Text(
                      MyText.addNewAdress,
                      style: AppTextStyles.sanF400.copyWith(fontSize: 18),
                    ),
                    NullIconButton(),
                    //  MySizedBox.w12
                  ],
                ),
                ListView(
                  padding: Paddings.paddingA16 + Paddings.paddingT8,
                  shrinkWrap: true,
                  children: [
                    SectionName(title: MyText.delivery_adress),
                    MySizedBox.h16,
                    NameFieldDeliverOperations(controller: nameController),
                    RegionFieldDeliveryOperations(
                      regionList: regions,
                    ),
                    PhoneFieldDeliveryOperations(
                        controller: MaskedTextController.app(
                            text:
                                "${AppOperations.formatNumber("(055)-563-14-34", addZero: false, fromSpaceToLine: false)}")),
                    DetailsFieldDeliverOperations(
                        controller: TextEditingController(text: "${''}")),
                    MySizedBox.h36,
                    CaspaButton(
                      loading: (context
                          .watch<DeliveryAdressOperationsCubit>()
                          .state is DeliveryAdressOperationsInProgress),
                      text: MyText.save,
                      onTap: () => context
                          .read<DeliveryAdressOperationsCubit>()
                          .add(context),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
