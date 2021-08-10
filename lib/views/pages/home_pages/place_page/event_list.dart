import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          //aspectRatio: 2.0,

        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage("assets/images/test_event.png"),
              fit: BoxFit.cover,
            ),
          );
        }
    );
  }
}
