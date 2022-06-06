import 'package:flutter/material.dart';
import 'package:uni_mangement_system/view_model/students_view_model.dart';

import '../widgets/widget.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final _studentNameController = TextEditingController();
  final _studRollController=TextEditingController();
  final studSessionController=TextEditingController();
  final classNameController=TextEditingController();
  final sessionNameController=TextEditingController();
  final semesterNameController=TextEditingController();


  var studentViewModel = StudentsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Students Screen"),
        ),
        body: Column(
          children: [
            InputField(
              lableText: "Student Name",
              hintText: "Enter your Name",
              icon: const Icon(Icons.library_books_rounded),
              controller: _studentNameController,
            ),
            const Spacer(),
            MyButton(
                text: "Save Data",
                onPrseed: () {},
                height: 40,
                width: 130,
                fontsize: 20)
          ],
        ));
  }

  _addData() {}

  _updateDta() {}
  _deleteDta() {}
}
