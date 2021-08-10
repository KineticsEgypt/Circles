import 'package:circles/controlers/providers/widgets/page_index_provider.dart';
import 'package:circles/views/pages/home_pages/place_page/places_page.dart';
import 'package:circles/views/widgets/backgrounds/arc_bottom.dart';
import 'package:circles/views/widgets/backgrounds/arc_top.dart';
import 'package:provider/provider.dart';
import '../../widgets/buttons/app_icon_button1.dart';
import 'package:flutter/material.dart';

import 'cinema_page/cinema_page.dart';
import 'home_menu.dart';
import 'home_search.dart';
import 'profile_page/profile_page.dart';

class Home extends StatefulWidget {
  static final String id = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_){
          setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    PageIndexProvider _pageIndexProvider = Provider.of<PageIndexProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        if(_pageIndexProvider.menuIsOpen
            || _pageIndexProvider.searchIsOpen ){
          print("back from WillPopScope");
          _pageIndexProvider.resetMenus();
          return false;
        }
        return true;
      },
      child: Stack(
        children: [
          Scaffold(
            endDrawerEnableOpenDragGesture: false,
            drawerEnableOpenDragGesture: false,
            drawerEdgeDragWidth: 0.0,
            key: _scaffoldKey,
            body: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: _pageIndexProvider.pageIndex == 0
                        ? Alignment.topLeft
                        : Alignment.bottomRight ,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CustomPaint(
                        painter: _pageIndexProvider.pageIndex == 0
                          ? ArcTop(radius: MediaQuery.of(context).size.height/2.4,)
                          : ArcBottom(radius: MediaQuery.of(context).size.height/2.4,),
                      ),
                    ),
                  ),
                  [
                    ProfilePage(),
                    PlacesPage(),
                    CinemaPage()
                  ].elementAt(_pageIndexProvider.pageIndex),
                  HomeSearch(),
                  HomeMenu()
                ],
              ),
            ),
          ),

          // menu button
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: FadeTransition(child: child,opacity: animation,),
                    turns: animation,
                  );
                },
                child: Hero(
                  tag: "menu tag",
                  child: AIconButton1(
                    key: ValueKey(_pageIndexProvider.menuIsOpen),
                    iconData:  _pageIndexProvider.menuIsOpen
                        ? Icons.close : Icons.menu,
                    onTap: (){
                      _pageIndexProvider.menuIsOpen = !_pageIndexProvider.menuIsOpen;
                    },
                  ),
                ),
              ),
            ),
          ),
          // search button
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: FadeTransition(child: child,opacity: animation,),
                    turns: animation,
                  );
                },
                child: AIconButton1(
                  key: ValueKey(_pageIndexProvider.searchIsOpen),
                  iconData:  _pageIndexProvider.searchIsOpen
                      ? Icons.close : Icons.search,
                  onTap: (){
                    _pageIndexProvider.searchIsOpen = !_pageIndexProvider.searchIsOpen;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
