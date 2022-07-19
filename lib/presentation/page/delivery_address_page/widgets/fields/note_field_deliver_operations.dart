import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_adress_operations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/constants/text.dart';
import '../../../../../widget/general/caspa_field.dart';

class NoteFieldDeliverOperations extends StatelessWidget {
  final TextEditingController? controller;

  NoteFieldDeliverOperations(
      {this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // if (controller!.text != '' && controller!.text != 'null')
    //   BlocProvider.of<DeliveryAdressOperationsCubit>(context)
    //       .updateNote(controller!.text);

    return StreamBuilder<String>(
      stream:
          BlocProvider.of<DeliveryAdressOperationsCubit>(context).noteStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.instructionForTheCourier,
          maxLines: 1,
          hint: MyText.aptPasswordIs25K,
          upperCase: true,
          textInputType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<DeliveryAdressOperationsCubit>(context)
                  .updateNote(value),
        );
      },
    );
  }
}
