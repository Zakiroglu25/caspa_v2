import 'package:caspa_v2/infrastructure/cubits/delivery_adress/delivery_adress_cubit.dart';
import 'package:caspa_v2/presentation/page/delivery_address_page/widgets/add_new_button.dart';
import 'package:caspa_v2/presentation/page/delivery_address_page/widgets/selectable_add_address.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectableAddAddressList extends StatelessWidget {
  final List<int> packageList;

  SelectableAddAddressList({
    required this.packageList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: Physics.never,
          itemCount: packageList.length,
          padding: Paddings.paddingB16,
          itemBuilder: (context, index) {
            final currentPackage = packageList[index];
            return StreamBuilder<int?>(
                stream: BlocProvider.of<DeliveryAdressCubit>(context)
                    .selectedAdressIdStream,
                builder: (context, snapshot) {
                  return SelectableAddAddress(
                    id: index,
                    selected: snapshot.data == currentPackage,
                    onTap: () => context
                        .read<DeliveryAdressCubit>()
                        .updateSelectedAdressId(currentPackage),
                  );
                });
            return SizedBox();
          },
        ),
        AddNewAdressButton()
      ],
    );
  }
}
