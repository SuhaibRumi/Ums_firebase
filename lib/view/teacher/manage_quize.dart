import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';

import '../../view_model/view_model.dart';
import '../../widgets/widget.dart';

class ManageQuize extends StatefulWidget {
  const ManageQuize({Key? key}) : super(key: key);

  @override
  State<ManageQuize> createState() => _ManageQuizeState();
}

class _ManageQuizeState extends State<ManageQuize> {
  final _quizNoController = TextEditingController();

  var quizViewModel = QuizViewModel();
  var courseViewModel = CourseViewModel();
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
  String? courseId;
  String? quizId;
  String? className;
  String? sessionName;
  String? semesterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: kPrimaryColor,
          title: const Text("Mange Quize ")),
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
                                prefixIcon: Icon(Icons.book_outlined,
                                    color: kSecondary)),
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
                            // validator: (value) {
                            //   if (value == null) {
                            //     return "please select your session";
                            //   }
                            //   return null;
                            // },
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
                                prefixIcon: Icon(Icons.book_outlined,
                                    color: kSecondary)),
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
                                className = value.toString();
                              });
                            },
                            // validator: (value) {
                            //   if (value == null) {
                            //     return "please select your class";
                            //   }
                            //   return null;
                            // },
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
                                prefixIcon: Icon(Icons.description_outlined,
                                    color: kSecondary)),
                            value: semesterName,
                            key: semesterState,

                            hint: const Text("Select Semester"),
                            items: semesters.map((semester) {
                              return DropdownMenuItem(
                                value: semester.semesterName.toString(),
                                child: Text(semester.semesterName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                semesterName = value.toString();
                              });
                            },
                            // validator: (value) {
                            //   if (value == null) {
                            //     return "please select your semester";
                            //   }
                            //   return null;
                            // },
                          );
                        }),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    InputField(
                      lableText: "Quiz No:",
                      hintText: "",
                      icon: const Icon(
                        Icons.library_books_rounded,
                        color: kSecondary,
                      ),
                      controller: _quizNoController,
                    ),
                    const Divider(
                      thickness: 1.2,
                    ),
                    TextButton(
                      onPressed: () {},
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
            MyButton(
                color: kPrimaryColor,
                text: "Save Data",
                onPrseed: () {
                  if (isUpdate == false) {
                    _addData();
                    _quizNoController.clear();
                  } else {
                    _updateDta();
                    _quizNoController.clear();
                  }
                },
                height: 40,
                width: 120,
                fontsize: 14),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: quizViewModel.getData(),
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
                  List<QuizViewModel> quiz = snapshot.data!.docs
                      .map((e) => QuizViewModel.fromMap(e))
                      .toList();

                  return SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const [
                            DataColumn(label: Text("Quiz No")),
                            DataColumn(label: Text("Session Name")),
                            DataColumn(label: Text("Class Name")),
                            DataColumn(label: Text("Semeter Name")),
                            DataColumn(label: Text("Edit")),
                            DataColumn(label: Text("Delete")),
                          ],
                          rows: quiz.map((row) {
                            return DataRow(cells: [
                              DataCell(
                                Text(row.quizNo ?? ""),
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
                                    quizId = row.quizId.toString();
                                    isUpdate = true;
                                  });
                                  _quizNoController.text = row.quizNo!;
                                },
                                icon: const Icon(Icons.edit),
                                splashRadius: 20,
                              )),
                              DataCell(IconButton(
                                onPressed: () {
                                  setState(() {
                                    quizId = row.quizId.toString();
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

  _addData() {
    quizViewModel = QuizViewModel(
        quizNo: _quizNoController.text,
        semesterName: semesterName,
        sessionName: sessionName,
        className: className);
    quizViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    quizViewModel = QuizViewModel(
      quizId: quizId,
      quizNo: _quizNoController.text,
    );
    quizViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteData() {
    quizViewModel = QuizViewModel(
      quizId: quizId,
    );
    quizViewModel.deleteData();
  }
}
