import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReserveButton extends StatefulWidget {
  final VoidCallback onTap;

  const ReserveButton({Key key, this.onTap}) : super(key: key);

  @override
  _ReserveButtonState createState() => _ReserveButtonState();
}

class _ReserveButtonState extends State<ReserveButton>
    with SingleTickerProviderStateMixin{
  bool _dragging = false;



  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: "some data for draggable",
      child: ButtonShape(animation: "moving"),
      feedback: Container(
        height: 84,
        width: 84,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
      childWhenDragging: ButtonShape(animation: "moving",dragging: _dragging,),
      //feedbackOffset:Offset(0,0) ,
      onDragStarted: (){
        _dragging = true;
        setState(() {});
      },
      onDraggableCanceled: (velocity,offset){
        _dragging = false;
        setState(() {});
      },
    );
  }
}

class ButtonShape extends StatefulWidget {
  final String animation;
  final bool dragging;
  const ButtonShape({Key key, this.animation,this.dragging = false}) : super(key: key);

  @override
  _ButtonShapeState createState() => _ButtonShapeState();
}

class _ButtonShapeState extends State<ButtonShape>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, .2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _scaleAnimation = Tween<double>(
      begin: 14,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCirc,
      //reverseCurve: Curves.easeInCirc,
    ));


  }

  @override
  Widget build(BuildContext context) {
    if(widget.dragging){
      _controller.forward();
    }else{
      _controller.reverse();
    }
    return SizedBox(
      height: 40 * .9,
      width: 130 * .9,
      child: ClipRRect(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).accentColor
              )
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  alignment: Alignment.bottomCenter,
                  child: FlareActor(
                      "assets/flares/waves.flr",
                      alignment:Alignment.bottomCenter,
                      fit:BoxFit.cover,
                      animation: widget.animation
                  ),
                ),
                Text(
                  "Reserve With Circle",
                  style: TextStyle(
                      inherit: true,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Gothic",
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black26,
                          //offset: Offset(1,1),
                        ),
                      ]
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

