import 'package:flutter/material.dart';

class Colour {
  String _name;

  String _hexCode;

  Colour(this._name, this._hexCode);

  String get name => _name;

  String get hexCode => _hexCode;

  Colour.fromSnapShot(dynamic data){
    _name = data["name"];
    _hexCode = data["hexCode"];
  }
}