import 'package:flutter/material.dart';

import '../utils/utlis.dart';


class QuizViewModel extends ChangeNotifier {
  String? quizId = '';
  String? quizNo = '';
  String? sessionId = '';
  String? classId = '';
  String? semesterId = '';
  String? sessionName = '';
  String? semesterName = '';
  String? className = '';

  
  QuizViewModel({
    this.quizId,
    this.quizNo,
    this.sessionId,
    this.classId,
    this.semesterId,
    this.className,
    this.semesterName,
    this.sessionName,
  });

  factory QuizViewModel.fromMap(Map map) {
    return QuizViewModel(
      quizId: map['quizId'],
      quizNo: map['quizNo'],
      classId: map['className'],
      sessionId: map['semesterName'],
      semesterId: map['sessionName'],
    );
  }
  saveData() async {

    notifyListeners();
  }

  updateData() async {
    
    notifyListeners();
  }

  deleteData() async {
    
    notifyListeners();
  }

  getData() {
    var data =
        FirebaseUtility.getData(collection: "class", orderBy: "className");
    notifyListeners();
    return data;
  }
}
