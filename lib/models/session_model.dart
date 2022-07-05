import 'package:cloud_firestore/cloud_firestore.dart';

class Session {
  final String? sessionId;
  final String? sessionName;
    final String? fileUrl;

  Session({this.sessionId, this.sessionName,
  this.fileUrl});

  factory Session.fromMap(DocumentSnapshot map) {
    return Session(
      sessionId: map.id,
      sessionName: map['sessionsName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      'sessionsName': sessionName,
    };
    return row;
  }
}

class SessionList {
  final List<Session> sessionList;
  SessionList({required this.sessionList});
  factory SessionList.fromMap(List data) {
    List<Session> session = [];
    session = data.map((e) => Session.fromMap(e)).toList();
    return SessionList(sessionList: session);
  }
}
