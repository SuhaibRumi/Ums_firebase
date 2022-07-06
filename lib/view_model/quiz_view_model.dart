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
  String? fileUrl = '';

  QuizViewModel({
    this.quizId,
    this.fileUrl,
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
      className: quizes.className,
      semesterName: quizes.semesterName,
      sessionName: quizes.sessionName,
      classId: quizes.classId,
      sessionId: quizes.sessionId,
      semesterId: quizes.semesterId,
    );
  }
  saveData() async {
    var quizes = Quiz(
      quizNo: quizNo,
      className: className,
      semesterName: semesterName,
      sessionName: sessionName,
    );
    try {
      await FirebaseUtility.addData(collection: "quizes", doc: quizes.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var quizes = Quiz(
      quizNo: quizNo,
      className: className,
      semesterName: semesterName,
      sessionName: sessionName,
    );
    await FirebaseUtility.updateData(
        collection: "quizes", docId: quizId!, doc: quizes.toMap());
    notifyListeners();
  }

  deleteData() async {
    await FirebaseUtility.deleteData(
      collection: "quizes",
      docId: quizId!,
    );
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(collection: "quizes", orderBy: "quizNo");
    notifyListeners();
    return data;
  }
}
