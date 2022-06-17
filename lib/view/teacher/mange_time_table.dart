import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';

import '../../widgets/widget.dart';

class MangeTimeTable extends StatefulWidget {
  const MangeTimeTable({Key? key}) : super(key: key);

  @override
  State<MangeTimeTable> createState() => _MangeTimeTableState();
}

class _MangeTimeTableState extends State<MangeTimeTable> {
  final _timeTableController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: kPrimaryColor,
          title: const Text("Send Time Tables")),
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
                        lableText: "Time Table",
                        hintText: "Set your Time",
                        icon: const Icon(
                          Icons.library_books_rounded,
                          color: kSecondary,
                        ),
                        controller: _timeTableController,
                      ),
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
                text: "Upload file",
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
