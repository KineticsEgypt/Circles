import 'package:circles/widgets/place_item.dart';
import 'package:flutter/material.dart';

import 'circles_list.dart';
class PlacesList extends StatefulWidget {
  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  bool testFavorite = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (listContext,itemIndex){
          return PlaceItem(
            placeImage: "assets/images/test_image.png",
            badgesImages: [
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
              "assets/images/test_image.png",
            ],
            isFavorite: testFavorite,
            onFavoriteTap: (){
              testFavorite = !testFavorite;
              setState(() {});
            },
          );
        }
    );
  }
}
