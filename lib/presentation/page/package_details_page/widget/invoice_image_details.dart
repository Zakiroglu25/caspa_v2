import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../util/delegate/my_printer.dart';

class InvoiceImageFullScreen extends StatelessWidget {
  const InvoiceImageFullScreen(
      {Key? key, required this.url, required this.store})
      : super(key: key);
  final String url;
  final String store;
  @override
  Widget build(BuildContext context) {
    if (url[url.length - 1] == "f") {
      return Scaffold(
        appBar: CaspaAppbar(
          user: false,
          title: store,
          contextA: context,
          notification: false,
        ),
        body: PDF(
          swipeHorizontal: true,
        ).cachedFromUrl(url),
      );
    }
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: store,
        contextA: context,
        notification: false,
      ),
      body: SafeArea(
        child: Hero(
          tag: 'full',
          child: Center(child: ErrorableImage(url: url)),
        ),
      ),
    );
  }
}
