class Student {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? rollNo;
  final String? regNo;
  final String? classId;
  final String? sessionId;
  final String? semtserId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  Student({
    this.regNo,
    this.id,
    this.name,
    this.email,
    this.password,
    this.rollNo,
    this.classId,
    this.sessionId,
    this.semtserId,
    this.sessionName,
    this.semesterName,
    this.className,
  });

  factory Student.fromMap(Map map) {
    return Student(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        rollNo: map['rollNo'],
        regNo: map['regNo'],
        classId: map['classId'],
        semtserId: map['semtserId'],
        sessionId: map['sessionId'],
        sessionName: map['sessionName'],
        semesterName: map['semesterName'],
        className: map['className']);
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'rollNo': rollNo,
      ' regNo': regNo,
      'classId': classId,
      'semtserId': semtserId,
      'sessionId': sessionId,
      'semesterName': semesterName,
      'sessionName': sessionName,
      'className': className,
    };
    return row;
  }
}

class StudentList {
  final List<Student> studentlist;
  StudentList({required this.studentlist});

  factory StudentList.fromMap(List data) {
    List<Student> students = [];
    students = data.map((i) => Student.fromMap(i)).toList();
    return StudentList(studentlist: students);
  }
}
