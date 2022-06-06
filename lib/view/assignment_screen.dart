import 'package:flutter/material.dart';
import 'package:uni_mangement_system/view_model/assigment_view_model.dart';
import 'package:uni_mangement_system/widgets/button_widget.dart';
import 'package:uni_mangement_system/widgets/input_field.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final _assigmentController = TextEditingController();
  final _assigmentDescController = TextEditingController();
  var assignmentViewModel = AssigmentViewModel();
  int? assignmetId;
  bool isUpdate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Assignemnet Mangement"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            InputField(
              lableText: "Assignments Name",
              hintText: "Enter your assignment",
              icon: const Icon(Icons.library_books_rounded),
              controller: _assigmentController,
            ),
            const SizedBox(
              height: 12,
            ),
            InputField(
              lableText: "Description",
              hintText: "",
              icon: const Icon(Icons.description),
              controller: _assigmentDescController,
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
                text: "Save Data",
                onPrseed: () {
                  if (isUpdate == false) {
                    _addData();
                    _assigmentController.clear();
                  } else {
                    _updateDta();
                    _assigmentController.clear();
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
                                  assignmetId = row.assignmentId;
                                  isUpdate = true;
                                });
                                _assigmentController.text = row.assignmentName!;
                              },
                              icon: const Icon(Icons.edit),
                              splashRadius: 20,
                            )),
                            DataCell(IconButton(
                              onPressed: () async {
                                setState(() {
                                  assignmetId = row.assignmentId;
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
        assignmentName: _assigmentController.text,
        assignmentDesc: _assigmentDescController.text);
    assignmentViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    assignmentViewModel = AssigmentViewModel(
        assignmentId: assignmetId,
        assignmentName: _assigmentController.text,
        assignmentDesc: _assigmentDescController.text);
    assignmentViewModel.updateData();
  }

  _deleteDta() {
    assignmentViewModel = AssigmentViewModel(assignmentId: assignmetId);
    assignmentViewModel.deleteData();
  }
}
