import 'dart:io';

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
  String? fileUrl = '';

  NotificationViewModel({
    this.notificationId,
    this.notificationName,
    this.fileUrl,
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
        notificationName: notificationName,
        notificationDes: notificationDes,
        className: className,
        semesterName: semesterName,
        sessionName: sessionName,
        fileUrl: fileUrl,
        );
    try {
      await FirebaseUtility.addData(
          collection: "notifications", doc: notification.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var notification = Notifications(
        notificationName: notificationName,
        notificationDes: notificationDes,
        className: className,
        semesterName: semesterName,
        sessionName: sessionName);
    await FirebaseUtility.updateData(
        collection: "notifications",
        docId: notificationId!,
        doc: notification.toMap());
    notifyListeners();
  }

  deleteData() async {
    await FirebaseUtility.deleteData(
      collection: "notifications",
      docId: notificationId!,
    );
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(
        collection: "notifications", orderBy: "notificationName");
    notifyListeners();
    return data;
  }
   Future<String?> uploadFile({required File file}) async {
    var url = await FirebaseUtility.uploadFile(file: file);
    return url;
  }
}
