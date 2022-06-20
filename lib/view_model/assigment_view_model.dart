import 'package:flutter/material.dart';

import '../utils/db_helper.dart';

class AssigmentViewModel extends ChangeNotifier {
  int? assignmentId;
  String? assignmentDesc = "";
  String? assignmentName = "";

  var dbhelper = DBHelper.instance;

  AssigmentViewModel({
    this.assignmentName,
    this.assignmentDesc,
    this.assignmentId,
  });
  factory AssigmentViewModel.fromMap(Map map) {
    return AssigmentViewModel(
      assignmentName: map['assignmentName'],
      assignmentDesc: map['assignmentDesc'],
      assignmentId: map['assignmentId'],
    );
  }
  saveData() async {
    String query =
        "Insert into Assignments (assignmentName,assignmentDesc) values ('$assignmentName','$assignmentDesc')";
    var id = await dbhelper.rawInsert(query: query);
    notifyListeners();
  }

  updateData() async {
    String query =
        "Update Assignments set assignmentName  = '$assignmentName', assignmentDesc = '$assignmentDesc' where assignmentId = '$assignmentId'";
    var id = await dbhelper.rawUpdate(query: query);
    notifyListeners();
  }

  deleteData() async {
    String query =
        "delete from Assignments where assignmentId = '$assignmentId'";
    var id = await dbhelper.rawDelete(query: query);
    notifyListeners();
  }

  Future<List<AssigmentViewModel>> getData() async {
    List<AssigmentViewModel> assignment = [];
    String query = "Select * from Assignments";
    var data = await dbhelper.getDataByQuery(query: query);
    assignment = data.map((i) => AssigmentViewModel.fromMap(i)).toList();
    notifyListeners();
    return assignment;
  }
}
