import 'package:circles/models/enums/place_pages.dart';
import 'package:circles/models/page.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/pages/home_pages/place_page/places_page.dart';
import 'package:circles/views/widgets/buttons/app_flat_button.dart';
import 'package:circles/views/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PlaceDrawer extends StatelessWidget {
  final Function(PlacePages) onChange;

  PlaceDrawer({
    Key key,
    @required this.onChange
  }) : super(key: key);

  final List<APage> _pages = [
    APage(icon: FontAwesomeIcons.calendarAlt,label: "Events"),
    APage(icon: FontAwesomeIcons.utensils,label: "Menus"),
    APage(icon: FontAwesomeIcons.cashRegister,label: "Reservations"),
    APage(icon: FontAwesomeIcons.store,label: "Branches"),
    APage(icon: FontAwesomeIcons.star,label: "Reviews"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160 * AppStyle.getScaleFactor(context),
              decoration: BoxDecoration(
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageLoader(
                    url: "https://cdn.pixabay.com/photo/2014/12/15/17/16/boardwalk-569314_960_720.jpg",
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8 * AppStyle.getScaleFactor(context),
                      vertical: 8 * AppStyle.getScaleFactor(context),
                    ),
                    decoration: BoxDecoration(
                      gradient: AppStyle.linearGradient
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 54 * AppStyle.getScaleFactor(context),
                              width: 54 * AppStyle.getScaleFactor(context),
                              margin: EdgeInsets.symmetric(
                                horizontal: 8 * AppStyle.getScaleFactor(context),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: ImageLoader(
                                  url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("User name",
                                  style: Theme.of(context).textTheme.headline6.copyWith(
                                    color: Colors.white
                                  ),
                                  textScaleFactor: AppStyle.getScaleFactor(context),
                                ),
                                Text("example@email.com",
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white
                                  ),
                                  textScaleFactor: AppStyle.getScaleFactor(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16 * AppStyle.getScaleFactor(context)
                  ),
                itemCount: _pages.length,
                itemBuilder: (context,index){
                    return TextButton.icon(
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                      ),
                      label: Text(_pages[index].label),
                      icon: Icon(_pages[index].icon),
                      onPressed: (){
                        onChange(PlacePages.values[index]);
                        Navigator.of(context).pop();
                      },
                    );
                }
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16 * AppStyle.getScaleFactor(context),
                vertical: 8 * AppStyle.getScaleFactor(context),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                          ),
                          label: Text("logout"),
                          icon: Icon(Icons.logout),
                          onPressed: (){

                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
