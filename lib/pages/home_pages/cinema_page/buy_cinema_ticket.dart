import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/Location.dart';
import 'package:circles/models/cinema.dart';
import 'package:circles/models/cinema_time.dart';
import 'package:circles/models/seat.dart';
import 'package:circles/widgets/buttons/c_icon_button.dart';
import 'package:circles/widgets/buttons/c_small_button.dart';
import 'package:circles/widgets/cinema/cinema_screen_arc.dart';
import 'package:circles/widgets/cinema/cinema_seats.dart';
import 'package:circles/widgets/clip_path.dart';
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
  bool _stopScroll = true;
  bool _loadingSeats = false;
  ScrollController _scrollController;
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
    // todo remove that height and use sizeAnimation when create seats will appear came from top
    final double bookSeatsHeight = cinemaSeats.length * 44.0 + 16 + 24 + (42 + 38) * CirclesTextStyles.getScaleFactor(context) ;
    if(firstTime){
      _times.insert(0,CinemaTime(id: "-1",time: "Select"));
      _cinemaTime = _times[0];
      _locations.insert(0,Location(id: "-1",name: "Select"));
      _location = _locations[0];
      _cinemas.insert(0,Cinema(id: "-1",name: "Select"));
      _cinema = _cinemas[0];
      _scrollController = ScrollController(initialScrollOffset: bookSeatsHeight);
      firstTime = false;
    }
    // print(_scrollController?.offset);
    return Scaffold(
      //backgroundColor: CirclesColors.yellow,
      body: SafeArea(
        child: Stack(
          children: [
            NotificationListener(
              onNotification: (notification){
                if(notification is ScrollUpdateNotification){
                  if(_scrollController.offset > bookSeatsHeight){
                    if(_cinemaTime.id == "-1"){

                    }
                  }
                }
                return false;
              },
              child: ListView(
                controller: _scrollController,
                physics: _stopScroll
                    ? NeverScrollableScrollPhysics()
                    :BouncingScrollPhysics(),
                children: <Widget>[
                  AnimatedSize(
                    vsync: this,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutBack,
                    child: Container(
                      height: _loadingSeats ? null : 0,
                      color: CirclesColors.yellow,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 42,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Choose your seats",
                                style: CirclesTextStyles.header5Black,
                                textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                              ),
                            ),
                          ),
                          // space for toolbarHeight
                          // SizedBox(height: 32,),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0 * CirclesTextStyles.getScaleFactor(context)
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
                                    color: CirclesColors.yellow,
                                  )
                              ),
                              child: DropdownButton<CinemaTime>(
                                value: _cinemaTime ?? _times[0],
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                                iconSize: 24,
                                elevation: 16,
                                style: CirclesTextStyles.subTitle3,
                                dropdownColor: Colors.white.withOpacity(.9),
                                onChanged: (CinemaTime newValue) {
                                  if(newValue.id != _times[0].id){
                                    _stopScroll = false;
                                    _scrollController.animateTo(
                                        0,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutCubic);
                                  }else{
                                    _stopScroll = true;
                                    _scrollController.animateTo(
                                        bookSeatsHeight,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutCubic);
                                    print(_stopScroll);
                                  }

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
                                    color: CirclesColors.yellow,
                                  )
                              ),
                              child: DropdownButton<Location>(
                                value: _location,
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                                iconSize: 24,
                                elevation: 16,
                                style: CirclesTextStyles.subTitle3,
                                dropdownColor: Colors.white.withOpacity(.9),
                                onChanged: (Location newValue) {
                                  if(newValue.id != _times[0].id){
                                    _stopScroll = false;
                                    _scrollController.animateTo(
                                        0,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutCubic);
                                  }else{
                                    _stopScroll = true;
                                    _scrollController.animateTo(
                                        bookSeatsHeight,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutCubic);
                                    print(_stopScroll);
                                  }

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
                                    color: CirclesColors.yellow,
                                  )
                              ),
                              child: DropdownButton<Cinema>(
                                value: _cinema ?? _cinemas[0],
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                                iconSize: 24,
                                elevation: 16,
                                style: CirclesTextStyles.subTitle3,
                                dropdownColor: Colors.white.withOpacity(.9),
                                onChanged: (Cinema newValue) {
                                  if(newValue.id != _times[0].id){
                                    _stopScroll = false;
                                    _scrollController.animateTo(
                                        0,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutCubic);
                                  }else{
                                    _stopScroll = true;
                                    _scrollController.animateTo(
                                        bookSeatsHeight,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutCubic);
                                    print(_stopScroll);
                                  }

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
            ),
            Hero(
              tag: "menu tag",
              transitionOnUserGestures: true,
              child: CIconButton(
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
