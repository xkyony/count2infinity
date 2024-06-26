// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';


// class Product extends Model {
//   Product({required super.id});

//   int get special => 10;

//   @override
//   String get collection => 'product';
// }




// abstract class DB {
//   Future<void> add(Model model);
// }

// class FakeDB implements DB {
//   final Map<String, Map<String, Model>> data;

//   FakeDB({this.data = const <String, Map<String, Model>>{}});

//   @override
//   Future<void> add(Model model) async {
//     data.putIfAbsent(model.collection, () => <String, Model>{});
//     data[model.collection]![model.id] = model;
//   }
// }

// class FirestoreDB implements DB {
//   final Firebase instance;

//   FirestoreDB({required this.instance});
//   @override
//   Future<void> add(Model model) async {
//     debugPrint('todo');
//   }
// }

// class Repo<T extends Model> {
//   final DB db;
//   Repo({required this.db});

//   Future<void> add(T model) async {
//     db.add(model);
//   }
// }

// class ProductRepo extends Repo<Product> {
//   ProductRepo({required super.db});
// }


