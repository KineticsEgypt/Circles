import 'package:circles/pages/home_pages/place_page/circles_list.dart';
import 'package:circles/widgets/backgrounds/arc_bottom.dart';
import 'package:flutter/material.dart';

import 'cinema_horizontal_list.dart';
import 'cinema_list.dart';
class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: CinemaList()
        ),
        CirclesList(),
      ],
    );
  }
}
