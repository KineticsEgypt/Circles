import 'package:circles/views/widgets/places/place_item.dart';
import 'package:flutter/material.dart';

import '../../pages/home_pages/place_page/circles_list.dart';
class PlacesList extends StatefulWidget {
  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  bool testFavorite = false;
  int _viewItemIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int itemIndex) {
          return PlaceItem(
            placeImage: "assets/images/test_image.png",
            index: _viewItemIndex == itemIndex ? 1 : 0,
            onIndexChanged: (index){
              print(index);
              if(index== 1){
                _viewItemIndex = itemIndex;
                print(_viewItemIndex);
                setState(() {});
              }
            },
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
              "assets/images/test_image.png",
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
        },
        childCount: 15
      ),
    );
  }
}
