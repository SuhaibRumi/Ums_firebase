import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../view_model/assigment_view_model.dart';
import '../../view_model/view_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  // final _assignmentNameController = TextEditingController();
  final _assignmentNoController = TextEditingController();
  var assignmentViewModel = AssigmentViewModel();

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
                        stream: semesterViewModel.getData(),
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
                            value: classId,
                            key: classState,
                            hint: const Text("Select Session"),
                            items: sessions.map((session) {
                              return DropdownMenuItem(
                                value: session.sessionId.toString(),
                                child: Text(session.sessionName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                sessionId = value!.toString();
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
                            value: classId,
                            key: classState,
                            hint: const Text("Select Class"),
                            items: classes.map((cls) {
                              return DropdownMenuItem(
                                value: cls.classId.toString(),
                                child: Text(cls.className ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                classId = value!.toString();
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
                            key: semesterState,
                            value: semesterId,
                            hint: const Text("Select Semester"),
                            items: semesters.map((semester) {
                              return DropdownMenuItem(
                                value: semester.semesterId.toString(),
                                child: Text(semester.semesterName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                semesterId = value!.toString();
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
                    InputField(
                      lableText: "Assignments No:",
                      hintText: "",
                      icon: const Icon(
                        Icons.library_books_rounded,
                      ),
                      controller: _assignmentNoController,
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
                    _assignmentNoController.clear();
                  } else {
                    _updateDta();
                    _assignmentNoController.clear();
                  }
                },
                height: 40,
                width: 110,
                fontsize: 14),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: courseViewModel.getData(),
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
                  List<AssigmentViewModel> courses = snapshot.data!.docs
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
                          rows: courses.map((row) {
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

  _addData() {
    assignmentViewModel =
        AssigmentViewModel(assignmentNo: _assignmentNoController.text);
    assignmentViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    assignmentViewModel = AssigmentViewModel(
        assignmentId: assignmentId, assignmentNo: _assignmentNoController.text);
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
