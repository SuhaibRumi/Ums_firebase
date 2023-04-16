import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String? courseId;
  final String? courseName;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;
  final String? fileUrl;

  Course(
      {this.courseId,
      this.fileUrl,
      this.courseName,
      this.sessionId,
      this.sessionName,
      this.semesterId,
      this.semesterName,
      this.classId,
      this.className});

  factory Course.fromMap(DocumentSnapshot map) {
    return Course(
      courseId: map.id,
      courseName: map['courseName'],
      className: map['className'],
      sessionName: map['sessionName'],
      semesterName: map['semesterName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'courseName': courseName,
      'className': className,
      'sessionName': sessionName,
      'semesterName': semesterName,
      'fileUrl':fileUrl,
    };
    return row;
  }
}

class CourseList {
  final List<Course> courseList;
  CourseList({required this.courseList});
  factory CourseList.fromMap(List data) {
    List<Course> course = [];
    course = data.map((i) => Course.fromMap(i)).toList();
    return CourseList(courseList: course);
  }
}
