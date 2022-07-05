import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
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
  String? fileUrl = '';

  CourseViewModel({
    this.fileUrl,
    this.courseId,
    this.courseName,
    this.className,
    this.sessionName,
    this.semesterName,
    this.classId,
    this.semesterId,
    this.sessionId,
  });

  factory CourseViewModel.fromMap(DocumentSnapshot map) {
    var courses = Course.fromMap(map);
    return CourseViewModel(
      courseId: courses.courseId,
      courseName: courses.courseName,
      classId: courses.classId,
      className: courses.className,
      sessionId: courses.sessionId,
      sessionName: courses.semesterName,
      semesterId: courses.semesterId,
      semesterName: courses.semesterName,
    );
  }
  saveData() async {
    var courses = Course(
        courseName: courseName,
        semesterName: semesterName,
        sessionName: sessionName,
        className: className);
    try {
      await FirebaseUtility.addData(collection: "courses", doc: courses.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var courses = Course(
        courseName: courseName,
        semesterName: semesterName,
        sessionName: sessionName,
        className: className);

    await FirebaseUtility.updateData(
        collection: 'courses', docId: courseId!, doc: courses.toMap());
    notifyListeners();
  }

  deleteData() async {
    var courses = Course(
      courseId: courseId,
    );
    await FirebaseUtility.deleteData(
      collection: "courses",
      docId: courseId!,
    );
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(
      collection: "courses",
      orderBy: "courseName",
    );
    notifyListeners();
    return data;
  }
}
