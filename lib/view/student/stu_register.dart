import 'package:flutter/material.dart';
import '/../widgets/custom_button.dart';
import '/../widgets/input_field.dart';

import '../../utils/utlis.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({Key? key}) : super(key: key);

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _formKey = GlobalKey<FormState>();

  final _studentNameController = TextEditingController();
  final _studentEmailController = TextEditingController();
  final _studentPasswordController = TextEditingController();
  final _studentRollNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/img/splash.png",
                  fit: BoxFit.contain,
                  height: 180,
                  width: MediaQuery.of(context).size.width - 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Student Register".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22,
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Card(
                    shadowColor: kPrimaryColor,
                    elevation: 5,
                    color: Colors.grey[100],
                    child: Column(
                      key: _formKey,
                      children: [
                        InputField(
                          controller: _studentNameController,
                          lableText: "Name",
                          hintText: "Enter your Name",
                          icon: const Icon(
                            Icons.person,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentEmailController,
                          lableText: "Email",
                          hintText: "Enter your email",
                          icon: const Icon(
                            Icons.mail,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentPasswordController,
                          lableText: "Password",
                          hintText: "Enter your Password",
                          icon: const Icon(
                            Icons.lock,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentRollNoController,
                          lableText: "Roll No",
                          hintText: "Enter your Roll no",
                          icon: const Icon(
                            Icons.star_purple500_sharp,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentRollNoController,
                          lableText: "Reg No",
                          hintText: "Enter your Reg no",
                          icon: const Icon(
                            Icons.star_purple500_sharp,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(
                    text: "Register".toUpperCase(),
                    onPrseed: () {},
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    fontsize: 18,
                    color: kPrimaryColor),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
