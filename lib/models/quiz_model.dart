import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  final String? quizId;
  final String? quizNo;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;
  final String? fileUrl;

  Quiz(
      {this.quizId,
      this.quizNo,
      this.fileUrl,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});
  factory Quiz.fromMap(DocumentSnapshot map) {
    return Quiz(
      quizId: map.id,
      quizNo: map['quizNo'],
      className: map['className'],
      sessionName: map['sessionName'],
      semesterName: map['semesterName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'quizNo': quizNo,
      'className': className,
      'sessionName': sessionName,
      'semesterName': semesterName,
      'fileUrl':fileUrl,
    };
    return row;
  }
}

class QuizList {
  final List<Quiz> quizList;
  QuizList({required this.quizList});
  factory QuizList.fromMap(List data) {
    List<Quiz> quizes = [];
    quizes = data.map((i) => Quiz.fromMap(i)).toList();
    return QuizList(quizList: quizes);
  }
}
