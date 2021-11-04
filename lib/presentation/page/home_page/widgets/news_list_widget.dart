import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/elements/news_card.dart';
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
        //width: 94,
        child: ListView.separated(
          padding: Paddings.paddingH20,
          separatorBuilder: (context, index) {
            return MySizedBox.w12;
          },
          itemCount: hList.length,
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return NewsCard(
              url:
                  'https://image.freepik.com/free-photo/arrangement-black-friday-clock-with-copy-space_23-2148665530.jpg',
              newsText:
                  'titile new new news campaigncampaign campaign campaign',
              image:
                  'https://image.freepik.com/free-photo/arrangement-black-friday-clock-with-copy-space_23-2148665530.jpg',
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
