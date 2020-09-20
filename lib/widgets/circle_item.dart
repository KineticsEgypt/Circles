import 'package:flutter/material.dart';
class CircleItem extends StatefulWidget {
  final int index;

  const CircleItem({Key key, this.index}) : super(key: key);

  @override
  _CircleItemState createState() => _CircleItemState();
}

class _CircleItemState extends State<CircleItem> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, - 0.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
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
        print("${widget.index} dragging candidateData" + candidateData.toString());
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: candidateData.isNotEmpty
              ? 100
              : 74,
          width: candidateData.isNotEmpty
              ? 100
              : 74,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(
              horizontal: candidateData.isNotEmpty
                  ? 32
                  : 0
          ),
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
                height: 50,
                width: 50,
                image: AssetImage("assets/images/small_groups.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
