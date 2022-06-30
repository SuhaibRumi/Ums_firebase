import 'package:flutter/material.dart';

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

  factory TeacherViewModel.fromMap(Map map) {
    return TeacherViewModel(
      teacherId: map['teacherId'],
      teacherName: map['teacherName'],
      teacherEmail: map['teacherEmail'],
      teacherPassword: map['teacherPassword'],
      teacherDepartment: map['teacherDepartment'],
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

  getData() {
    var data =
        FirebaseUtility.getData(collection: "class", orderBy: "className");
    notifyListeners();
    return data;
  }
}
