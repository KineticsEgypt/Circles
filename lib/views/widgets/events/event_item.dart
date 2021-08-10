import 'package:circles/models/event.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/buttons/app_icon_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../image_loader.dart';
class EventItem extends StatefulWidget {
  final Event event;
  final Function(Event) onPressed;
  final Future<void> Function(Event) onDelete;
  final Function(Event) onEdit;

  const EventItem({
    Key key,
    this.event,
    this.onPressed,
    this.onDelete,
    this.onEdit
  }) : super(key: key);

  @override
  _EventItemState createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool _deleting = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140 * AppStyle.getScaleFactor(context),
      margin: EdgeInsets.symmetric(
        vertical: 8 * AppStyle.getScaleFactor(context),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8 * AppStyle.getScaleFactor(context)
            ),
          ),
        ),
        onPressed: (){
          widget.onPressed(widget.event);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              8  * AppStyle.getScaleFactor(context)
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageLoader(
                url: widget.event.image,
                boxFit: BoxFit.cover,
              ),
              widget.onDelete == null ? SizedBox.shrink():
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _deleting ?
                  SizedBox(
                    height: 20 * AppStyle.getScaleFactor(context),
                    width: 20 * AppStyle.getScaleFactor(context),
                    child: CircularProgressIndicator(),
                  ):AIconButton2(
                    iconData: Icons.delete,
                    onPressed: () async {
                      _deleting = true;
                      setState(() {});
                      await widget.onDelete(widget.event);
                      _deleting = false;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black38]),
                  ),
                  child: Text(
                    widget.event.title,
                    maxLines: 1,
                    style: TextStyle(
                      inherit: true,
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "PlayFairDisplay",
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: AppStyle.getScaleFactor(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
