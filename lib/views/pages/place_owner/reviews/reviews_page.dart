import 'package:circles/models/rate_summery.dart';
import 'package:circles/models/reviews.dart';
import 'package:circles/models/user.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/reviews/reviews_list.dart';
import 'package:circles/views/widgets/titles/app_title.dart';
import 'package:flutter/material.dart';

import 'rate_summery_section.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        //floatHeaderSlivers: false,
        headerSliverBuilder: (headerContext, value) {
          return [
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8 * AppStyle.getScaleFactor(context)
                  ),
                  child: ATitle("Reviews"),
                ),
                RateSummerySection(
                  rateSummery: RateSummery(
                      average: 3.5,
                      userRate: 4.5,
                      oneStarNumber: 120,
                      twoStarNumber: 130,
                      threeStarNumber: 200,
                      fourStarNumber: 100,
                      fiveStarNumber: 150,
                      totalRateNumber: 700
                  ),
                ),
              ]),
            ),
          ];
        },
        body: ReviewsList(
          reviews: List.generate(
              20, (index) {
            return Review(
              id: index.toString(),
              rate: 3.5,
              user: User(
                  name: "User name",
                  image: "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg"
              ),
              date: DateTime.now().subtract(Duration(days: index)),
              comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              placeId: index.toString(),
            );
          }
          ),
          onPressed: (review){
          },
        ),
      )
    );
  }
}
