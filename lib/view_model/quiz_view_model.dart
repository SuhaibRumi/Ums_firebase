import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_mangement_system/models/model.dart';

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

  factory QuizViewModel.fromMap(DocumentSnapshot map) {
    var quizes = Quiz.fromMap(map);
    return QuizViewModel(
      quizId: quizes.quizId,
      quizNo: quizes.quizNo,
      classId: quizes.classId,
      sessionId: quizes.sessionId,
      semesterId:quizes.semesterId,
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
