import 'package:options_consumer_app/config/ui_icons.dart';
import 'package:options_consumer_app/src/models/product.dart';
import 'package:options_consumer_app/src/models/reviews.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
class Category {
  String id;
  String name;
  bool selected;
  IconData icon;
  List<Product> products;
  Category(this.id,this.name, this.icon, this.selected, this.products);
}

class SubCategory {
  String id;
  String name;
  List<String> products;
  SubCategory(this.id,this.name, this.products);
  SubCategory.fromSnapShot(QueryDocumentSnapshot snapshot){
    id = snapshot.data()["id"];
    name = snapshot.data()["name"];
    products = snapshot.data()["products"].cast<String>();
  }
}

class  CategoriesList {
  List<Category> _list;

 // List<Category> get list => getCategories();

  IconData fromJSONString(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);
    return IconData(
      map['codePoint'],
      fontFamily: map['fontFamily'],
      fontPackage: map['fontPackage'],
      matchTextDirection: map['matchTextDirection'],
    );
  }
  // developer.log('hello',name:"world");

  selectById(String id) {
    this._list.forEach((Category category) {
      category.selected = false;
      if (category.id == id) {
        category.selected = true;
      }
    });
  }
  getCategories(AsyncSnapshot<Map<String, dynamic>> snap) {
    this._list = [];
    Map<String,dynamic> productMap = snap.data['products'];
    for(int i=0;i<snap.data['categories'].length;i++){
      print(snap.data['categories'][i]);
      List<String> prodIds = snap.data['categories'][i].data()["products"].cast<String>();
      List<Product> _productList = [];
      prodIds.forEach((element) {
        _productList.add(Product.fromSnapshot(productMap[element]));
      });
      _list.add(
          new Category(
            snap.data['categories'][i].data()["id"],
            snap.data['categories'][i].data()["name"],
            UiIcons.shoe_1,
            i==0?true:false,
            _productList
          )
      );
    }
    return _list;
  }
  void clearSelection() {
    _list.forEach((category) {
      category.selected = false;
    });
  }
}

class SubCategoriesList {
  List<SubCategory> _list;

  List<SubCategory> get list => _list;

  SubCategoriesList() {
    this._list = [
      new SubCategory('0','Sh', []),
      new SubCategory('0','Sh', []),
      new SubCategory('0','Sh', []),
      new SubCategory('0','Sh', []),];
  }
//
//   selectById(String id) {
//     this._list.forEach((SubCategory subCategory) {
//       subCategory.selected = false;
//       if (subCategory.id == id) {
//         subCategory.selected = true;
//       }
//     });
//   }
//
//   void clearSelection() {
//     _list.forEach((category) {
//       category.selected = false;
//     });
//   }
 }
