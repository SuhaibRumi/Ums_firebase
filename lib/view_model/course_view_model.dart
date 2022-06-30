import 'package:flutter/material.dart';

import '../utils/utlis.dart';

class CourseViewModel extends ChangeNotifier {
  String? courseId = '';
  String? classId = '';
  String? sessionId = '';
  String? semesterId = '';
  String? courseName = '';
  String? className = '';
  String? sessionName = '';
  String? semesterName = '';

  CourseViewModel({
    this.courseId,
    this.courseName,
    this.className,
    this.sessionName,
    this.semesterName,
    this.classId,
    this.semesterId,
    this.sessionId,
  });

  factory CourseViewModel.fromMap(Map map) {
    return CourseViewModel(
      courseId: map['courseId'].toString(),
      courseName: map['courseName'],
      className: map['className'],
      sessionName: map['semesterName'],
      semesterName: map['semesterName'],
    );
  }
  saveData() async {
    notifyListeners();
  }

  updateData() async {
    notifyListeners();
  }

  deleteData() async {
    notifyListeners();
  }

  deleteAllData() async {}

  getData() {
    var data =
        FirebaseUtility.getData(collection: "class", orderBy: "className");
    notifyListeners();
    return data;
  }
}
