import 'package:circles/app_style/colors.dart';
import 'package:circles/app_style/text_style.dart';
import 'package:circles/widgets/c_rate_bar.dart';
import 'package:flutter/material.dart';

import 'buttons/c_small_button.dart';
class CinemaItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.8,
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding:EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image(
                  image: AssetImage("assets/images/test_movie_cover.jpg"),
                width: MediaQuery.of(context).size.width/1.4,
                height: MediaQuery.of(context).size.width/2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "some long movie name word, word, word again",
              style: CirclesTextStyles.header6Black,
              textAlign: TextAlign.center,
              textScaleFactor: CirclesTextStyles.getScaleFactor(context),
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
                            color: CirclesColors.yellow,
                            borderRadius: BorderRadius.circular(24),
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
                      return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: CirclesColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(0,2)
                          )
                        ]
                    ),
                    child: Text(
                      "Action",
                      style: CirclesTextStyles.body2,
                    ),
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
            onTap: (){},
          ),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
}
