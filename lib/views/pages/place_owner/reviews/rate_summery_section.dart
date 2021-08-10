import 'package:circles/models/rate_summery.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/image_loader.dart';
import 'package:circles/views/widgets/reviews/app_rate_bar.dart';
import 'package:circles/views/widgets/reviews/rate_bar_with_ratio.dart';
import 'package:flutter/material.dart';
class RateSummerySection extends StatelessWidget {

  final RateSummery rateSummery;

  const RateSummerySection({Key key, this.rateSummery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0,.5),
                color: Colors.grey
            ),
          ]
      ),
      child: Container(
        height: 94 * AppStyle.getScaleFactor(context),
        padding: EdgeInsets.only(bottom: 8 * AppStyle.getScaleFactor(context)),
        child: Row(
          children: [
            SizedBox(width: 16 * AppStyle.getScaleFactor(context),),
            // average rate
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rateSummery.userRate.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Theme.of(context).accentColor
                  ),
                  textScaleFactor: AppStyle.getScaleFactor(context),
                ),
                ARateBar(rate: rateSummery.userRate,),
              ],
            ),
            //SizedBox(width: 8 * AppStyle.getScaleFactor(context),),
            // every single rate from 1-5
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 6 * AppStyle.getScaleFactor(context),),
                  Row(
                    children: [
                      Expanded(
                        child: RateBarWithRatio(
                          rate: rateSummery.fiveStarNumber,
                          totalRate: rateSummery.totalRateNumber,
                        ),
                      ),
                      ARateBar(rate: 5,),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RateBarWithRatio(
                          rate: rateSummery.fourStarNumber,
                          totalRate: rateSummery.totalRateNumber,
                        ),
                      ),
                      ARateBar(rate: 4,),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RateBarWithRatio(
                          rate: rateSummery.threeStarNumber,
                          totalRate: rateSummery.totalRateNumber,
                        ),
                      ),
                      ARateBar(rate: 3,),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RateBarWithRatio(
                          rate: rateSummery.twoStarNumber,
                          totalRate: rateSummery.totalRateNumber,
                        ),
                      ),
                      ARateBar(rate: 2,),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RateBarWithRatio(
                          rate: rateSummery.oneStarNumber,
                          totalRate: rateSummery.totalRateNumber,
                        ),
                      ),
                      ARateBar(rate: 1,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16 * AppStyle.getScaleFactor(context),),
          ],
        ),
      ),
    );
  }
}
