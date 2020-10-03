import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/place.dart';
import 'package:circles/models/product.dart';
import 'package:circles/pages/home_pages/place_page/place_details/products_list.dart';
import 'package:circles/pages/home_pages/place_page/reserve_page/researve_page.dart';
import 'package:circles/widgets/backgrounds/arc_bottom.dart';
import 'package:circles/widgets/buttons/c_colored_icon_button.dart';
import 'package:circles/widgets/buttons/c_icon_button.dart';
import 'package:circles/widgets/buttons/c_small_button.dart';
import 'package:flutter/material.dart';

import '../circles_list.dart';
import '../event_list.dart';
class PlaceDetailsPage extends StatefulWidget {
  static final String id = "/place/details";

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  double _viewBadgesSpace = 1.5;
  int _readMoreIndex = -1;
  GlobalKey _listKey = GlobalKey();
  double _listHeight;
  List<String> _badges = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                  return <Widget>[
                    // Events List
                    SliverAppBar(
                      automaticallyImplyLeading: false,
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
                body: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight ,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CustomPaint(
                          painter: ArcBottom(radius: MediaQuery.of(context).size.height/2.4,),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        // places List
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              "Kazoku ---- ----",
                                            style: CirclesTextStyles.header4,
                                          ),
                                          //SizedBox(height: 8,),
                                          SizedBox(
                                            height: 52,
                                            width: MediaQuery.of(context).size.width,
                                            child: InkWell(
                                              onTap: (){
                                                if(_viewBadgesSpace == 1.5){
                                                  _viewBadgesSpace = .01;
                                                } else {
                                                  _viewBadgesSpace = 1.5;
                                                }
                                                setState(() {});
                                              },
                                              child: AnimatedSwitcher(
                                                duration: Duration(milliseconds: 500),
                                                child: Wrap(
                                                  alignment: WrapAlignment.start,
                                                  runAlignment: WrapAlignment.start,
                                                  key: ValueKey(_viewBadgesSpace),
                                                  children:  List.generate(
                                                      _badges.length >
                                                          MediaQuery.of(context).size.width ~/_viewBadgesSpace ~/32
                                                          ? MediaQuery.of(context).size.width ~/_viewBadgesSpace ~/32 +1
                                                          : _badges.length,
                                                          (index) {
                                                        int hidedItems = MediaQuery.of(context).size.width ~/_viewBadgesSpace ~/32;
                                                        //print(hidedItems);
                                                        if(index == hidedItems)
                                                          return Container(
                                                            padding: EdgeInsets.all(4),
                                                            decoration: BoxDecoration(
                                                              color: CirclesColors.yellow,
                                                              borderRadius: BorderRadius.circular(24),
                                                            ),
                                                            child: Text(
                                                                "+${_badges.length - hidedItems}",
                                                                style: TextStyle(
                                                                  inherit: true,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: CirclesColors.grey,
                                                                )
                                                            ),
                                                          );
                                                        return Image(
                                                          image: AssetImage(_badges[index]),
                                                          height: 28,
                                                          width: 28,
                                                        );
                                                      }
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          CColoredIconButton(
                                            color: CirclesColors.firozi,
                                            iconDate: Icons.phone,
                                            scaleFactor: .7,
                                            onTap: (){},
                                          ),
                                          SizedBox(width: 8,),
                                          CColoredIconButton(
                                            color: CirclesColors.lightBlue,
                                            iconDate: Icons.map,
                                            scaleFactor: .7,
                                            onTap: (){},
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4,),
                                      CSmallButton(
                                        text: "Reserve",
                                        onTap: (){
                                          Navigator.of(context).pushNamed(
                                              ReservePage.id,
                                            arguments: Place(
                                              id: "1",
                                              name: "some place name",
                                              imagePath: "assets/images/test_image.png",
                                              coverImagePath: "assets/images/test_place_cover.png",
                                            )
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                key: _listKey,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: _readMoreIndex == -1
                                      ? AlwaysScrollableScrollPhysics()
                                      : NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                    itemBuilder: (context,itemIndex){
                                      return ProductsList(
                                        title: "some title name $itemIndex",
                                        readMore: _readMoreIndex == itemIndex,
                                        height: _readMoreIndex == itemIndex
                                            ? 400 * CirclesTextStyles.getScaleFactor(context)
                                            : 200 * CirclesTextStyles.getScaleFactor(context),
                                        onReadMore: (readMore){
                                          if(readMore){
                                            _readMoreIndex = itemIndex;
                                          } else {
                                            _readMoreIndex = -1;
                                          }

                                          _listHeight = _listKey.currentContext.size.height;
                                          setState(() {});
                                        },
                                        products: List.generate(30, (index) => Product(
                                          id: index.toString(),
                                          name: "product name $index",
                                          imagePath: itemIndex % 2 == 0
                                              ? "assets/images/test_product.png"
                                              : "assets/images/test_product2.png",
                                          price: "3000",
                                        )),
                                      );
                                    }
                                ),
                              ),

                            ],
                          ),
                        ),
                        // circles list
                        CirclesList(),
                      ],
                    ),
                  ],
                )
            ),
            CIconButton(
              iconData: Icons.arrow_back,
              onTap: (){Navigator.of(context).pop();},
            ),
          ],
        ),
      ),
    );
  }
}
