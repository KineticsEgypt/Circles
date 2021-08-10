import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
class NoItemFound extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback onAddItem;
  const NoItemFound({
    Key key,
    this.message,
    this.buttonText,
    this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size =  MediaQuery.of(context).size.width/ 1.5;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image(
              width:  size,
              image: AssetImage("assets/images/no_item_found.png"),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
          Text(
              message ?? "no item found",
            style: Theme.of(context).textTheme.subtitle2,
            textScaleFactor: AppStyle.getScaleFactor(context),
          ),
          onAddItem == null ? SizedBox.shrink() :
          Column(
            children: [
              SizedBox(height: 8 * AppStyle.getScaleFactor(context),),
              SizedBox(
                width: size,
                child: AButton(
                  text: buttonText ?? "Add",
                  onPressed: onAddItem,
                ),
              ),
            ],
          ),
          Spacer(flex: 1,),
        ],
      ),
    );
  }
}
