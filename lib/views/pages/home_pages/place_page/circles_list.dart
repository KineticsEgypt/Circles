import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/buttons/app_icon_button1.dart';
import 'package:circles/views/widgets/circles/circle_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CirclesList extends StatelessWidget {
  final Axis scrollDirection;
  final String selectedCircle;
  final Function(String) onSelect;
  const CirclesList({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.selectedCircle,
    this.onSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scrollDirection == Axis.vertical
          ? null : 86 * AppStyle.getScaleFactor(context),
      width: scrollDirection == Axis.vertical
          ? 86 * AppStyle.getScaleFactor(context) : null,
      child: Center(
        child: ListView.builder(
            scrollDirection: scrollDirection,
            reverse: scrollDirection == Axis.vertical,
            itemCount: 10+1,
            itemBuilder: (listContext,itemIndex){
              if(itemIndex == 0){
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AIconButton1(
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        color: Theme.of(context).accentColor,
                      ),
                      onTap: (){},
                    ),
                  ),
                );
              }
              return CircleItem(
                index: itemIndex,
                opacity: selectedCircle != null
                    ? selectedCircle == itemIndex.toString() ? 1 : .3
                    : 1,
                onTap: selectedCircle == null ? null: (){
                  //todo witch with circle id
                  onSelect(itemIndex.toString());
                },
              );
            }
        ),
      ),
    );
  }
}
