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
  String? fileUrl = '';

  TeacherViewModel({
    this.fileUrl,
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
        teacherPassword: teacher.password,
        teacherDepartment: teacher.department);
  }

  saveData() async {
    var teacher = Teacher(
      name: teacherName,
      email: teacherEmail,
      password: teacherPassword,
      department: teacherDepartment,
    );
    await FirebaseUtility.addData(
        collection: "teacheres", doc: teacher.toMap());
    notifyListeners();
  }

  updateData() async {
    var teacher = Teacher(
      name: teacherName,
      email: teacherEmail,
      password: teacherPassword,
      department: teacherDepartment,
    );
    await FirebaseUtility.updateData(
        collection: "teacheres", docId: teacherId!, doc: teacher.toMap());
    notifyListeners();
  }

  deleteData() async {
    await FirebaseUtility.deleteData(
        collection: "teacheres", docId: teacherId!);
    notifyListeners();
  }

  getData() {
    var data =
        FirebaseUtility.getData(collection: "teacheres", orderBy: "name");
    notifyListeners();
    return data;
  }
}
