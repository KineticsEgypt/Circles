import 'package:circles/models/available_time.dart';
import 'package:circles/widgets/available_time_item.dart';
import 'package:flutter/material.dart';
class AvailableTimesList extends StatefulWidget {
  final List<AvailableTime> availableTimes;
  final Axis scrollDirection;
  const AvailableTimesList({Key key, this.availableTimes,this.scrollDirection = Axis.vertical}) : super(key: key);

  @override
  _AvailableTimesListState createState() => _AvailableTimesListState();
}

class _AvailableTimesListState extends State<AvailableTimesList> {
  String _selectedID;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: widget.scrollDirection,
        itemCount: widget.availableTimes.length,
        itemBuilder: (context,itemIndex){
          return AvailableTimeItem(
            onTap: (isSelected){
              _selectedID = isSelected;
              setState(() {});
            },
            isSelected: _selectedID == widget.availableTimes[itemIndex].id,
            availableTime: widget.availableTimes[itemIndex],
          );
        }
    );
  }
}
