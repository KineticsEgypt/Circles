import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/pages/home_pages/cinema_page/buy_cinema_ticket.dart';
import 'package:circles/views/pages/home_pages/cinema_page/movie_details.dart';
import 'package:flutter/material.dart';
import '../buttons/app_small_button.dart';
import '../c_rate_bar.dart';
import 'genre_badge.dart';
class CinemaHorizontalItem extends StatelessWidget {
  final int heroTag;

  const CinemaHorizontalItem({Key key, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(MovieDetails.id,arguments: heroTag);
      },
      child: Container(
        height: MediaQuery.of(context).size.height/1.8,
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding:EdgeInsets.symmetric(horizontal: 8),
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
        child: Column(
          children: [
            SizedBox(height: 8,),
            Expanded(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "some long movie name word, word, word again",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
                textScaleFactor: AppStyle.getScaleFactor(context),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                  10 > MediaQuery.of(context).size.width ~/1.5 ~/84
                      ? MediaQuery.of(context).size.width ~/1.5 ~/84 + 1
                      : 10,
                      (index) {
                        int hidedItems = MediaQuery.of(context).size.width ~/1.5 ~/84;
                        if(index == hidedItems)
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                                "+${10 - hidedItems}",
                              style: Theme.of(context).textTheme.subtitle1,
                              textScaleFactor: AppStyle.getScaleFactor(context),
                            ),
                          );
                        return GenreBadge(
                          text: "Action $index",
                        );
                      }
              ),
            ),
            SizedBox(height: 8,),
            CRateBar(
              starsNumber: 3.5,
            ),
            SizedBox(height: 8,),
            CSmallButton(
              text: "Buy Ticket",
              onTap: (){
                Navigator.of(context).pushNamed(BuyCinemaTicket.id);
              },
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
