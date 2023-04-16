import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/firebase_utility.dart';
import '../../utils/constants.dart';
import '../../view_model/view_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final _assignmentNoController = TextEditingController();
  var assignmentViewModel = AssigmentViewModel();
  File? file;

  var semesterViewModel = SemesterViewModel();
  var sessionViewModel = SessionViewModel();
  var classViewModel = ClassViewModel();

  var classState = GlobalKey<FormFieldState>();
  var sessionState = GlobalKey<FormFieldState>();
  var semesterState = GlobalKey<FormFieldState>();

  bool isUpdate = false;
  String? classId;
  String? sessionId;
  String? semesterId;
  String? className;
  String? sessionName;
  String? semesterName;
  String? assignmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Manage Assignment "),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                shadowColor: Colors.grey[500],
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: sessionViewModel.getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          List<SessionViewModel> sessions = snapshot.data!.docs
                              .map((e) => SessionViewModel.fromMap(e))
                              .toList();

                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                              Icons.cached,
                            )),
                            value: sessionName,
                            key: sessionState,
                            hint: const Text("Select Session"),
                            items: sessions.map((session) {
                              return DropdownMenuItem(
                                value: session.sessionName.toString(),
                                child: Text(session.sessionName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                sessionName = value.toString();
                              });
                            },
                          );
                        }),
                    StreamBuilder<QuerySnapshot>(
                        stream: classViewModel.getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }

                          List<ClassViewModel> classes = snapshot.data!.docs
                              .map((e) => ClassViewModel.fromMap(e))
                              .toList();

                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                              Icons.group_outlined,
                            )),
                            value: className,
                            key: classState,
                            hint: const Text("Select Class"),
                            items: classes.map((cls) {
                              return DropdownMenuItem(
                                value: cls.className.toString(),
                                child: Text(cls.className ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                // classId = value!.toString();
                                className = value.toString();
                              });
                            },
                          );
                        }),
                    StreamBuilder<QuerySnapshot>(
                        stream: semesterViewModel.getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          List<SemesterViewModel> semesters = snapshot
                              .data!.docs
                              .map((e) => SemesterViewModel.fromMap(e))
                              .toList();

                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                              Icons.bookmark_add_outlined,
                            )),
                            key: semesterState,
                            value: semesterName,
                            hint: const Text("Select Semester"),
                            items: semesters.map((semester) {
                              return DropdownMenuItem(
                                value: semester.semesterName.toString(),
                                child: Text(semester.semesterName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                // semesterId = value!.toString();
                                semesterName = value.toString();
                              });
                            },
                          );
                        }),
                    InputField(
                      lableText: "Assignments No:",
                      hintText: "",
                      icon: const Icon(
                        Icons.description_outlined,
                      ),
                      controller: _assignmentNoController,
                    ),
                    const Divider(
                      thickness: 1.2,
                    ),
                    TextButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          setState(() {
                            file = File(result.files.single.path!);
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: const Text(
                        "Upload file",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            uploading == false
                ? MyButton(
                    color: kPrimaryColor,
                    text: "Save Data",
                    onPrseed: () async {
                      if (isUpdate == false) {
                        await _addData();
                        _assignmentNoController.clear();
                      } else {
                        _updateDta();
                        _assignmentNoController.clear();
                      }
                    },
                    height: 40,
                    width: 120,
                    fontsize: 14)
                : const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: assignmentViewModel.getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went Wrong"),
                    );
                  }
                  List<AssigmentViewModel> assignment = snapshot.data!.docs
                      .map((e) => AssigmentViewModel.fromMap(e))
                      .toList();

                  return SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const [
                            DataColumn(label: Text("Assignmnet No")),
                            DataColumn(label: Text("Session Name")),
                            DataColumn(label: Text("Class Name")),
                            DataColumn(label: Text("Semeter Name")),
                            DataColumn(label: Text("Edit")),
                            DataColumn(label: Text("Delete")),
                          ],
                          rows: assignment.map((row) {
                            return DataRow(cells: [
                              DataCell(
                                Text(row.assignmentNo ?? ""),
                              ),
                              DataCell(
                                Text(row.sessionName ?? ""),
                              ),
                              DataCell(
                                Text(row.className ?? ""),
                              ),
                              DataCell(
                                Text(row.semesterName ?? ""),
                              ),
                              DataCell(IconButton(
                                onPressed: () {
                                  setState(() {
                                    assignmentId = row.assignmentId.toString();
                                    isUpdate = true;
                                  });
                                  _assignmentNoController.text =
                                      row.assignmentNo!;
                                },
                                icon: const Icon(Icons.edit),
                                splashRadius: 20,
                              )),
                              DataCell(IconButton(
                                onPressed: () {
                                  setState(() {
                                    assignmentId = row.assignmentId.toString();
                                  });
                                  _deleteData();
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
      ),
    );
  }

  bool uploading = false;
  _addData() async {
    String url = '';
    setState(() {
      uploading = true;
    });
    url = await assignmentViewModel.uploadFile(file: file!) ?? '';
    Future.delayed(const Duration(seconds: 5), () {
       if (url.isNotEmpty)
      {
        assignmentViewModel = AssigmentViewModel(
            assignmentNo: _assignmentNoController.text,
            semesterName: semesterName,
            sessionName: sessionName,
            className: className,
            fileUrl: url);
        assignmentViewModel.saveData();

        setState(() {
          uploading = false;
        });
        print('url: $url');
      }
    });
  }

  _updateDta() {
    assignmentViewModel = AssigmentViewModel(
        assignmentId: assignmentId,
        classId: classId,
        sessionId: sessionId,
        semesterId: semesterId,
        assignmentNo: _assignmentNoController.text);
    assignmentViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteData() {
    assignmentViewModel = AssigmentViewModel(assignmentId: assignmentId);
    assignmentViewModel.deleteData();
  }
}
