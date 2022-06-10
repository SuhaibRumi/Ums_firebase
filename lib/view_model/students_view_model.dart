import 'package:flutter/cupertino.dart';

import '../utils/db_helper.dart';

class StudentsViewModel extends ChangeNotifier {
  int? studId;
  int? classId;
  int? sessionId;
  int? semesterId;
  String? studentName = '';
  String? studRoll = '';
  String? className = '';
  String? sessionName = '';
  String? semesterName = '';
  bool? isActive = true;

  var dbhelper = DBHelper.instance;
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

  factory StudentsViewModel.fromMap(Map map) {
    return StudentsViewModel(
        studId: map['studId'],
        studentName: map['studentName'],
        studRoll: map['studRoll'],
        sessionName: map['sessionName'],
        className: map['className'],
        semesterName: map['semesterName'],
        isActive: map['isActive']);
  }
  saveData() async {
    String query =
        "insert into Students (studentName,studRoll,isActive,sessionId,classId,semesterId) values('$studentName','$studRoll','$isActive','$sessionId','$classId','$semesterId' )";
    var id = await dbhelper.rawInsert(query: query);
    print(id);
    notifyListeners();
  }

  updateData() async {
    String query =
        "Update Students set studentName = '$studentName', studRoll = '$studRoll',isActive ='$isActive', sessionName = '$sessionName', className = '$className', semesterName = '$semesterName where studId = '$studId'";
    var id = await dbhelper.rawUpdate(query: query);
    notifyListeners();
  }

  deletData() async {
    String query = "delete from Students where studId  = '$studId' ";
    var id = await dbhelper.rawDelete(query: query);
    notifyListeners();
  }

  Future<List<StudentsViewModel>> getData() async {
    List<StudentsViewModel> students = [];
    String query = "Select * from Students ";
    var data = await dbhelper.getDataByQuery(query: query);
    students = data.map((i) => StudentsViewModel.fromMap(i)).toList();
    notifyListeners();
    return students;
  }
}
