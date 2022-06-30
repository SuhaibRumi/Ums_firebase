import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';

import '../../view_model/view_model.dart';
import '../../widgets/widget.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final _formKey = GlobalKey<FormState>();

  final _studsemesterNameController = TextEditingController();
  final _studentNameController = TextEditingController();
  final _studSessionController = TextEditingController();
  final _studRollController = TextEditingController();
  final _studClassNameController = TextEditingController();
  var semesterViewModel = SemesterViewModel();
  var studentViewModel = StudentsViewModel();
  var sessionViewModel = SessionViewModel();
  var classViewModel = ClassViewModel();
  bool _isActive = true;
  bool isUpdate = false;
  int? studId;
  int? classId;
  int? sessionId;
  int? semesterId;
  Future<List<StudentsViewModel>>? data;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() {
    data = studentViewModel.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Students Mangement"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              shadowColor: Colors.grey[500],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  key: _formKey,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    InputField(
                      lableText: "Student Name",
                      hintText: "Enter your Name",
                      icon: const Icon(
                        Icons.person,
                        color: kSecondary,
                      ),
                      controller: _studentNameController,
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      endIndent: 12,
                      indent: 12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InputField(
                      lableText: "Student Roll No",
                      hintText: "Enter your Name",
                      icon: const Icon(Icons.data_array, color: kSecondary),
                      controller: _studRollController,
                    ),
                    const Divider(
                      endIndent: 12,
                      indent: 12,
                    ),
                    FutureBuilder(
                        future: classViewModel.getData(),
                        builder: (context,
                            AsyncSnapshot<List<ClassViewModel>> snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.crisis_alert_outlined,
                                    color: kSecondary)),
                            autofocus: true,
                            hint: const Text("Select Class"),
                            items: const [
                              DropdownMenuItem(
                                  value: "data", child: Text("data"))
                            ]
                            //  snapshot.data!.map((cls) {
                            //   return DropdownMenuItem(
                            //     value: cls.classId,
                            //     child: Text(cls.className ?? ""),
                            //   );
                            // }).toList()
                            ,
                            onChanged: (value) {
                              setState(() {
                                classId = int.parse(value.toString());
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return "please select your class";
                              }
                              return null;
                            },
                          );
                        }),
                    FutureBuilder(
                        future: sessionViewModel.getData(),
                        builder: (context,
                            AsyncSnapshot<List<SessionViewModel>> snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.book_outlined,
                                    color: kSecondary)),
                            autofocus: true,
                            hint: const Text("Select Session"),
                            items: snapshot.data!.map((session) {
                              return DropdownMenuItem(
                                value: session.sessionId,
                                child: Text(session.sessionName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                sessionId = int.parse(value.toString());
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return "please select your session";
                              }
                              return null;
                            },
                          );
                        }),
                    FutureBuilder(
                        future: semesterViewModel.getData(),
                        builder: (context,
                            AsyncSnapshot<List<SemesterViewModel>> snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.description_outlined,
                                    color: kSecondary)),
                            hint: const Text("Select Semester"),
                            items: snapshot.data!.map((semester) {
                              return DropdownMenuItem(
                                value: semester.semesterId,
                                child: Text(semester.semesterName ?? ""),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                semesterId = int.parse(value.toString());
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return "please select your semester";
                              }
                              return null;
                            },
                          );
                        }),
                    const SizedBox(height: 15),
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
                  } else {
                    _updateDta();
                  }
                  // if (_formKey.currentState!.validate()) {}
                },
                height: 40,
                width: 110,
                fontsize: 14),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
                future: data,
                builder:
                    (context, AsyncSnapshot<List<StudentsViewModel>> snapshot) {
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
                  List<StudentsViewModel> students = snapshot.data!;

                  return SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Student ID")),
                          DataColumn(label: Text("Student Name")),
                          DataColumn(label: Text("Student Class")),
                          DataColumn(label: Text("Student Roll")),
                          DataColumn(label: Text("Student Session")),
                          DataColumn(label: Text("Student Semester")),
                          DataColumn(label: Text("Student Active")),
                          DataColumn(label: Text("Edit")),
                          DataColumn(label: Text("Delete")),
                        ],
                        rows: students.map((row) {
                          return DataRow(cells: [
                            DataCell(
                              Text(row.studId.toString()),
                            ),
                            DataCell(
                              Text(
                                row.studentName ?? "",
                              ),
                            ),
                            DataCell(
                              Text(
                                row.className ?? "",
                              ),
                            ),
                            DataCell(
                              Text(row.studRoll ?? ""),
                            ),
                            DataCell(
                              Text(row.sessionName ?? ""),
                            ),
                            DataCell(
                              Text(row.semesterName ?? ""),
                            ),
                            DataCell(
                              Switch(
                                  value: _isActive,
                                  onChanged: (value) {
                                    setState(() {
                                      if (_isActive) {
                                        _isActive = true;
                                      } else {
                                        _isActive = false;
                                      }
                                    });
                                  }),
                            ),
                            DataCell(IconButton(
                              onPressed: () {
                                setState(() {
                                  studId = row.studId;
                                  isUpdate = true;
                                });
                                _studentNameController.text = row.studentName!;
                                _studRollController.text = row.studRoll!;
                                _studSessionController.text = row.semesterName!;
                                _studsemesterNameController.text =
                                    row.semesterName!;
                                _studClassNameController.text = row.className!;
                              },
                              icon: const Icon(Icons.edit),
                              splashRadius: 20,
                            )),
                            DataCell(IconButton(
                              onPressed: () async {
                                setState(() {
                                  studId = row.studId;
                                });
                                _deleteDta();
                              },
                              icon: const Icon(Icons.delete),
                              splashRadius: 20,
                            )),
                          ]);
                        }).toList(),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  _addData() {
    studentViewModel = StudentsViewModel(
        studentName: _studentNameController.text,
        studRoll: _studRollController.text,
        semesterId: semesterId,
        sessionId: sessionId,
        classId: classId,
        isActive: true);
    studentViewModel.saveData();

    setState(() {});
    _clearData();
  }

  _updateDta() {
    studentViewModel = StudentsViewModel(
      sessionId: sessionId,
      semesterId: semesterId,
      studId: studId,
      studentName: _studentNameController.text,
      studRoll: _studRollController.text,
      semesterName: _studsemesterNameController.text,
      sessionName: _studSessionController.text,
    );
    studentViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteDta() {
    studentViewModel = StudentsViewModel(
      studId: studId,
    );
    studentViewModel.deletData();
  }

  _clearData() {
    _studentNameController.clear();
    _studRollController.clear();
    _studsemesterNameController.clear();
    _studSessionController.clear();
    _studClassNameController.clear();
  }
}
