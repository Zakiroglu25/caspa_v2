// import 'package:example/modals/circular_modal.dart';
// import 'package:example/web_frame.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import 'modals/floating_modal.dart';
// import 'modals/modal_complex_all.dart';
// import 'modals/modal_fit.dart';
// import 'modals/modal_inside_modal.dart';
// import 'modals/modal_will_scope.dart';
// import 'modals/modal_with_navigator.dart';
// import 'modals/modal_with_nested_scroll.dart';
// import 'modals/modal_with_scroll.dart';
// import 'modals/modal_with_page_view.dart';
//
// import 'examples/cupertino_share.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(platform: TargetPlatform.iOS),
//       darkTheme: ThemeData.dark().copyWith(platform: TargetPlatform.iOS),
//       title: 'BottomSheet Modals',
//       builder: (context, Widget? child) => WebFrame(
//         child: CupertinoTheme(
//           data: CupertinoThemeData(
//             brightness: Theme.of(context).brightness,
//             scaffoldBackgroundColor: CupertinoColors.systemBackground,
//           ),
//           child: child!,
//         ),
//       ),
//       onGenerateRoute: (RouteSettings settings) {
//         switch (settings.name) {
//           case '/':
//             return MaterialWithModalsPageRoute(
//                 builder: (_) => MyHomePage(title: 'Flutter Demo Home Page'),
//                 settings: settings);
//         }
//         return MaterialPageRoute(
//           builder: (context) => Scaffold(
//             body: CupertinoScaffold(
//               body: Builder(
//                 builder: (context) => CupertinoPageScaffold(
//                   navigationBar: CupertinoNavigationBar(
//                     transitionBetweenRoutes: false,
//                     middle: Text('Normal Navigation Presentation'),
//                     trailing: GestureDetector(
//                       child: Icon(Icons.arrow_upward),
//                       onTap: () =>
//                           CupertinoScaffold.showCupertinoModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => Stack(
//                           children: <Widget>[
//                             ModalWithScroll(),
//                             Positioned(
//                               height: 40,
//                               left: 40,
//                               right: 40,
//                               bottom: 20,
//                               child: MaterialButton(
//                                 onPressed: () => Navigator.of(context).popUntil(
//                                     (route) => route.settings.name == '/'),
//                                 child: Text('Pop back home'),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   child: Center(
//                     child: Container(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           settings: settings,
//         );
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         body: CupertinoPageScaffold(
//           navigationBar: CupertinoNavigationBar(
//             transitionBetweenRoutes: false,
//             middle: Text('iOS13 Modal Presentation'),
//             trailing: GestureDetector(
//               child: Icon(Icons.arrow_forward),
//               onTap: () => Navigator.of(context).pushNamed('ss'),
//             ),
//           ),
//           child: SizedBox.expand(
//             child: SingleChildScrollView(
//               primary: true,
//               child: SafeArea(
//                 bottom: false,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     ListTile(
//                         title: Text('Cupertino Photo Share Example'),
//                         onTap: () => Navigator.of(context).push(
//                             MaterialWithModalsPageRoute(
//                                 builder: (context) => CupertinoSharePage()))),
//                     section('STYLES'),
//                     ListTile(
//                       title: Text('Material fit'),
//                       onTap: () => showMaterialModalBottomSheet(
//                         expand: false,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalFit(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Bar Modal'),
//                       onTap: () => showBarModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalInsideModal(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Avatar Modal'),
//                       onTap: () => showAvatarModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalInsideModal(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Float Modal'),
//                       onTap: () => showFloatingModalBottomSheet(
//                         context: context,
//                         builder: (context) => ModalFit(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Cupertino Modal fit'),
//                       onTap: () => showCupertinoModalBottomSheet(
//                         expand: false,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalFit(),
//                       ),
//                     ),
//                     section('COMPLEX CASES'),
//                     ListTile(
//                         title: Text('Cupertino Small Modal forced to expand'),
//                         onTap: () => showCupertinoModalBottomSheet(
//                               expand: true,
//                               context: context,
//                               backgroundColor: Colors.transparent,
//                               builder: (context) => ModalFit(),
//                             )),
//                     ListTile(
//                       title: Text('Reverse list'),
//                       onTap: () => showBarModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalInsideModal(reverse: true),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Cupertino Modal inside modal'),
//                       onTap: () => showCupertinoModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalInsideModal(),
//                       ),
//                     ),
//                     ListTile(
//                         title: Text('Cupertino Modal with inside navigation'),
//                         onTap: () => showCupertinoModalBottomSheet(
//                               expand: true,
//                               context: context,
//                               backgroundColor: Colors.transparent,
//                               builder: (context) => ModalWithNavigator(),
//                             )),
//                     ListTile(
//                       title:
//                           Text('Cupertino Navigator + Scroll + WillPopScope'),
//                       onTap: () => showCupertinoModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ComplexModal(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Modal with WillPopScope'),
//                       onTap: () => showCupertinoModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => ModalWillScope(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Modal with Nested Scroll'),
//                       onTap: () => showCupertinoModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         builder: (context) => NestedScrollModal(),
//                       ),
//                     ),
//                     ListTile(
//                       title: Text('Modal with PageView'),
//                       onTap: () => showBarModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         builder: (context) => ModalWithPageView(),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 60,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget section(String title) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
//       child: Text(
//         title,
//         style: Theme.of(context).textTheme.caption,
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class WebFrame extends StatelessWidget {
//   final Widget child;
//
//   const WebFrame({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (kIsWeb && MediaQuery.of(context).size.width > 600) {
//       final date = DateTime.now();
//       final MediaQueryData mediaQuery = MediaQueryData(
//         size: Size(414, 896),
//         padding: EdgeInsets.only(
//           top: 44,
//           bottom: 34,
//         ),
//         devicePixelRatio: 2,
//       );
//       return Material(
//         child: Padding(
//           padding: EdgeInsets.all(60),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Flexible(
//                 flex: 2,
//                 key: Key('Preview'),
//                 child: FittedBox(
//                   fit: BoxFit.contain,
//                   child: Builder(builder: (context) {
//                     final device = MediaQuery(
//                       data: mediaQuery,
//                       child: Container(
//                           width: mediaQuery.size.width,
//                           height: mediaQuery.size.height,
//                           alignment: Alignment.center,
//                           child: Stack(
//                             fit: StackFit.expand,
//                             children: <Widget>[
//                               child,
//                               Positioned(
//                                 top: 0,
//                                 left: 0,
//                                 right: 0,
//                                 height: 44,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Padding(
//                                         padding:
//                                         EdgeInsets.only(left: 30, top: 4),
//                                         child: Text(
//                                           '${date.hour}:${date.minute}',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                                     Padding(
//                                         padding: EdgeInsets.only(right: 18),
//                                         child: Row(
//                                           children: <Widget>[
//                                             Icon(
//                                               Icons.signal_cellular_4_bar,
//                                               size: 14,
//                                             ),
//                                             SizedBox(width: 4),
//                                             Icon(Icons.wifi, size: 16),
//                                             SizedBox(width: 4),
//                                             Icon(
//                                                 CupertinoIcons.battery_charging,
//                                                 size: 20)
//                                           ],
//                                         ))
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Container(
//                                   margin: EdgeInsets.only(bottom: 8),
//                                   height: 4,
//                                   width: 140,
//                                   decoration: BoxDecoration(
//                                       color: Colors.black,
//                                       borderRadius: BorderRadius.circular(4)),
//                                 ),
//                               )
//                             ],
//                           )),
//                     );
//
//                     return Container(
//                       child: ClipRRect(
//                           clipBehavior: Clip.antiAlias,
//                           borderRadius: BorderRadius.circular(38.5),
//                           child: device),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(color: Colors.black, width: 12)),
//                     );
//                   }),
//                 ),
//               ),
//               SizedBox(width: 80),
//               Flexible(
//                   flex: 1,
//                   child: FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Container(
//                           padding: EdgeInsets.only(bottom: 40),
//                           width: mediaQuery.size.width,
//                           height: mediaQuery.size.height,
//                           alignment: Alignment.center,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: <Widget>[
//                               Expanded(
//                                   child: Text(
//                                     'Modal\nBottom\nSheet',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 80,
//                                     ),
//                                     maxLines: 3,
//                                     overflow: TextOverflow.clip,
//                                   )),
//                               Spacer(),
//                               Row(
//                                 children: <Widget>[
//                                   InkWell(
//                                     onTap: () => launch(
//                                         'https://pub.dev/packages/modal_bottom_sheet'),
//                                     child: Image.asset('assets/flutter.png',
//                                         height: 60),
//                                   ),
//                                   Spacer(),
//                                   InkWell(
//                                     onTap: () => launch(
//                                         'https://github.com/jamesblasco/modal_bottom_sheet'),
//                                     child: Image.asset('assets/github.png',
//                                         height: 60),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ))))
//             ],
//           ),
//         ),
//       );
//     } else {
//       return child;
//     }
//   }
// }
