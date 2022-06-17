import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';

import '../../widgets/widget.dart';

class MangeQuize extends StatefulWidget {
  const MangeQuize({Key? key}) : super(key: key);

  @override
  State<MangeQuize> createState() => _MangeQuizeState();
}

class _MangeQuizeState extends State<MangeQuize> {
  final _quizSubjectNameController = TextEditingController();
  final _quizSubjectNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: kPrimaryColor,
          title: const Text("Mange Quize ")),
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
                        lableText: " Quiz Name",
                        hintText: "Enter your Quiz",
                        icon: const Icon(
                          Icons.library_books_rounded,
                          color: kSecondary,
                        ),
                        controller: _quizSubjectNameController,
                      ),
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    InputField(
                      lableText: "Quiz No:",
                      hintText: "",
                      icon: const Icon(
                        Icons.library_books_rounded,
                        color: kSecondary,
                      ),
                      controller: _quizSubjectNoController,
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
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
                    DropdownButtonFormField(
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
                            ))
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
                color: kPrimaryColor,
                text: "Upload Quiz",
                onPrseed: () {},
                height: 40,
                width: 120,
                fontsize: 14),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
