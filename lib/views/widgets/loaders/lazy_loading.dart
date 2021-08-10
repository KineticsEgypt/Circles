import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';

import 'app_loading.dart';
class LazyLoading extends StatefulWidget {
  final Widget child;
  final bool nextPage;
  final Future<void> Function() onLazyLoad;
  final VoidCallback onLoadingEnd;

  const LazyLoading({
    Key key,
    this.nextPage = false,
    this.child,
    this.onLazyLoad,
    this.onLoadingEnd,
  }) : super(key: key);

  @override
  _LazyLoadingState createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;
  bool _firstTime = true;
  _scrollListener() async {
    if (!_animationController.isAnimating && !_animationController.isCompleted && widget.nextPage) {
      _animationController.forward();
      setState(() {});
      await widget.onLazyLoad();
      await Future.delayed(Duration(milliseconds: 600));
      setState(() {});
      _animationController.reverse();
      print(" ----------------- toNext ------------------- ");
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin:  const Offset(0.0, .8),
      end: const Offset(0, .4),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));

  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              if(notification.metrics.pixels >= notification.metrics.maxScrollExtent){
                print("gooooooooooooooooooooo");
                _scrollListener();
              }
              return true;
            },
            child: widget.child
        ),
        SlideTransition(
          position: _offsetAnimation,
          child: Center(
            child: Visibility(
              visible: _animationController.isAnimating || _animationController.isCompleted,
              child: Container(
                height: 36 * AppStyle.getScaleFactor(context),
                width: 36 * AppStyle.getScaleFactor(context),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    AppStyle.boxShadow
                  ]
                ),
                child: ALoading(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
