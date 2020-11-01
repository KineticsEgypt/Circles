import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/pages/home_pages/place_page/place_details/place_detials_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'buttons/c_colored_icon_button.dart';
import 'buttons/researve_button.dart';
import 'c_rate_bar.dart';
class PlaceItem extends StatefulWidget {
  final String placeImage;
  final List<String> badgesImages;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final Function(int) onIndexChanged;
  final int index;

  const PlaceItem({
    Key key,
    this.placeImage,
    this.badgesImages,
    this.isFavorite,
    this.onFavoriteTap,
    this.onIndexChanged,
    this.index
  }) : super(key: key);

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
              onIndexChanged: widget.onIndexChanged,
              layout: SwiperLayout.STACK,
              itemWidth: MediaQuery.of(context).size.width,
              itemBuilder: (BuildContext context,int index){
                if(index == 0)
                  return MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.of(context).pushNamed(PlaceDetailsPage.id);
                    },
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: 108,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:CirclesColors.grey,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.1),
                                    spreadRadius: 2
                                )
                              ]
                          ),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Place Name",
                                          style: CirclesTextStyles.header5,
                                          textScaleFactor: CirclesTextStyles.getScaleFactor(context) > 1.3
                                              ? 1.3
                                              : CirclesTextStyles.getScaleFactor(context),
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
                                          widget.badgesImages.length >
                                          MediaQuery.of(context).size.width ~/1.8 ~/32
                                              ? MediaQuery.of(context).size.width ~/1.8 ~/32 +1
                                              : widget.badgesImages.length,
                                              (index) {
                                                int hidedItems = MediaQuery.of(context).size.width ~/1.8 ~/32;
                                            if(index == hidedItems)
                                              return Container(
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color: CirclesColors.yellow,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                    "+${widget.badgesImages.length - hidedItems}",
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

                            ],
                          ),
                        ),
                        Container(
                          width: 6,
                          height: 100,
                          padding: const EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)
                              ),
                              color:CirclesColors.yellow.withOpacity(1),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.1),
                                    spreadRadius: 2
                                )
                              ]
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
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: CirclesColors.grey,
                            spreadRadius: 2
                        )
                      ]
                  ),
                  child: Container(
                    child: Wrap(
                      runAlignment: WrapAlignment.spaceEvenly,
                      alignment:  WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        CColoredIconButton(
                          color: CirclesColors.firozi,
                          iconDate: Icons.phone,
                          onTap: (){},
                        ),
                        CColoredIconButton(
                          color: CirclesColors.lightBlue,
                          iconDate: Icons.map,
                          onTap: (){},
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

