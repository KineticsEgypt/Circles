import 'package:circles/views/widgets/popular_spot_item.dart';
import 'package:flutter/material.dart';
class PopularSpotsList extends StatefulWidget {
  @override
  _PopularSpotsListState createState() => _PopularSpotsListState();
}

class _PopularSpotsListState extends State<PopularSpotsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/8,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context,int itemIndex){
            return PopularSpot();
          }
        ),
      ),
    );
  }
}
