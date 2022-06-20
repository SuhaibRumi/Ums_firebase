
class Session {
  final String? sessionId;
  final String? sessionName;

  Session({this.sessionId, this.sessionName});

  factory Session.fromMap(Map map) {
    return Session(
      sessionId: map['sessionId'],
      sessionName: map['sessionName'],
    );
  }
  toMap() {
    Map<String, dynamic> row = {};
    row = {
      ' sessionId': sessionId,
      'sessionName': sessionName,
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