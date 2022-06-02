import 'package:uni_mangement_system/utils/db_helper.dart';
import 'package:uni_mangement_system/view_model/semester_view_model.dart';

class AssigmentViewModel {
  int? assigmentid = 1;
  String? assigmentdesc = '';
  String? assigmentName = '';

  var dbhelper = DBHelper.instance;

  AssigmentViewModel({
    this.assigmentName,
    this.assigmentdesc,
    this.assigmentid,
  });
  factory AssigmentViewModel.fromMap(Map map) {
    return AssigmentViewModel(
      assigmentName: map['assigmentName'],
      assigmentdesc: map['assigmentdesc'],
      assigmentid: map['assigmentid'],
    );
  }
  saveData() async {
    String query =
        "Insert into Assigments (assigmentName,assigmentdesc) values ('$assigmentName','$assigmentdesc')";
   await dbhelper.rawInsert(query: query);
  }

  updateData() async {
    String query =
        "Update Assigments set assigmentName,assigmentdesc where id = '$assigmentid'";
  await  dbhelper.rawUpdate(query: query);
  }

  deleteData() async {
    String query = "delete from Assigments where id = '$assigmentid'";
   await dbhelper.rawDelete(query: query);
  }

  Future<List<SemesterViewModel>> getAssigments() async {
    List<SemesterViewModel> semesters = [];
    String query = "Select  assigmentName,assigmentdesc from Assigments";
   await dbhelper.getDataByQuery(query: query);
    return semesters;
  }
}
