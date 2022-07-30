import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../presentation/page/delivery_address_page/widgets/modal_with_scroll.dart';
import '../caspa_appbar/caspa_appbar.dart';

class CupertinoModalBody extends StatelessWidget {
  const CupertinoModalBody({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialWithModalsPageRoute(
                builder: (_) => Material(
                      child: body,
                    ),
                settings: settings);
        }
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: CaspaAppbar(
              user: false,
              notification: false,
              title: "Çatdırılma ünvanlarım",
              contextA: context,
            ),
            body: Builder(
              builder: (context) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  transitionBetweenRoutes: false,
                  middle: Text('Normal Navigation Presentation'),
                  trailing: GestureDetector(
                    child: Icon(Icons.arrow_upward),
                    onTap: () =>
                        CupertinoScaffold.showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Stack(
                        children: <Widget>[
                          ModalWithScroll(),
                          Positioned(
                            height: 40,
                            left: 40,
                            right: 40,
                            bottom: 20,
                            child: MaterialButton(
                              onPressed: () => Navigator.of(context).popUntil(
                                  (route) => route.settings.name == '/'),
                              child: Text('Pop back home'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                child: Center(child: Container()),
              ),
            ),
          );
        });
      },
    );
  }
}
