import 'package:circles/app_style/text_style.dart';
import 'package:flutter/material.dart';
class CircleItem extends StatefulWidget {
  final int index;
  final double opacity;
  final VoidCallback onTap;
  const CircleItem({Key key, this.index,this.opacity = 1,this.onTap}) : super(key: key);

  @override
  _CircleItemState createState() => _CircleItemState();
}

class _CircleItemState extends State<CircleItem> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
      padding: EdgeInsets.zero,
      onPressed: widget.onTap,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        child: Opacity(
          key: ValueKey(widget.opacity),
          opacity: widget.opacity,
          child: DragTarget(
            onAccept: (data){
              print("accept --> $data");
            },
            onWillAccept: (details){
              //setState(() {});
              //_controller.forward();
              return true;
            },
            onLeave: (details){
              //_controller.reverse();
            },
            builder: (context,List<String> candidateData,List<dynamic>rejectedData){
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: candidateData.isNotEmpty
                    ? 100 * CirclesTextStyles.getScaleFactor(context)
                    : 74 * CirclesTextStyles.getScaleFactor(context),
                width: candidateData.isNotEmpty
                    ? 100 * CirclesTextStyles.getScaleFactor(context)
                    : 74 * CirclesTextStyles.getScaleFactor(context),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      height: 50 * CirclesTextStyles.getScaleFactor(context),
                      width: 50 * CirclesTextStyles.getScaleFactor(context),
                      image: AssetImage("assets/images/small_groups.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
