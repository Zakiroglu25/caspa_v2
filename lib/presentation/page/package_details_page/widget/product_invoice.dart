import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/screen/errorable_image.dart';
import 'invoice_image_details.dart';

class ProductInvoice extends StatelessWidget {
  const ProductInvoice({
    Key? key,
    required this.url,
    required this.store,
  }) : super(key: key);
  final String? url;
  final String store;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: url != null,
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWrapper(
          onTap: () => Go.to(
              context,
              InvoiceImageFullScreen(
                url: url!,
                store: store,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.grey245),
            width: 72.w,
            height: 72.h,
            child: Hero(
              tag: 'full',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ErrorableImage(
                  url: url,
                  fit: BoxFit.cover,
                  errorIcon: Icon(Icons.photo),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
