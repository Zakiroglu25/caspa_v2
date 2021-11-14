import 'package:caspa_v2/presentation/page/home_page/widgets/news_details_page.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String? newsText;
  final String? image;
  final String? url;

  NewsCard({this.newsText, this.image, this.url});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      splashColor: Colors.transparent,
      radius: 12,
      onTap: () {
        Go.to(context, NewsDetails());
       // launch(url!);
      },
      child: Container(
        height: 94,
        // width: 94,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          //   color: Colors.blue,
        ),
        child: Stack(
          //  fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                12,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  //  color: Colors.blue,
                ),
                child: ErrorableImage(
                  url: image!,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Text(
                "$newsText",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
