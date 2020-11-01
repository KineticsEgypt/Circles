import 'package:circles/pages/home_pages/place_page/event_list.dart';
import 'package:circles/pages/home_pages/place_page/places_list.dart';
import 'package:flutter/material.dart';

import 'circles_list.dart';
class PlacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        // places List
        Expanded(
          child:CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
                SliverAppBar(
                stretch: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: EventList(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: MediaQuery.of(context).size.height/4 ,
              ),
              PlacesList()
            ],
          ),
        ),
        // circles list
        CirclesList(),
      ],
    );
  }
}
