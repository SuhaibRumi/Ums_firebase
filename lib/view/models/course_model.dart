class Course {
  final String? courseId;
  final String? courseName;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  Course(
      {this.courseId,
      this.courseName,
      this.sessionId,
      this.sessionName,
      this.semesterId,
      this.semesterName,
      this.classId,
      this.className});

  factory Course.fromMap(Map map) {
    return Course(
      courseId: map['courseId'],
      courseName: map['courseName'],
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
      'courseId':courseId,
      'courseName':courseName,
      'classId':classId,
      'className':className,
      'sessionId':sessionId,
      'sessionName':sessionName,
      'semesterId':semesterId,
      'semesterName':semesterName,
    };
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