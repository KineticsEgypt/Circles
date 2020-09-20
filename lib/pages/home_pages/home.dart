import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/pages/home_pages/place_page/place_page.dart';
import 'package:circles/widgets/backgrounds/arc_bottom.dart';
import 'package:circles/widgets/circle_item.dart';
import 'package:circles/widgets/place_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/buttons/c_icon_button.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  static final String id = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CustomPaint(
                      painter: ArcBottom(
                        radius: MediaQuery.of(context).size.height/2.4,
                      ),
                    ),
                  ),
                ),
                [
                  PlacesPage()
                ].elementAt(0),

              ],
            ),
          ),
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Drawer(
              child: ListView(
                children: [
                  ListTile(title: Text("some title"),),
                  ListTile(title: Text("some title"),),
                  ListTile(title: Text("some title"),),
                  ListTile(title: Text("some title"),),
                ],
              ),
            ),
          ),
          endDrawer: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Drawer(
              child: ListView(
                children: [
                  ListTile(title: Text("some title"),),
                  ListTile(title: Text("some title"),),
                  ListTile(title: Text("some title"),),
                  ListTile(title: Text("some title"),),
                ],
              ),
            ),
          ),
        ),
        // menu button
        Align(
          alignment: Alignment.topLeft,
          child: CIconButton(
            startIconData: Icons.menu,
            endIconData: Icons.close,
            onOpen: (){
              _scaffoldKey.currentState.openDrawer();
            },
            onClose: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        // search button
        Align(
          alignment: Alignment.topRight,
          child: CIconButton(
            startIconData: Icons.search,
            endIconData: Icons.close,
            onOpen: (){
              _scaffoldKey.currentState.openEndDrawer();
            },
            onClose: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
