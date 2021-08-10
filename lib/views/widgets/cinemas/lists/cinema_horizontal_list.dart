import 'dart:ui';
import 'package:flutter/material.dart';

import '../cinema_horizontal_item.dart';
class CinemaHorizontalList extends StatefulWidget {
  @override
  _CinemaHorizontalListState createState() => _CinemaHorizontalListState();
}

class _CinemaHorizontalListState extends State<CinemaHorizontalList>
    with SingleTickerProviderStateMixin {

  String _imagePath= "assets/images/test_profile_image.jpg";

  AnimationController _controller;
  Animation<Offset> _offsetAnimationLeft;
  Animation<Offset> _offsetAnimationRight;
  bool _firstTime = true;
  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _offsetAnimationLeft = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(-1.0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _offsetAnimationRight = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(1.0, 0.0),
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
    return Stack(
      children: [
        SlideTransition(
          position: _offsetAnimationLeft,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Image(
              key: ValueKey(_imagePath),
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width,
              image: AssetImage(_imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SlideTransition(
          position: _offsetAnimationRight,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height/1.8,
              child: PageView.builder(
                controller: _pageViewController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index){
                    _imagePath = index %2 == 0
                        ? "assets/images/test_movie.jpeg"
                        : "assets/images/test_profile_image.jpg";
                    setState(() {});
                },
                itemCount: 20,
                itemBuilder:(BuildContext context, int index){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height/1.8,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: CinemaHorizontalItem(
                        heroTag: index,
                      ),
                    );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
