import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Staggerd extends StatefulWidget {
  @override
  _StaggerdState createState() => _StaggerdState();
}

class _StaggerdState extends State<Staggerd> {
  @override
  Widget build(BuildContext context) {
    return ProductsGrid([
      Product(
        manufacturer: 'Cadbury',
        title: 'Dairy Milk Chocolate Freddo',
        perHundredGramm: 143,
        price: 0.5,
      ),
      Product(
        manufacturer: 'Cadbury',
        title: 'Caranello Koala Chocolate',
        perHundredGramm: 143,
        price: 0.5,
      ),
      Product(
        manufacturer: 'Mama',
        title: 'Shrimp Tom Yam Noodles Jumbo Pack',
        perHundredGramm: 143,
        price: 0.5,
      ),
      Product(
        manufacturer: 'Mama',
        title: 'Pork Noodle Jumbo Pack',
        perHundredGramm: 0.62,
        price: 0.72,
      ),
      Product(
        manufacturer: 'Cadbury',
        title: 'Dairy Milk Chocolate Freddo',
        perHundredGramm: 0.62,
        price: 0.72,
      ),
      Product(
        manufacturer: 'Someone',
        title: 'Something',
        perHundredGramm: 0.1,
        price: 1,
      ),
      Product(
        manufacturer: 'Someone',
        title: 'Something',
        perHundredGramm: 0.1,
        price: 1,
      ),
      Product(
        manufacturer: 'Someone',
        title: 'Something',
        perHundredGramm: 0.1,
        price: 1,
      ),
      Product(
        manufacturer: 'Someone',
        title: 'Something',
        perHundredGramm: 0.1,
        price: 1,
      ),
      Product(
        manufacturer: 'Someone',
        title: 'Something',
        perHundredGramm: 0.1,
        price: 1,
      )
    ]);
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.products);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    var oddList = <Product>[];
    var evenList = <Product>[];
    products.asMap().forEach((key, value) {
      key.isEven ? evenList.add(value) : oddList.add(value);
    });
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: const Radius.circular(40),
          bottomRight: const Radius.circular(40),
        ),
        child: Scrollable(
          physics: ClampingScrollPhysics(),
          viewportBuilder: (_, viewportOffset) => Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Viewport(
                    axisDirection: AxisDirection.down,
                    offset: viewportOffset,
                    slivers: oddList
                        .map((el) => SliverToBoxAdapter(
                              child: VerticalProductCard(el),
                            ))
                        .toList(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Viewport(
                    axisDirection: AxisDirection.down,
                    offset: viewportOffset,
                    slivers: evenList
                        .asMap()
                        .map(
                          (key, el) => MapEntry(
                            key,
                            SliverToBoxAdapter(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: key == 0 ? 70 : 0),
                                child: VerticalProductCard(el),
                              ),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

@immutable
class Product {
  final double price;
  final String manufacturer;
  final String title;
  final double perHundredGramm;

  const Product({
    required this.price,
    required this.manufacturer,
    required this.title,
    required this.perHundredGramm,
  });
}

class VerticalProductCard extends StatefulWidget {
  const VerticalProductCard(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  _VerticalProductCardState createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> {
  bool isFavorite = false;

  _onTap() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'coles',
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          Center(
            child: Container(
              width: 50,
              child: Placeholder(
                fallbackHeight: 50,
                fallbackWidth: 30,
              ),
            ),
          ),
          Text('\$ ${widget.product.price}'),
          Text(widget.product.manufacturer),
          Text(widget.product.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$${widget.product.perHundredGramm} per 100G',
                style: TextStyle(fontSize: 12),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.redAccent : Colors.grey,
                ),
                onPressed: _onTap,
              )
            ],
          )
        ],
      ),
    );
  }
}
