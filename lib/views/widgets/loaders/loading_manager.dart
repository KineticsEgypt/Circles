import 'package:circles/controlers/http_status_manger/http_status_manger.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'app_page_loading.dart';
import 'failed_loading.dart';
class LoadingManager extends StatefulWidget {
  final bool isLoading;
  final bool isFailedLoading;
  final bool isNotPage;
  final int progress;
  final bool askOnBack;
  final bool stopRefresh;
  final int stateCode;
  final double notPageHeight;
  final double failedToLoadHeight;
  final Future<void> Function() onRefresh;
  final Widget child;

  LoadingManager({
    Key key,
    @required this.isLoading,
    this.isFailedLoading = false,
    this.stateCode = 200,
    this.onRefresh,
    @required this.child,
    this.progress,
    this.isNotPage = false,
    this.stopRefresh = false,
    this.notPageHeight,
    this.askOnBack = false,
    this.failedToLoadHeight,
  }) : super(key: key);

  @override
  _LoadingManagerState createState() => _LoadingManagerState();
}

class _LoadingManagerState extends State<LoadingManager>
    with TickerProviderStateMixin{
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    Widget _placeHolder;
    // to load data if load not start
    if(widget.isLoading == null || widget.stateCode == null && widget.onRefresh != null){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.onRefresh();
      });
    }

    // if loading of still not start in loading (true or null)
    // return loading widget
    if(widget.isLoading != false || widget.stateCode == null || _isloading){
      _placeHolder = widget.isNotPage
          ? SizedBox(height: widget.notPageHeight,child: APageLoading())
          : APageLoading();
    }else if(widget.isFailedLoading){
      // if failed return failed widget
      _placeHolder = Center(
        child: SizedBox(
          height: widget.failedToLoadHeight ?? 240 * AppStyle.getScaleFactor(context),
          child: FailedLoading(
            message: HttpStatusManger.getStatusMessage(
                status: widget.stateCode,
            ),
            status: widget.stateCode,
            onReload: () async {
              _isloading = true;
              setState(() {});
              await widget.onRefresh();
              _isloading = false;
              setState(() {});
            },
          ),
        ),
      );
    }

    if(widget.stopRefresh || widget.onRefresh == null)
      return AnimatedSize(
        vsync: this,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: _placeHolder ?? widget.child),
      );

    // if load end successfully return loaded widget
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: AnimatedSize(
        vsync: this,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: _placeHolder ?? widget.child),
      )
    );
  }
}
