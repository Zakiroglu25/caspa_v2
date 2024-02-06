// import 'package:animate_do/animate_do.dart';
// import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
// import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
// import 'package:caspa_v2/util/constants/app_text_styles.dart';
// import 'package:caspa_v2/util/constants/colors.dart';
// import 'package:caspa_v2/util/constants/sized_box.dart';
// import 'package:caspa_v2/util/constants/text.dart';
// import 'package:caspa_v2/util/delegate/navigate_utils.dart';
// import 'package:caspa_v2/util/delegate/pager.dart';
// import 'package:caspa_v2/util/screen/alert.dart';
// import 'package:caspa_v2/util/screen/ink_wrapper.dart';
// import 'package:caspa_v2/util/screen/widget_or_empty.dart';
// import 'package:caspa_v2/widgets/custom/buttons/app_button.dart';
// import 'package:flutter/material.dart';
// import '../../../../widgets/custom/order_select_check_indicator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CourierOrder extends StatefulWidget {
//   Function? onTap;
//   Package package;
//   int index;
//
//   CourierOrder({this.onTap, required this.package, required this.index});
//
//   @override
//   State<CourierOrder> createState() => _CourierOrderState();
// }
//
// class _CourierOrderState extends State<CourierOrder> {
//   @override
//   Widget build(BuildContext context) {
//     //final selectedOrders = context.watch<CourierCubit>().selectedOrdersId.value;
//     widgets.package.customStatus = MyText.stArrived;
//     return Stack(
//       fit: StackFit.loose,
//       children: [
//         GestureDetector(
//           onTap: () =>
//               //widgets.package.payment == 1
//               //    ?
//               setState(() {
//             context.read<CourierCubit>().addOrderId(widgets.package.id!);
//             context.read<CourierCubit>().addPackage(widgets.package);
//           })
//           //    : null
//           ,
//           child: FadeInUp(
//             delay: Duration(milliseconds: widgets.index * 100),
//             child: AnimatedContainer(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               margin: EdgeInsets.only(bottom: 20),
//               duration: Duration(milliseconds: 200),
//               decoration: BoxDecoration(
//                 color: selectedOrders.contains(widgets.package.id)
//                     ? MyColors.mainOpacity
//                     : Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                     color: selectedOrders.contains(widgets.package.id)
//                         ? MyColors.mainColor
//                         : MyColors.grey153,
//                     width: selectedOrders.contains(widgets.package.id) ? 2 : 1),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //ySizedBox.h16,
//                         Text(widgets.package.store!,
//                             style:
//                                 AppTextStyles.sanF600.copyWith(fontSize: 16)),
//                         MySizedBox.h4,
//                         Text(widgets.package.date!,
//                             style: AppTextStyles.sanF400Grey),
//                         // MySizedBox.h16,
//                       ],
//                     ),
//                   ),
//                   Text("${widgets.package.price!} TL",
//                       style: AppTextStyles.sanF600.copyWith(fontSize: 16)),
//                   MySizedBox.w20,
//                   OrderSelectCheckIndicator(
//                     active: selectedOrders.contains(widgets.package.id),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // Positioned.fill(
//         //   child: WidgetOrEmpty(
//         //     value: widgets.package.payment == 0,
//         //     child: InkWrapper(
//         //       onTap: () => Alert.show(context,
//         //           image: Icon(
//         //             Icons.info,
//         //             size: 80,
//         //           ),
//         //           title: MyText.youHaveNotPay,
//         //           secondButton: CaspaButton(
//         //             text: MyText.pay,
//         //             color: MyColors.grey245,
//         //             textColor: MyColors.black,
//         //             onTap: () {
//         //               Go.pop(context);
//         //               return Go.to(context,
//         //                   Pager.packageDetails(package: widgets.package));
//         //             },
//         //           ),
//         //           content: MyText.youMustHaveMakepayment),
//         //       child: Container(
//         //         color: MyColors.white70,
//         //       ),
//         //     ),
//         //   ),
//         // )
//       ],
//     );
//   }
// }
