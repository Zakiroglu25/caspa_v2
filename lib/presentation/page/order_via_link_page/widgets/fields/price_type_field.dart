
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceTypeFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController? controller;

  PriceTypeFieldOrderViaUrl({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width / 1.5) -
          32,
      child: StreamBuilder<String>(
        stream: BlocProvider.of<OrderViaUrlCubit>(context).priceType,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.currency,
            maxLines: 1,
            hint: MyText.currency,
            upperCase: true,
            readOnly: true,
            textInputType: TextInputType.phone,
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            //  controller: controller,
            controller: TextEditingController.fromValue(TextEditingValue(
                text: (BlocProvider.of<OrderViaUrlCubit>(context)
                        .priceType
                        .valueOrNull) ??
                    '')),
            onTap: () => Sheet.display(
                context: context,
                child: SizedBox(
                  //height: 100,
                  height: 70,
                  child: StreamBuilder(
                      stream: BlocProvider.of<OrderViaUrlCubit>(context).priceType,
                      builder: (contextP, snapShoot) {
                        return ListView(
                          children: [
                            CaspaRadio(
                              onTap: () {
                                BlocProvider.of<OrderViaUrlCubit>(context)
                                    .updatepriceType(MyText.tryy);
                              },
                              title: MyText.tryy,
                              //  isActive: false,
                              isActive: BlocProvider.of<OrderViaUrlCubit>(context)
                                      .priceType
                                      .valueOrNull ==
                                  MyText.tryy,
                            ),
                            CaspaRadio(
                              onTap: () {
                                BlocProvider.of<OrderViaUrlCubit>(context)
                                    .updatepriceType(MyText.usd);
                              },
                              title: MyText.usd,
                              //   isActive: false,
                              isActive: BlocProvider.of<OrderViaUrlCubit>(context)
                                      .priceType
                                      .valueOrNull ==
                                  MyText.usd,
                            ),
                          ],
                        );
                      }),
                )),
            onChanged: (value) =>
                BlocProvider.of<OrderViaUrlCubit>(context).updatepriceType(value),
          );
        },
      ),
    );
  }
}
