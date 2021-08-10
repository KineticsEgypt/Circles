import 'package:circles/models/user.dart';

class Review{
  String id;
  User user;
  double rate;
  String comment;
  DateTime date;
  String placeId;

  Review({
    this.id,
    this.user,
    this.comment,
    this.rate,
    this.placeId,
    this.date,
  });
}