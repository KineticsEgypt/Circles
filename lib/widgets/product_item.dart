import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/product.dart';
import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(

     // width: itemWidth,
      child: Container(
       // width: 120 * CirclesTextStyles.getScaleFactor(context),
        //height: (itemWidth + 40) * CirclesTextStyles.getScaleFactor(context),
        height: 148 * CirclesTextStyles.getScaleFactor(context),
        margin: EdgeInsets.all(4),
        //padding: EdgeInsets.only(bottom: 8),
        child: AspectRatio(
          aspectRatio: .74,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Container(
                      //height: itemWidth,
                      decoration: BoxDecoration(
                        color: CirclesColors.lightGrey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color:  Colors.black.withOpacity(.4),
                          width: 4,
                        )
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage(product.imagePath),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8,right: 8,bottom: 8),
                    child: Column(
                      children: [
                        Text(
                          product.name,
                          style: CirclesTextStyles.body1,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                        ),
                        Text(
                          product.price,
                          style: CirclesTextStyles.body1,
                          textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
