import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class RateBarWithRatio extends StatelessWidget {
  final int totalRate;
  final int rate;

  const RateBarWithRatio({Key key, this.totalRate, this.rate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8 * AppStyle.getScaleFactor(context),
      margin: EdgeInsets.symmetric(
        vertical: 1.5 * AppStyle.getScaleFactor(context),
        horizontal: 8 * AppStyle.getScaleFactor(context),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: rate,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            flex: totalRate - rate,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
