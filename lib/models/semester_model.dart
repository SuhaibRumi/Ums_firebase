import 'package:cloud_firestore/cloud_firestore.dart';

class Semester {
  final String? semesterId;
  final String? semesterName;
  final String? fileUrl;
  Semester({this.semesterId, this.semesterName,
  this.fileUrl});

  factory Semester.fromMap(DocumentSnapshot map) {
    return Semester(semesterId: map.id, semesterName: map['semesterName']);
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'semesterName': semesterName,
    };
    return row;
  }
}

class SemesterList {
  final List<Semester> semesterList;
  SemesterList({required this.semesterList});
  factory SemesterList.fromMap(List data) {
    List<Semester> semester = [];
    semester = data.map((e) => Semester.fromMap(e)).toList();
    return SemesterList(semesterList: semester);
  }
}
