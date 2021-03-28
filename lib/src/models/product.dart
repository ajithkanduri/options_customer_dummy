import 'package:flutter/material.dart';
import 'package:options_consumer_app/src/models/reviews.dart';
import 'package:options_consumer_app/src/models/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Product {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "imageURL";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const AVAILABLE = "available";
  static const SALES = "sales";
  static const DISCOUNT = "discount";
  static const AVERAGE_RATING = "avgRating";
  static const REVIEWS = "reviews";
  static const COLORS = "colors";
  static const SIZES = "size";
  static const RELATED_PRODUCTS = "relatedProducts";
  static const IS_DISCOUNTED_PRODUCT = "isDiscountedProduct";
  static const IN_STOCK = "inStock";

  String _id;
  String _name;
  String _image;
  String _description;
  double _price;
  int _available;
  int _quantity;
  int _sales;
  double _discount;
  double _avgRating;
  bool _isDiscountedProduct;
  bool _inStock;
  List<String> _size;
  List<String> _relatedProducts;
  List<Colour> _colors = new List<Colour>();
  List<Review> _reviews = new List<Review>();

  String getPrice() {
    if (this._isDiscountedProduct) {
      return '\$${(this._price-this._discount).toStringAsFixed(2)}';
    }
    return '\$${this._price.toStringAsFixed(2)}';
  }
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot.data());
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _sales = snapshot.data()[SALES];
    _description = snapshot.data()[DESCRIPTION] ?? " ";
    _price = snapshot.data()[PRICE].toDouble();
    _available = snapshot.data()[AVAILABLE];
    _size = snapshot.data()[SIZES].cast<String>();
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
    _inStock = snapshot.data()[IN_STOCK];
    _isDiscountedProduct = snapshot.data()[IS_DISCOUNTED_PRODUCT];
    _discount = snapshot.data()[DISCOUNT].toDouble();
    _avgRating = snapshot.data()[AVERAGE_RATING].toDouble();
    _relatedProducts = snapshot.data()[RELATED_PRODUCTS].cast<String>();
     snapshot.data()[COLORS].forEach((color){_colors.add(Colour.fromSnapShot(color));});
     snapshot.data()[REVIEWS].forEach((review){_reviews.add(Review.fromSnapShot(review));});
  }

  String get id => _id;

  String get name => _name;

  String get image => _image;

  String get description => _description;

  double get price => _price;

  int get available => _available;

  int get quantity => _quantity;

  int get sales => _sales;

  double get discount => _discount;

  double get avgRating => _avgRating;

  List<Review> get reviews => _reviews;

  List<String> get size => _size;

  List<Colour> get colors => _colors;

  List<String> get relatedProducts => _relatedProducts;

  bool get inStock => _inStock;

  bool get isDiscountedProduct => _isDiscountedProduct;
}

class ProductsList {
  List<Product> _flashSalesList;
  List<Product> _list;
  List<Product> _categorized;
  List<Product> _favoritesList;
  List<Product> _cartList;

  set categorized(List<Product> value) {
    _categorized = value;
  }

  List<Product> get categorized => _categorized;

  List<Product> get list => _list;
  List<Product> get flashSalesList => _flashSalesList;
  List<Product> get favoritesList => _favoritesList;
  List<Product> get cartList => _cartList;


}
