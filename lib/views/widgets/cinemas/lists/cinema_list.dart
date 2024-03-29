import 'package:circles/views/widgets/buttons/app_icon_button1.dart';
import 'package:flutter/material.dart';
import 'cinema_horizontal_list.dart';
import 'cinema_vertical_list.dart';
class CinemaList extends StatefulWidget {
  @override
  _CinemaListState createState() => _CinemaListState();
}

class _CinemaListState extends State<CinemaList> {
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 600),
          child: _isVertical
              ? CinemaHorizontalList()
              : CinemaVerticalList(),
        ),
        // menu button
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 70),
            child: Align(
              alignment: Alignment.topRight,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: FadeTransition(child: child,opacity: animation,),
                    turns: animation,
                  );
                },
                child: AIconButton1(
                  key: ValueKey(_isVertical),
                  iconData:  _isVertical
                      ? Icons.view_carousel : Icons.view_day,
                  onTap: (){
                    _isVertical = !_isVertical;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
