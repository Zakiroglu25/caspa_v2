import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../util/delegate/my_printer.dart';

class InvoiceImageFullScreen extends StatelessWidget {
  const InvoiceImageFullScreen(
      {Key? key, required this.url, required this.store})
      : super(key: key);
  final String url;
  final String store;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

    if(url[url.length - 1] == "f"){
      return Scaffold(
        appBar: CaspaAppbar(
          user: false,
          title: store,
          contextA: context,
          notification: false,
        ),
        body: SfPdfViewer.network(
          url,
          key: _pdfViewerKey,
        ),
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
