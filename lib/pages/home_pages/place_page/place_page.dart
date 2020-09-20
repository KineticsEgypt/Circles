import 'package:circles/pages/home_pages/place_page/event_list.dart';
import 'package:circles/pages/home_pages/place_page/places_list.dart';
import 'package:flutter/material.dart';

import 'circles_list.dart';
class PlacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Events List
        SizedBox(
          height: MediaQuery.of(context).size.height/4,
          child: EventList(),
        ),
        // places List
        Expanded(
          child: PlacesList(),
        ),
        // circles list
        SizedBox(
          height: MediaQuery.of(context).size.height/10,
          child: CirclesList(),
        ),
      ],
    );
  }
}
