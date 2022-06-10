import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/utils/db_helper.dart';

class SemesterViewModel extends ChangeNotifier {
  int? semesterId;
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
    notifyListeners();
  }

  updateData() async {
    String query =
        "Update Semester set semesterName = '$semesterName' where semesterId = '$semesterId' ";
    var id = await dbHelper.rawUpdate(query: query);
    notifyListeners();
  }

  deleteData() async {
    String query = "delete from Semester where semesterId = '$semesterId' ";
    var id = await dbHelper.rawDelete(query: query);
    notifyListeners();
  }

  Future<List<SemesterViewModel>> getdata() async {
    List<SemesterViewModel> semesters = [];
    String query = "Select * from Semester";
    var data = await dbHelper.getDataByQuery(query: query);
    semesters = data.map((i) => SemesterViewModel.fromMap(i)).toList();
    notifyListeners();
    return semesters;
  }
}
