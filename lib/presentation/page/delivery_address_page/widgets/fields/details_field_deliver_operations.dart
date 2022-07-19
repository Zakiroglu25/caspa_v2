import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/constants/text.dart';
import '../../../../../widget/general/caspa_field.dart';

class DetailsFieldDeliverOperations extends StatelessWidget {
  final TextEditingController? controller;

  DetailsFieldDeliverOperations(
      {this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // if (controller!.text != '' && controller!.text != 'null')
    //   BlocProvider.of<DeliveryAdressOperationsCubit>(context)
    //       .updateDetails(controller!.text);

    return StreamBuilder<String>(
      stream:
          BlocProvider.of<DeliveryAdressOperationsCubit>(context).detailsStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.enterTheDetails,
          maxLines: 1,
          hint: MyText.aptOfficeFloor,
          upperCase: true,
          textInputType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<DeliveryAdressOperationsCubit>(context)
                  .updateDetails(value),
        );
      },
    );
  }
}
