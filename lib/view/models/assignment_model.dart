class Assignment {
  final String? assignmentId;
  final String? assignmentNo;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  Assignment(
      {this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className,
      this.assignmentId,
      this.assignmentNo});

  factory Assignment.fromMap(Map map) {
    return Assignment(
      assignmentId: map['id'],
      assignmentNo: map['assignmentNo'],
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
      'assignmentId': assignmentId,
      'assignmentNo': assignmentNo,
      'classId': classId,
      'className': className,
      'sessionId': sessionId,
      'sessionName': sessionName,
      'semesterId': semesterId,
      'semesterName': semesterName,
    };
  }
}

class AssignmentList {
  final List<Assignment> assignmentList;
  AssignmentList({required this.assignmentList});

  factory AssignmentList.fromMap(List data) {
    List<Assignment> assignments = [];
    assignments = data.map((i) => Assignment.fromMap(i)).toList();
    return AssignmentList(assignmentList: assignments);
  }
}
