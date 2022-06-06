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
  final _assigmentdescController = TextEditingController();
  var assignmentViewModel = AssigmentViewModel();
  int? assignmetId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Assignemnet Screen"),
      ),
      body: Column(
        children: [
          InputField(
            lableText: "Assignments Name",
            hintText: "Enter your assignment",
            icon: const Icon(Icons.library_books_rounded),
            controller: _assigmentController,
          ),
          InputField(
            lableText: "Description",
            hintText: "",
            icon: const Icon(Icons.description),
            controller: _assigmentController,
          ),
          const Spacer(),
          MyButton(
              text: "Save Data",
              onPrseed: () {},
              height: 40,
              width: 130,
              fontsize: 20),
        ],
      ),
    );
  }

  _addData() {
    assignmentViewModel = AssigmentViewModel(
        assignmentName: _assigmentController.text,
        assignmentdesc: _assigmentdescController.text);
  }

  _updateDta() {
    assignmentViewModel = AssigmentViewModel(assignmentid: assignmetId);
  }

  _deleteDta() {
    assignmentViewModel = AssigmentViewModel(assignmentid: assignmetId);
  }
}
