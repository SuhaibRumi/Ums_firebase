import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? department;

  Teacher({
    this.id,
    this.name,
    this.email,
    this.password,
    this.department,
  });

  factory Teacher.fromMap(DocumentSnapshot map) {
    return Teacher(
      id: map.id,
      name: map['name'],
      email: map['email'],
      password: map['password'],
      department: map['department'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      ' name': name,
      'email': email,
      ' password': password,
      'department': department,
    };
    return row;
  }
}

class TeacherList {
  final List<Teacher> teachersList;

  TeacherList({required this.teachersList});

  factory TeacherList.fromMap(List data) {
    List<Teacher> teachers = [];
    teachers = data.map((i) => Teacher.fromMap(i)).toList();
    return TeacherList(teachersList: teachers);
  }
}
