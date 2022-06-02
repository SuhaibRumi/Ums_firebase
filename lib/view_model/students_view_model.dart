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

  StudentsViewModel({
    this.studId,
    this.studName,
    this.studRoll,
    this.isActive,
    this.studSession,
  });
  factory StudentsViewModel.fromMap(Map map) {
    return StudentsViewModel(
        studId: map['studId'],
        studName: map['studName'],
        studRoll: map['studRoll'],
        studSession: map['studSession'],
        isActive: map['isActive']);
  }
  saveData() async {
    String query =
        "insert into Students (studName,studRoll,studSession,isActive) values ('$studName','$studRoll','$studSession','$isActive')";
   await dbhelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Students set studName,studRoll,studSession,isActive = '$studName','$studRoll','$studSession','$studSession' = where id = '$studId'";
   await dbhelper.rawUpdate(query: query);
  }

  deletData() async {
    String query = "delete from Students where id  = '$studId'";
   await dbhelper.rawDelete(query: query);
  }

  Future<List<StudentsViewModel>> getStudents() async {
    List<StudentsViewModel> students = [];
    String query =
        "Select studName,studRoll,studSession,isActive from Students ";
   await dbhelper.getDataByQuery(query: query);
    return students;
  }
}
