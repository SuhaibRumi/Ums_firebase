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
    String query =
        "Insert into Semester (semesterName) values('$semesterName')";
    var id = await dbHelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Semester set semesterName = '$semesterName' where semesterId = '$semesterId' ";
    var id = await dbHelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query = "delete from Semester where semesterId = '$semesterId' ";
    var id = await dbHelper.rawDelete(query: query);
  }

  Future<List<SemesterViewModel>> getdata() async {
    List<SemesterViewModel> semesters = [];
    String query = "Select * from Semester";
    var data = await dbHelper.getDataByQuery(query: query);

    semesters = data.map((i) => SemesterViewModel.fromMap(i)).toList();
    return semesters;
  }
}
