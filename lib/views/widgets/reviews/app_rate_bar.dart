import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/app_style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ARateBar extends StatelessWidget {

  final double rate;
  final double maxRating;
  final double minRating;
  final double itemSize;
  final bool tapOnlyMode;
  final EdgeInsets itemPadding;
  final Function(double) onRatingUpdate;
  const ARateBar({
    Key key,
    this.rate,
    this.itemSize = 12,
    this.maxRating = 5,
    this.minRating = 1,
    this.onRatingUpdate,
    this.tapOnlyMode = true,
    this.itemPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rate == -1 || rate == null
    ? SizedBox()
    : RatingBar(
      itemSize: itemSize * AppStyle.getScaleFactor(context),
      tapOnlyMode: tapOnlyMode,
      ignoreGestures: onRatingUpdate == null,
      allowHalfRating:  onRatingUpdate == null,
      initialRating: rate,
      updateOnDrag: true,
      minRating: minRating,
      maxRating: maxRating,
      direction: Axis.horizontal,
      //allowHalfRating: true,
      itemCount: 5,
      //glowColor: Colors.grey,
      glow: false,
      itemPadding: itemPadding ?? EdgeInsets.symmetric(horizontal: 2),
      ratingWidget: RatingWidget(
        full: Icon(FontAwesomeIcons.solidStar, color: Theme.of(context).accentColor,),
        half: Icon(FontAwesomeIcons.starHalfAlt, color: AColors.yellow,),
        empty: Icon(FontAwesomeIcons.star, color: AColors.yellow,),
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
