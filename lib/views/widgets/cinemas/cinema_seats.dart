import 'package:circles/models/seat.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class CinemaSeats extends StatefulWidget {
  final List<List<Seat>> cinemaSeats;
  final Function(List<Seat>) onSelect;
  const CinemaSeats({Key key, this.cinemaSeats,this.onSelect}) : super(key: key);

  @override
  _CinemaSeatsState createState() => _CinemaSeatsState();
}

class _CinemaSeatsState extends State<CinemaSeats> {
  final double _squareSize = 28;
  List<List<Seat>> cinemaSeats = [];
  List<Seat> seats = [];

  Color getSeatColor(int state){
    switch(state){
      case 1: return Colors.transparent;
      case 2: return Colors.black38;
      case 3: return Colors.grey;
      default: return Colors.transparent;
    }
  }

  @override
  void initState() {
    super.initState();
    cinemaSeats.addAll(widget.cinemaSeats);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: List.generate(
                  cinemaSeats.length,
                (columnIndex) => TableRow(
                  children: List.generate(
                      cinemaSeats[columnIndex].length + 2,
                          (rowIndex) {
                            if(rowIndex == 0 || rowIndex == cinemaSeats[columnIndex].length+1){
                              return Column(
                                children: [
                                  SizedBox(
                                    height: _squareSize,
                                    width: _squareSize,
                                    child: Center(
                                        child: Text(
                                            String.fromCharCode(columnIndex+65),
                                          style: Theme.of(context).textTheme.subtitle1,
                                          textScaleFactor: AppStyle.getScaleFactor(context),
                                        )
                                    ),
                                  ),
                                  Text("‒ ‒ ‒ ‒ ")
                                ],
                              );
                            }
                            Seat seat = cinemaSeats[columnIndex][rowIndex-1];
                            if(seat.status == 0)
                              return Column(
                                children: [
                                  SizedBox( height: _squareSize,),
                                  Text("‒ ‒ ‒ "),
                                ],
                              );
                            else
                              return Column(
                                children: [
                                  Container(
                                    height: _squareSize,
                                    width: _squareSize,
                                   // margin: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                      color: getSeatColor(seat.status),
                                      border: Border.all(color: Colors.black45)
                                    ),
                                    child: MaterialButton(
                                      onPressed: seat.status < 1 ? null
                                          : (){
                                        if(seat.status == 1){
                                          cinemaSeats[columnIndex][rowIndex-1].status = 3;
                                          seats.add(cinemaSeats[columnIndex][rowIndex-1]);
                                        } else if(seat.status == 3){
                                          cinemaSeats[columnIndex][rowIndex-1].status = 1;
                                          seats.remove(cinemaSeats[columnIndex][rowIndex-1]);
                                        }
                                        widget.onSelect(seats);
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Text("‒ ‒ ‒ "),
                                ],

                              );
                          }
                  )
                )
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.spaceEvenly,
          runAlignment:  WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SeatSquare(
              text: "Selected",
              state: 3,
            ),
            SeatSquare(
              text: "Available",
              state: 1,
            ),
            SeatSquare(
              text: "Taken",
              state: 2,
            )
          ],
        ),
      ],
    );
  }
}

class SeatSquare extends StatelessWidget {
  final int state;
  final String text;

  const SeatSquare({Key key, this.text,this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86,
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                color: getSeatColor(state),
                border: Border.all(color: Colors.black45)
            ),
          ),
          Text(
              text,
            style: Theme.of(context).textTheme.bodyText1,
            textScaleFactor: AppStyle.getScaleFactor(context),
          ),
        ],
      ),
    );
  }

  Color getSeatColor(int state){
    switch(state){
      case 1: return Colors.transparent;
      case 2: return Colors.black38;
      case 3: return Colors.grey;
      default: return Colors.transparent;
    }
  }
}

