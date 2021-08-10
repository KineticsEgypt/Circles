import 'dart:ui';

import 'package:flutter/material.dart';
class FormBackground extends StatelessWidget {
  final Widget child;
  const FormBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
          image: AssetImage(
              MediaQuery.of(context)
                  .platformBrightness == Brightness.light
                  ?"assets/images/background_light.jpg"
                  :"assets/images/background_dark.png"
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [.2,1],
          colors: [
            Theme.of(context).colorScheme.secondaryVariant,
            Theme.of(context).colorScheme.secondary,

            //Theme.of(context).accentColor
          ],
        )
      ),
      child: child,
    );
  }
}
