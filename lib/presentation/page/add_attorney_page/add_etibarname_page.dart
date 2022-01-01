import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/add_attorney_list_view.dart';

class AddEtibarname extends StatelessWidget {
  const AddEtibarname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        centerTitle: true,
        title: MyText.new_attorney,
      ),
      body: SafeArea(
        child: BlocListener<AddAttorneysCubit, AddAttorneysState>(
          listener: (context, state) {
            if (state is AddAttorneysInProgress) {
              FullScreenLoading.display(context);
            } else if (state is AddAttorneysSuccess) {
              Go.pop(context);
              Snack.display(
                  context: context,
                  message: MyText.operationIsSuccess,
                  positive: true,
                  showSuccessIcon: true);
            }
          },
          child: const AddAttorneyListView(),
        ),
      ),
    );
  }
}
