import '../utils/db_helper.dart';

class AssigmentViewModel {
  int? assignmentId = 1;
  String? assignmentDesc = "";
  String? assignmentName = "";

  var dbhelper = DBHelper.instance;

  AssigmentViewModel({
    this.assignmentName,
    this.assignmentDesc,
    this.assignmentId,
  });
  factory AssigmentViewModel.fromMap(Map map) {
    return AssigmentViewModel(
      assignmentName: map['assignmentName'],
      assignmentDesc: map['assignmentDesc'],
      assignmentId: map['assignmentId'],
    );
  }
  saveData() async {
    String query =
        "Insert into Assignments (assignmentName,assignmentDesc) values ('$assignmentName','$assignmentDesc')";
    var id = await dbhelper.rawInsert(query: query);
    print(id);
  }

  updateData() async {
    String query =
        "Update Assignments set assignmentName,assignmentDesc = '$assignmentName','$assignmentId' where assignmentId = '$assignmentId'";
    var id = await dbhelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query =
        "delete from Assigments where assignmentid = '$assignmentId'";
    var id = await dbhelper.rawDelete(query: query);
  }

  Future<List<AssigmentViewModel>> getData() async {
    List<AssigmentViewModel> assignment = [];
    String query = "Select * from Assignments";
    var data = await dbhelper.getDataByQuery(query: query);
    print(data);
    assignment = data.map((i) => AssigmentViewModel.fromMap(i)).toList();
    return assignment;
  }
}
