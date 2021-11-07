import 'package:flutter/material.dart';
import 'dart:convert';
String productsJson =
    '{"last": [{"product_id":"62","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
    '{"product_id":"61","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
    '{"product_id":"57","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
    '{"product_id":"63","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
    '{"product_id":"64","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
    '{"product_id":"58","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}, '
    '{"product_id":"59","thumb":"sandwich.png","name":"Test Tilte","price":"\$55.00"}]}';

String categoriesJson = '{"categories":['
    '{"name":"Category 1","image":"icon.png","id":2}, '
    '{"name":"Category 2","image":"icon.png","id":4}, '
    '{"name":"Category 3","image":"icon.png","id":4}, '
    '{"name":"Category 4","image":"icon.png","id":4}, '
    '{"name":"Category 5","image":"icon.png","id":6}]}';



class InfoA extends StatefulWidget {
  InfoA({Key? key,}) : super(key: key);


  @override
  _InfoAState createState() => _InfoAState();
}

class _InfoAState extends State<InfoA> {
  final ScrollController _scrollController = ScrollController();

  List<dynamic>? products;
  List<dynamic>? categories;

  @override
  initState() {
    super.initState();

    Map<String, dynamic> decoded = json.decode(productsJson);
    products = decoded['last'];

    Map<String, dynamic> decodedCategories = json.decode(categoriesJson);
    categories = decodedCategories['categories'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String, String> category =
                  categories![index].cast<String, String>();
                  return Card(
                    child: Container(
                      height: double.infinity,
                      color: Colors.grey[200],
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Text(category["name"]!),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: categories!.length,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                Map<String, String> product =
                products![index].cast<String, String>();
                return Card(
                  child: Container(
                    color: Colors.grey[400],
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Center(
                          child: Text("Product ${product["product_id"]}")),
                    ),
                  ),
                );
              },
              childCount: products!.length,
            ),
          ),
        ],
      ),
    );
  }
}
