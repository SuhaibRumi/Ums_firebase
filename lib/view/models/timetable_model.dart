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

  factory TimeTable.fromMap(Map map) {
    return TimeTable(
      timeTableId: map['timeTableId'],
      timeTableDesc: map['timeTableDesc'],
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
      'timeTableId': timeTableId,
      'timeTableDesc': timeTableDesc,
      'classId': classId,
      'className': className,
      'sessionId': sessionId,
      'sessionName': sessionName,
      'semesterId': semesterId,
      'semesterName': semesterName,
    };
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