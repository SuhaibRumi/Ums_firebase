import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_mangement_system/models/model.dart';

import '../utils/utlis.dart';

class SessionViewModel extends ChangeNotifier {
  String? sessionId = '';
  String? sessionName = '';

  SessionViewModel({
    this.sessionId,
    this.sessionName,
  });

  factory SessionViewModel.fromMap(DocumentSnapshot map) {
    var sessions = Session.fromMap(map);

    return SessionViewModel(
      sessionId: sessions.sessionId,
      sessionName: sessions.sessionName,
    );
  }
  saveData() async {
    var sessions = Session(sessionName: sessionName);
    try {
      await FirebaseUtility.addData(
          collection: "session", doc: sessions.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var sessions = Session(sessionName: sessionName);
    await FirebaseUtility.updateData(
        collection: 'session', docId: sessionId!, doc: sessions.toMap());
    notifyListeners();
  }

  deleteData() async {
    await FirebaseUtility.deleteData(collection: "session", docId: sessionId!);
    notifyListeners();
  }

  getData() {
    var data = FirebaseUtility.getData(collection: "Session", orderBy: "sessionsName");
    notifyListeners();
    return data;
  }
}
