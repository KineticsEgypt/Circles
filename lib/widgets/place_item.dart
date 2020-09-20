import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'buttons/researve_button.dart';
import 'c_rate_bar.dart';
class PlaceItem extends StatefulWidget {
  final String placeImage;
  final List<String> badgesImages;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const PlaceItem({Key key, this.placeImage, this.badgesImages, this.isFavorite, this.onFavoriteTap}) : super(key: key);

  @override
  _PlaceItemState createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem> with SingleTickerProviderStateMixin {

  bool _swap = false;
  double _positionTopLayer = 0;
  double _positionBottomLayer = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: Row(
        children: [
          Image(
            image: AssetImage(widget.placeImage),
            width: 100,
            height: 100,
          ),
          Expanded(
            child: Swiper(
              itemCount: 2,
              //pagination: new SwiperPagination(),
              //control: new SwiperControl(),
              layout: SwiperLayout.STACK,
              itemWidth: MediaQuery.of(context).size.width,
              itemBuilder: (BuildContext context,int index){
                if(index == 0)
                  return Container(
                    height: 108,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color:CirclesColors.grey,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.1),
                              spreadRadius: 2
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Place Name",
                                style: CirclesTextStyles.header4,
                                textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                    icon: AnimatedSwitcher(
                                      duration: Duration(milliseconds: 500),
                                      child: Icon(
                                        widget.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        key: ValueKey<bool>(widget.isFavorite),
                                        color: CirclesColors.red,
                                      ),
                                    ),
                                    onPressed: widget.onFavoriteTap
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: List.generate(
                                widget.badgesImages.length > 5
                                    ? 6
                                    : widget.badgesImages.length,
                                    (index) {
                                  if(index == 5)
                                    return Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: CirclesColors.yellow,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text(
                                          "+${widget.badgesImages.length - 5}",
                                          style: TextStyle(
                                            inherit: true,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: CirclesColors.grey,
                                          )
                                      ),
                                    );
                                  return Image(
                                    image: AssetImage(widget.badgesImages[index]),
                                    height: 24,
                                    width: 24,
                                  );
                                }
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: CRateBar(
                            itemSize: 18,
                            starsNumber: 3.2,
                            onRatingUpdate: (value){
                            },
                          ),
                        ),
                      ],
                    ),
                  );

                return Container(
                  height: 108,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: CirclesColors.grey,
                            spreadRadius: 2
                        )
                      ]
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Material(
                              color: CirclesColors.firozi,
                              child: IconButton(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                onPressed: (){},
                              )
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Material(
                              color: CirclesColors.lightBlue,
                              child: IconButton(
                                icon: Icon(
                                  Icons.map,
                                  color: Colors.white,
                                ),
                                onPressed: (){},
                              )
                          ),
                        ),
                        ReserveButton(
                          onTap: (){},
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}

class PlaceInfo extends StatelessWidget {

  final List<String> badgesImages;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final bool swap;

  const PlaceInfo({Key key, this.badgesImages, this.isFavorite, this.onFavoriteTap, this.swap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: swap ? Colors.black : CirclesColors.grey,
          boxShadow: [
            BoxShadow(
                color: swap ? CirclesColors.grey :Colors.black26,
                spreadRadius: 5
            )
          ]
      ),
      child: swap
          ? Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                  color: CirclesColors.firozi,
                  child: IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  )
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                  color: CirclesColors.lightBlue,
                  child: IconButton(
                    icon: Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  )
              ),
            ),
            ReserveButton(
              onTap: (){},
            ),
          ],
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Place Name",
                  style: CirclesTextStyles.header4,
                  textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          key: ValueKey<bool>(isFavorite),
                          color: CirclesColors.red,
                        ),
                      ),
                      onPressed: onFavoriteTap
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: List.generate(
                 badgesImages.length > 5
                      ? 6
                      : badgesImages.length,
                      (index) {
                    if(index == 5)
                      return Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: CirclesColors.yellow,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                            "+${badgesImages.length - 5}",
                            style: TextStyle(
                              inherit: true,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: CirclesColors.grey,
                            )
                        ),
                      );
                    return Image(
                      image: AssetImage(badgesImages[index]),
                      height: 24,
                      width: 24,
                    );
                  }
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: CRateBar(
              itemSize: 18,
              starsNumber: 3.2,
              onRatingUpdate: (value){
              },
            ),
          ),
        ],
      ),
    );
  }
}

