import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
class CButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onTap;

  const CButton({
    Key key,
    this.color = Colors.white,
    this.text,
    this.onTap
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
        child: Text(
          text,
          style: TextStyle(
           // fontFamily: "Gothic",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color.computeLuminance() > 0.5
                ? Colors.black : Colors.white
          ),
          textScaleFactor: CirclesTextStyles.getScaleFactor(context),
        ),
        onPressed: onTap
    );
  }
}
