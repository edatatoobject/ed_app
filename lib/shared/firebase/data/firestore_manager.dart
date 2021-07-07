import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreManager {
  final String cacheField = 'updatedAt';

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
      String collectionName) async {
    final collection = _getCollection(collectionName);

    var collectionData = await collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .get();

    return collectionData.docs;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getById(
      String collectionName, String id) async {
    final collection = _getCollection(collectionName);

    return collection.doc(id).get();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getByIds(
      String collectionName, List<String> ids) async {
    final collection = _getCollection(collectionName);

    var collectionData = await collection
        .where(FieldPath.documentId, whereIn: ids)
        .get();

    return collectionData.docs;
  }

  CollectionReference<Map<String, dynamic>> _getCollection(
      String collectionName) {
    return FirebaseFirestore.instance.collection(collectionName);
  }
}
