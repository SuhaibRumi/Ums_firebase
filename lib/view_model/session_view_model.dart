import 'package:uni_mangement_system/utils/db_helper.dart';

class SessionViewModel {
  int? sessionId = 1;
  String? sessionName = '';

  var dbHelper = DBHelper.instance;

  SessionViewModel({
    this.sessionId,
    this.sessionName,
  });

  factory SessionViewModel.fromMap(Map map) {
    return SessionViewModel(
      sessionId: map['sessionId'],
      sessionName: map['sessionName'],
    );
  }
  saveData() async {
    String query = "Insert into Session (sessionName) values('$sessionName')";
    var id = await dbHelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Session set className = '$sessionName' where sessionId = '$sessionId'";
    var id = await dbHelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query = "delete from Session where sessionId = '$sessionId'";
    var id = await dbHelper.rawDelete(query: query);
  }

  Future<List<SessionViewModel>> getData() async {
    List<SessionViewModel> sessions = [];
    String query = "Select className from Session";
    var data = await dbHelper.getDataByQuery(query: query);
    sessions = data.map((i) => SessionViewModel.fromMap(i)).toList();
    return sessions;
  }
}
