import 'package:circles/app_style/colors.dart';
import 'package:circles/widgets/buttons/c_icon_button.dart';
import 'package:circles/widgets/circle_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CirclesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10+1,
        itemBuilder: (listContext,itemIndex){
          if(itemIndex == 0){
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CIconButton(
                  icon: Icon(
                    FontAwesomeIcons.plus,
                    color: CirclesColors.yellow,
                  ),
                  onTap: (){},
                ),
              ),
            );
          }
          return CircleItem(index: itemIndex,);
        }
    );
  }
}
