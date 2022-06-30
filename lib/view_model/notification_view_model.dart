import 'package:flutter/material.dart';


import '../utils/utlis.dart';

class NotificationViewModel extends ChangeNotifier {
  String? notificationId = '';
  String? notificationDes = '';
  String? notificationName = '';
  String? sessionName = '';
  String? semesterName = '';
  String? className = '';
  String? sessionId = '';
  String? classId = '';
  String? semesterId = '';



  NotificationViewModel({
    this.notificationId,
    this.notificationName,
    this.notificationDes,
    this.semesterName,
    this.sessionName,
    this.className,
    this.sessionId,
    this.classId,
    this.semesterId,
  });

  factory NotificationViewModel.fromMap(Map map) {
    return NotificationViewModel(
      notificationId: map['notificationId'].toString(),
      notificationName: map['notificationName'],
      notificationDes: map['notificationDes'],
      classId: map['className'],
      sessionId: map['semesterName'],
      semesterId: map['semesterName'],
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
