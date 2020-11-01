import 'dart:ui';

import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/pages/home_pages/place_page/circles_list.dart';
import 'package:circles/widgets/backgrounds/arc_top.dart';
import 'package:circles/widgets/recent_event_item.dart';
import 'package:flutter/material.dart';

import 'popular_spots.dart';
import 'recent_events.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 72),
          child: Opacity(
            opacity: .1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: AssetImage("assets/images/test_profile_image.jpg"),
                width: MediaQuery.of(context).size.width/1.3,
                height: MediaQuery.of(context).size.width/.9,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(height: 72,),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                      image: AssetImage("assets/images/test_profile_image.jpg"),
                      width: MediaQuery.of(context).size.width/2.6,
                      height: MediaQuery.of(context).size.width/2,
                      fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo",
                        style: TextStyle(
                          color: CirclesColors.lightGrey,
                          fontFamily: "Gothic",
                          fontSize: 18,
                        ),
                        textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                      ),
                      Text(
                        "Ann Michelle llllll llllll",
                        style: CirclesTextStyles.header4,
                        textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 48,),
            CirclesList(),
            SizedBox(height: 8,),
            Text(
              "Popular Spots",
              style: CirclesTextStyles.header5,
              textScaleFactor: CirclesTextStyles.getScaleFactor(context),
            ),
            SizedBox(height: 8,),
            PopularSpotsList(),
            SizedBox(height: 24,),
            Text(
              "Recent Events",
              style: CirclesTextStyles.header5,
              textScaleFactor: CirclesTextStyles.getScaleFactor(context),
            ),
            SizedBox(height:16,),
            RecentEvents(),
            SizedBox(height:32,),
          ],
        ),
      ],
    );
  }
}
