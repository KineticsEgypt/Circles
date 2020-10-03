import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
class CIconButton extends StatelessWidget {
  final IconData iconData;
  final Widget icon;
  final VoidCallback onTap;

  const CIconButton({
    Key key,
    this.iconData,
    this.icon,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 48 * CirclesTextStyles.getScaleFactor(context),
        width: 48 * CirclesTextStyles.getScaleFactor(context),
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
                color: CirclesColors.yellow,
                size: 24 * CirclesTextStyles.getScaleFactor(context),
              ),
              color: CirclesColors.yellow,
              iconSize: 24 * CirclesTextStyles.getScaleFactor(context),
              onPressed: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
