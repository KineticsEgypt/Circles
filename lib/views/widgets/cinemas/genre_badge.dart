import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class GenreBadge extends StatelessWidget {
  final String text;
  const GenreBadge({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(
          color: Theme.of(context).accentColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text ?? "",
        style: Theme.of(context).textTheme.subtitle1,
        textScaleFactor: AppStyle.getScaleFactor(context),
      ),
    );
  }
}
