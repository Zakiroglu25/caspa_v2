import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/text_styles.dart';

class MoreStories extends StatefulWidget {
  const MoreStories({Key? key, required this.hList}) : super(key: key);

  @override
  _MoreStoriesState createState() => _MoreStoriesState();
  final List<Data> hList;
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  List<StoryItem> stories = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.hList.length; i++) {
      stories.add(
        StoryItem.pageImage(
          duration: Duration(
            seconds: 5,
          ),
          url: widget.hList[i].image!,
          caption: widget.hList[i].description,
          controller: storyController,
        ),
      );
    }
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: MyColors.black,
      //   elevation: 0,
      //   title: Text("Xəbərlər",
      //       style: UITextStyle.tW600Black
      //           .copyWith(fontSize: 16, color: MyColors.white)),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 16.0),
      //       child: InkWell(
      //           onTap: () {
      //             Navigator.pop(context);
      //           },
      //           child: Icon(
      //             Icons.clear,
      //             color: MyColors.white,
      //           )),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          StoryView(
            storyItems: stories,
            onComplete: () {
              Navigator.pop(context);
            },
            progressPosition: ProgressPosition.top,
            controller: storyController,
          ),
          Positioned(
            right: 16,
            top: 60,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                color: MyColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
