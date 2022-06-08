import 'package:flutter/material.dart';
import '../view_model/view_model.dart';
import '../widgets/button_widget.dart';
import '../widgets/input_field.dart';

class SemesterScreen extends StatefulWidget {
  const SemesterScreen({Key? key}) : super(key: key);

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  final _semeterController = TextEditingController();
  var semesterViewModel = SemesterViewModel();
  int? semesterId;
  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Semester Mangement"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            InputField(
              controller: _semeterController,
              lableText: "Semester Name",
              hintText: "Enter your semester",
              icon: const Icon(
                Icons.menu_book,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
                text: "Save Data",
                onPrseed: () {
                  if (isUpdate == false) {
                    _addData();
                    _semeterController.clear();
                  } else {
                    _updateDta();
                    _semeterController.clear();
                  }
                },
                height: 40,
                width: 130,
                fontsize: 14),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: semesterViewModel.getdata(),
                builder:
                    (context, AsyncSnapshot<List<SemesterViewModel>> snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went Wrong"),
                    );
                  }
                  List<SemesterViewModel> semester = snapshot.data!;
                  return SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Semester ID")),
                          DataColumn(label: Text("Semester Name")),
                          DataColumn(label: Text("Edit")),
                          DataColumn(label: Text("delete")),
                        ],
                        rows: semester.map((row) {
                          return DataRow(cells: [
                            DataCell(
                              Text(row.semesterId.toString()),
                            ),
                            DataCell(
                              Text(row.semesterName ?? ""),
                            ),
                            DataCell(IconButton(
                              onPressed: () {
                                setState(() {
                                  semesterId = row.semesterId;
                                  isUpdate = true;
                                });
                                _semeterController.text = row.semesterName!;
                              },
                              icon: const Icon(Icons.edit),
                              splashRadius: 20,
                            )),
                            DataCell(IconButton(
                              onPressed: () async {
                                setState(() {
                                  semesterId = row.semesterId;
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
    semesterViewModel =
        SemesterViewModel(semesterName: _semeterController.text);
    semesterViewModel.savaData();
    setState(() {});
  }

  _updateDta() {
    semesterViewModel = SemesterViewModel(
        semesterId: semesterId, semesterName: _semeterController.text);
    semesterViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteDta() {
    semesterViewModel = SemesterViewModel(semesterId: semesterId);
    semesterViewModel.deleteData();
  }
}
