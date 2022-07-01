import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_mangement_system/models/model.dart';
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

  factory NotificationViewModel.fromMap(DocumentSnapshot map) {
    var notification = Notifications.fromMap(map);
    return NotificationViewModel(
      notificationId: notification.notificationId,
      notificationName: notification.notificationName,
      notificationDes: notification.notificationDes,
      className: notification.className,
      classId: notification.classId,
      sessionName: notification.sessionName,
      sessionId: notification.sessionId,
      semesterName: notification.semesterName,
      semesterId: notification.semesterId,
    );
  }
  saveData() async {
    var notification = Notifications(
        notificationId: notificationId,
        notificationName: notificationName,
        notificationDes: notificationDes,
        className: className,
        semesterName: semesterName,
        sessionName: sessionName);
    try {
      await FirebaseUtility.addData(
          collection: "notification", doc: notification.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var notification = Notifications(
        notificationId: notificationId,
        notificationName: notificationName,
        notificationDes: notificationDes,
        className: className,
        semesterName: semesterName,
        sessionName: sessionName);
    await FirebaseUtility.updateData(
        collection: "notification",
        docId: notificationId!,
        doc: notification.toMap());
    notifyListeners();
  }

  deleteData() async {
   await FirebaseUtility.deleteData(collection: "notification", docId: notificationId!,);
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(
        collection: "notification", orderBy: "notificationName");
    notifyListeners();
    return data;
  }
}
