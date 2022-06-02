import 'package:uni_mangement_system/utils/db_helper.dart';

class ClassViewModel {
  int? classId = 1;
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
  await dbHelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Classes set className = '$className' where id = '$classId'";
   await dbHelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query = "delete from Classes where id = '$classId'";
 await dbHelper.rawDelete(query: query);
  }

  Future<List<ClassViewModel>> getClasses() async {
    List<ClassViewModel> classes = [];
    String query = "Select className from Classes";
   await dbHelper.getDataByQuery(query: query);

    return classes;
  }
}
