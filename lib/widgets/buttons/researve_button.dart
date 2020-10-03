import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
class ReserveButton extends StatefulWidget {
  final VoidCallback onTap;

  const ReserveButton({Key key, this.onTap}) : super(key: key);

  @override
  _ReserveButtonState createState() => _ReserveButtonState();
}

class _ReserveButtonState extends State<ReserveButton> {
  bool _onTapDown = false;
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: "some data for draggable",
      child: SizedBox(
        height: 40 * .9,
        width: 130 * .9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            FlareActor(
                "assets/flares/waves.flr",
                alignment:Alignment.center,
                fit:BoxFit.contain,
            ),
            Text(
                "Reserve With Circle",
              style: TextStyle(
                  inherit: true,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Gothic",
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                    ),
                  ]
              ),

            ),
          ],
        ),
      ),
      feedback: Container(
        height: 84,
        width: 84,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
      childWhenDragging: SizedBox(
        height: 40 * .9,
        width: 130 * .9,
        child: Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              FlareActor(
                  "assets/flares/waves.flr",
                  alignment:Alignment.center,
                  fit:BoxFit.contain,
                  animation: "moving"
              ),
              Text(
                "Reserve With Circle",
                style: TextStyle(
                    inherit: true,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Gothic",
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                      ),
                    ]
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
