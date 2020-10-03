import 'package:circles/app_style/text_style.dart';
import 'package:circles/controlers/providers/page_index_provider.dart';
import 'package:circles/widgets/buttons/c_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeMenu extends StatelessWidget {

  bool _isOpened;
  @override
  Widget build(BuildContext context) {
    PageIndexProvider _pageIndexProvider = Provider.of<PageIndexProvider>(context);
    _isOpened = _pageIndexProvider.menuIsOpen;
    return Align(
      alignment: Alignment.topLeft,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        margin: EdgeInsets.all(_isOpened ? 0 : 12),
        width: _isOpened
            ? MediaQuery.of(context).size.width
            : 28,
        height: _isOpened
            ? MediaQuery.of(context).size.height
            : 28,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(_isOpened ? 0 : 64),
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 600),
          switchInCurve: Curves.easeInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
                scale: animation,
                child: FadeTransition(child: child,opacity: animation,)
            );
          },
          child:  !_isOpened ? null: SingleChildScrollView(
            key: ValueKey(_isOpened),
            child: SizedBox(
              height: MediaQuery.of(context).size.height
              - MediaQuery.of(context).padding.top - kToolbarHeight,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:16.0),
                      child: Text(
                          "Circles",
                        style: CirclesTextStyles.header4,
                        textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                      ),
                    ),
                    Expanded(
                      child: Transform.scale(
                        scale: MediaQuery.of(context).size.width >= 640
                            ? 1.5 : 1 ,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CFlatButton(
                              text: "Ann Michelle",
                              onTap: (){
                                _pageIndexProvider.pageIndex = 0;
                              },
                            ),
                            SizedBox(height:4 * CirclesTextStyles.getScaleFactor(context)),
                            CFlatButton(
                              text: "Reserve",
                              onTap: (){
                                _pageIndexProvider.pageIndex = 1;
                              },
                            ),
                            SizedBox(height:4 * CirclesTextStyles.getScaleFactor(context)),
                            CFlatButton(
                              text: "Cinema",
                              onTap: (){
                                _pageIndexProvider.pageIndex = 2;
                              },
                            ),
                            SizedBox(height:4 * CirclesTextStyles.getScaleFactor(context)),
                            CFlatButton(
                              text: "Contact Us",
                              onTap: (){},
                            ),
                            SizedBox(height:4 * CirclesTextStyles.getScaleFactor(context)),
                            CFlatButton(
                              text: "About Us",
                              onTap: (){},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CFlatButton(
                        text: "Power By Kinetics Egypt",
                        onTap: (){},
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
