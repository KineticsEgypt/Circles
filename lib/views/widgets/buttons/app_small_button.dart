import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class CSmallButton extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final VoidCallback onTap;

  const CSmallButton({
    Key key,
    this.color,
    this.text,
    this.fontSize,
    this.onTap

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: color == null ? null :
              color.computeLuminance() > 0.5
                  ? Colors.black : Colors.white
          ),
          textScaleFactor: AppStyle.getScaleFactor(context),
        ),
        onPressed: onTap
    );
  }
}
