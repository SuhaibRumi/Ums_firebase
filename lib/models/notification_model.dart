import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  final String? notificationId;
  final String? notificationDes;
  final String? notificationName;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;
    final String? fileUrl;

  Notifications(
      {this.notificationId,
      this.fileUrl,
      this.notificationDes,
      this.notificationName,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});

  factory Notifications.fromMap(DocumentSnapshot map) {
    return Notifications(
      notificationId: map.id,
      notificationName: map['notificationName'],
      notificationDes: map['notificationDes'],
      classId: map.id,
      className: map['className'],
      sessionId: map.id,
      sessionName: map['sessionName'],
      semesterId: map.id,
      semesterName: map['semesterName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'notificationName': notificationName,
      'notificationDes': notificationDes,
      'className': className,
      'sessionName': sessionName,
      'semesterName': semesterName,
    };
    return row;
  }
}

class NotificationList {
  final List<Notifications> notificationList;
  NotificationList({required this.notificationList});
  factory NotificationList.fromMAp(List data) {
    List<Notifications> notifications = [];
    notifications = data.map((i) => Notifications.fromMap(i)).toList();
    return NotificationList(notificationList: notifications);
  }
}
