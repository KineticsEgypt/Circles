import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class AIconButton1 extends StatelessWidget {
  final IconData iconData;
  final Widget icon;
  final VoidCallback onTap;

  const AIconButton1({
    Key key,
    this.iconData,
    this.icon,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48 * AppStyle.getScaleFactor(context),
      width: 48 * AppStyle.getScaleFactor(context),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[850]
        ),
        boxShadow: [
          BoxShadow(
              color:  Colors.grey[600],
              blurRadius: 6,
              spreadRadius: 1
          )
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.grey[800]
            ]
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: icon
            ?? Icon(
                iconData,
              color: Theme.of(context).accentColor,
              size: 24 * AppStyle.getScaleFactor(context),
            ),
            color: Theme.of(context).accentColor,
            iconSize: 24 * AppStyle.getScaleFactor(context),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}
