import 'package:uni_mangement_system/utils/db_helper.dart';

class SemesterViewModel {
  int? semesterId = 1;
  String? semesterName = '';
  var dbHelper = DBHelper.instance;

  SemesterViewModel({this.semesterId, this.semesterName});

  factory SemesterViewModel.fromMap(Map map) {
    return SemesterViewModel(
      semesterId: map['semesterId'],
      semesterName: map['semesterName'],
    );
  }

  savaData() async {
    String query =  "Insert into Semester (semesterName) values($semesterName)";
    await dbHelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Semester set semesterName = '$semesterName' where id = '$semesterId' ";
await dbHelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query = "delete from Semester where id = '$semesterId' ";
  await dbHelper.rawDelete(query: query);
  }

  Future<List<SemesterViewModel>> getSemester() async {
    List<SemesterViewModel> semesters = [];
    String query = "Select semesterName from Semester";
   await dbHelper.getDataByQuery(query: query);
    return semesters;
  }
}
