import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/models/model.dart';

import '../utils/utlis.dart';

class TimeTableViewModel extends ChangeNotifier {
  String? timeTableId = '';
  String? timeTableDesc = '';
  String? sessionId = '';
  String? classId = '';
  String? semesterId = '';
  String? sessionName = '';
  String? semesterName = '';
  String? className = '';

  TimeTableViewModel({
    this.timeTableId,
    this.timeTableDesc,
    this.sessionId,
    this.classId,
    this.semesterId,
    this.className,
    this.semesterName,
    this.sessionName,
  });

  factory TimeTableViewModel.fromMap(DocumentSnapshot map) {
    var time = TimeTable.fromMap(map);
    return TimeTableViewModel(
      timeTableId:time.timeTableId,
      timeTableDesc:time.timeTableDesc,
      classId: time.classId,
      sessionId: time.semesterId,
      semesterId:time.semesterId
    );
  }
  saveData() async {}

  updateData() async {
    notifyListeners();
  }

  deleteData() async {
    notifyListeners();
  }

  getData() {
    var data =
        FirebaseUtility.getData(collection: "timeTable", orderBy: "timeTableDesc");
    notifyListeners();
    return data;
  }
}
