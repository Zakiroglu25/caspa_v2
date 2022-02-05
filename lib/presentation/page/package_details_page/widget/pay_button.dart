import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/package_main_button.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key, required this.package}) : super(key: key);
  final Package package;
  @override
  Widget build(BuildContext context) {
    return PackageMainButton(
        w: (MediaQuery.of(context).size.width - 32),
        text: MyText.pay,
        // onTap: () => Go.to(context, Pager.payment(price: "466"))),
        onTap: () => Alert.body(context,
            title: MyText.choosePaypentType,
            cancelButton: true,
            buttonText: MyText.goOn,
            onTap: () => context
                .read<PackageDetailsCubit>()
                .makePayment(id: package.id!, context: context),
            image: Image.asset(
              Assets.linkGirl,
              width: 100,
              height: 100,
            ),
            content: StreamBuilder(
              stream:
                  BlocProvider.of<PackageDetailsCubit>(context).payTypeStream,
              builder: (contextK, snapShoot) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    buildCaspaRadio(context, snapShoot,
                        value: MyText.fromBalance),
                    buildCaspaRadio(context, snapShoot, value: MyText.byCard),
                    // buildCaspaRadio(context, snapShoot,
                    //     value: MyText.withPromoCode),
                  ],
                );
              },
            )));
  }

  CaspaRadio buildCaspaRadio(
      BuildContext context, AsyncSnapshot<Object?> snapShoot,
      {required String value}) {
    return CaspaRadio(
        onTap: () => context.read<PackageDetailsCubit>().updatePayType(value),
        title: value,
        isActive: snapShoot.data == value);
  }
}
