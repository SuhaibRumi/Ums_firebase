class Notification {
  final String? notificationId;
  final String? notificationDes;
  final String? notificationName;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  Notification(
      {this.notificationId,
      this.notificationDes,
      this.notificationName,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});

  factory Notification.fromMap(Map map) {
    return Notification(
      notificationId: map['notificationId'],
      notificationName: map['notificationName'],
      notificationDes: map['notificationDes'],
      classId: map['classId'],
      className: map['className'],
      sessionId: map['semesterId'],
      sessionName: map['sessionName'],
      semesterId: map['semesterId'],
      semesterName: map['semesterName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'notificationId': notificationId,
      'notificationName': notificationName,
      'notificationDes': notificationDes,
      'classId': classId,
      'className': className,
      'sessionId': sessionId,
      'sessionName': sessionName,
      'semesterId': semesterId,
      'semesterName': semesterName,
    };
  }
}

class NotificationList {
  final List<Notification> notificationList;

  NotificationList({required this.notificationList});

  factory NotificationList.fromMAp(List data) {
    List<Notification> notifications = [];
    notifications = data.map((i) => Notification.fromMap(i)).toList();
    return NotificationList(notificationList: notifications);
  }
}
