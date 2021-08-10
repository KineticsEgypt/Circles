import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class AButtonWithIcon extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final IconData iconData;
  final VoidCallback onTap;

  const AButtonWithIcon({
    Key key,
    this.color,
    this.text,
    this.onTap, this.iconData, this.textColor
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color _textColor = textColor ?? (color == null ?
    Theme.of(context).colorScheme.primary.computeLuminance() > 0.5
        ? Colors.black : Colors.white:
    color.computeLuminance() > 0.5
        ? Colors.black : Colors.white);
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: 8* AppStyle.getScaleFactor(context),
              horizontal: 16* AppStyle.getScaleFactor(context),
          ),
          primary: color,
          onPrimary: _textColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          ),
        ),
        icon: Icon(
          iconData,
          color: _textColor,
          size: 24 * AppStyle.getScaleFactor(context),
        ),
        label:Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: _textColor
          ),
          textScaleFactor: AppStyle.getScaleFactor(context),
        ),
        onPressed: onTap
    );
  }
}
