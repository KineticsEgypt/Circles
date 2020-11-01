import 'package:circles/app_style/colors.dart';
import 'package:flutter/material.dart';
class CirclesTextStyles {

  static final TextStyle header4 = TextStyle(
      inherit: true,
      fontSize: 28,
      color: Colors.white,
      fontFamily: "Gothic"
  );

  static final TextStyle header5 = TextStyle(
    inherit: true,
    fontSize: 24,
    color: Colors.white,
    fontFamily: "Gothic"
  );

  static final TextStyle header5Black = TextStyle(
      inherit: true,
      fontSize: 24,
      //fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: "Gothic"
  );

  static final TextStyle header6 = TextStyle(
      inherit: true,
      fontSize: 18,
      color: Colors.white,
      fontFamily: "Gothic"
  );



  static final TextStyle header6Black = TextStyle(
      inherit: true,
      fontSize: 18,
      color: Colors.black,
      fontFamily: "Gothic"
  );

  static final TextStyle subTitleGolden = TextStyle(
      inherit: true,
      fontSize: 16,
      color: CirclesColors.yellow,
      fontFamily: "Gothic",
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subTitle1 = TextStyle(
      inherit: true,
      fontSize: 14,
      color: Colors.white,
      fontFamily: "Gothic"
  );

  static final TextStyle subTitle2 = TextStyle(
      inherit: true,
      fontSize: 14,
      color: CirclesColors.yellow,
      fontFamily: "Gothic"
  );

  static final TextStyle subTitle3 = TextStyle(
      inherit: true,
      fontSize: 14,
      color: Colors.black,
      fontFamily: "Gothic"
  );
  static final TextStyle body1 = TextStyle(
      inherit: true,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: "Gothic",

  );

  static final TextStyle body2 = TextStyle(
      inherit: true,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: CirclesColors.yellow,
      fontFamily: "Gothic"
  );

  static double getScaleFactor(BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.portrait
        ?  MediaQuery.of(context).size.width/(360) > 1.5
          ? 1.5 : MediaQuery.of(context).size.width/(360)
        : MediaQuery.of(context).size.height/(360) > 1.5
          ? 1.5 : MediaQuery.of(context).size.height/(360);
  }
}