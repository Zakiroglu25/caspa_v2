import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widget/general/caspa_loading.dart';

class ErrorableImage extends StatelessWidget {
  final String? url;
  final Widget? errorIcon;
  final Widget? placeHolder;
  final BoxFit? fit;
  final double? w;
  final double? h;

  ErrorableImage(
      {@required this.url,
      this.errorIcon,
      this.fit,
      this.placeHolder,
      this.h,
      this.w});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      fit: fit ?? BoxFit.contain,
      width: w,
      height: h,
      placeholder: (context, url) => Center(
          child: SizedBox(
              height: 10, width: 10, child: placeHolder ?? CaspaLoading())),
      errorWidget: (context, url, error) => errorIcon ?? Icon(Icons.error),
    );
  }
}
