import 'package:circles/views/app_style/app_style.dart';
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
                borderRadius: BorderRadius.circular(8),
                child: Image(
                    image: AssetImage("assets/images/event2_test.jpg"),
                ),
              ),
            ),
          ),
          Text(
              "popular spot name",
            style: Theme.of(context).textTheme.subtitle1,
            textScaleFactor: AppStyle.getScaleFactor(context),
          ),
          Text(
            "@event tag",
            style: Theme.of(context).textTheme.subtitle1,
            textScaleFactor: AppStyle.getScaleFactor(context),
          )
        ],
      ),
    );
  }
}
