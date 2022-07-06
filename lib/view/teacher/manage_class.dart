import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import '../../view_model/class_view_model.dart';
import '../../widgets/widget.dart';

class ClassMangemnetScreen extends StatefulWidget {
  const ClassMangemnetScreen({Key? key}) : super(key: key);

  @override
  State<ClassMangemnetScreen> createState() => _ClassMangemnetScreenState();
}

class _ClassMangemnetScreenState extends State<ClassMangemnetScreen> {
  final _classController = TextEditingController();
  var classViewModel = ClassViewModel();
  String? classId;
  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(" Mange Class  "),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shadowColor: Colors.grey[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      InputField(
                        controller: _classController,
                        lableText: "Class Name",
                        hintText: "Enter your Class",
                        icon: const Icon(
                          Icons.group_outlined,
                          size: 30,
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
                      _classController.clear();
                    } else {
                      _updateDta();
                      _classController.clear();
                    }
                  },
                  height: 40,
                  width: 120,
                  fontsize: 14),
              const SizedBox(
                height: 50,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: classViewModel.getData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("No Class Data Found"),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something went Wrong"),
                      );
                    }
                    List<ClassViewModel> classes = snapshot.data!.docs
                        .map((e) => ClassViewModel.fromMap(e))
                        .toList();

                    return SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            columns: const [
                              DataColumn(label: Text("Class Name")),
                              DataColumn(label: Text("Edit")),
                              DataColumn(label: Text("Delete")),
                            ],
                            rows: classes.map((row) {
                              return DataRow(cells: [
                                DataCell(
                                  Text(row.className ?? ""),
                                ),
                                DataCell(IconButton(
                                  onPressed: () {
                                    setState(() {
                                      classId = row.classId.toString();
                                      isUpdate = true;
                                    });
                                    _classController.text = row.className!;
                                  },
                                  icon: const Icon(Icons.edit),
                                  splashRadius: 20,
                                )),
                                DataCell(IconButton(
                                  onPressed: () {
                                    setState(() {
                                      classId = row.classId.toString();
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
          )),
    );
  }

  _addData() {
    classViewModel = ClassViewModel(className: _classController.text);
    classViewModel.saveData();
    setState(() {});
  }

  _updateDta() {
    classViewModel =
        ClassViewModel(classId: classId, className: _classController.text);
    classViewModel.updateData();
    setState(() {
      isUpdate = false;
    });
  }

  _deleteData() {
    classViewModel = ClassViewModel(classId: classId);
    classViewModel.deleteData();
  }

  _showAlert() async {
    await showDialog(
        context: context,
        builder: (bc) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Do you want to delete this record?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(bc, true);

                    setState(() {
                      // _deleteDta();
                    });
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(bc, false);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }
}
