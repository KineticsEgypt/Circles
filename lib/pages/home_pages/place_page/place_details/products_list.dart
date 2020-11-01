import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/product.dart';
import 'package:circles/widgets/product_item.dart';
import 'package:flutter/material.dart';
class ProductsList extends StatefulWidget {

  final List<Product> products;
  final String title;
  final bool readMore;
  final double height;
  final Function(bool) onReadMore;
  const ProductsList({
    Key key,
    this.products,
    this.title,
    this.readMore = false,
    this.onReadMore,
    this.height,
  }) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    int numberOfItemsInRow = MediaQuery.of(context).size.width ~/ (156 * CirclesTextStyles.getScaleFactor(context) *.74);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Some title here",
                  style: CirclesTextStyles.subTitleGolden,
                  textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                ),
              ),
            ),
            FlatButton(
                child: Text(
                  widget.readMore ? "Read Less" :"Read More",
                    style: CirclesTextStyles.subTitle2,
                ),
              onPressed: (){
                widget.onReadMore(!widget.readMore);
                //setState(() {});
              },
            )
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: widget.readMore
              ? widget.products.length % numberOfItemsInRow == 0
                  ?  (widget.products.length / numberOfItemsInRow) * 156.0 * CirclesTextStyles.getScaleFactor(context)
                  : ((widget.products.length / numberOfItemsInRow) +1) * 156.0 * CirclesTextStyles.getScaleFactor(context)
              : 156.0  * CirclesTextStyles.getScaleFactor(context),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Wrap(
             // padding: EdgeInsets.symmetric(horizontal: 4),
              key: ValueKey(widget.readMore),
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.spaceEvenly,
              children: List.generate(
                  widget.products.length,
                      (index){
                    return ProductItem(
                      product: widget.products[index],
                    );
                  }
              ),
            ),
          ),
        )
      ],
    );
  }
}
