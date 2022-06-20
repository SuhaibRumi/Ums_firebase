import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../view_model/assigment_view_model.dart';
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
  int? assignmentId;
  bool isUpdate = false;
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: DropdownButtonFormField(
                        alignment: Alignment.center,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.book_outlined,
                          ),
                        ),
                        hint: const Text("Select Session"),
                        items: [
                          DropdownMenuItem(
                              value: "data",
                              child: Column(
                                children: const <Widget>[
                                  Text("2021-2023"),
                                ],
                              )),
                        ],
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null) {
                            return "please select your Session";
                          }
                          return null;
                        },
                      ),
                    ),
                    DropdownButtonFormField(
                      alignment: Alignment.center,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                        Icons.crisis_alert_outlined,
                      )),
                      hint: const Text("Select Class"),
                      items: [
                        DropdownMenuItem(
                            value: "data",
                            child: Column(
                              children: const <Widget>[
                                Text("BSCS"),
                              ],
                            ))
                      ],
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null) {
                          return "please select your class";
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                      alignment: Alignment.center,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                        Icons.description_outlined,
                      )),
                      hint: const Text("Select Semeter"),
                      items: [
                        DropdownMenuItem(
                            value: "data",
                            child: Column(
                              children: const <Widget>[
                                Text("1st"),
                              ],
                            ))
                      ],
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null) {
                          return "please select your Semester";
                        }
                        return null;
                      },
                    ),
                    
                    InputField(
                      lableText: "Assignments No:",
                      hintText: "",
                      icon: const Icon(
                        Icons.library_books_rounded,
                        color: kSecondary,
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
                        ),),
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
                onPrseed: () {},
                height: 40,
                width: 110,
                fontsize: 14),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  // _addData() {
  //   assignmentViewModel = AssigmentViewModel(
  //       assignmentName: _assignmentNameController.text,
  //       assignmentDesc: _assignmentNoController.text);
  //   assignmentViewModel.saveData();
  //   setState(() {});
  // }

  // _updateDta() {
  //   assignmentViewModel = AssigmentViewModel(
  //       assignmentId: assignmentId,
  //       assignmentName: _assignmentNameController.text,
  //       assignmentDesc: _assignmentNoController.text);
  //   assignmentViewModel.updateData();
  //   setState(() {
  //     isUpdate = false;
  //   });
  // }

  // _deleteDta() {
  //   assignmentViewModel = AssigmentViewModel(assignmentId: assignmentId);
  //   assignmentViewModel.deleteData();
  // }
}
