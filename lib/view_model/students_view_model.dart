import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/models/model.dart';

class StudentsViewModel extends ChangeNotifier {
  String? studId;
  String? classId;
  String? sessionId;
  String? semesterId;
  String? studentName = '';
  String? studRoll = '';
  String? className = '';
  String? sessionName = '';
  String? semesterName = '';
  bool? isActive = true;

  StudentsViewModel({
    this.studId,
    this.studentName,
    this.studRoll,
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
        studId:students.id,
        studentName: students.name,
        studRoll: students.rollNo,
        sessionName:students.semesterName,
        className:students.className,
        semesterName: students.semesterName,
        semesterId: students.semtserId,
        sessionId: students.sessionId,
        classId: students.classId,

        isActive: active);
  }
  saveData() async {
    
    notifyListeners();
  }

  updateData() async {
    notifyListeners();
  }

  deletData() async {
    notifyListeners();
  }

  Future<List<StudentsViewModel>> getData() async {
    List<StudentsViewModel> students = [];
    notifyListeners();
    return students;
  }
}
