import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CCalender extends StatefulWidget {
  @override
  _CCalenderState createState() => _CCalenderState();
}

class _CCalenderState extends State<CCalender> {

  DateTime _firstDayInCurrentMonth;

  DateTime _selectedDay = DateTime.now();
  @override
  void initState() {
    super.initState();
    DateTime _today = DateTime.now();
    _firstDayInCurrentMonth = DateTime.utc(_today.year,_today.month,1);
  }

  List<String> _days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

  int getDifference (DateTime currentMonth){
    for(int i =0;i<7;i++){
      if(_days[i]
          ==
        DateFormat('EEE').format(currentMonth)
      ){
        return i;
      }
    }
    return 6;
  }

  Color getDayColor({DateTime currentMonth,DateTime dayValue,int index,int difference}){
    if(_selectedDay == dayValue){
      return CirclesColors.yellow;
    } else {
      if(difference <= index){
        return currentMonth.month ==
            currentMonth.add(Duration(days: index - difference - 7)).month
            ? Colors.white24 : Colors.white10;
      } else{
        return currentMonth.month ==
            currentMonth.subtract(Duration(days: difference - index - 7)).month
            ? Colors.white24 : Colors.white10;
      }
    }
  }

  getDateOfNextMonth(int index){
    if(_firstDayInCurrentMonth.month + index > 12)
      return DateTime.utc(_firstDayInCurrentMonth.year +1 ,_firstDayInCurrentMonth.month - 12 + index,1);
    else
      return DateTime.utc(_firstDayInCurrentMonth.year,_firstDayInCurrentMonth.month+index,1);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelColor: CirclesColors.yellow,
              labelStyle: TextStyle(
                fontSize: 14 * CirclesTextStyles.getScaleFactor(context),
              ),
              tabs: List.generate(5, (index) {
                return Tab(
                  text: DateFormat('yMMM').format(
                    getDateOfNextMonth(index),
                  ),
                );
              })
          ),
          Expanded(
            child: TabBarView(
              children: List.generate(5, (indexMonth) {
                DateTime currentMonth = getDateOfNextMonth(indexMonth);
                int _difference = getDifference(currentMonth);
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 7,
                  children: List.generate(
                      49,
                          (index){
                        DateTime dayValue = _difference <= index
                            ? currentMonth.add(
                            Duration(days: index - _difference - 7)
                        )
                            : currentMonth.subtract(
                            Duration(days: _difference - index - 7)
                        );
                        if(index <  7){
                          return Center(
                            child: Text(
                                _difference <= index
                                    ? DateFormat('EEE').format(currentMonth.add(Duration(days: index - _difference)))
                                    : DateFormat('EEE').format(currentMonth.subtract(Duration(days: _difference - index))),
                              style: CirclesTextStyles.subTitle1,
                              textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                            ),
                          );
                        }
                        return MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            _selectedDay = dayValue;
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.all(.5),
                            padding: EdgeInsets.all(4*CirclesTextStyles.getScaleFactor(context),),
                            decoration: BoxDecoration(
                                color:  getDayColor(
                                    currentMonth:currentMonth,
                                    dayValue:dayValue,
                                    index:index,
                                    difference:_difference),
                                border: Border.all(
                                  color: DateTime.now().compareTo(dayValue) >= 0
                                      && DateTime.now().difference(dayValue).inDays == 0
                                      ? CirclesColors.yellow
                                      : Colors.transparent,

                                )
                            ),
                            child: Text(
                                dayValue.day.toString(),
                              style: CirclesTextStyles.subTitle1,
                              textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                            ),
                          ),
                        );
                      }
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
