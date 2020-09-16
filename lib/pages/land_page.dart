import 'package:circles_design/widgets/backgrounds/arc_bottom.dart';
import 'package:circles_design/widgets/backgrounds/arc_top.dart';
import 'package:circles_design/widgets/c_icon_button.dart';
import 'package:flutter/material.dart';
class LandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CIconButton(),
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
