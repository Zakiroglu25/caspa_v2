import 'package:caspa_v2/infrastructure/cubits/payment/payment_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// class WebviewPage extends StatelessWidget {
//   String url;
//   WebviewPage({Key? key, required this.url}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CaspaAppbar(
//         user: false,
//         title: MyText.makePayment,
//       ),
//       body: WebView(
//         initialUrl: url,
//       ),
//     );
//   }
// }

import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebviewPage extends StatefulWidget {
  String url;
  BuildContext mainContext;
  WebviewPage({Key? key, required this.url, required this.mainContext})
      : super(key: key);
  @override
  _WebviewPageState createState() => new _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final GlobalKey webViewKey = GlobalKey();

  late InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;

//ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // contextMenu = ContextMenu(
    //     menuItems: [
    //       ContextMenuItem(
    //           androidId: 1,
    //           iosId: "1",
    //           title: "Special",
    //           action: () async {
    //             print("Menu item Special clicked!");
    //             print(await webViewController?.getSelectedText());
    //             await webViewController?.clearFocus();
    //           })
    //     ],
    //     options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
    //     onCreateContextMenu: (hitTestResult) async {
    //       print("onCreateContextMenu");
    //       print(hitTestResult.extra);
    //       print(await webViewController?.getSelectedText());
    //     },
    //     onHideContextMenu: () {
    //       print("onHideContextMenu");
    //     },
    //     onContextMenuActionItemClicked: (contextMenuItemClicked) async {
    //       var id = (Platform.isAndroid)
    //           ? contextMenuItemClicked.androidId
    //           : contextMenuItemClicked.iosId;
    //       print("onContextMenuActionItemClicked: " +
    //           id.toString() +
    //           " " +
    //           contextMenuItemClicked.title);
    //     });

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController.reload();
        } else if (Platform.isIOS) {
          webViewController.loadUrl(
              urlRequest: URLRequest(url: await webViewController.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    // webViewController.clo
    super.dispose();
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      print("onwill goback");
      webViewController.goBack();
      return Future.value(true);
    } else {
      Scaffold.of(context).showSnackBar(
        const SnackBar(content: Text("No back history item")),
      );
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: SafeArea(
          child: Column(children: <Widget>[
        // TextField(
        //   decoration: InputDecoration(
        //       prefixIcon: Icon(Icons.search)
        //   ),
        //   controller: urlController,
        //   keyboardType: TextInputType.url,
        //   onSubmitted: (value) {
        //     var url = Uri.parse(value);
        //     if (url.scheme.isEmpty) {
        //       url = Uri.parse("https://www.google.com/search?q=" + value);
        //     }
        //     webViewController?.loadUrl(
        //         urlRequest: URLRequest(url: url));
        //   },
        // ),
        Expanded(
          child: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                // contextMenu: contextMenu,

                initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                // initialFile: "assets/index.html",
                initialUserScripts: UnmodifiableListView<UserScript>([]),
                initialOptions: options,
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },

                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                androidOnPermissionRequest:
                    (controller, origin, resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url;
                  bbbb("url:  $uri");
                  // if (![
                  //   "http",
                  //   "https",
                  //   "file",
                  //   "chrome",
                  //   "data",
                  //   "javascript",
                  //   "about"
                  // ].contains(uri!.scheme)) {
                  //   if (await canLaunch(url)) {
                  //     // Launch the App
                  //     await launch(
                  //       url,
                  //     );
                  //     // and cancel the request
                  //     return NavigationActionPolicy.CANCEL;
                  //   }
                  // }
                  if (('$uri').contains('https://caspa.az/?modal=true')) {
                    //  webViewController.
                    eeee("url containe");

                    context
                        .read<PaymentCubit>()
                        .paymentSuccess(widget.mainContext);
                  }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  pullToRefreshController.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onLoadError: (controller, url, code, message) {
                  print("-- mmessage: " + message.toUpperCase());
                  //launch("https://caspa.az");
                  // pullToRefreshController.endRefreshing();
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = this.url;
                  });
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                },
              ),
              // progress < 1.0
              //     ? LinearProgressIndicator(value: progress)
              //     : Container(),
            ],
          ),
        ),
        // ButtonBar(
        //   alignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     ElevatedButton(
        //       child: Icon(Icons.arrow_back),
        //       onPressed: () {
        //         webViewController?.goBack();
        //       },
        //     ),
        //     ElevatedButton(
        //       child: Icon(Icons.arrow_forward),
        //       onPressed: () {
        //         webViewController?.goForward();
        //       },
        //     ),
        //     ElevatedButton(
        //       child: Icon(Icons.refresh),
        //       onPressed: () {
        //         webViewController?.reload();
        //       },
        //     ),
        //   ],
        // ),
      ])),
    );
  }
}

// class MyChromeSafariBrowser extends ChromeSafariBrowser {
//   @override
//   void onOpened() {
//     print("ChromeSafari browser opened");
//   }
//
//   @override
//   void onCompletedInitialLoad() {
//     print("ChromeSafari browser initial load completed");
//   }
//
//   @override
//   void onClosed() {
//     print("ChromeSafari browser closed");
//   }
// }

// class ChromeSafariBrowserExampleScreen extends StatefulWidget {
//   final ChromeSafariBrowser browser = MyChromeSafariBrowser();
//
//   @override
//   _ChromeSafariBrowserExampleScreenState createState() =>
//       _ChromeSafariBrowserExampleScreenState();
// }
//
// class _ChromeSafariBrowserExampleScreenState
//     extends State<ChromeSafariBrowserExampleScreen> {
//   @override
//   void initState() {
//     widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
//         id: 1,
//         label: 'Custom item menu 1',
//         action: (url, title) {
//           print('Custom item menu 1 clicked!');
//           print(url);
//           print(title);
//         }));
//     widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
//         id: 2,
//         label: 'Custom item menu 2',
//         action: (url, title) {
//           print('Custom item menu 2 clicked!');
//           print(url);
//           print(title);
//         }));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text(
//           "ChromeSafariBrowser",
//         )),
//         //drawer: myDrawer(context: context),
//         body: Center(
//           child: ElevatedButton(
//               onPressed: () async {
//                 await widget.browser.open(
//                     url: Uri.parse("https://flutter.dev/"),
//                     options: ChromeSafariBrowserClassOptions(
//                         android: AndroidChromeCustomTabsOptions(
//                             addDefaultShareMenuItem: false,
//                             keepAliveEnabled: true),
//                         ios: IOSSafariOptions(
//                             dismissButtonStyle:
//                                 IOSSafariDismissButtonStyle.CLOSE,
//                             presentationStyle:
//                                 IOSUIModalPresentationStyle.OVER_FULL_SCREEN)));
//               },
//               child: Text("Open Chrome Safari Browser")),
//         ));
//   }
// }
