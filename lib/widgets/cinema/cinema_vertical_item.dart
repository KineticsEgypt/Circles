import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/pages/home_pages/cinema_page/buy_cinema_ticket.dart';
import 'package:circles/pages/home_pages/cinema_page/movie_details.dart';
import 'package:circles/widgets/c_rate_bar.dart';
import 'package:flutter/material.dart';

import '../buttons/c_small_button.dart';
import 'genre_badge.dart';
class CinemaVerticalItem extends StatelessWidget {
  final int heroTag;

  const CinemaVerticalItem({Key key,@required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(MovieDetails.id,arguments: heroTag);
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
        padding:EdgeInsets.symmetric(horizontal: 4,vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
            )
          ]
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Hero(
                  tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                      image: AssetImage("assets/images/test_movie_cover.jpg"),
                    width: MediaQuery.of(context).size.width/1.4,
                    height: MediaQuery.of(context).size.width/2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      "some long movie name word, word, word again",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CirclesTextStyles.header6Black,
                      textAlign: TextAlign.center,
                      textScaleFactor: CirclesTextStyles.getScaleFactor(context),
                    ),
                  ),

                  Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(
                        10 > MediaQuery.of(context).size.width ~/1.7 ~/84
                            ? MediaQuery.of(context).size.width ~/1.7 ~/84 + 1
                            : 10,
                            (index) {
                          int hidedItems = MediaQuery.of(context).size.width ~/1.7 ~/84;
                          if(index == hidedItems)
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                              decoration: BoxDecoration(
                                color: CirclesColors.yellow,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                  "+${10 - hidedItems}",
                                  style: TextStyle(
                                    inherit: true,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: CirclesColors.grey,
                                  )
                              ),
                            );
                          return GenreBadge(
                            text: "Action $index",
                          );
                        }
                    ),
                  ),
                  //SizedBox(height: 8,),

                  //SizedBox(height: 8,),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CRateBar(
                        starsNumber: 3.5,
                        itemSize: 14 * CirclesTextStyles.getScaleFactor(context),
                      ),
                      SizedBox(
                        height: 25,
                        child: CSmallButton(
                          text: "Buy Ticket",
                          onTap: (){
                            Navigator.of(context).pushNamed(BuyCinemaTicket.id);
                          },
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: 8,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
