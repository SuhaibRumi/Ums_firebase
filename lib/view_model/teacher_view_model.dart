import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_mangement_system/models/model.dart';

import '../utils/utlis.dart';

class TeacherViewModel extends ChangeNotifier {
  String? teacherId = '';
  String? teacherName = '';
  String? teacherEmail = '';
  String? teacherPassword = '';
  String? teacherDepartment = '';

  TeacherViewModel({
    this.teacherId,
    this.teacherName,
    this.teacherEmail,
    this.teacherPassword,
    this.teacherDepartment,
  });

  factory TeacherViewModel.fromMap(DocumentSnapshot map) {
    var teacher = Teacher.fromMap(map);
    return TeacherViewModel(
        teacherId: teacher.id,
        teacherName: teacher.name,
        teacherEmail: teacher.email,
        teacherPassword: teacher.email,
        teacherDepartment: teacher.password);
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

  getData() {
    var data = FirebaseUtility.getData(collection: "Teacher", orderBy: "name");
    notifyListeners();
    return data;
  }
}
