import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class DescriptionText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int maxLine;
  final double width;
  const DescriptionText({
    Key key,
    this.text,
    this.style,
    this.maxLine = 3,
    this.width
  }) : super(key: key);
  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText>
    with SingleTickerProviderStateMixin{
  bool _viewFullContent = false;
  double _width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    if(widget.text == null){
      return SizedBox.shrink();
    }
    _width = widget.width ?? (MediaQuery.of(context).size.width/1.5);
    double _maxLength = _width/(6 * AppStyle.getScaleFactor(context))* widget.maxLine;
    bool unexpanded = widget.text.length < _maxLength;
    if(unexpanded){
      _viewFullContent = widget.text.split("\n").length >= widget.maxLine;
    }
    return AnimatedSize(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOutBack,
      vsync: this,
      child: unexpanded ?
      Text(
        widget.text ?? "",
        style: widget.style ?? Theme.of(context).textTheme.bodyText2,
        textScaleFactor: AppStyle.getScaleFactor(context),
        maxLines: _viewFullContent ? null : widget.maxLine,
        overflow: _viewFullContent ? null : TextOverflow.fade,
      ) :
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        key: ValueKey(_viewFullContent),
        onPressed: (){
          _viewFullContent = !_viewFullContent;
          setState(() {});
        },
        child: Text(
          widget.text ?? "",
          style: widget.style ?? Theme.of(context).textTheme.bodyText2,
          textScaleFactor: AppStyle.getScaleFactor(context),
          maxLines: _viewFullContent ? null : widget.maxLine,
          overflow: _viewFullContent ? null : TextOverflow.fade,
        ),
      ),
    );
  }
}
