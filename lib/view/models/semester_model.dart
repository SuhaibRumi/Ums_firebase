class Semester {
  final String? semesterId;
  final String? semesterName;

  Semester({this.semesterId, this.semesterName});

  factory Semester.fromMap(Map map) {
    return Semester(
        semesterId: map['semesterId'], semesterName: map['semesterName']);
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'semesterId': semesterId,
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