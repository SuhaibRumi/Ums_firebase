import '../utils/db_helper.dart';

class StudentsViewModel {
  int? studId;
  String? studName = '';
  String? studRoll = '';
  String? studClassName = '';
  int? classId;
  int? semesterId;
  int? sessionId;
  String? studSessionName = '';
  String? studSemesterName = '';
  bool? isActive = true;

  var dbhelper = DBHelper.instance;
  StudentsViewModel({
    this.studId,
    this.studName,
    this.studRoll,
    this.studClassName,
    this.studSessionName,
    this.studSemesterName,
    this.classId,
    this.semesterId,
    this.sessionId,
    this.isActive,
  });

  factory StudentsViewModel.fromMap(Map map) {
    return StudentsViewModel(
        studId: map['studId'],
        studName: map['studName'],
        studRoll: map['studRoll'],
        studSessionName: map['studSessionName'],
        studClassName: map['studClassName'],
        studSemesterName: map['studSemesterName'],
        isActive: map['isActive']);
  }
  saveData() async {
    String query =
        "insert into Students (studName,studRoll,isActive,classId,semesterId,sessionId) values ('$studName','$studRoll','$isActive',)";
    var id = await dbhelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Students set studName = '$studName', studRoll ='$studRoll',isActive ='$isActive' where studId = '$studId'";
    var id = await dbhelper.rawUpdate(query: query);
  }

  deletData() async {
    String query =
        "delete from Students where studId  = '$studId'";
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
