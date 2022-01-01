// // Flutter imports:
// // Package imports:
// import 'package:animate_do/animate_do.dart';
// import 'package:caspa_v2/util/constants/assets.dart';
// import 'package:caspa_v2/util/constants/colors.dart';
// import 'package:caspa_v2/util/constants/sized_box.dart';
// import 'package:caspa_v2/util/screen/widget_or_empty.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // Project imports:
//
// class NoData extends StatelessWidget {
//   final String? text;
//   final bool? showButton;
//   final Function? refreshButton;
//   final double? w;
//   final double? h;
//
//   NoData({this.text, this.showButton, this.refreshButton, this.w, this.h});
//
//   // const NoData({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           height: h ?? 350.sp,
//           width: w ?? 350.sp,
//           // color: Colors.pink,
//           child: SvgPicture.asset(
//             Assets.svgNoData,
//             // width: 280,
//             // height: 280,
//           ),
//         ),
//         Container(
//           //width: sW-80,
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: FadeIn(
//             child: Text(
//               text == null
//                   ?'there_is_no_result'
//                   : text!,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.w700, fontSize: 23.sp,
//                 color: MyColors.halfBlack,
//                 //fontWeight: FontWeight.w500 ,
//                 fontFamily: 'Inter',
//               ),
//             ),
//           ),
//         ),
//         WidgetOrEmpty(value: refreshButton != null, child: MySizedBox.h24),
//         refreshButton != null
//             ? OutlinedButton(
//                 child:
//                     Text('try_again'),
//                 style: OutlinedButton.styleFrom(
//                   primary: MyColors.mainRED,
//                   onSurface: Colors.red,
//                   side: BorderSide(width: 1, color: Colors.red),
//                 ),
//                 onPressed: () {
//                   refreshButton?.call();
//
//                   // print("yenden butonu basildi");
//                 },
//               )
//             : Container()
//       ],
//     );
//   }
// }
