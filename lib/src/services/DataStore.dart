import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:options_consumer_app/src/models/category.dart';
class DataStore {
  Future<Map<String, dynamic>> getData() async {
    List<Future> tasks = [];
    tasks.addAll([
      getCategories(),
      getBrands(),
      //getStores(),
      getProducts()
    ]);
    List results = await Future.wait(tasks);
    return {
      'categories': results[0],
      'brands': results[1],
      //'stores': results[2],
      'products':results[2]
    };
  }
  Future<List<QueryDocumentSnapshot>> getCategories() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection("category").get();
    return snapshot.docs;
  }
  Future<List<QueryDocumentSnapshot>> getSubcategory(Category category) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("category")
        .doc(category.id.toString())
        .collection("subCategories")
        .get();
    // print(snapshot.docs.length);
    return snapshot.docs;
  }
  Future<List<QueryDocumentSnapshot>> getBrands() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection("brands").get();

    return snapshot.docs;
  }
  // Future<List<QueryDocumentSnapshot>> getStores() async {
  //   QuerySnapshot snapshot =
  //   await FirebaseFirestore.instance.collection("Stores").get();
  //
  //   return snapshot.docs;
  // }
  Future<Map<String,dynamic>> getProducts() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("products").get();
    Map<String,dynamic> productMap = new Map();
    for(QueryDocumentSnapshot doc in snapshot.docs){
      if(doc.data()["inStock"]){
        productMap[doc.data()["id"].toString()] = doc;
      }
    }
    return productMap;
  }
}