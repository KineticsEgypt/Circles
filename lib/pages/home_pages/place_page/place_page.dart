import 'package:circles/pages/home_pages/place_page/event_list.dart';
import 'package:circles/pages/home_pages/place_page/places_list.dart';
import 'package:flutter/material.dart';

import 'circles_list.dart';
class PlacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            // Events List
            SliverAppBar(
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: EventList(),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: MediaQuery.of(context).size.height/4 ,
            ),
          ];
        },
        body: Column(
          children: [
            // places List
            Expanded(
              child: PlacesList(),
            ),
            // circles list
            CirclesList(),
          ],
        )
    );
  }
}
