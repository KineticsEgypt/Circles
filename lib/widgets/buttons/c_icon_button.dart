import 'package:circles/app_style/colors.dart';
import 'package:flutter/material.dart';
class CIconButton extends StatefulWidget {
  final IconData startIconData;
  final IconData endIconData;
  final Widget icon;
  final VoidCallback onOpen;
  final VoidCallback onClose;
  final VoidCallback onTap;

  const CIconButton({
    Key key,
    this.startIconData,
    this.endIconData,
    this.icon,
    this.onOpen,
    this.onClose,
    this.onTap
  }) : super(key: key);

  @override
  _CIconButtonState createState() => _CIconButtonState();
}

class _CIconButtonState extends State<CIconButton> {
  bool _swap = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(
                 color: Colors.grey[850]
              ),
              boxShadow: [
                BoxShadow(
                  color:  Colors.grey[800],
                  blurRadius: 10,
                  spreadRadius: 1
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.grey[800]
                  ]
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  child: FadeTransition(child: child,opacity: animation,),
                  turns: animation,
                );
              },
              child: IconButton(
                key: ValueKey(_swap),
                icon: widget.icon
                ?? Icon(
                    _swap ? widget.endIconData : widget.startIconData,
                  color: CirclesColors.yellow,
                ),
                color: CirclesColors.yellow,
                onPressed: widget.icon != null
                  ? widget.onTap
                  :(){
                    _swap = !_swap;
                    setState(() {});
                    _swap ? widget.onOpen() : widget.onClose();
                  },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
