import 'package:circles/models/event.dart';
import 'package:circles/views/widgets/events/events_list.dart';
import 'package:circles/views/widgets/titles/app_title.dart';
import 'package:flutter/material.dart';

import 'event_details_page.dart';
class EventsPage extends StatefulWidget {
  const EventsPage({Key key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ATitle("Event & News ",center: true,),
          Expanded(
            child: EventsList(
              events: List.generate(
                20, (index) {
                  return Event(
                    id: index.toString(),
                    image: "https://cdn.pixabay.com/photo/2014/08/15/11/29/beach-418742_960_720.jpg",
                    title: "Lorem Ipsum is simply dummy text",
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    placeId: index.toString(),
                  );
                }
              ),
              onPressed: (event){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => EventDetails(event: event,)
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
