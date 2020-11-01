import 'dart:ui';

import 'package:circles/app_style/colors.dart';
import 'package:circles/widgets/cinema/cinema_horizontal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
              child: Swiper(
                  itemCount: 10,
                onIndexChanged: (index){
                    _imagePath = index %2 == 0
                        ? "assets/images/test_movie.jpeg"
                        : "assets/images/test_profile_image.jpg";
                    setState(() {});
                },
                layout: SwiperLayout.TINDER,
                itemHeight: MediaQuery.of(context).size.height/1.8,
                itemWidth: MediaQuery.of(context).size.width/1.2,
                itemBuilder: (context,itemIndex){
                    return CinemaHorizontalItem(
                      heroTag: itemIndex,
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
