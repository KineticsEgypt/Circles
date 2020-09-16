import 'package:circles/widgets/backgrounds/arc_bottom.dart';
import 'file:///C:/Users/maxas/AndroidStudioProjects/Circles/lib/widgets/buttons/c_icon_button.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  static final String id = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CIconButton(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CIconButton(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CustomPaint(
                  painter: ArcBottom(
                    radius: MediaQuery.of(context).size.height/2.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
