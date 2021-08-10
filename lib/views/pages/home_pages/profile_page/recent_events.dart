import 'package:circles/views/widgets/recent_event_item.dart';
import 'package:flutter/material.dart';
class RecentEvents extends StatefulWidget {
  @override
  _RecentEventsState createState() => _RecentEventsState();
}

class _RecentEventsState extends State<RecentEvents> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/7,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context,int itemIndex){
            return RecentEventItem();
          }
        ),
      ),
    );
  }
}
