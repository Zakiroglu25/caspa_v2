import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/elements/tariff_card.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TariffDetails extends StatelessWidget {
  final List<Tariff> hList;

  TariffDetails({
    Key? key,
    required this.hList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        notification: false,
        user: false,
        title: "Tariffler",
      ),
      body: Column(
        children: [
          BlocBuilder<TarifCubit, TarifState>(
            builder: (context, state) {
              if (state is TarifSuccess) {
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return MySizedBox.w10;
                  },
                  shrinkWrap: true,
                  itemCount: hList.length,
                  scrollDirection: Axis.vertical,
                  padding: Paddings.paddingH20,
                  itemBuilder: (context, index) {
                    Tariff tariff = hList[index];
                    return TariffCard(
                      tarifName: tariff.description,
                      price: tariff.price,
                    );
                  },
                );
              }
              return Center(child: CaspaLoading());
            },
          )
        ],
      ),
    );
  }
}
