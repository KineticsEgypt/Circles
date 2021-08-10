import 'package:circles/models/available_time.dart';
import 'package:circles/models/place.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/backgrounds/arc_top.dart';
import 'package:circles/views/widgets/buttons/app_icon_button1.dart';
import 'package:circles/views/widgets/buttons/app_small_button.dart';
import 'package:circles/views/widgets/calender/ccalender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import '../circles_list.dart';
import 'available_time_list.dart';
class ReservePage extends StatefulWidget {
  static final String id = "/place/reserve";
  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  String _selectedCircleId;
  Size _pageSize;

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context).settings.arguments;
    _pageSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight ,
              child: SizedBox(
                width: _pageSize.width,
                height: _pageSize.height,
                child: CustomPaint(
                  painter: ArcTop(radius: _pageSize.height/2.4,),
                ),
              ),
            ),
          ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 64 * AppStyle.getScaleFactor(context),
                padding: EdgeInsets.only(
                    left: 68 * AppStyle.getScaleFactor(context),
                    right: 32
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                    place?.name ?? "",
                  style: Theme.of(context).textTheme.headline5,
                  textScaleFactor: AppStyle.getScaleFactor(context),
                ),
              ),
              // circles list
              SizedBox(
                height: _pageSize.height/2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: _pageSize.width,
                        height: _pageSize.height,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.black38,
                            width: 4
                          )
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image(
                            image: AssetImage("assets/images/test_bar.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                    ),
                    CirclesList(
                      scrollDirection: Axis.vertical,
                      selectedCircle: _selectedCircleId ?? "",
                      onSelect: (id){
                        _selectedCircleId = id;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 1.3,
                child: Container(
                  //height: _pageSize.height/1.5,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: _pageSize.width/4,
                        child: AvailableTimesList(
                          availableTimes: List.generate(
                              30, (index) => AvailableTime(
                            id: index.toString(),
                            isAvailable: index % 3 != 0,
                            time: "${index}0:00 - 10:00",
                          )
                          ),
                        ),
                      ),

                      Container(
                        color: Theme.of(context).accentColor,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 3,
                        height: _pageSize.height,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(child: AspectRatio( aspectRatio: .8,child: CCalender())),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Number Of Attendees",
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textScaleFactor: AppStyle.getScaleFactor(context),
                                  ),
                                ),
                                SizedBox(
                                  width: 80 * AppStyle.getScaleFactor(context),
                                  child: Text(
                                    "5",
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textScaleFactor: AppStyle.getScaleFactor(context),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Total",
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textScaleFactor: AppStyle.getScaleFactor(context),
                                  ),
                                ),
                                SizedBox(
                                  width: 80 * AppStyle.getScaleFactor(context),
                                  child: Text(
                                    "10,200 EGP",
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textScaleFactor: AppStyle.getScaleFactor(context),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                  child: CSmallButton(
                    text: "RESERVE",
                    onTap: (){},
                  ),
                ),
              ),
              SizedBox(height: 60,)
            ],
          ),
            AIconButton1(
              iconData: Icons.arrow_back,
              onTap: (){Navigator.of(context).pop();},
            ),
          ],
        ),
      ),
    );
  }
}
