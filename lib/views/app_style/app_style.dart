import 'package:flutter/material.dart';
class AppStyle {
  AppStyle._();

  static const BoxShadow boxShadow = BoxShadow(
    color: Colors.black26,
    blurRadius: 2,
    offset: Offset(0,1)
  );

  static const LinearGradient linearGradient = LinearGradient(
      stops: [
        .4,
        .9
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black54
      ]
  );

  static double getScaleFactor(BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.portrait
        ?  MediaQuery.of(context).size.width/(360) > 1.5
        ? 1.5 : MediaQuery.of(context).size.width/(360)
        : MediaQuery.of(context).size.height/(360) > 1.5
        ? 1.5 : MediaQuery.of(context).size.height/(360);
  }

  static EdgeInsets getListPadding(BuildContext context){
    return EdgeInsets.only(
      top: 16 * AppStyle.getScaleFactor(context),
      left: 16 * AppStyle.getScaleFactor(context),
      right: 16 * AppStyle.getScaleFactor(context),
      bottom: 100 * AppStyle.getScaleFactor(context),
    );
  }

}