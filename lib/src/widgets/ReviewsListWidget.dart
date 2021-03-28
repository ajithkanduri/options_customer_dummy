import 'package:options_consumer_app/src/models/reviews.dart';
import 'package:options_consumer_app/src/widgets/ReviewItemWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReviewsListWidget extends StatelessWidget {
  List<Review> reviewList;

  ReviewsListWidget({
    Key key,
    this.reviewList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return ReviewItemWidget(review: this.reviewList.elementAt(index));
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 30,
        );
      },
      itemCount: this.reviewList.length,
      primary: false,
      shrinkWrap: true,
    );
  }
}
