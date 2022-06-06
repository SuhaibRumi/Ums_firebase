import '../utils/db_helper.dart';

class StudentsViewModel {
  int? studId = 1;
  String? studName = '';
  String? studRoll = '';
  String? studSession = '';
  String? className = '';
  String? sessionName = '';
  String? semesterName = '';
  bool? isActive = true;

  var dbhelper = DBHelper.instance;

  StudentsViewModel(
      {this.studId,
      this.studName,
      this.studRoll,
      this.isActive,
      this.studSession,
      this.semesterName,
      this.className,
      this.sessionName});
  factory StudentsViewModel.fromMap(Map map) {
    return StudentsViewModel(
        studId: map['studId'],
        studName: map['studName'],
        studRoll: map['studRoll'],
        studSession: map['studSession'],
        className: map['className'],
        semesterName: map['semesterName'],
        sessionName: map['sessionName'],
        isActive: map['isActive']);
  }
  saveData() async {
    String query =
        "insert into Students (studName,studRoll,studSession,isActive,className,semesterName,sessionName) values ('$studName','$studRoll','$studSession','$isActive','$semesterName','$sessionName','$className')";
    var id = await dbhelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Students set studName,studRoll,studSession,isActive,className,semesterName,sessionName = '$studName','$studRoll','$studSession','$semesterName','$className','$isActive' = where studId = '$studId'";
    var id = await dbhelper.rawUpdate(query: query);
  }

  deletData() async {
    String query = "delete from Students where studId  = '$studId'";
    var id = await dbhelper.rawDelete(query: query);
  }

  Future<List<StudentsViewModel>> getData() async {
    List<StudentsViewModel> students = [];
    String query = "Select * from Students ";
    var data = await dbhelper.getDataByQuery(query: query);
    students = data.map((i) => StudentsViewModel.fromMap(i)).toList();
    return students;
  }
}
