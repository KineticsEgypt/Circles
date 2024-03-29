import 'package:circles/models/Location.dart';
import 'package:circles/models/cinema.dart';
import 'package:circles/models/cinema_time.dart';
import 'package:circles/models/seat.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/buttons/app_icon_button1.dart';
import 'package:circles/views/widgets/buttons/app_small_button.dart';
import 'package:circles/views/widgets/cinemas/cinema_screen_arc.dart';
import 'package:circles/views/widgets/cinemas/cinema_seats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BuyCinemaTicket extends StatefulWidget {
  static final String id = "cinema/buy-ticket";
  @override
  _BuyCinemaTicketState createState() => _BuyCinemaTicketState();
}

class _BuyCinemaTicketState extends State<BuyCinemaTicket>
    with SingleTickerProviderStateMixin{

  bool firstTime = true;
  bool _loadingSeats = false;
  CinemaTime _cinemaTime;
  List<CinemaTime> _times = List.generate(10, (index) => CinemaTime(
      id: index.toString(),time: "$index ------- --:-- --"));
  Location _location;
  List<Location> _locations = List.generate(10, (index) => Location(
      id: index.toString(),name: "$index location name"));
  Cinema _cinema;
  List<Cinema> _cinemas = List.generate(10, (index) => Cinema(
      id: index.toString(),
      name: "$index cinema name",
    locationID: "$index location Id",
  ));
  List<List<Seat>> cinemaSeats = List.generate(
      20, (indexColumn) => List.generate(20, (indexRow) => Seat(
    id: (indexRow+indexColumn).toString(),
    column: indexColumn,
    row: indexRow,
    status: (indexRow+indexColumn) % 5
  ))
  );

  @override
  Widget build(BuildContext context) {

    if(firstTime){
      _times.insert(0,CinemaTime(id: "-1",time: "Select"));
      _cinemaTime = _times[0];
      _locations.insert(0,Location(id: "-1",name: "Select"));
      _location = _locations[0];
      _cinemas.insert(0,Cinema(id: "-1",name: "Select"));
      _cinema = _cinemas[0];
      firstTime = false;
    }
    // print(_scrollController?.offset);
    return Scaffold(
      //backgroundColor: CirclesColors.yellow,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutBack,
                  child: Container(
                    height: _loadingSeats ? null : 0,
                    color: Theme.of(context).accentColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 42,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Choose your seats",
                              style: Theme.of(context).textTheme.subtitle1,
                              textScaleFactor: AppStyle.getScaleFactor(context),
                            ),
                          ),
                        ),
                        // space for toolbarHeight
                        // SizedBox(height: 32,),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.0 * AppStyle.getScaleFactor(context),
                          ),
                          child: CustomPaint(
                            painter: CinemaScreenArc(),
                            size: Size(MediaQuery.of(context).size.width,38),
                          ),
                        ),
                        SizedBox(height: 16,),
                        // Cinema Seats widget
                        // response to take matrix of seats and represent it.
                        CinemaSeats(
                          cinemaSeats: cinemaSeats,
                          onSelect: (seats){
                            print(seats);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //color: CirclesColors.yellow,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(48),
                          topLeft:  Radius.circular(48),
                        )
                    ),

                    child: Column(
                      children: [
                        SizedBox(height: 32,),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 600),
                          child: Opacity(
                            key: ValueKey(_cinemaTime.id == "-1"),
                            opacity: _cinemaTime.id == "-1" ? .6 : 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width/10
                              ),
                              child: CSmallButton(
                                text: "Buy Ticket",
                                fontSize: 22,
                                onTap: _cinemaTime.id == "-1" ? (){} : (){},
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: .8,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical:8,
                                horizontal: MediaQuery.of(context).size.width/10
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).accentColor,
                                )
                            ),
                            child: DropdownButton<CinemaTime>(
                              value: _cinemaTime ?? _times[0],
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                              iconSize: 24,
                              elevation: 16,
                              style: Theme.of(context).textTheme.subtitle1,
                              dropdownColor: Colors.white.withOpacity(.9),
                              onChanged: (CinemaTime newValue) {
                                setState(() {
                                  _cinemaTime = newValue;
                                });
                              },
                              items: _times
                                  .map<DropdownMenuItem<CinemaTime>>((CinemaTime time) {
                                return DropdownMenuItem<CinemaTime>(
                                  value: time,
                                  child: Text(time.time),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: .8,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical:8,
                                horizontal: MediaQuery.of(context).size.width/10
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).accentColor,
                                )
                            ),
                            child: DropdownButton<Location>(
                              value: _location,
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                              iconSize: 24,
                              elevation: 16,
                              style: Theme.of(context).textTheme.headline6,
                              dropdownColor: Colors.white.withOpacity(.9),
                              onChanged: (Location newValue) {
                                setState(() {
                                  _location = newValue;
                                });
                              },
                              items: _locations
                                  .map<DropdownMenuItem<Location>>((Location location) {
                                return DropdownMenuItem<Location>(
                                  value: location,
                                  child: Text(location.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: .8,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical:8,
                                horizontal: MediaQuery.of(context).size.width/10
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).accentColor,
                                )
                            ),
                            child: DropdownButton<Cinema>(
                              value: _cinema ?? _cinemas[0],
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                              iconSize: 24,
                              elevation: 16,
                              style: Theme.of(context).textTheme.subtitle1,
                              dropdownColor: Colors.white.withOpacity(.9),
                              onChanged: (Cinema newValue) {
                                setState(() {
                                  _cinema = newValue;
                                });
                              },
                              items: _cinemas
                                  .map<DropdownMenuItem<Cinema>>((Cinema cinema) {
                                return DropdownMenuItem<Cinema>(
                                  value: cinema,
                                  child: Text(cinema.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 1.2,)
              ],
            ),
            Hero(
              tag: "menu tag",
              transitionOnUserGestures: true,
              child: AIconButton1(
                iconData:  Icons.close,
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
      //body:null ,
    );
  }
}
