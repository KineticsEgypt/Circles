import 'package:circles/controlers/providers/widgets/page_index_provider.dart';
import 'package:circles/models/Badge.dart';
import 'package:circles/models/location.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/badges_picker.dart';
import 'package:circles/views/widgets/buttons/app_button.dart';
import 'package:circles/views/widgets/buttons/app_flat_button.dart';
import 'package:circles/views/widgets/c_rate_bar.dart';
import 'package:circles/views/widgets/location_picker.dart';
import 'package:circles/views/widgets/text_field/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSearch extends StatefulWidget {
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {

  bool _seeMoreBadges = false;
  bool _seeMoreLocations = false;

  double minPrice;
  double maxPrice;

  @override
  Widget build(BuildContext context) {
    PageIndexProvider _pageIndexProvider = Provider.of<PageIndexProvider>(context);
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        margin: EdgeInsets.all(_pageIndexProvider.searchIsOpen ? 0 : 12),
        width: _pageIndexProvider.searchIsOpen
            ? MediaQuery.of(context).size.width
            : 32,
        height: _pageIndexProvider.searchIsOpen
            ? MediaQuery.of(context).size.height
            : 32,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(_pageIndexProvider.searchIsOpen ? 0 : 64),
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
          child:  !_pageIndexProvider.searchIsOpen ? null: OverflowBox(
            key: ValueKey(_pageIndexProvider.searchIsOpen),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:16.0),
                          child: Text(
                              "Filters",
                            style: Theme.of(context).textTheme.headline6,
                            textScaleFactor: AppStyle.getScaleFactor(context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32,),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Mood",
                          style: Theme.of(context).textTheme.headline6,
                          textScaleFactor: AppStyle.getScaleFactor(context),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: ATextButton(
                          key: ValueKey(_seeMoreBadges),
                          text: _seeMoreBadges ? "see less" : "see more",
                          onTap: (){
                            _seeMoreBadges = !_seeMoreBadges;
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                  BadgesPicker(
                    seeMore: _seeMoreBadges,
                    onSelect: (selectedIds){
                      print(selectedIds);
                    },
                    badges: List.generate(30, (index) =>
                        Badge(
                            id: index.toString(),
                            imagePath: "assets/images/logo.png",
                          name: "long badge name $index"
                        )
                    ),
                  ),
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Locations",
                          style: Theme.of(context).textTheme.headline6,
                          textScaleFactor: AppStyle.getScaleFactor(context),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: ATextButton(
                          key: ValueKey(_seeMoreLocations),
                          text: _seeMoreLocations ? "see less " : "see more",
                          onTap: (){
                            _seeMoreLocations = !_seeMoreLocations;
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                  LocationsPicker(
                    seeMore: _seeMoreLocations,
                    onSelect: (selectedIds){
                      print(selectedIds);
                    },
                    locations: List.generate(30, (index) =>
                        Location(
                            id: index.toString(),
                            name: "long location name $index"
                        )
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text(
                    "Min Rate",
                    style: Theme.of(context).textTheme.headline6,
                    textScaleFactor: AppStyle.getScaleFactor(context),
                  ),
                  SizedBox(height: 8,),
                  CRateBar(
                    starsNumber: 3.5,
                    itemSize: 24,
                    ignoreGestures: false,
                    tapOnlyMode: false,
                    onRatingUpdate: (starsNumber){
                    },
                  ),
                  SizedBox(height: 32,),
                  Text(
                    "Minimum Charge",
                    style: Theme.of(context).textTheme.headline6,
                    textScaleFactor: AppStyle.getScaleFactor(context),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          runAlignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            ATextFormField(
                              width: MediaQuery.of(context).size.width / 3 < 160
                                  ? 160 : MediaQuery.of(context).size.width / 3,
                              textAlign: TextAlign.center,
                              prefixIcon: Text(
                                  "Min",
                                style: Theme.of(context).textTheme.subtitle2,
                                textScaleFactor: AppStyle.getScaleFactor(context),
                              ),
                              suffixIcon: Text(
                                "EGP",
                                style: Theme.of(context).textTheme.subtitle2,
                                textScaleFactor: AppStyle.getScaleFactor(context),
                              ),
                              textInputType: TextInputType.number,
                            ),
                            ATextFormField(
                              width: MediaQuery.of(context).size.width / 3 < 160
                                  ? 160 : MediaQuery.of(context).size.width / 3,
                              textAlign: TextAlign.center,
                              prefixIcon: Text(
                                "Max",
                                style: Theme.of(context).textTheme.subtitle2,
                                textScaleFactor: AppStyle.getScaleFactor(context),
                              ),
                              suffixIcon: Text(
                                "EGP",
                                style: Theme.of(context).textTheme.subtitle2,
                                textScaleFactor: AppStyle.getScaleFactor(context),
                              ),
                              textInputType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: AButton(
                          text: "Apply",
                          onPressed: (){},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
