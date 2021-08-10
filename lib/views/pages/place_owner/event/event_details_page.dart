import 'package:circles/models/event.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/buttons/app_button.dart';
import 'package:circles/views/widgets/events/events_list.dart';
import 'package:circles/views/widgets/image_loader.dart';
import 'package:circles/views/widgets/titles/app_body_title.dart';
import 'package:flutter/material.dart';
class EventDetails extends StatefulWidget {

  final Event event;

  const EventDetails({Key key, this.event}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body:  NestedScrollView(
        physics: BouncingScrollPhysics(),
        //floatHeaderSlivers: false,
        headerSliverBuilder: (headerContext, value) {
          return [
            SliverAppBar(
              //backgroundColor: AColors.lightGrey,
              //automaticallyImplyLeading: false,
              stretch: true,
              floating: true,
              pinned: true,
              // backgroundColor: AColors.lightGray,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * AppStyle.getScaleFactor(headerContext)
                  ),
                  child: Text(
                    "${widget.event.title}",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.white
                    ),
                    textScaleFactor: AppStyle.getScaleFactor(context),
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageLoader(
                      url: widget.event.image,
                      boxFit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: AppStyle.linearGradient
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: _size.height/3,
            ),
          ];
        },
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: AppStyle.getListPadding(context),
          children: [
            ABody(widget.event.description),
            SizedBox(height: 16 * AppStyle.getScaleFactor(context),),
            AButton(
              text: "Book Now",
              onPressed: (){},
            ),
            SizedBox(height: 16 * AppStyle.getScaleFactor(context),),
            AButton(
              text: "View location",
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
