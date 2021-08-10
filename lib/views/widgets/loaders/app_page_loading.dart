import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
class APageLoading extends StatelessWidget {
  final bool withBackgroundColor;
  const APageLoading({Key key, this.withBackgroundColor = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: withBackgroundColor
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.transparent,
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.5,
        child: FlareActor(
            "assets/flares/circles_loading.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "loading"
        ),
      ),
    );
  }
}
