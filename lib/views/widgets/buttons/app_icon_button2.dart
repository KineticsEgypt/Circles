import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class AIconButton2 extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final VoidCallback onPressed;

  const AIconButton2({
    Key key,
    this.iconData,
    this.onPressed, this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42 * AppStyle.getScaleFactor(context),
      width: 42 * AppStyle.getScaleFactor(context),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8 * AppStyle.getScaleFactor(context)),
          primary: color ?? Theme.of(context).canvasColor,
          shape: CircleBorder(),
        ),
        onPressed: onPressed,
        child: Icon(
          iconData,size: 22 * AppStyle.getScaleFactor(context),
          color: color == null ? Colors.white :
          color.computeLuminance() > 0.5
              ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
