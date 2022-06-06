import 'package:flutter/material.dart';
import 'package:uni_mangement_system/view_model/session_view_model.dart';

import '../widgets/widget.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final _sessionController = TextEditingController();
  var sessionViewModel = SessionViewModel();
  int? sessionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Session Screen"),
      ),
      body: FutureBuilder(
          future: sessionViewModel.getData(),
          builder: (context, AsyncSnapshot<List<SessionViewModel>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            return Column(
              children: [
                InputField(
                  lableText: "Session Name",
                  hintText: "Enter your session",
                  icon: const Icon(Icons.library_books_rounded),
                  controller: _sessionController,
                ),
                const Spacer(),
                MyButton(
                    text: "Save Data",
                    onPrseed: () {},
                    height: 40,
                    width: 130,
                    fontsize: 20)
              ],
            );
          }),
    );
  }

  _addData() {
    sessionViewModel = SessionViewModel(sessionName: _sessionController.text);
  }

  _updateDta() {
    sessionViewModel = SessionViewModel(sessionId: sessionId);
  }

  _deleteDta() {
    sessionViewModel = SessionViewModel(sessionId: sessionId);
  }
}
