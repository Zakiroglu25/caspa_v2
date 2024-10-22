// import 'dart:math';
//
// import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
// import 'package:caspa_v2/infrastructure/cubits/wares_cubit/wares_cubit.dart';
// import 'package:caspa_v2/infrastructure/cubits/wares_cubit/wares_state.dart';
// import 'package:caspa_v2/infrastructure/models/remote/response/wares.dart';
// import 'package:caspa_v2/util/constants/physics.dart';
// import 'package:caspa_v2/util/constants/text.dart';
// import 'package:caspa_v2/util/delegate/navigate_utils.dart';
// import 'package:caspa_v2/util/screen/sheet.dart';
// import 'package:caspa_v2/util/screen/snack.dart';
// import 'package:caspa_v2/widget/general/caspa_field.dart';
// import 'package:caspa_v2/widget/general/caspa_loading.dart';
// import 'package:caspa_v2/widget/general/app_radio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class WaresRegisterField extends StatelessWidget {
//   WaresRegisterField({Key? key, this.selectedWaresId}) : super(key: key);
//   int? selectedWaresId;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: WaresCubit()..fetch(),
//       child: BlocBuilder<WaresCubit, WaresState>(
//         builder: (context, state) {
//           List<Data>? wares;
//           if (state is WaresSuccess) {
//             wares = state.wares;
//             context.read<RegisterCubit>().updateWaresList(wares);
//           }
//           return Column(
//             children: [
//               StreamBuilder(
//                   stream: BlocProvider.of<RegisterCubit>(context)
//                       .selectedWaresStream,
//                   builder: (contextP, snapShoot) {
//                     return CaspaField(
//                       readOnly: true,
//                       // suffixIcon: FieldLoading(state),
//                       hint: MyText.topWares,
//                       controller: TextEditingController.fromValue(
//                           TextEditingValue(
//                               text: (BlocProvider.of<RegisterCubit>(context)
//                                       .selectedWares
//                                       .valueOrNull
//                                       ?.name) ??
//                                   '')),
//                       title: MyText.deliveryPoint,
//                       onTap: () => wares != null
//                           ? showSheet(context, wares)
//                           : Snack.display(
//                               context: context,
//                               message: MyText.none_wares_is_found),
//                     );
//                   }),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   showSheet(BuildContext context, List<Data>? waresList) {
//     if (waresList != null && waresList.length != 0) {
//       Sheet.display(
//           context: context,
//           child: StreamBuilder<List<Data>>(
//               stream: BlocProvider.of<RegisterCubit>(context).waresListStream,
//               builder: (contextZ, listSnapshot) {
//                 List<Data> wares = (listSnapshot.data ?? []);
//                 final itemCount = wares.length;
//                 final sH = MediaQuery.of(context).size.height - 56 - 90;
//                 //   final listHeight = (itemCount) * 50.0 + 75;
//                 final listHeight = (itemCount) * 50.0;
//                 return SizedBox(
//                   height: min(listHeight, sH),
//                   child: ListView(
//                     physics: Physics.never,
//                     shrinkWrap: true,
//                     children: [
//                       StreamBuilder(
//                           stream: BlocProvider.of<RegisterCubit>(context)
//                               .selectedWaresStream,
//                           builder: (contextP, snapShoot) {
//                             return wares.isEmpty
//                                 ? CaspaLoading()
//                                 : SizedBox(
//                                     height: min(listHeight, sH),
//                                     //height: min(listHeight - 75, sH - 75),
//                                     child: ListView.builder(
//                                         physics: Physics.alwaysBounce,
//                                         shrinkWrap: false,
//                                         itemCount: wares.length,
//                                         itemBuilder: (contextK, index) {
//                                           Data category = wares[index];
//
//                                           return AppRadio(
//                                             onTap: () {
//                                               BlocProvider.of<RegisterCubit>(
//                                                       context)
//                                                   .updateWares(category);
//                                               Go.pop(context);
//                                             },
//                                             title: category.name,
//                                             isActive:
//                                                 BlocProvider.of<RegisterCubit>(
//                                                             context)
//                                                         .selectedWares
//                                                         .valueOrNull
//                                                         ?.id ==
//                                                     category.id,
//                                           );
//                                         }),
//                                   );
//                           }),
//                     ],
//                   ),
//                 );
//               }));
//     } else {
//       Snack.display(context: context, message: MyText.none_category_is_found);
//     }
//   }
// }
