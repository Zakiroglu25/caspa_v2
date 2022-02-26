import 'package:caspa_v2/infrastructure/cubits/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/add_attorneys/add_attorneys_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/add_attorney_list_view.dart';

class AddOrEditEtibarnamePage extends StatelessWidget {
  Attorney? attorney;

  AddOrEditEtibarnamePage({this.attorney});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        centerTitle: true,
        contextA: context,
        title: MyText.new_attorney,
      ),
      body: SafeArea(
        child: BlocListener<AddAttorneysCubit, AddAttorneysState>(
          listener: (context, state) {
            if (state is AddAttorneysInProgress) {
              FullScreenLoading.display(context);
            } else if (state is AddAttorneysSuccess ||
                state is AddAttorneysEdited) {
              Go.pop(context);
              Snack.display(
                  context: context,
                  message: MyText.operationIsSuccess,
                  positive: true,
                  showSuccessIcon: true);
            } else if (state is AddAttorneysError) {
              // Go.pop(context);
              Snack.display(
                context: context,
                message: MyText.error,
              );
            }
          },
          child: AddOrEditFieldsAttorneyListView(
            attorney: attorney,
          ),
        ),
      ),
    );
  }
}
