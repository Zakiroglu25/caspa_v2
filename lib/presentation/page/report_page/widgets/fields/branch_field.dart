import 'dart:math';

import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/app_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../infrastructure/cubits/branches_cubit/braches_cubit.dart';
import '../../../../../../infrastructure/cubits/branches_cubit/branches_state.dart';
import '../../../../../../infrastructure/models/remote/response/branches_model.dart';
import '../../../../../infrastructure/cubits/report/report_cubit.dart';

class BranchField extends StatelessWidget {
  BranchField({Key? key, this.selectedWaresId, required this.activityNotifier})
      : super(key: key);
  int? selectedWaresId;
  final ValueNotifier<int?> activityNotifier;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BranchCubit()..fetch(),
      child: BlocBuilder<BranchCubit, BranchesState>(
        builder: (context, state) {
          List<Branch>? branch;
          if (state is BranchesSuccess) {
            branch = state.branches;
            context.read<ReportCubit>().updateBranchList(branch);
          }
          return Column(
            children: [
              StreamBuilder(
                  stream: BlocProvider.of<ReportCubit>(context)
                      .selectedBranchStream,
                  builder: (contextP, snapShoot) {
                    return CaspaField(
                      readOnly: true,
                      // suffixIcon: FieldLoading(state),
                      hint: MyText.topBranch,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: (BlocProvider.of<ReportCubit>(context)
                                      .selectedBranch
                                      .valueOrNull
                                      ?.name) ??
                                  '')),
                      title: MyText.branch,
                      onTap: () => branch != null
                          ? showSheet(context, branch)
                          : Snack.display(
                              context: context,
                              message: MyText.none_branch_is_found),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }

  showSheet(BuildContext context, List<Branch>? branchList) {
    if (branchList != null && branchList.length != 0) {
      Sheet.display(
          context: context,
          child: StreamBuilder<List<Branch>>(
              stream: BlocProvider.of<ReportCubit>(context).branchListStream,
              builder: (contextZ, listSnapshot) {
                List<Branch> branch = (listSnapshot.data ?? []);
                final itemCount = branch.length;
                final sH = MediaQuery.of(context).size.height - 56 - 90;
                //   final listHeight = (itemCount) * 50.0 + 75;
                final listHeight = (itemCount) * 50.0;
                return SizedBox(
                  height: min(listHeight, sH),
                  child: ListView(
                    physics: Physics.never,
                    shrinkWrap: true,
                    children: [
                      StreamBuilder(
                          stream: BlocProvider.of<ReportCubit>(context)
                              .selectedBranchStream,
                          builder: (contextP, snapShoot) {
                            return branch.isEmpty
                                ? CaspaLoading()
                                : SizedBox(
                                    height: min(listHeight, sH),
                                    //height: min(listHeight - 75, sH - 75),
                                    child: ListView.builder(
                                        physics: Physics.alwaysBounce,
                                        shrinkWrap: false,
                                        itemCount: branch.length,
                                        itemBuilder: (contextK, index) {
                                          Branch category = branch[index];

                                          return AppRadio(
                                            onTap: () {
                                              BlocProvider.of<ReportCubit>(
                                                      context)
                                                  .updateBranch(category);

                                              activityNotifier.value =
                                                  category.id;
                                              Go.pop(context);
                                            },
                                            title: category.name,
                                            isActive:
                                                BlocProvider.of<ReportCubit>(
                                                            context)
                                                        .selectedBranch
                                                        .valueOrNull
                                                        ?.id ==
                                                    category.id,
                                          );
                                        }),
                                  );
                          }),
                    ],
                  ),
                );
              }));
    } else {
      Snack.display(context: context, message: MyText.none_category_is_found);
    }
  }
}
