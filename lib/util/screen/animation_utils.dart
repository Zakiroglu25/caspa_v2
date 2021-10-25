// // Flutter imports:
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:lottie/lottie.dart';
//
// // Project imports:
// import 'package:optimal/my_widgets/general/full_screen_alert.dart';
// import 'package:optimal/my_widgets/general/optimal_loading.dart';
//
// class ShowAnimation {
//   static void showSuccessAnim(BuildContext context) async{
//     FullScreenAlert.of(context).show(
//         hideAuto: true,
//         backColor: Colors.black38,
//         widget: Center(
//             child: Container(
//           width: 80,
//           height: 80,
//           child: Lottie.asset('assets/anim/success_tick_confetti.json',
//               repeat: false),
//         )),
//         duration: Duration(milliseconds: 1200));
//     //
//     // await Future.delayed(Duration(milliseconds: 1200)) ;
//     // FullScreenAlert.of(context).hideAlert();
//   }
//
//   static void showErrorAnim(BuildContext context) {
//     FullScreenAlert.of(context).show(
//         hideAuto: true,
//         backColor: Colors.black38,
//         widget: Center(
//             child: Container(
//           width: 80,
//           height: 80,
//           child: Lottie.asset('assets/anim/network_error.json', repeat: false),
//         )),
//         duration: Duration(milliseconds: 1500));
//   }
//
//   static void showCartUpdateAnim(BuildContext context,
//       {bool addToCart, bool hideAuto}) {
//     FullScreenAlert.of(context).show(
//         backColor: Colors.white54,
//         hideAuto: hideAuto,
//         widget: Center(
//             child: Container(
//           width: 200,
//           height: 200,
//           child: addToCart
//               ? Lottie.asset('assets/anim/added_to_cart.json', repeat: false)
//               : Lottie.asset('assets/anim/remove_from_cart.json',
//                   repeat: false),
//         )),
//         duration: Duration(milliseconds: 1500));
//   }
//
//   static void showOptimalLoading(BuildContext context,
//       {bool addToCart, bool hideAuto, Color color}) {
//     FullScreenAlert.of(context).show(
//       hideAuto: hideAuto,
//       backColor: color ?? Colors.transparent,
//       widget: Center(
//           child: Container(
//         width: 20,
//         height: 20,
//         child: OptimalLoading(),
//       )),
//     );
//   }
// }
