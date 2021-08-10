import 'package:circles/models/enums/place_pages.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/pages/home_pages/place_page/places_page.dart';
import 'package:circles/views/pages/place_owner/event/events_page.dart';
import 'package:circles/views/pages/place_owner/place_drawer.dart';
import 'package:circles/views/pages/place_owner/reviews/reviews_page.dart';
import 'package:circles/views/widgets/buttons/app_icon_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PlaceDashboard extends StatefulWidget {
  static final String id = "/place-dashboard";
  const PlaceDashboard({Key key}) : super(key: key);

  @override
  _PlaceDashboardState createState() => _PlaceDashboardState();
}

class _PlaceDashboardState extends State<PlaceDashboard> {

  // current selected key
  PlacePages _selectedPage = PlacePages.reservations;

  // current selected key
  GlobalKey<NavigatorState> _selectedNavigationKey;

  // scaffoldKey
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey(); // Create a key

  // list of available pages with key for each place
  final Map<PlacePages, GlobalKey> _navigatorKeys = {
    PlacePages.reservations: GlobalKey<NavigatorState>(),
    PlacePages.events: GlobalKey<NavigatorState>(),
    PlacePages.branches: GlobalKey<NavigatorState>(),
    PlacePages.menus: GlobalKey<NavigatorState>(),
    PlacePages.profile: GlobalKey<NavigatorState>(),
    PlacePages.reviews: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            IndexedStack(
              index: _selectedPage.index,
              children: [
                EventsPage(),
                Center(child:Text("menus")),
                Center(child:Text("reservations")),
                Center(child:Text("branches")),
                ReviewsPage(),
                Center(child:Text("profile")),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * AppStyle.getScaleFactor(context),
                    vertical: 8 * AppStyle.getScaleFactor(context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AIconButton2(
                        iconData: Icons.menu,
                        onPressed: (){
                          _keyScaffold.currentState.openDrawer();
                        },
                      ),
                      AIconButton2(
                        iconData: Icons.notifications,
                        onPressed: (){

                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: FloatingActionButton(
          key: ValueKey( _selectedPage == PlacePages.reservations
              ? "reservations me active"
              : "reservations me inactive"),
          heroTag: "reservations",
          backgroundColor: Theme.of(context).canvasColor,
          tooltip: "Reservations",
          child: Icon(
            FontAwesomeIcons.cashRegister,
            color: _selectedPage == PlacePages.reservations
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withOpacity(.5),
            size: 26,
          ),
          onPressed: (){
            _selectedPage = PlacePages.reservations;
            if( _selectedNavigationKey == _navigatorKeys[_selectedPage]){
              _selectedNavigationKey.currentState.popUntil((route) {
                return !route.navigator.canPop();//|| route.settings.name == CustomerLandPage.id;
              });

            }else{
              _selectedNavigationKey = _navigatorKeys[_selectedPage];
            }

            setState(() {});
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.primary.withOpacity(.5),
          currentIndex: _selectedPage.index > 4 ? 2 : _selectedPage.index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.calendarAlt),
                label: "Events"
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.utensils),
                label: "Menus"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit_sharp,color: Colors.transparent,),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.store),
                label: "branches"
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.star),
                label: "Reviews"
            ),
          ],
          onTap: (_pageIndex){
            _selectedPage = PlacePages.values[_pageIndex];
            if( _selectedNavigationKey == _navigatorKeys[_selectedPage]){
              _selectedNavigationKey = _navigatorKeys[_selectedPage];

              while(_selectedNavigationKey.currentState.canPop()){
                _selectedNavigationKey.currentState.pop();
              }

            }else{
              _selectedNavigationKey = _navigatorKeys[_selectedPage];
            }

            setState(() {});
          },
        ),
      ),
      drawer: PlaceDrawer(
        onChange: (page){
          _selectedPage = page;
          setState(() {});
        },
      ),
    );
  }
}
