import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FailedLoading extends StatelessWidget {
  final String message;
  final int status;
  final VoidCallback onReload;

  const FailedLoading({
    Key key,
    this.message,
    this.onReload,
    this.status = 400
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image(
              image: AssetImage(
                  status >= 400 && status < 500
                      ? "assets/images/request_error.png"
                      : "assets/images/server_error.png"
              ),
              fit: BoxFit.contain,
            ),
          ),
          //SizedBox(height: 8,),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                  message?? "Error Request Failed",
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textScaleFactor: AppStyle.getScaleFactor(context),
              ),
              TextButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh_rounded),
                    Text("Refresh?"),
                  ],
                ),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  textStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontSize: 14 * AppStyle.getScaleFactor(context),
                    fontWeight: FontWeight.bold,
                  ),
                  //side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                onPressed: onReload,
              ),
            ],
          ),
         //SizedBox(height: 16,),
        ],
      ),
    );
  }
}
