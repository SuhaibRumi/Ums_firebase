import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../view_model/view_model.dart';
import '/../widgets/custom_button.dart';
import '/../widgets/input_field.dart';

import '../../utils/utlis.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({Key? key}) : super(key: key);

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _formKey = GlobalKey<FormState>();

  final _studentNameController = TextEditingController();
  final _studentEmailController = TextEditingController();
  final _studentPasswordController = TextEditingController();
  final _studentRollNoController = TextEditingController();
  final _studentRegNoController = TextEditingController();

  var studentViewModel = StudentsViewModel();
  var semesterViewModel = SemesterViewModel();
  var sessionViewModel = SessionViewModel();
  var classViewModel = ClassViewModel();
  String? className;
  String? sessionName;
  String? semesterName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/img/splash.png",
                  fit: BoxFit.contain,
                  height: 180,
                  width: MediaQuery.of(context).size.width - 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Student Register".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22,
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Card(
                    shadowColor: kPrimaryColor,
                    elevation: 5,
                    color: Colors.grey[100],
                    child: Column(
                      key: _formKey,
                      children: [
                        InputField(
                          controller: _studentNameController,
                          lableText: "Name",
                          hintText: "Enter your Name",
                          icon: const Icon(
                            Icons.person,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentEmailController,
                          lableText: "Email",
                          hintText: "Enter your email",
                          icon: const Icon(
                            Icons.mail,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentPasswordController,
                          lableText: "Password",
                          hintText: "Enter your Password",
                          icon: const Icon(
                            Icons.lock,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentRollNoController,
                          lableText: "Roll No",
                          hintText: "Enter your Roll no",
                          icon: const Icon(
                            Icons.star_purple500_sharp,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentRegNoController,
                          lableText: "Reg No",
                          hintText: "Enter your Reg no",
                          icon: const Icon(
                            Icons.star_purple500_sharp,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: sessionViewModel.getData(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              List<SessionViewModel> sessions = snapshot
                                  .data!.docs
                                  .map((e) => SessionViewModel.fromMap(e))
                                  .toList();

                              return DropdownButtonFormField(
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.book_outlined,
                                        color: kSecondary)),
                                value: sessionName,
                                hint: const Text("Select Session"),
                                items: sessions.map((session) {
                                  return DropdownMenuItem(
                                    value: session.sessionName.toString(),
                                    child: Text(session.sessionName ?? ""),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    // sessionId = value!.toString();
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
                                    prefixIcon: Icon(Icons.book_outlined,
                                        color: kSecondary)),
                                value: className,
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
                                    prefixIcon: Icon(Icons.description_outlined,
                                        color: kSecondary)),
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(
                    text: "Register".toUpperCase(),
                    onPrseed: () {},
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    fontsize: 18,
                    color: kPrimaryColor),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addData() {
    studentViewModel = StudentsViewModel(
        studentName: _studentNameController.text,
        studentEmail: _studentEmailController.text,
        studentRoll: _studentRollNoController.text,
        studentRegNo: _studentRegNoController.text,
        semesterName: semesterName,
        sessionName: sessionName,
        className: className);
    studentViewModel.saveData();

    setState(() {});
    _clearData();
  }

  _clearData() {
    _studentNameController.clear();
    _studentRollNoController.clear();
    _studentRegNoController.clear();
    _studentEmailController.clear();
    _studentPasswordController.clear();
  }
}
