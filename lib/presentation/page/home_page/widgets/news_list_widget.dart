import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({
    Key? key,
    required this.hList,
  }) : super(key: key);

  final List<NewsModel> hList;

  @override
  Widget build(BuildContext context) {
    List<NewsModel> hList = [
      NewsModel(
        Image.asset("assets/png/news1.pg"),
        "Catdirilma",
      ),
      NewsModel(
        Image.asset(Assets.news1),
        "3 gün ərzində çatdırılma",
      ),
      NewsModel(
        Image.asset(Assets.news2),
        "Sürətli küryer xidmətləri",
      ),
      NewsModel(
        Image.asset(Assets.news3),
        "Catdirilma",
      ),
      NewsModel(
        Image.asset(Assets.news1),
        "3 gün ərzində çatdırılma",
      ),
      NewsModel(
        Image.asset(Assets.news2),
        "Sürətli küryer xidmətləri",
      ),
    ];


    return Container(
        height: 94,
        width: 94,
        child: ListView.builder(
          itemCount: hList.length,
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Image.asset(Assets.news1),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      "${hList[index].newsText}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}


class NewsModel {
  Image image;
  String? newsText;

  NewsModel(
      this.image,
      this.newsText,
      );
}
