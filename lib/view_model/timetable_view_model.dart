import 'package:flutter/cupertino.dart';

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

  factory TimeTableViewModel.fromMap(Map map) {
    return TimeTableViewModel(
      timeTableId: map['timeTableId'],
      timeTableDesc: map['timeTableDesc'],
      classId: map['className'],
      sessionId: map['sessionName'],
      semesterId: map['semesterName'],
    );
  }
  saveData() async {
   
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
