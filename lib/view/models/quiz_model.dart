class Quiz {
  final String? quizId;
  final String? quizNo;
  final String? sessionId;
  final String? classId;
  final String? semesterId;
  final String? sessionName;
  final String? semesterName;
  final String? className;

  Quiz(
      {this.quizId,
      this.quizNo,
      this.sessionId,
      this.classId,
      this.semesterId,
      this.sessionName,
      this.semesterName,
      this.className});
  factory Quiz.fromMap(Map map) {
    return Quiz(
      quizId: map['quizId'],
      quizNo: map['quizNo'],
      classId: map['classId'],
      className: map['className'],
      sessionId: map['semesterId'],
      sessionName: map['sessionName'],
      semesterId: map['semesterId'],
      semesterName: map['semesterName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'quizId':quizId,
      'quizNo':quizNo,
       'classId': classId,
      'className': className,
      'sessionId': sessionId,
      'sessionName': sessionName,
      'semesterId': semesterId,
      'semesterName': semesterName,
    };
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