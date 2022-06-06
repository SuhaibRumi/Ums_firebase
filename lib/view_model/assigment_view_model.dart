import '../utils/db_helper.dart';

class AssigmentViewModel {
  int? assignmentid = 1;
  String? assignmentdesc = '';
  String? assignmentName = '';

  var dbhelper = DBHelper.instance;

  AssigmentViewModel({
    this.assignmentName,
    this.assignmentdesc,
    this.assignmentid,
  });
  factory AssigmentViewModel.fromMap(Map map) {
    return AssigmentViewModel(
      assignmentName: map['assignmentName'],
      assignmentdesc: map['assignmentdesc'],
      assignmentid: map['assignmentid'],
    );
  }
  saveData() async {
    String query =
        "Insert into Assignments (assignmentName,assignmentdesc) values ('$assignmentName','$assignmentdesc')";
    var id = await dbhelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Assignments set assignmentName,assignmentdesc where assignmentid = '$assignmentid'";
    var id = await dbhelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query =
        "delete from Assigments where assignmentid = '$assignmentid'";
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
