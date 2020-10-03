import 'dart:ui';

import 'package:circles/app_style/colors.dart';
import 'package:circles/widgets/cinema_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class CinemaList extends StatefulWidget {
  @override
  _CinemaListState createState() => _CinemaListState();
}

class _CinemaListState extends State<CinemaList> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String _imagePath= "assets/images/test_profile_image.jpg";
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 10);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Image(
            key: ValueKey(_imagePath),
            height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width,
            image: AssetImage(_imagePath),
            fit: BoxFit.cover,
          ),
        ),

        Align(
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
                  return CinemaItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}
