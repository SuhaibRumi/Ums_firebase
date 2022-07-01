import 'package:cloud_firestore/cloud_firestore.dart';

class TimeTable {
  final String? timeTableId;
  final String? timeTableDesc;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  TimeTable(
      {this.timeTableId,
      this.timeTableDesc,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});

  factory TimeTable.fromMap(DocumentSnapshot map) {
    return TimeTable(
      timeTableId: map.id,
      timeTableDesc: map['timeTableDesc'],
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
      'timeTableDesc': timeTableDesc,
      'className': className,
      'sessionName': sessionName,
      'semesterName': semesterName,
    };
    return row;
  }
}

class TimeTableList {
  final List<TimeTable> timeTableList;
  TimeTableList({required this.timeTableList});

  factory TimeTableList.fromMap(List data) {
    List<TimeTable> timeTable = [];
    timeTable = data.map((i) => TimeTable.fromMap(i)).toList();
    return TimeTableList(timeTableList: timeTable);
  }
}
