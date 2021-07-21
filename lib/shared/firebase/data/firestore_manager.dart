import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreManager {
  final String cacheField = 'updatedAt';

  //get all
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
      String collectionName) async {
    final collection = _getCollection(collectionName);

    var collectionData = await collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .get();

    return collectionData.docs;
  }

  // get by id
  Future<DocumentSnapshot<Map<String, dynamic>>> getById(
      String collectionName, String id) async {
    final collection = _getCollection(collectionName);

    return collection.doc(id).get();
  }

  //get range by ids
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getByIds(
      String collectionName, List<String> ids) async {
    final collection = _getCollection(collectionName);

    var collectionData =
        await collection.where(FieldPath.documentId, whereIn: ids).get();

    return collectionData.docs;
  }

  //get range by isEqualTo filter
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getByEqualFilter(
      String collectionName, String filterField, Object filterValue) async {
    final collection = _getCollection(collectionName);

    var collectionData =
        await collection.where(filterField, isEqualTo: filterValue).get();

    return collectionData.docs;
  }

  //get count by isEqualTo filter
  Future<int> getSizeByEqualFilter(
      String collectionName, String filterField, Object filterValue) async {
    final collection = _getCollection(collectionName);

    var collectionData =
        await collection.where(filterField, isEqualTo: filterValue).get();

    return collectionData.size;
  }

  //add
  Future add(String collectionName, Map<String, dynamic> data) async {
    final collection = _getCollection(collectionName);

    _addUserId(data);

    await collection
        .add(data)
        .then((value) => print("Added"))
        .catchError((error) => print("Add error: $error"));
  }

  //update
  Future update(
      String collectionName, String id, Map<String, dynamic> data) async {
    final collection = _getCollection(collectionName);

    await collection
        .doc(id)
        .update(data)
        .then((value) => print("Updated"))
        .catchError((error) => print("Update error: $error"));
  }

  //delete
  Future delete(String collectionName, String id) async {
    final collection = _getCollection(collectionName);

    await collection
        .doc(id)
        .delete()
        .then((value) => print("deleted"))
        .catchError((error) => print("Delete error: $error"));
  }

  CollectionReference<Map<String, dynamic>> _getCollection(
      String collectionName) {
    return FirebaseFirestore.instance.collection(collectionName);
  }

  void _addUserId(Map<String, dynamic> data) {
    data["userId"] = FirebaseAuth.instance.currentUser.uid;
  }
}
