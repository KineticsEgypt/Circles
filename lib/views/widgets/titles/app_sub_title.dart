import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class ASubTitle extends StatelessWidget {
  final String text;
  const ASubTitle(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
      textScaleFactor: AppStyle.getScaleFactor(context),
    );
  }
}
