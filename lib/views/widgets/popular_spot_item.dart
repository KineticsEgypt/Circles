import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class PopularSpot extends StatelessWidget {
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
                    image: AssetImage("assets/images/test_image.png"),
                ),
              ),
            ),
          ),
          Text(
              "popular spot name",
            style: Theme.of(context).textTheme.subtitle1,
            textScaleFactor: AppStyle.getScaleFactor(context),
          ),
        ],
      ),
    );
  }
}
