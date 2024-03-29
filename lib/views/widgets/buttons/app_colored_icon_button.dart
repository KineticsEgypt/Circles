import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class CColoredIconButton extends StatelessWidget {
  final Color color;
  final IconData iconDate;
  final VoidCallback onTap;
  final double scaleFactor;
  const CColoredIconButton({Key key, this.color, this.iconDate, this.onTap,this.scaleFactor = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 48 * scaleFactor * AppStyle.getScaleFactor(context),
      width: 48 * scaleFactor * AppStyle.getScaleFactor(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
            color: color,
            child: IconButton(
              icon: Icon(
                iconDate,
                color: Colors.white,
              ),
              iconSize:  24 * scaleFactor * AppStyle.getScaleFactor(context),
              onPressed: onTap,
            )
        ),
      ),
    );
  }
}
