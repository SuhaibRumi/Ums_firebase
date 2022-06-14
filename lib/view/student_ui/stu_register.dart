import 'package:flutter/material.dart';
import 'package:uni_mangement_system/widgets/button_widget.dart';
import 'package:uni_mangement_system/widgets/input_field.dart';

import '../../utils/utlis.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({Key? key}) : super(key: key);

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _studentNameController = TextEditingController();
  final _studentEmailController = TextEditingController();
  final _studentPasswordController = TextEditingController();
  final _studentSessionController = TextEditingController();
  final _studentRollNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  "assets/img/splash.png",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Student Register".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24,
                        color: kSecondary,
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
                      children: [
                        InputField(
                          controller: _studentNameController,
                          lableText: "Name",
                          hintText: "Enter your Name",
                          icon: const Icon(
                            Icons.person,
                            color: kSecondary,
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
                          icon: const Icon(Icons.mail, color: kSecondary),
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
                          icon: const Icon(Icons.lock, color: kSecondary),
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 15,
                          indent: 15,
                        ),
                        InputField(
                          controller: _studentSessionController,
                          lableText: "Session",
                          hintText: "Enter your session",
                          icon: const Icon(Icons.design_services,
                              color: kSecondary),
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
                          icon: const Icon(Icons.star_purple500_sharp,
                              color: kSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                MyButton(
                    text: "Register".toUpperCase(),
                    onPrseed: () {},
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    fontsize: 18,
                    color: kPrimaryColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
