import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/accent_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/courier/courier_cubit.dart';
import '../../../../infrastructure/models/remote/response/delivery_address_model.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/delegate/pager.dart';
import '../../../../widget/general/caspa_field.dart';
import '../../../../widget/general/caspa_loading.dart';

class DeliveryAddressSelectField extends StatelessWidget {
  const DeliveryAddressSelectField({Key? key, required this.address})
      : super(key: key);
  final DeliveryAddress? address;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: address != null,
      elseChild: AccentButton(
        onTap: () => Go.to(context, Pager.deliveryAddress()),
        title: MyText.selectAddress,
      ),
      child: StreamBuilder<String>(
          stream: BlocProvider.of<CourierCubit>(context).deliveryAddressStream,
          builder: (context, snapshot) {
            return CaspaField(
              readOnly: true,
              maxLines: 1,
              child:
                  snapshot.data == "" ? FadeOut(child: CaspaLoading()) : null,
              controller: TextEditingController(text: snapshot.data),
              title: MyText.selectedAddress,
              //initialValue: snapshot.data,
              onTap: () => Go.to(context, Pager.deliveryAddress()),
            );
          }),
    );
  }
}
