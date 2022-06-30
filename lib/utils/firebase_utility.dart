import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtility {
  static addData(
      {required String collection, required Map<String, dynamic> doc}) async {
    await FirebaseFirestore.instance.collection(collection).add(doc);
  }

  static updateData(
      {required String collection,
      required Map<String, dynamic> doc,
      required String docId}) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(docId)
        .update(doc);
  }

  static deleteData({required String collection, required String docId}) async {
    await FirebaseFirestore.instance.collection(collection).doc(docId).delete();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getData(
      {required String collection, String? orderBy}) {
    if (orderBy == null) {
      return FirebaseFirestore.instance.collection(collection).snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection(collection)
          .orderBy(orderBy)
          .snapshots();
    }
  }
}
