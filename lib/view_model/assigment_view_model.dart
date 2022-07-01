import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
import '../utils/utlis.dart';

class AssigmentViewModel extends ChangeNotifier {
  final String? assignmentId;
  final String? assignmentNo;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  AssigmentViewModel(
      {this.assignmentId,
      this.assignmentNo,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});

  factory AssigmentViewModel.fromMap(DocumentSnapshot map) {
    var assignments = Assignment.fromMap(map);
    // print(map);
    return AssigmentViewModel(
      assignmentId: assignments.assignmentId,
      assignmentNo: assignments.assignmentNo,
      semesterId: assignments.semesterId,
      semesterName: assignments.semesterName,
      sessionId: assignments.sessionId,
      sessionName: assignments.sessionName,
      classId: assignments.classId,
      className: assignments.className,
    );
  }

  saveData() async {
    var assignments = Assignment(
        assignmentNo: assignmentNo,
        semesterName: semesterName,
        sessionName: sessionName,
        className: className);
    try {
      await FirebaseUtility.addData(
          collection: "assignment", doc: assignments.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var assignments = Assignment(
        assignmentNo: assignmentNo,
        semesterName: semesterName,
        sessionName: sessionName,
        className: className);
    await FirebaseUtility.updateData(
        collection: 'assignment',
        docId: assignmentId!,
        doc: assignments.toMap());
    notifyListeners();
  }

  deleteData() async {
  
  await FirebaseUtility.deleteData(collection: "assignment", docId: assignmentId!,);
    notifyListeners();

  }

  getData() {
    var data = FirebaseUtility.getData(
      collection: "assignment",
      orderBy: "assignmentNo",
    );
    notifyListeners();
    return data;
  }
}
