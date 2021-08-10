import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class ATextButton extends StatelessWidget {

  final Color color;
  final String text;
  final Alignment alignment;
  final VoidCallback onTap;

  const ATextButton({
    Key key,
    this.color,
    this.text,
    this.onTap,
    this.alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        alignment: alignment
      ),
      child: Text(
        text ?? "",
        style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: color,
          fontWeight: FontWeight.bold
        ),
        textScaleFactor: AppStyle.getScaleFactor(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
