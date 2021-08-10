import 'package:circles/views/pages/home_pages/place_page/circles_list.dart';
import 'package:flutter/material.dart';
import '../../../widgets/cinemas/lists/cinema_list.dart';

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
