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
    var session = Session.fromMap(map);

    return SessionViewModel(
      sessionId: session.sessionId,
      sessionName: session.sessionName,
    );
  }
  saveData() async {
    var session = Session(sessionName: sessionName);
    try {
      await FirebaseUtility.addData(
          collection: "Session", doc: session.toMap());
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateData() async {
    var session = Session(sessionName: sessionName);
    await FirebaseUtility.updateData(
        collection: 'Session', docId: sessionId!, doc: session.toMap());
    notifyListeners();
  }

  deleteData() async {
    var session = Session(sessionId: sessionId);
    await FirebaseUtility.deleteData(collection: "Session", docId: sessionId!);
    notifyListeners();
  }

  getData() {
    var data =
        FirebaseUtility.getData(collection: "Session", orderBy: "sessionName");
    notifyListeners();
    return data;
  }
}
