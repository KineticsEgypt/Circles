import 'package:circles/app_style/colors.dart';
import 'package:flutter/material.dart';
class CIconButton extends StatelessWidget {
  final IconData iconData;
  final Widget icon;
  final VoidCallback onTap;

  const CIconButton({
    Key key,
    this.iconData = Icons.search,
    this.icon,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
             color: Colors.grey[850]
          ),
          boxShadow: [
            BoxShadow(
              color:  Colors.grey[800],
              blurRadius: 10,
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
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: IconButton(
            key: ValueKey(iconData),
            icon: icon
            ?? Icon(
                iconData,
              color: CirclesColors.yellow,
            ),
            color: CirclesColors.yellow,
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}
