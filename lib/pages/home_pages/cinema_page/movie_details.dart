import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/models/cinema_time.dart';
import 'package:circles/widgets/buttons/c_icon_button.dart';
import 'package:circles/widgets/buttons/c_small_button.dart';
import 'package:circles/widgets/c_rate_bar.dart';
import 'package:circles/widgets/cinema/genre_badge.dart';
import 'package:circles/widgets/image_loader.dart';
import 'package:flutter/material.dart';

import 'buy_cinema_ticket.dart';
class MovieDetails extends StatefulWidget {
  static final String id = "movie/details";
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with SingleTickerProviderStateMixin {
  int _maxLineNumber = 3;

  @override
  Widget build(BuildContext context) {
    final int heroTag = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                  SliverAppBar(
                  //pinned: true,
                  stretch: true,
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.of(context).size.height/3,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: heroTag,
                      child: Image(
                          image: AssetImage("assets/images/test_movie_cover.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [

                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "movie name movie name movie name movie name movie name",
                                style: CirclesTextStyles.header5,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: List.generate(
                                  15,
                                      (index) {
                                    return GenreBadge(
                                      text: "Action $index",
                                    );
                                  }
                              ),
                            ),
                            SizedBox(height: 8,),
                            CRateBar(
                              itemSize: 18,
                              starsNumber: 2.5,
                              onRatingUpdate: (starsNumber){

                              },
                            ),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/time.png"),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  "RunTime: 2h 33 mins",
                                  style: CirclesTextStyles.subTitle2,
                                  textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child:   Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Introduction",
                                    style: CirclesTextStyles.header5,
                                    textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      if(_maxLineNumber == null){
                                        _maxLineNumber = 3;
                                      } else {
                                        _maxLineNumber = null;
                                      }
                                      setState(() {});
                                    },
                                    child: AnimatedSize(
                                      vsync: this,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOutBack,
                                      child: AnimatedSwitcher(
                                        duration: Duration(milliseconds: 200),
                                        child: Text(
                                          "The surviving members of the resistance face the First Order once"
                                          "again, and the legendary conflict between the Jedi and the Sith"
                                          "again, and the legendary conflict between the Jedi and the Sith"
                                          "again, and the legendary conflict between the Jedi and the Sith"
                                          "again, and the legendary conflict between the Jedi and the Sith"
                                          "again, and the legendary conflict between the Jedi and the Sith"
                                          "again, and the legendary conflict between the Jedi and the Sith"
                                          "reaches its peak bringing the Skywalker saga to its",
                                          key: ValueKey(_maxLineNumber ?? 0),
                                          style: CirclesTextStyles.subTitle1,
                                          maxLines: _maxLineNumber,
                                          overflow: _maxLineNumber == null
                                              ? null
                                              : TextOverflow.fade,
                                          textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                                        ),
                                      ),
                                    ),

                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    "Starring",
                                    style: CirclesTextStyles.header5,
                                    textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                                  ),
                                  SizedBox(height: 4,),
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      itemCount: 15,
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                      ),
                                      itemBuilder: (context,itemIndex){
                                        return SizedBox(
                                          height: 120 * CirclesTextStyles.getScaleFactor(context),
                                          width: 80 * CirclesTextStyles.getScaleFactor(context),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: ImageLoader(
                                              url: itemIndex%2 == 0
                                                  ?"https://m.media-amazon.com/images/M/MV5BOTI3ODk1MTMyNV5BMl5BanBnXkFtZTcwNDEyNTE2Mg@@._V1_UY317_CR6,0,214,317_AL_.jpg"
                                                  :"https://m.media-amazon.com/images/M/MV5BZmViMjQxYTUtZDExNy00NjU1LWI4MmEtY2RhODRkMzNkODM1XkEyXkFqcGdeQXVyNjkwNzEwMzY@._V1_UY317_CR56,0,214,317_AL_.jpg",
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 24,),

                            Opacity(
                              opacity: .6,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                margin: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width/10
                                ),
                                child: CSmallButton(
                                  text: "Buy Ticket",
                                  fontSize: 22,
                                  onTap: (){
                                    Navigator.of(context).pushNamed(BuyCinemaTicket.id);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60,),

                    ],
                  ),
                ),
              ],
            ),
            Hero(
              tag: "menu tag",
              transitionOnUserGestures: true,
              child: CIconButton(
                iconData:  Icons.close,
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
