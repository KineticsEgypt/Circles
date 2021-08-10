import 'package:flutter/material.dart';

import '../cinema_vertical_item.dart';
class CinemaVerticalList extends StatefulWidget {
  @override
  _CinemaVerticalListState createState() => _CinemaVerticalListState();
}

class _CinemaVerticalListState extends State<CinemaVerticalList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimationTop;

  bool _firstTime = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _offsetAnimationTop = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if(_firstTime){
      _controller.forward();
      _firstTime = false;
    }
    return SlideTransition(
      position: _offsetAnimationTop,
      child: ListView.builder(
        itemCount: 10+1,
        itemBuilder: (context,itemIndex){
          if(itemIndex == 0)
            return SizedBox(height: 80,);
          return CinemaVerticalItem(heroTag: itemIndex,);
        },

      ),
    );
  }
}
