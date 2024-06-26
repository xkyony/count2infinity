// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../model.dart';
import '../repository.dart';

class FirebaseRepository<T extends Model> extends Repository<T> {
  final String collection;
  final Function fromJson;
  final FirebaseFirestore instance;
  final Logger logger;

  FirebaseRepository({
    required this.collection,
    required this.fromJson,
    required this.instance,
    Logger? logger,
  }) : logger = logger ?? Logger();

  CollectionReference get query {
    return instance.collection(collection).withConverter(
          toFirestore: (model, _) => (model as Model).toJson(),
          fromFirestore: (snapshot, options) {
            try {
              final String id = snapshot.id;
              final Map<String, dynamic> json =
                  snapshot.data() as Map<String, dynamic>;

              final document = {...json, 'id': id};
              T model = fromJson(document);
              return model;
            } catch (e) {
              logger.e(collection);
              logger.e(snapshot.id);
              logger.e(e.toString());
              rethrow;
            }
          },
        );
  }

  @override
  Future<int> get fetchCount async {
    try {
      final result = await query.count().get();
      return result.count!;
    } on FirebaseException catch (error) {
      if (error.code == 'DEADLINE_EXCEEDED') {
        final message =
            'Count operation exceeded the dealine for the $collection collection.';
        logger.e(message);
        throw FirebaseException(
          code: error.code,
          message: message,
          plugin: 'Firestore',
        );
      }
      rethrow;
    }
  }

  T fromDocument(QueryDocumentSnapshot doc) {
    return doc.data() as T;
  }

  @override
  Stream<List<T>> get watchList {
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data() as T;
      }).toList();
    });
  }

  @override
  Future<void> add(T model) async {
    try {
      final id = model.id;
      await query.doc(id).set(model);
    } on FirebaseException catch (e) {
      logger.e('Error in $collection/${model.id} document.');
      logger.e(e.toString());
    }
  }

  @override
  Future<void> addAll(List<T> items) async {
    try {
      for (var item in items) {
        await add(item);
      }
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await query.doc(id).delete();
    } on FirebaseRepository catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      final snapshot = await query.get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<T?> fetch(String id) async {
    try {
      final snapshot = await query.doc(id).get();
      if (!snapshot.exists) {
        logger.w(
            'The document with id:$id was not found in the $collection collection.');
        return null;
      }
      return snapshot.data() as T;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  @override
  Stream<T?> watch(String id) {
    if (id.isEmpty) {
      return Stream.value(null);
    }
    final result = query.doc(id).snapshots();
    return result.map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data() as T;
      } else {
        return null;
      }
    });
  }

  Future<List<T>> fetchBy({
    required String field,
    required String value,
  }) async {
    final querySnapshot = await query.where(field, isEqualTo: value).get();
    return querySnapshot.docs.map((doc) => doc.data() as T).toList();
  }

  @override
  Future<void> modify(Model model) async {
    try {
      final id = model.id;
      final data = model.toJson();
      data.remove('id');
      await query.doc(id).update(data);
    } on FirebaseException catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> seed(List<T> items) async {
    try {
      await deleteAll();
      await addAll(items);
    } on FirebaseException catch (e) {
      logger.e(e);
      rethrow;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Stream<List<T>> watchAllBy({required String field, required String value}) {
    return query.where(field, isEqualTo: value).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        try {
          return doc.data() as T;
        } catch (e) {
          logger.e(collection);
          logger.e(e.toString());
          rethrow;
        }
      }).toList();
    });
  }

  @override
  Future<List<T>> fetchAll() async {
    try {
      final snapshot = await query.get();
      final docs = snapshot.docs;
      return docs.map((doc) => fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      logger.e(e.message);
      rethrow;
    }
  }
}
