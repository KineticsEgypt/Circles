import 'package:circles/models/available_time.dart';
import 'package:circles/views/app_style/app_style.dart';
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
      height: 30 * AppStyle.getScaleFactor(context),
      child: Opacity(
        opacity: availableTime.isAvailable ? 1 : .3,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: Container(
            width: MediaQuery.of(context).size.width,
            key: ValueKey(isSelected),
            decoration: BoxDecoration(
              color: isSelected  ? Theme.of(context).accentColor : Colors.transparent,
              borderRadius: BorderRadius.circular(8 * AppStyle.getScaleFactor(context)),
              border: Border.all(color: Theme.of(context).accentColor)
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
                  textScaleFactor: AppStyle.getScaleFactor(context),
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
