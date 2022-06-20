import 'package:flutter/material.dart';

import '../../utils/utlis.dart';
import '../../widgets/widget.dart';

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({Key? key}) : super(key: key);

  @override
  State<TeacherRegister> createState() => _TeacherRegisterState();
}

class _TeacherRegisterState extends State<TeacherRegister> {
  final _formKey = GlobalKey<FormState>();

  final _teacherNameController = TextEditingController();

  final _teacherEmailController = TextEditingController();

  final _teacherPasswordController = TextEditingController();

  final _teacherDepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/img/teacher-logo.png",
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
                  "Teacher Register".toUpperCase(),
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
                        controller: _teacherNameController,
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
                        controller: _teacherEmailController,
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
                        controller: _teacherPasswordController,
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
                        controller: _teacherDepController,
                        lableText: "Department",
                        hintText: "Enter your department",
                        icon: const Icon(
                          Icons.design_services,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                  text: "Register",
                  onPrseed: () {},
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  fontsize: 18,
                  color: kPrimaryColor)
            ]),
          ),
        ),
      ),
    );
  }
}
