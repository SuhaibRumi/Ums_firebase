class Teacher {
  final String? teacherId;
  final String? teacherName;
  final String? teacherEmail;
  final String? teacherPassword;
  final String? teacherDepartment;

  Teacher({
    this.teacherId,
    this.teacherName,
    this.teacherEmail,
    this.teacherPassword,
    this.teacherDepartment,
  });

  factory Teacher.fromMap(Map map) {
    return Teacher(
      teacherId: map['teacherId'],
      teacherName: map['teacherName'],
      teacherEmail: map['teacherEmail'],
      teacherPassword: map['teacherPassword'],
      teacherDepartment: map['teacherDepartment'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'teacherId': teacherId,
      ' teacherName': teacherName,
      'teacherEmail': teacherEmail,
      ' teacherPassword': teacherPassword,
      'teacherDepartment': teacherDepartment,
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
