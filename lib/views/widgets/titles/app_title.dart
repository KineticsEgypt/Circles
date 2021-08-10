import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class ATitle extends StatelessWidget {
  final String text;
  final bool center;
  final EdgeInsets padding;
  const ATitle(this.text, {Key key,this.padding,this.center = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        mainAxisAlignment: center
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline5,
            textScaleFactor: AppStyle.getScaleFactor(context),
          ),
        ],
      ),
    );
  }
}
