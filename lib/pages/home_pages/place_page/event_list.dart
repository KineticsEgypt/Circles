import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white70
            )
        ),
        autoplay: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (listContext,itemIndex){
          return Container(
            child: Image(
              image: AssetImage("assets/images/test_event.png"),
              fit: BoxFit.cover,
            ),
          );
        }
    );
  }
}
