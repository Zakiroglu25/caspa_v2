import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/screen/ink_wrapper.dart';

class AddNewAdressButton extends StatelessWidget {
  const AddNewAdressButton({Key? key, required this.regions}) : super(key: key);
  final List<Region> regions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWrapper(
        onTap: () => context
            .read<DeliveryAddressCubit>()
            .goToAddPage(context: context, regions: regions),
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
