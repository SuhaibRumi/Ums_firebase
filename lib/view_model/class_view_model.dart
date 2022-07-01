import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/models/class_model.dart';

import 'package:uni_mangement_system/utils/firebase_utility.dart';

class ClassViewModel extends ChangeNotifier {
  String? classId = "";
  String? className = "";

  ClassViewModel({
    this.classId,
    this.className,
  });

  factory ClassViewModel.fromMap(DocumentSnapshot map) {
    var cls = Class.fromMap(map);
    // print(map);
    return ClassViewModel(
      classId: cls.classId,
      className: cls.className,
    );
  }

  saveData() async {
    var cls = Class(className: className);
    // print(cls);
    try {
      await FirebaseUtility.addData(collection: "class", doc: cls.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updateData() async {
    var cls = Class(className: className);
    await FirebaseUtility.updateData(
        collection: 'class', docId: classId!, doc: cls.toMap());
    notifyListeners();
  }

  deleteData() async {
   
    await FirebaseUtility.deleteData(collection: "class", docId: classId!);
    notifyListeners();
  }

  getData() {
    var data =
        FirebaseUtility.getData(collection: "class", orderBy: "className");
    notifyListeners();
    return data;
  }
}
