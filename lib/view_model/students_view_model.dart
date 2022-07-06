import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/models/model.dart';

import '../utils/utlis.dart';

class StudentsViewModel extends ChangeNotifier {
  String? studentId = '';
  String? studentName = '';
  String? studentRoll = '';
  String? studentEmail = '';
  String? studentRegNo = '';

  String? classId = '';
  String? sessionId = '';
  String? semesterId = '';

  String? className = '';
  String? sessionName = '';
  String? semesterName = '';
  bool? isActive = true;

  StudentsViewModel({
    this.studentId,
    this.studentName,
    this.studentRoll,
    this.studentEmail,
    this.studentRegNo,
    this.className,
    this.sessionName,
    this.semesterName,
    this.classId,
    this.semesterId,
    this.sessionId,
    this.isActive,
  });

  factory StudentsViewModel.fromMap(DocumentSnapshot map) {
    var students = Student.fromMap(map);
    bool active = false;
    if (map['isActive'] == 1 || map['isActive'] == true) {
      active = true;
    }
    return StudentsViewModel(
        studentId: students.id,
        studentName: students.name,
        studentRoll: students.rollNo,
        studentEmail: students.email,
        studentRegNo: students.regNo,
        sessionName: students.sessionName,
        className: students.className,
        semesterName: students.semesterName,
        semesterId: students.semtserId,
        sessionId: students.sessionId,
        classId: students.classId,
        isActive: active);
  }
  saveData() async {
    var students = Student(
      name: studentName,
      email: studentName,
      rollNo: studentRoll,
      regNo: studentRoll,
      sessionName: sessionName,
      semesterName: semesterName,
      className: className,
    );

    await FirebaseUtility.addData(
        collection: "Students", doc: students.toMap());

    notifyListeners();
  }

  updateData() async {
    var students = Student(
      name: studentName,
      email: studentName,
      rollNo: studentRoll,
      regNo: studentRoll,
      sessionName: sessionName,
      semesterName: semesterName,
      className: className,
    );
    await FirebaseUtility.updateData(
        collection: "Students", docId: studentId!, doc: students.toMap());
    notifyListeners();
  }

  deletData() async {
    await FirebaseUtility.deleteData(collection: "Students", docId: studentId!);

    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(
        collection: "Students", orderBy: " StudentName");
    notifyListeners();
    return data;
  }
}
