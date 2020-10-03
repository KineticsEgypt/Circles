import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/available_time.dart';
import 'package:flutter/material.dart';
class AvailableTimeItem extends StatelessWidget {
  final AvailableTime availableTime;
  final bool isSelected;
  final Function(String) onTap;

  const AvailableTimeItem({Key key, this.availableTime, this.isSelected, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16,
        //horizontal: 8
      ),
      height: 30 * CirclesTextStyles.getScaleFactor(context),
      child: Opacity(
        opacity: availableTime.isAvailable ? 1 : .3,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: Container(
            width: MediaQuery.of(context).size.width,
            key: ValueKey(isSelected),
            decoration: BoxDecoration(
              color: isSelected  ? CirclesColors.yellow : Colors.transparent,
              borderRadius: BorderRadius.circular(100 * CirclesTextStyles.getScaleFactor(context)),
              border: Border.all(color: CirclesColors.yellow)
            ),
            child: InkWell(
              onTap: !availableTime.isAvailable ? null : (){
                onTap(availableTime.id);
              },
              child: Center(
                child: Text(
                    availableTime.time,
                  style: TextStyle(
                    inherit: true,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.yellow,
                  ),
                  textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
