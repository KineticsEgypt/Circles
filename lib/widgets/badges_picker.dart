import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/Badge.dart';
import 'package:flutter/material.dart';
class BadgesPicker extends StatefulWidget {

  final List<String> selectedBadges;
  final List<Badge> badges;
  final Function(List<String>) onSelect;
  final bool seeMore;

  const BadgesPicker({
    Key key,
    this.selectedBadges,
    this.badges,
    this.onSelect,
    this.seeMore = false
  }) : super(key: key);

  @override
  _BadgesPickerState createState() => _BadgesPickerState();
}

class _BadgesPickerState extends State<BadgesPicker> {
  List<String> selectedBadges = [];

  @override
  void initState() {
    super.initState();
    if(widget.selectedBadges != null){
      selectedBadges.clear();
      selectedBadges.addAll(widget.selectedBadges);
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
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: widget.seeMore ? 3 :1,
            scrollDirection: Axis.horizontal,
            children: List.generate(
                widget.badges.length, (index) {
                  return MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      if(selectedBadges.contains(widget.badges[index].id)){
                        selectedBadges.remove(widget.badges[index].id);
                      }else{
                        selectedBadges.add(widget.badges[index].id);
                      }
                      widget.onSelect(selectedBadges);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                                color:  selectedBadges.contains(widget.badges[index].id)
                                    ? CirclesColors.yellow
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height)
                            ),
                            child: Image(
                              image: AssetImage(widget.badges[index].imagePath),
                              color: selectedBadges.contains(widget.badges[index].id)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          widget.badges[index].name,
                          style: TextStyle(
                            inherit: true,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Gothic",
                          ),
                          //overflow: TextOverflow.ellipsis,
                          textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }
            ),
        ),
      ),
    );
  }
}
