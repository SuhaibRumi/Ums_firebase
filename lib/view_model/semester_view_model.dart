import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/models/model.dart';
import 'package:uni_mangement_system/utils/firebase_utility.dart';

class SemesterViewModel extends ChangeNotifier {
  String? semesterId = '';
  String? semesterName = '';
  String? fileUrl = '';

  SemesterViewModel({this.semesterId, this.fileUrl, this.semesterName});

  factory SemesterViewModel.fromMap(DocumentSnapshot map) {
    var semesters = Semester.fromMap(map);
    return SemesterViewModel(
        semesterId: semesters.semesterId, semesterName: semesters.semesterName);
  }

  savaData() async {
    var semester = Semester(semesterName: semesterName);
    try {
      await FirebaseUtility.addData(
          collection: "semesters", doc: semester.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  updateData() async {
    var semester = Semester(semesterName: semesterName);
    await FirebaseUtility.updateData(
        collection: "semesters", docId: semesterId!, doc: semester.toMap());
    notifyListeners();
  }

  deleteData() async {
    await FirebaseUtility.deleteData(
        collection: "semesters", docId: semesterId!);
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(
        collection: 'semesters', orderBy: "semesterName");
    notifyListeners();
    return data;
  }
}
