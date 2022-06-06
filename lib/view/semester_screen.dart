import 'package:flutter/material.dart';
import 'package:uni_mangement_system/view_model/view_model.dart';
import 'package:uni_mangement_system/widgets/button_widget.dart';
import 'package:uni_mangement_system/widgets/input_field.dart';

class SemesterScreen extends StatefulWidget {
  const SemesterScreen({Key? key}) : super(key: key);

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  final _semeterController = TextEditingController();
  var semesterViewModel = SemesterViewModel();
  int? semesterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Semester Screen"),
      ),
      body: FutureBuilder(
          future: semesterViewModel.getSemester(),
          builder: (context, AsyncSnapshot<List<SemesterViewModel>> snapshot) {
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
            return Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  InputField(
                    controller: _semeterController,
                    lableText: "Semester Name",
                    hintText: "Enter your semester",
                    icon: const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  MyButton(
                      text: "Save Data",
                      onPrseed: () {
                        _addData();
                      },
                      height: 40,
                      width: 130,
                      fontsize: 20),
                  const Spacer(),
                ],
              ),
            );
          }),
    );
  }

  _addData() {
    semesterViewModel =
        SemesterViewModel(semesterName: _semeterController.text);
    semesterViewModel.savaData();
  }

  _updateDta() {
    semesterViewModel = SemesterViewModel(semesterId: semesterId);
    semesterViewModel.updateData();
  }

  _deleteDta() {
    semesterViewModel = SemesterViewModel(semesterId: semesterId);
    semesterViewModel.deleteData();
  }
}
