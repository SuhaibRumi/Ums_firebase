import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/utils/db_helper.dart';

class ClassViewModel extends ChangeNotifier {
  int? classId;
  String? className = "";

  var dbHelper = DBHelper.instance;

  ClassViewModel({
    this.classId,
    this.className,
  });

  factory ClassViewModel.fromMap(Map map) {
    return ClassViewModel(
      classId: map["classId"],
      className: map["className"],
    );
  }

  saveData() async {
    String query = "Insert into Classes (className) values('$className')";
    var id = await dbHelper.rawInsert(query: query);
    notifyListeners();
  }

  updateData() async {
    String query =
        "Update Classes set className = '$className' where classId = '$classId'";
    var id = await dbHelper.rawUpdate(query: query);
    notifyListeners();
  }

  deleteData() async {
    String query = "delete from Classes where classId = '$classId'";
    var id = await dbHelper.rawDelete(query: query);
    notifyListeners();
  }

  Future<List<ClassViewModel>> getData() async {
    List<ClassViewModel> classes = [];
    String query = "Select * from Classes";
    var data = await dbHelper.getDataByQuery(query: query);
    classes = data.map((i) => ClassViewModel.fromMap(i)).toList();
    notifyListeners();
    return classes;
  }
}
