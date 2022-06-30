import 'package:flutter/cupertino.dart';



class StudentsViewModel extends ChangeNotifier {
  int? studId;
  int? classId;
  int? sessionId;
  int? semesterId;
  String? studentName = '';
  String? studRoll = '';
  String? className = '';
  String? sessionName = '';
  String? semesterName = '';
  bool? isActive = true;

 
  StudentsViewModel({
    this.studId,
    this.studentName,
    this.studRoll,
    this.className,
    this.sessionName,
    this.semesterName,
    this.classId,
    this.semesterId,
    this.sessionId,
    this.isActive,
  });

  factory StudentsViewModel.fromMap(Map map) {
    bool active = false;
    if (map['isActive'] == 1 || map['isActive'] == true) {
      active = true;
    }
    return StudentsViewModel(
        studId: map['studId'],
        studentName: map['studentName'],
        studRoll: map['studRoll'],
        sessionName: map['sessionName'],
        className: map['className'],
        semesterName: map['semesterName'],
        isActive: active);
  }
  saveData() async {
    notifyListeners();
  }

  updateData() async {
    notifyListeners();
  }

  deletData() async {
    notifyListeners();
  }

  Future<List<StudentsViewModel>> getData() async {
    List<StudentsViewModel> students = [];
    notifyListeners();
    return students;
  }
}
