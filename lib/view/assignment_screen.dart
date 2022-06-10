import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view_model/assigment_view_model.dart';
import 'package:uni_mangement_system/widgets/button_widget.dart';
import 'package:uni_mangement_system/widgets/input_field.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final _assigmentNameController = TextEditingController();
  final _assigmentDescController = TextEditingController();
  var assignmentViewModel = AssigmentViewModel();
  int? assignmentId;
  bool isUpdate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Assignemnet Mangement"),
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
                      child: InputField(
                        lableText: "Assignments Name",
                        hintText: "Enter your assignment",
                        icon: const Icon(
                          Icons.library_books_rounded,
                          color: kSecondary,
                        ),
                        controller: _assigmentNameController,
                      ),
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    InputField(
                      controller: _assigmentDescController,
                      lableText: "Description",
                      hintText: "",
                      icon: const Icon(
                        Icons.description,
                        color: kSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                text: "Submit",
                onPrseed: () {
                  if (isUpdate == false) {
                    _addData();
                    _assigmentNameController.clear();
                    _assigmentDescController.clear();
                  } else {
                    _updateDta();
                    _assigmentNameController.clear();
                    _assigmentDescController.clear();
                  }
                },
                height: 40,
                width: 110,
                fontsize: 14),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: assignmentViewModel.getData(),
                builder: (context,
                    AsyncSnapshot<List<AssigmentViewModel>> snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No Class Data Found"),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went Wrong"),
                    );
                  }
                  List<AssigmentViewModel> assignment = snapshot.data!;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Assignment ID")),
                          DataColumn(label: Text("Assignment Name")),
                          DataColumn(label: Text("Assignment Description")),
                          DataColumn(label: Text("Edit")),
                          DataColumn(label: Text("Delete")),
                        ],
                        rows: assignment.map((row) {
                          return DataRow(cells: [
                            DataCell(
                              Text(row.assignmentId.toString()),
                            ),
                            DataCell(
                              Text(row.assignmentName ?? ""),
                            ),
                            DataCell(
                              Text(row.assignmentDesc ?? ""),
                            ),
                            DataCell(IconButton(
                              onPressed: () {
                                setState(() {
                                  assignmentId = row.assignmentId;
                                  isUpdate = true;
                                });
                                _assigmentNameController.text =
                                    row.assignmentName!;
                                _assigmentDescController.text =
                                    row.assignmentDesc!;
                              },
                              icon: const Icon(Icons.edit),
                              splashRadius: 20,
                            )),
                            DataCell(IconButton(
                              onPressed: () async {
                                setState(() {
                                  assignmentId = row.assignmentId;
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
    assignmentViewModel = AssigmentViewModel(
        assignmentName: _assigmentNameController.text,
        assignmentDesc: _assigmentDescController.text);
    assignmentViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    assignmentViewModel = AssigmentViewModel(
        assignmentId: assignmentId,
        assignmentName: _assigmentNameController.text,
        assignmentDesc: _assigmentDescController.text);
    assignmentViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteDta() {
    assignmentViewModel = AssigmentViewModel(assignmentId: assignmentId);
    assignmentViewModel.deleteData();
  }
}
