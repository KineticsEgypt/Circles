import 'package:circles/models/reviews.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/titles/description_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../image_loader.dart';
import 'app_rate_bar.dart';
class ReviewItem extends StatelessWidget {

  final Review review;
  final Function(Review) onPressed;
  final Function(Review) onEdit;
  final Future<void> Function(Review) onDelete;

  const ReviewItem({
    Key key,
    this.review,
    this.onPressed,
    this.onEdit,
    this.onDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 8 * AppStyle.getScaleFactor(context)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey,width: .5),
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54 * AppStyle.getScaleFactor(context),
            width: 54 * AppStyle.getScaleFactor(context),
            margin: EdgeInsets.symmetric(horizontal: 8 * AppStyle.getScaleFactor(context)),
            decoration: BoxDecoration(
                shape: BoxShape.circle ,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0,2)
                  )
                ]
            ),
            child: ClipOval(
              child: ImageLoader(
                url: review.user.image,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.user.name,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                        textScaleFactor: AppStyle.getScaleFactor(context),
                      ),
                    ),
                    ARateBar(rate: review.rate,)
                  ],
                ),
                DescriptionText(
                 // width: MediaQuery.of(context).size.width/3,
                  text: review.comment,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      DateFormat.yMd().add_jm().format(review.date),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                      textScaleFactor: AppStyle.getScaleFactor(context),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
