import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
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

  static Future<String?> uploadFile({
    required File file,
  }) async {
    if (!file.existsSync()) {
      return null;
    }
    String fileUrl = '';
    String fileName = path.basename(file.path);
    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = storageRef.putFile(file);
    TaskSnapshot snapshot = await task.whenComplete(() {});
    print(snapshot.state.toString());
    storageRef.getDownloadURL().then((value) {
      fileUrl = value;
    });
    return fileUrl;
  }
}
