import 'package:flutter/material.dart';

class Review {
  double _rating;
  String _userID;
  DateTime _date;
  String _review;

  Review(this._userID, this._date, this._rating, this._review);

  double get rating => _rating;

  String get review => _review;

  DateTime get date => _date;

  String get userID => _userID;

  Review.fromSnapShot(dynamic data){
    _rating = data["rating"].toDouble();
    _date = data["date"].toDate();
    _review = data["review"];
    _userID = data["userID"];
  }
}