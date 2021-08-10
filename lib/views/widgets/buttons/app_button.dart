import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class AButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const AButton({
    Key key,
    this.color,
    this.text,
    this.onPressed
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color _textColor = color == null ?
    Theme.of(context).colorScheme.primary.computeLuminance() > 0.5
        ? Colors.black : Colors.white:
    color.computeLuminance() > 0.5
        ? Colors.black : Colors.white;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: 16
          ),
          primary: color,
          onPrimary: _textColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: _textColor
          ),
          textScaleFactor: AppStyle.getScaleFactor(context),
        ),
        onPressed: onPressed
    );
  }
}
