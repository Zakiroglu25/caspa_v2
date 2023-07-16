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

import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewPage extends StatefulWidget {
  String url;
  Function whenSuccess;
  BuildContext mainContext;
  WebviewPage(
      {Key? key,
      required this.url,
      required this.mainContext,
      required this.whenSuccess})
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
      // Scaffold.of(context).showSnackBar(
      //   const SnackBar(content: Text("No back history item")),
      // );
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: SafeArea(
          child: Column(children: <Widget>[

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
                  if (('$uri').contains('https://caspa.az/?modal=true')) {

                    //  webViewController.
                    eeee("url containe");

                    widget.whenSuccess.call();
                  }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  pullToRefreshController.endRefreshing();
                  //setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                  //});
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
//     widgets.browser.addMenuItem(ChromeSafariBrowserMenuItem(
//         id: 1,
//         label: 'Custom item menu 1',
//         action: (url, title) {
//           print('Custom item menu 1 clicked!');
//           print(url);
//           print(title);
//         }));
//     widgets.browser.addMenuItem(ChromeSafariBrowserMenuItem(
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
//                 await widgets.browser.open(
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
