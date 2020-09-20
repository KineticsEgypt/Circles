import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
class CFlatButton extends StatelessWidget {

  final Color textColor;
  final String text;
  final VoidCallback onTap;

  const CFlatButton({
    Key key,
    this.textColor,
    this.text,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FlatButton(
      onPressed: onTap,
      child: Text(
        text ?? "",
        style: TextStyle(
          fontSize: 16,
        ),
        textScaleFactor: CirclesTextStyles.getScaleFactor(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
