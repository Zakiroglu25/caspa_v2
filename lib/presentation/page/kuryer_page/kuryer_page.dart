import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KuryerPage extends StatefulWidget {
  KuryerPage({Key? key}) : super(key: key);

  @override
  State<KuryerPage> createState() => _KuryerPageState();
}

class _KuryerPageState extends State<KuryerPage> {
  int selectedTool = 0;

  List<dynamic> tools = [
    {
      'name': 'Massimo Dutti',
      'date': '08.09.1993',
    },
    {
      'name': 'Pull & Bear ',
      'date': '08.09.1993',
    },
    {
      'name': 'Figma',
      'date': '08.09.1993',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: 'Kuryer sifarişi',
        user: false,
        notification: false,
        centerTitle: true,
        contextA: context,
      ),
      body: ListView(
        children: [
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
                    'assets/png/moto.png',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionName(title: "Sizin məlumatlarınız bizdə var 😊"),
                MySizedBox.h12,
                Text(
                  MyText.kuryerTxt,
                  style: UITextStyle.tW400Grey,
                ),
                MySizedBox.h24,
                SectionName(title: "Çatdırılma məlumatları"),
                MySizedBox.h16,
                CaspaField(
                  hint: '+994 ... .. ..',
                  title: 'Nomre',
                ),
                CaspaTextFieldUnder("Rayon"),
                CaspaField(
                  hint: 'Rayonu daxil edin',
                ),
                CaspaTextFieldUnder("Ünvan"),
                CaspaField(
                  hint: 'Burada ünvanı qeyd edə bilərsiniz',
                ),
                SectionName(title: "Bağlamanı seçin"),
                MySizedBox.h20,
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          itemCount: tools.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTool = index;
                                });
                              },
                              child: FadeInUp(
                                delay: Duration(milliseconds: index * 100),
                                child: AnimatedContainer(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  margin: EdgeInsets.only(bottom: 20),
                                  duration: Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color: selectedTool == index
                                        ? MyColors.mainOpacity
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: selectedTool == index
                                            ? MyColors.mainColor
                                            : MyColors.grey153,
                                        width: selectedTool == index ? 2 : 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //ySizedBox.h16,
                                            Text(tools[index]['name'],
                                                style: AppTextStyles.sanF600
                                                    .copyWith(fontSize: 16)),
                                            MySizedBox.h4,

                                            Text(tools[index]['date'],
                                                style:
                                                    AppTextStyles.sanF400Grey),
                                            // MySizedBox.h16,
                                          ],
                                        ),
                                      ),
                                      Text("7 264.00 TL",
                                          style: AppTextStyles.sanF600
                                              .copyWith(fontSize: 16)),
                                      MySizedBox.w20,
                                      Icon(
                                        Icons.circle,
                                        color: selectedTool == index
                                            ? MyColors.mainColor
                                            : Colors.white,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
