import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NewOrderPage extends StatefulWidget {
  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  @override
  void initState() {
    // initialise your tab controller here

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Text(
              "Yeni sifariş",
              style: UITextStyle.tW400BigBlack,
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/png/bck.png"),
                  ),
                ),
              ),
              Positioned(
                top: 65,
                left: 65,
                right: 65,
                child: SizedBox(
                  child: Image.asset(
                    'assets/png/sebet.png',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Go.to(context, LinkPage());
                },
                child: Container(
                  width: 167,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(234, 251, 221, 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Link ile 🎁",
                            style:
                                AppTextStyles.coHead600.copyWith(fontSize: 16)),
                        Text(
                          "Sizin əvəzinizə biz alırıq, yalız linki verməniz gərəkdi.",
                          style: AppTextStyles.sanF400
                              .copyWith(fontSize: 12, color: MyColors.grey153),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 167,
                height: 140,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 241, 249, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bəynnamə 📦",
                          style:
                              AppTextStyles.coHead600.copyWith(fontSize: 16)),
                      Text(
                        "Məhsulu siz alırsız biz isə seçdiyiniz ünvana qədər çatdırırıq.",
                        style: AppTextStyles.sanF400
                            .copyWith(fontSize: 12, color: MyColors.grey153),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
