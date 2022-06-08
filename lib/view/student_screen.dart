import 'package:flutter/material.dart';

import '../view_model/view_model.dart';
import '../widgets/widget.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final _studentNameController = TextEditingController();
  final _studRollController = TextEditingController();
  final _studSessionController = TextEditingController();

  final _studsemesterNameController = TextEditingController();
  var studentViewModel = StudentsViewModel();
  String? classId;
  String? sessionId;
  String? semesterId;
  var classViewModel = ClassViewModel();
  var sessionViewModel = SessionViewModel();
  var semesterViewModel = SemesterViewModel();

  bool _isActive = true;
  bool isUpdate = false;
  int? studId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                  children: [
                    InputField(
                      lableText: "Student Name",
                      hintText: "Enter your Name",
                      icon: const Icon(Icons.person),
                      controller: _studentNameController,
                    ),
                    const Divider(),
                    FutureBuilder(
                        future: classViewModel.getData(),
                        builder: (context,
                            AsyncSnapshot<List<ClassViewModel>> snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return DropdownButtonFormField(
                              hint: const Text("Select Class"),
                              items: snapshot.data!.map((cls) {
                                return DropdownMenuItem(
                                  value: cls.classId,
                                  child: Text(cls.className ?? ""),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  classId = value.toString();
                                });
                              });
                        }),
                    const Divider(),
                    InputField(
                      lableText: "Student Roll No",
                      hintText: "Enter your Name",
                      icon: const Icon(Icons.data_array),
                      controller: _studRollController,
                    ),
                    const Divider(),
                    InputField(
                      lableText: "Student Session",
                      hintText: "Enter your Name",
                      icon: const Icon(Icons.label),
                      controller: _studSessionController,
                    ),
                    InputField(
                      lableText: "Student Semester",
                      hintText: "Enter your Name",
                      icon: const Icon(Icons.library_books_rounded),
                      controller: _studsemesterNameController,
                    ),
                    const Divider(),
                   
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                text: "Save Data",
                onPrseed: () {
                  if (isUpdate == false) {
                    _addData();
                  } else {
                    _updateDta();
                  }
                },
                height: 40,
                width: 110,
                fontsize: 14),
            FutureBuilder(builder:
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
                      DataColumn(label: Text("Student Assignmet")),
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
                            row.studName ?? "",
                          ),
                        ),
                        DataCell(
                          Text(
                            row.studClassName ?? "",
                          ),
                        ),
                        DataCell(
                          Text(row.studRoll ?? ""),
                        ),
                        DataCell(
                          Text(row.studSessionName ?? ""),
                        ),
                        DataCell(
                          Text(row.studSemesterName ?? ""),
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
                            _studentNameController.text = row.studName!;
                            _studRollController.text = row.studRoll!;
                            _studSessionController.text = row.studSessionName!;
                            _studsemesterNameController.text =
                                row.studSemesterName!;
                            
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
      studName: _studentNameController.text,
      studRoll: _studRollController.text,
      studSemesterName: _studsemesterNameController.text,
      studSessionName: _studSessionController.text,
    );
    studentViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    studentViewModel = StudentsViewModel(
      studId: studId,
      studName: _studentNameController.text,
      studRoll: _studRollController.text,
      studSemesterName: _studsemesterNameController.text,
      studSessionName: _studSessionController.text,
    );
    studentViewModel.updateData();
  }

  _deleteDta() {
    studentViewModel = StudentsViewModel(studId: studId);
    studentViewModel.deletData();
  }
}
