import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CRateBar extends StatelessWidget {

  final double starsNumber;
  final double maxRating;
  final double minRating;
  final double itemSize;
  final bool ignoreGestures;
  final bool tapOnlyMode;
  final EdgeInsets itemPadding;
  final Function(double) onRatingUpdate;
  const CRateBar({
    Key key,
    this.starsNumber,
    this.itemSize,
    this.ignoreGestures = true,
    this.maxRating = 5,
    this.minRating = 1,
    this.onRatingUpdate,
    this.tapOnlyMode = true,
    this.itemPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return starsNumber == -1
    ? Container(
      height: 14,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: Text(
          "New",
          textScaleFactor: AppStyle.getScaleFactor(context),
          style: TextStyle(
              color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    )
    :RatingBar(
      itemSize: itemSize,
      tapOnlyMode: tapOnlyMode,
      ignoreGestures: ignoreGestures,
      allowHalfRating: ignoreGestures,
      initialRating: starsNumber,
      minRating: 1,
      maxRating: maxRating,
      direction: Axis.horizontal,
      //allowHalfRating: true,
      itemCount: 5,
      //glowColor: Colors.grey,
      glow: false,
      itemPadding: itemPadding ?? EdgeInsets.symmetric(horizontal: 2),
      ratingWidget: RatingWidget(
        full: Icon(FontAwesomeIcons.solidStar, color: Theme.of(context).accentColor,),
        half: Icon(FontAwesomeIcons.starHalfAlt, color: Theme.of(context).accentColor,),
        empty: Icon(FontAwesomeIcons.star, color: Theme.of(context).accentColor,),
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
