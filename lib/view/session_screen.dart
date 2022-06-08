import 'package:flutter/material.dart';
import '../view_model/session_view_model.dart';
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
  bool isUpdate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Session Mangement"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              InputField(
                lableText: "Session Name",
                hintText: "Enter your session",
                icon: const Icon(Icons.library_books_rounded),
                controller: _sessionController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  text: "Save Data",
                  onPrseed: () {
                    if (isUpdate) {
                      _updateDta();
                    } else {
                      _addData();
                    }
                  },
                  height: 40,
                  width: 110,
                  fontsize: 14),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                  future: sessionViewModel.getData(),
                  builder: (context,
                      AsyncSnapshot<List<SessionViewModel>> snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Data Found",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something went Wrong"),
                      );
                    }
                    List<SessionViewModel> session = snapshot.data!;
                    return SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            columns: const [
                              DataColumn(label: Text("Session ID")),
                              DataColumn(label: Text("Session Name")),
                              DataColumn(label: Text("Edit")),
                              DataColumn(label: Text("Delete")),
                            ],
                            rows: session.map((row) {
                              return DataRow(cells: [
                                DataCell(
                                  Text(
                                    row.sessionId.toString(),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    row.sessionName ?? "",
                                  ),
                                ),
                                DataCell(IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sessionId = row.sessionId;
                                      isUpdate = true;
                                    });
                                    _sessionController.text = row.sessionName!;
                                  },
                                  icon: const Icon(Icons.edit),
                                  splashRadius: 20,
                                )),
                                DataCell(IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      sessionId = row.sessionId;
                                    });
                                    _deleteDta();
                                  },
                                  icon: const Icon(Icons.delete),
                                  splashRadius: 20,
                                )),
                              ]);
                            }).toList()),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }

  _addData() {
    sessionViewModel = SessionViewModel(sessionName: _sessionController.text);
    sessionViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    sessionViewModel = SessionViewModel(
        sessionId: sessionId, sessionName: _sessionController.text);
    sessionViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteDta() {
    sessionViewModel = SessionViewModel(sessionId: sessionId);
    sessionViewModel.deleteData();
  }
}
