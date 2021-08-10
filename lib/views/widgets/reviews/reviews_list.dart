import 'package:circles/models/event.dart';
import 'package:circles/models/reviews.dart';
import 'package:circles/views/app_style/app_style.dart';
import 'package:circles/views/widgets/loaders/no_item_found.dart';
import 'package:circles/views/widgets/reviews/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  final List<Review> reviews;
  final Function(Review) onPressed;
  final Function(Review) onEdit;
  final Future<void> Function(Review) onDelete;
  final bool nextPage;
  final Future<void> Function() onLazyLoad;

  const ReviewsList({
    Key key,
    this.reviews,
    this.onPressed,
    this.nextPage,
    this.onLazyLoad,
    this.onDelete,
    this.onEdit
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(reviews.isEmpty){
      return NoItemFound(
        message: "No reviews found",
      );
    }
    return ListView.builder(
        padding: AppStyle.getListPadding(context),
        itemCount: reviews.length,
        itemBuilder: (context,itemIndex){
          Review _review = reviews[itemIndex];
          return ReviewItem(
            review: _review,
            onPressed:onPressed,
            onDelete: onDelete,
            onEdit: onEdit,
          );
        }
    );
  }
}