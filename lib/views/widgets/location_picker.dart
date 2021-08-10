
import 'package:circles/models/location.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class LocationsPicker extends StatefulWidget {

  final List<String> selectedLocations;
  final List<Location> locations;
  final Function(List<String>) onSelect;
  final bool seeMore;

  const LocationsPicker({
    Key key,
    this.selectedLocations,
    this.locations,
    this.onSelect,
    this.seeMore = false
  }) : super(key: key);

  @override
  _LocationsPickerState createState() => _LocationsPickerState();
}

class _LocationsPickerState extends State<LocationsPicker> {
  List<String> selectedBadges = [];

  @override
  void initState() {
    super.initState();
    if(widget.selectedLocations != null){
      selectedBadges.clear();
      selectedBadges.addAll(widget.selectedLocations);
    }
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      height: MediaQuery.of(context).size.height/(widget.seeMore ? 3 :10),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        switchInCurve: Curves.easeInOutBack,
        child: GridView.count(
            key: ValueKey(widget.seeMore),
            physics: BouncingScrollPhysics(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: widget.seeMore ? 5 :2,
            childAspectRatio: widget.seeMore ? .35 : .25,
            scrollDirection: Axis.horizontal,
            children: List.generate(
                widget.locations.length, (index) {
                  return MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      if(selectedBadges.contains(widget.locations[index].id)){
                        selectedBadges.remove(widget.locations[index].id);
                      }else{
                        selectedBadges.add(widget.locations[index].id);
                      }
                      widget.onSelect(selectedBadges);
                      setState(() {});
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            color:  selectedBadges.contains(widget.locations[index].id)
                                ? Theme.of(context).accentColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                          child: Text(
                            widget.locations[index].name,
                            style: TextStyle(
                              inherit: true,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedBadges.contains(widget.locations[index].id)
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Colors.white,
                              fontFamily: "Gothic",
                            ),
                            textScaleFactor: AppStyle.getScaleFactor(context),
                            textAlign: TextAlign.center,
                            //overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
        ),
      ),
    );
  }
}
