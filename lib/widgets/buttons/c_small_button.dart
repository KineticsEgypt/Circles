import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
class CSmallButton extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final VoidCallback onTap;

  const CSmallButton({
    Key key,
    this.color = CirclesColors.yellow,
    this.text,
    this.fontSize,
    this.onTap

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30 *  CirclesTextStyles.getScaleFactor(context),
        color: color,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Gothic",
              fontSize: fontSize ?? 14,
              //fontWeight: FontWeight.bold,
              color: color.computeLuminance() > 0.5
                  ? Colors.black : Colors.white
          ),
          textScaleFactor: CirclesTextStyles.getScaleFactor(context),
        ),
        onPressed: onTap
    );
  }
}
