import 'package:circles/models/event.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/loaders/no_item_found.dart';
import 'package:flutter/material.dart';

import 'event_item.dart';

class EventsList extends StatelessWidget {
  final List<Event> events;
  final Function(Event) onPressed;
  final Function(Event) onEdit;
  final Future<void> Function(Event) onDelete;
  final bool nextPage;
  final Future<void> Function() onLazyLoad;

  const EventsList({
    Key key,
    this.events,
    this.onPressed,
    this.nextPage,
    this.onLazyLoad,
    this.onDelete,
    this.onEdit
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(events.isEmpty){
      return NoItemFound(
        message: "No events found",
      );
    }
    return ListView.builder(
        padding: AppStyle.getListPadding(context),
        itemCount: events.length,
        itemBuilder: (context,itemIndex){
          Event _event = events[itemIndex];
          return EventItem(
            event: _event,
            onPressed:onPressed,
            onDelete: onDelete,
            onEdit: onEdit,
          );
        }
    );
  }
}