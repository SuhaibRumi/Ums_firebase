import 'package:cloud_firestore/cloud_firestore.dart';

class Assignment {
  final String? assignmentId;
  final String? assignmentNo;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;
  final String? fileUrl;
  Assignment(
      {this.sessionId,
      this.fileUrl,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className,
      this.assignmentId,
      this.assignmentNo});

  factory Assignment.fromMap(DocumentSnapshot map) {
    return Assignment(
      assignmentId: map.id,
      assignmentNo: map['assignmentNo'],
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
      'assignmentNo': assignmentNo,
      'className': className,
      'sessionName': sessionName,
      'semesterName': semesterName,
    };
    // print(row);
    return row;
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
