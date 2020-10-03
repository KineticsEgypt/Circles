import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
class RecentEventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                    image: AssetImage("assets/images/event2_test.jpg"),
                ),
              ),
            ),
          ),
          Text(
              "popular spot name",
            style: CirclesTextStyles.body1,
            textScaleFactor: CirclesTextStyles.getScaleFactor(context),
          ),
          Text(
            "@event tag",
            style: CirclesTextStyles.body2,
            textScaleFactor: CirclesTextStyles.getScaleFactor(context),
          )
        ],
      ),
    );
  }
}
