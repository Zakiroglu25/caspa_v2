import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TarifListWidget extends StatelessWidget {
  const TarifListWidget({
    Key? key,
    required this.hList,
  }) : super(key: key);

  final List<TarifModel> hList;

  @override
  Widget build(BuildContext context) {
    List<TarifModel> hList = [
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
    ];
    return Container(
      height: 132,
      width: 284,
      child: ListView.builder(
        itemCount: hList.length,
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              width: 284,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.mainGrey
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(Assets.tarifBox),
                    Text(hList[index].tarifName.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    Text(hList[index].price.toString()+"USD",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.green))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TarifModel {
  String? tarifName;
  double? price;

  TarifModel(
    this.tarifName,
    this.price,
  );
}
