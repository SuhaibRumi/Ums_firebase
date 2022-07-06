import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
import '../utils/utlis.dart';

class AssigmentViewModel extends ChangeNotifier {
  String? assignmentId = '';
  String? assignmentNo = '';
  String? sessionId = '';
  String? classId = '';
  String? semesterId = '';
  String? sessionName = '';
  String? semesterName = '';
  String? className = '';
  String? fileUrl = '';

  AssigmentViewModel(
      {this.assignmentId,
      this.fileUrl,
      this.assignmentNo,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});

  factory AssigmentViewModel.fromMap(DocumentSnapshot map) {
    var assignments = Assignment.fromMap(map);
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
          collection: "assignments", doc: assignments.toMap());

      
   
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
        collection: 'assignments',
        docId: assignmentId!,
        doc: assignments.toMap());
    notifyListeners();
  }

  deleteData() async {
    await FirebaseUtility.deleteData(
      collection: "assignments",
      docId: assignmentId!,
    );
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(
      collection: "assignments",
      orderBy: "assignmentNo",
    );

    notifyListeners();
    return data;
  }
}
